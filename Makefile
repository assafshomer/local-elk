elasticsearch:
	docker run -it -d --net elk --name elasticsearch -p 9200:9200 -p 9300:9300 elasticsearch:5.2.0

logstash:
	docker run -it -d --net elk --name logstash -p 9998:9998 logstash:5.2.0 \
    -e 'input { tcp { port => "9998" codec => json } } output { elasticsearch { hosts => "elasticsearch" } }'

kibana:
	docker run -it -d --net elk --name kibana -e ELASTICSEARCH_URL=http://elasticsearch:9200 -p 5601:5601 kibana:5.2.0

clean:
	./cleardocker.sh

run: elasticsearch logstash kibana

up: clean run stat

kill:
	docker stop elasticsearch
	docker stop logstash
	docker stop kibana

stop:	kill stat

stat:
	docker ps