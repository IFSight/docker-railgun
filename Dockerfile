# https://www.cloudflare.com/docs/railgun/installation.html
FROM centos:7
RUN yum update --security && \
    yum install -y memcached && \
    rpm -ivh http://pkg.cloudflare.com/cloudflare-release-latest.el7.rpm
EXPOSE 2408
