FROM alpine:3.19
LABEL maintainer=cupen<cupen@gmail.com>

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache bash ca-certificates python3 py3-pip 
RUN apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Chongqing /etc/localtime \
    && echo "Asia/Chongqing" > /etc/timezone

RUN python3 -m venv /py/ \
    && source /py/bin/activate \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install pipenv invoke


RUN apk add --no-cache nodejs npm protoc
RUN source /py/bin/activate \
    && pip install excel2xx==0.11.8 \
    && pip install protobuf==5.26

ENV PATH="${PATH}:/py/bin:/bin"
RUN echo "export PATH=${PATH}" >> /etc/profile
ENV PIPENV_VENV_IN_PROJECT=1

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
