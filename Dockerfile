FROM ubuntu:16.04

# Update and install common dependencies.
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y build-essential gosu sudo snapcraft
RUN echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/snapbuild

# Set up the entry point script
COPY docker-entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["bash"]
