#
#################################################################
# Dockerfile to build Mixpanel event extraction container images
# Based on ruby:2.2.0
##################################################################

# Set the base image
FROM ruby:2.2.0

MAINTAINER Kada Situ <kada@methodmill.com>

# Update the repository sources list
# RUN apt-get update

# Install and setup SSH key for Github clone
#RUN mkdir -p /root/.ssh
#RUN chmod 700 /root/.ssh
#ADD ./id_rsa /root/.ssh/id_rsa
#RUN chmod 600 /root/.ssh/id_rsa
#RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Set working directory
WORKDIR /root

RUN git clone https://79c556d4e1871fad7648c7a0ca789be679e8a6b2@github.com/methodmill/DataRobot

# Install gems
RUN cd DataRobot/Mixpanel && bundle install



# Delete the private key and thank you for your sevice
# RUN rm /root/.ssh/id_rsa

# You can setup environment variables for launching containers to the rake task
# ENV AWS_ACCESS_KEY_ID <FILL-IN>
# ENV AWS_SECRET_ACCESS_KEY <FILL-IN>
# ENV SLACK_TOKEN <FILL-IN>
# ENV SLACK_CHANNEL_ID C07AQV3MX
# ENV SLACK_USER kada
# ENV SLACK_RECIPIENT_NAME kada

