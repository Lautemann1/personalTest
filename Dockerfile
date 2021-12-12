FROM ubi8/ubi
LABEL name Test
MAINTAINER Sven L. sven@bla

ARG BArg
RUN echo && \
    echo "Show one build arg:" && \
    echo "BArg is equal to: $BArg" && \
    echo "--------------"

RUN echo && \
    echo "Show all env vars:" && \
    env && \
    echo "--------------"

# funktioniert nicht:
RUN export state=1

ENV SEL_state=yes
RUN echo && \
    echo "Show all env vars:" && \
    env && \
    echo "--------------"


RUN whoami
RUN adduser sven
USER sven
RUN whoami
USER root
RUN whoami


RUN yum -y install vim httpd procps-ng && \
    yum -y clean all

#USER sven

RUN echo "Hallo Welt" >/var/www/html/index.html
RUN echo "ServerName 127.0.0.1" >> /etc/httpd/conf/httpd.conf

EXPOSE 80

RUN pwd
RUN more /etc/hostname
#RUN /usr/bin/hostname
run ls -al /
WORKDIR /bin
RUN more /etc/hostname
#RUN /usr/bin/hostname
run ls -al /
RUN pwd

COPY html-files /var/www/html

#ENTRYPOINT ["/bin/bash"]
#CMD [""]

#ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


