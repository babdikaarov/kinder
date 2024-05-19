# Use the official Nginx image as the base image
FROM nginx:latest

# Copy the nginx.conf from the host to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
