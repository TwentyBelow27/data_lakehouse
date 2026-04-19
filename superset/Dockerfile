FROM apache/superset:2.1.0

# Копируем конфиг в контейнер
COPY superset_config.py /app/superset_config.py

# Указываем путь к конфигу через переменную окружения
ENV SUPERSET_CONFIG_PATH=/app/superset_config.py

ENV ADMIN_USERNAME=admin \
    ADMIN_PASSWORD=admin

USER root

# Копируем скрипт инициализации
COPY docker-init.sh /app/docker-init.sh
RUN chmod +x /app/docker-init.sh

# Переключаемся на пользователя superset
USER superset

ENTRYPOINT ["/app/docker-init.sh"]