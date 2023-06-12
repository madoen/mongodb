FROM mongo:5

CMD ["mongod", "--replSet", "myReplicaSet", "--bind_ip", "localhost,mongo1"]

EXPOSE 27017
