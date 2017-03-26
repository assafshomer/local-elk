to run local logstash type
```
  make up
```
and then wait for like 20-30 seconds.

For example, in applicaster2 I had to add the followying keys to `.env.devleopment`
```
  export LOGSTASH_AGENT_UDP_HOST=192.168.99.100
  export LOGSTASH_AGENT_UDP_PORT=9998
```

and the following to `development.yml`
```
  :logstash_config:
    :type: :tcp
    :host: <%= ENV["LOGSTASH_AGENT_UDP_HOST"] %>
    :port: <%= ENV["LOGSTASH_AGENT_UDP_PORT"] %>
```

To stop
```
  make stop
```

For some reason `docker-compose` doesn't work (so basically docker-compose.yml and the config dir are here just for future reference)