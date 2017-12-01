FROM ubuntu:17.10

COPY . /app

WORKDIR /app

RUN apt-get update
RUN apt install -y libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev

RUN cmake . -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF

RUN make install

ENV httpd_port=9292
EXPOSE 9292

CMD [ "./start.sh" ]
