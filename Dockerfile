# Use the official MongoDB Docker image
FROM mongo:4.4

# Expose the MongoDB port
EXPOSE 27017

# The command-line options in the CMD instruction are passed as arguments to mongod
CMD ["mongod", "--replSet", "replicaSet"]
