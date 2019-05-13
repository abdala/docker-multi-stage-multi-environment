FROM node

WORKDIR /opt

ENV PATH="$PATH:/opt/node_modules/.bin"

RUN yarn add tldr \ 
 && tldr --update
