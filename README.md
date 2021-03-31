# Introduction

By default the Docker Hub repo for [Apache HTTPD](https://hub.docker.com/_/httpd) exposes only HTTP endpoints. I was working on a project that needed a HTTPS endpoint mandatorily. While I don't remember what that project exactly was, I had to extend the HTTPD container image to offer HTTPS by default too.

#  Building the image

The image is built as usual

```
docker image build -t 0nth/https-ssl:latest .
docker push 0nth/https-ssl:latest
```

# Running the image

To be documented 
