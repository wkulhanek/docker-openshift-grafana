FROM docker.io/centos:7
LABEL maintainer="Wolfgang Kulhanek <WolfgangKulhanek@gmail.com>"
ARG GRAFANA_VERSION=5.4.4

LABEL name="Grafana" \
      io.k8s.display-name="Grafana" \
      io.k8s.description="Grafana Dashboard for use with Prometheus." \
      io.openshift.expose-services="3000" \
      io.openshift.tags="grafana" \
      build-date="2019-04-30" \
      version=$GRAFANA_VERSION \
      release="1"

# User grafana gets added by RPM
ENV USERNAME=grafana

RUN yum -y update && yum -y upgrade && \
    yum -y install epel-release && \
    yum -y install git unzip nss_wrapper && \
    curl -L -o /tmp/grafana.rpm https://dl.grafana.com/oss/release/grafana-$GRAFANA_VERSION-1.x86_64.rpm && \
    yum -y localinstall /tmp/grafana.rpm && \
    yum -y clean all && \
    rm -rf /var/cache/yum \
    rm /tmp/grafana.rpm

COPY ./root /
RUN /usr/bin/fix-permissions /var/log/grafana && \
    /usr/bin/fix-permissions /etc/grafana && \
    /usr/bin/fix-permissions /usr/share/grafana && \
    /usr/bin/fix-permissions /usr/sbin/grafana-server

VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]

EXPOSE 3000

ENTRYPOINT ["/usr/bin/rungrafana"]
