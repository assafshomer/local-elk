to run local logstash type
```
  make up
```
and then wait for like 20-30 seconds until the stack can recieve a connection.

Once it's up visit `localhost:5601` or `$(docker-machine ip):5601` or `$(boot2docker ip):5601` depending on your setup and you should see the Kibana interface.
To test, you can direct a logfile via http, for example by typing:
```
  nc $(docker-machine ip) 9998 < foobar.log
```

To stop
```
  make stop
```