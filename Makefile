#include .env

env_file:=".env"
gen-pass:
	@echo "generating passwords into env file"
	@echo "password=`openssl rand -base64 12 | tr --delete =`" > $(env_file)
	@echo 


start:
	docker compose up -d


build-image:
	echo $(images)


install-with-nginx:
	mkdir -p /etc/nginx/conf.d/project-engine/
	cp ./jenkins/nginx.locations /etc/nginx/conf.d/project-engine/jenkins.locations
	cp ./registry/nginx.locations /etc/nginx/conf.d/project-engine/registry.locations
	nginx -t && systemctl reload nginx


install-over-ssh:
	ssh $(host) "rm -fr /tmp/project-engine && mkdir -p /tmp/project-engine /data/project-engine"
	scp -r ./* $(host):/tmp/project-engine
	ssh $(host) "sudo cp -r /tmp/project-engine/* /data/project-engine" \
				"&& cd /data/project-engine" \
				"&& sudo make gen-pass install-with-nginx" \
				"&& sudo make start"
