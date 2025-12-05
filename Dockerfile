#FROM node:20
FROM node:20.19.4-alpine3.22 AS builder
WORKDIR /opt/backend
COPY package.json ./
COPY *.js ./
RUN npm install


FROM node:20.19.4-alpine3.22
RUN addgroup -S expense && adduser -S expense -G expense && \
    mkdir /opt/backend && \
    chown -R expense:expense /opt/backend
ENV DB_HOST="mysql"
#ENV DB_HOST="localhost"
WORKDIR /opt/backend
USER expense
COPY --from=builder /opt/backend/ /opt/backend/
CMD ["node","index.js"]    

