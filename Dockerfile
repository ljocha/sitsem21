# docker build -t ljocha/jupytermeta21 .

FROM ubuntu:18.04

MAINTAINER Ales Krenek <ljocha@ics.muni.cz>

USER root

ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=Europe/Prague

RUN apt update && apt upgrade -y
RUN apt install -y python3-pip git

RUN pip3 install notebook rise
RUN pip3 install matplotlib ipympl
RUN pip3 install scipy

RUN mkdir  -p /usr/local/share/jupyter/nbextensions && cd /usr/local/share/jupyter/nbextensions && git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding && jupyter nbextension enable vim_binding/vim_binding

RUN mkdir -p /work

RUN apt install -y sassc

COPY ljocha.scss patch-reveal-themes.sh /work/

WORKDIR /work
RUN sassc -I /usr/local/lib/python3.6/dist-packages/rise/static/reveal.js/css/theme/source ljocha.scss ljocha.css && ./patch-reveal-themes.sh ljocha.css && cp ljocha.css /usr/local/share/jupyter/nbextensions/rise/reveal.js/css/theme

WORKDIR /work
ENV HOME /work

CMD jupyter nbextension enable vim_binding/vim_binding && jupyter notebook --ip 0.0.0.0 --port 8888 sitsem21.ipynb
