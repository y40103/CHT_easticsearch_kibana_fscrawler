FROM elasticsearch:7.17.6

ADD elasticsearch-analysis-ik-7.17.6.zip /tmp/

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch file:///tmp/elasticsearch-analysis-ik-7.17.6.zip

RUN rm -rf /tmp/*
RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update
RUN apt-get -y install opencc

COPY s2t.sh /home/root/s2t.sh

RUN /usr/bin/bash /home/root/s2t.sh
