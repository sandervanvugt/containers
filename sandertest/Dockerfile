FROM centos
MAINTAINER Sander <mail@sandervanvugt.nl>

# Add repo file
ADD ./sander.repo /etc/yum.repos.d/

# Install cool software
RUN yum --assumeyes update && \
yum --assumeyes install \
nmap && \
bash && \
yum clean all

CMD ["/usr/bin/nmap -sn 192.168.4.0"]
