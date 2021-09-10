# Use Fedora 34 as base image
FROM registry.fedoraproject.org/fedora-minimal:34
LABEL maintainer="Preston Davis pdavis@pebcac.org"

# Install httpd
RUN microdnf install -y httpd zsh --nodocs --setopt install_weak_deps=0 && \
      microdnf clean all -y

# Copy the website
COPY files/* /var/www/html/

# Expose Port 80/tcp
EXPOSE 80

# Start httpd
CMD ["httpd", "-DFOREGROUND"]
