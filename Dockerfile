FROM ubuntu:22.10


RUN apt-get update && apt-get install --no-install-recommends -y nano git  python3 python3-uvloop python3-cryptography python3-socks libcap2-bin ca-certificates && rm -rf /var/lib/apt/lists/*
RUN setcap cap_net_bind_service=+ep /usr/bin/python3.10

RUN useradd tgproxy -u 10000

USER tgproxy

WORKDIR /home/tgproxy/

COPY --chown=tgproxy mtprotoproxy.py config.py /home/tgproxy/
#COPY --chown=tgproxy mtprotoproxy.py start.sh /home/tgproxy/
#COPY --chown=tgproxy mtprotoproxy.py  mtprotoproxy/ /home/tgproxy/

#RUN chmod +x /home/tgproxy/start.sh
#RUN chmod 777 /home/tgproxy/mtprotoproxy/

EXPOSE 80

CMD ["python3", "mtprotoproxy.py"]
