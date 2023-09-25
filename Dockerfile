FROM debian:bookworm

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN pip install --break-system-packages ldaptor
COPY server.py .
COPY data.ldif .

CMD [ "python3", "server.py", "389" ]
