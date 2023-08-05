DOCKER_USERNAME ?= username
APPLICATION_NAME ?= hello-world

startDebug:
			docker compose \
			-f docker-compose.yml \
			-f docker-compose.debug.yml \
			up \
			-d --always-recreate-deps


startRelease:
			docker compose \
			-f docker-compose.yml \
			up \
			-d --always-recreate-deps


down:
			docker compose \
			-f docker-compose.yml \
			-f docker-compose.debug.yml \
			down  \
			--remove-orphans


.PHONY: clean
clean:
			docker compose \
			-f docker-compose.yml \
			-f docker-compose.debug.yml \
			down  \
			--remove-orphans \
			-v

.PHONY: cleanAll
cleanAll: clean
			rm -rf datadb_dir ejbca_dir

.PHONY: print
cleanAll: print
			docker compose \
            			-f docker-compose.yml \
            			-f docker-compose.debug.yml \
            			down  \
            			--remove-orphans \
            			-v
