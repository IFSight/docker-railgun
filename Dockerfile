# https://www.cloudflare.com/docs/railgun/installation.html
FROM centos:7
RUN rpm -ivh http://pkg.cloudflare.com/cloudflare-release-latest.el7.rpm && \
    yum update --security && \
    yum install -y railgun-stable ca-certificates && \
    rm -rf /var/cache/yum && \
    cd /etc/railgun && find /etc/railgun -type f -exec cp {} {}-default \;
WORKDIR /etc/railgun
EXPOSE 2408
CMD ["/usr/bin/rg-listener","-config=/etc/railgun/railgun.conf"]
