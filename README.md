# Testing Docker image for Rocky Linux with PHP Kafka client 

Put your credentials and Kafka bootstrap servers in `.env` file, add ca-cert, then build container


```
./build.sh
```

run it and list Kafka topics

```
docker run --env-file .env -ti rlkafka
# php kafka-topics.php
```

