FROM gliderlabs/alpine

RUN apk update
RUN apk add mini_httpd
COPY content /content
CMD ["mini_httpd", "-d", "/content", "-D"]

