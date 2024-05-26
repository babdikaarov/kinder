# Use the official Nginx image as the base image
FROM nginx:latest

# Install OpenSSL
RUN apt-get update && apt-get install -y openssl

# Generate SSL/TLS certificates
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/certs/private.key -out /etc/nginx/certs/certificate.crt -days 3650 -subj "/CN=mydomain.com"

# Copy the nginx.conf from the host to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports 80 and 443
EXPOSE 80
EXPOSE 443

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
