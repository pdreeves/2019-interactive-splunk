FROM amazonlinux:latest

LABEL maintainer="iso-se@list.arizona.edu"
LABEL version="1.0.5"
LABEL description="Basic stand-alone container for Splunk"

RUN amazon-linux-extras install epel -y && \
  yum update -y && \
  yum install screen git ansible sudo procps unzip -y && \
  yum clean all && \
  rm -rf /var/cache/yum

ENV SPLUNK_ADMIN_PASSWORD="splunkAdminPassword"

COPY ansible /root/ansible
COPY variables /root/variables
RUN ansible-playbook -i ~/ansible/hosts --extra-vars @~/variables/docker.yml ~/ansible/site.yml
RUN rm -rf ~/ansible && rm -rf ~/variables

COPY Splunk_TA_apache /opt/splunk/etc/apps/

COPY ./entrypoint.sh /
RUN chmod 755 /entrypoint.sh

EXPOSE 8000 8088 8089 8191 9100 9200 9997

ENTRYPOINT ["/entrypoint.sh"]
CMD ["splunk"]
