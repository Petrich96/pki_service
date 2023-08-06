DATADB_DIR ?= datadb_dir
EJBCA_DIR ?= ejbca_dir

#Первая цель. Запускается по-умолчанию при вызове make без параметров.
#Запускаем нашу PKI в релизном варианте.
start: startRelease

#Запуск контейнеров в режиме отладки
startDebug: .env
			docker compose \
			-f docker-compose.yml \
			-f docker-compose.debug.yml \
			up \
			-d --force-recreate

#Запуск контейнеров в режиме релиз
startRelease: .env
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


#Создание файла с переменными по умолчанию
.env:
			cp .env.example .env


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
