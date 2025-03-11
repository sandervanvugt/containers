FROM docker.io/redhat/ubi8
MAINTAINER Sander <mail@sandervanvugt.nl>

# Add repo file
ADD ./sander.repo /etc/yum.repos.d/

# Bypass GPG key install
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install cool software
RUN 	yum -y update && \
	yum -y install bash nmap iproute && \
	yum clean all

ENTRYPOINT ["/usr/bin/nmap"]
CMD ["-sn", "172.17.0.0/24"] 
