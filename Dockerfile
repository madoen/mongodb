# Use the official MongoDB Docker image
FROM mongo:4.4

# Define environment variables
ENV MONGO_INITDB_ROOT_USERNAME=admin
ENV MONGO_INITDB_ROOT_PASSWORD=password

# When this Docker image is started, this script will be run
COPY setup-replica.sh /docker-entrypoint-initdb.d/

# Ensure the script is executable
RUN chmod +x /docker-entrypoint-initdb.d/setup-replica.sh

# Expose the MongoDB port
EXPOSE 27017

CMD ["--replSet", "rs0"]
