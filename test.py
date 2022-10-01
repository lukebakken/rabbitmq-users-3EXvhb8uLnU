#!/usr/bin/env python
import pika

connection = pika.BlockingConnection(pika.connection.URLParameters('amqp://default:password@localhost:5673/%2f/messages'))
channel = connection.channel()
channel.queue_declare(queue='messages_normal')
channel.basic_publish(exchange='', routing_key='hello', body='Hello World!')
print(" [x] Sent 'Hello World!'")
connection.close()
