FROM phusion/baseimage:0.9.15
MAINTAINER nando

# Set correct environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV HOME            /root
ENV LC_ALL          C.UTF-8
ENV LANG            en_US.UTF-8
ENV LANGUAGE        en_US.UTF-8
ENV TERM xterm


# Use baseimage-docker's init system
CMD ["/sbin/my_init"]


# Configure user nobody to match unRAID's settings
 RUN \
 usermod -u 99 nobody && \
 usermod -g 100 nobody && \
 usermod -d /home nobody && \
 chown -R nobody:users /home


RUN apt-get update 
RUN apt-get install -qy mc
RUN apt-get install -qy tmux




# Expose Ports
EXPOSE 80 443

# The www directory and proxy config location
VOLUME ["/config", "/web", "/logs"]

