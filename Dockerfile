# Use Alpine as a base image to fetch CA certificates
FROM alpine as certs
RUN apk update && apk add ca-certificates
RUN apk --no-cache add curl

# Use BusyBox as the final image
FROM busybox:latest

# Copy CA certificates and curl binary from the 'certs' stage to the current image
COPY --from=certs /etc/ssl/certs /etc/ssl/certs
COPY --from=certs /usr/bin/curl /bin/curl

# Set the working directory to /bin
WORKDIR /bin

# Make the curl binary executable
RUN chmod +x /bin/curl
#RUN export PATH=$PATH:/bin/curl

# Set the working directory to /home
WORKDIR /home

# Add metadata to the image using LABEL
LABEL org.opencontainers.image.title="BusyBox with curl"
LABEL org.opencontainers.image.description="A minimal image based on BusyBox with curl added"
LABEL org.opencontainers.image.authors="Wael Mohamed <wael.mohamed@atos.net>, Wael Mohamed <wael.mohamed.ahmed2@gmail.com>"
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.license="MIT"

# Default command to run when the container starts
CMD ["/bin/sh"]
