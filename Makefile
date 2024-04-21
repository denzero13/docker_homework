IMG=netcat
SERV=server
CLI=client
NET=local
CDIR=$(CURDIR)

all: bridge img  $(SERV) $(CLI)


bridge:
	@if ! docker network inspect $(NET) >/dev/null 2>&1; then \
		echo "Creating Docker network: $(NET)"; \
		docker network create $(NET); \
        else \
   	        echo "Docker network $(NET) already exists"; \
	fi

img:
	@if ! docker image inspect $(IMG) >/dev/null 2>&1; then \
		echo "Creating Docker image: $(IMG)"; \
	        docker build -t $(IMG):latest .; \
	else \
	        echo "Docker image $(IMG) alredy exist"; \
	fi

$(SERV): bridge img
	docker run -d --network $(NET) --name $(SERV) -v "$(CDIR)":/scripts $(IMG) /scripts/$(SERV).sh

$(CLI): bridge img
	docker run -d --network $(NET) --name $(CLI) -v "$(CDIR)":/scripts $(IMG) /scripts/$(CLI).sh

rm:
	docker container rm $(SERV) $(CLI) -f
	rm server_ip

rmi:
	docker network rm $(NET) -f
	docker rmi $(IMG) -f

rm-all: rm rmi
