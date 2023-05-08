FROM debian:bullseye

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# Basics
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY server.py .
RUN pip install ldaptor

CMD [ "python3", "server.py" ]
