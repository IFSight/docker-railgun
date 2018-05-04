FROM centos:7
RUN yum update --security && \
    rpm -ivh http://pkg.cloudflare.com/cloudflare-release-latest.el7.rpm
