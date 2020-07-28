# RabbitMQ Cluster

This project includes a RabbitMQ cluster for Docker, using the MassTransit RabbitMQ image, and HAProxy to front-end the three node cluster. MassTransit only needs to connect to a single host (in this case, `haproxy`), and HAProxy will select available cluster nodes automatically.

As nodes are taken up/down, the Quartz service will reconnect when the connection is dropped.