
#Таким образом мы подключаем переменные
include .env
#Первая цель. Запускается по-умолчанию при вызове make без параметров.
#Запускаем нашу PKI в релизном варианте.
start: startRelease

#Запуск контейнеров в режиме отладки
startDebug:
			docker compose \
			-f docker-compose.yml \
			-f docker-compose.debug.yml \
			up \
			-d --force-recreate

#Запуск контейнеров в режиме релиз
startRelease:
			docker compose \
			-f docker-compose.yml \
			up \
			-d --force-recreate

#Остановка контейнеров
down:
			docker compose \
			-f docker-compose.yml \
			-f docker-compose.debug.yml \
			down  \
			--remove-orphans


#Остановка и очистка контейнеров
.PHONY: clean
clean:
			docker compose \
			-f docker-compose.yml \
			-f docker-compose.debug.yml \
			down  \
			--remove-orphans \
			-v

#Остановка и очистка контейнеров, а так же удаление всех данных с диска
.PHONY: cleanAll
cleanAll: clean
			rm -rf $(DATADB_DIR) $(EJBCA_DIR)

