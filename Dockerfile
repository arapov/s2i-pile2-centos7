FROM openshift/base-centos7
LABEL maintainer="Anton Arapov <aarapov@redhat.com>"

ENV GOPATH=$HOME/go \
    PILE2=$HOME/go/src/github.com/arapov/pile2 \
    APP_NAME=pile2 \
    PATH=$PATH:$HOME/go/bin

ENV JAYCONFIG=$PILE2/env.json

# Set the labels that are used for OpenShift to describe the builder image.
LABEL io.k8s.description="S2I builder image for Pile2" \
    io.k8s.display-name="s2i-pile2-centos7" \
    io.openshift.expose-services="8080:http" \
    io.openshift.tags="builder,golang" \
    # this label tells s2i where to find its mandatory scripts
    # (run, assemble, save-artifacts)
    io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

# Install the nginx web server package and clean the yum cache
RUN yum install -y epel-release && \
    PKGS="golang openssl npm" && \
    yum install -y --setopt=tsflags=nodocs $PKGS && \
    yum clean all

# Copy the S2I scripts to /usr/libexec/s2i since we set the label that way
COPY ./s2i/bin/ /usr/libexec/s2i

USER 1001
EXPOSE 8080

CMD ["/usr/libexec/s2i/usage"]
