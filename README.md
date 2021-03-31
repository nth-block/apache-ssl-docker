# Introduction

By default the Docker Hub repo for [Apache HTTPD](https://hub.docker.com/_/httpd) exposes only HTTP endpoints. I was working on a project that needed a HTTPS endpoint mandatorily. While I don't remember what that project exactly was, I had to extend the HTTPD container image to offer HTTPS by default too.

#  Building the image

The image is built as usual

```
docker image build -t 0nth/https-ssl:latest .
```

> Please note that you will have to keep your certificate chain (public keys) and the server certificate (including the private key) in the directory. I used LetsEncrypt to get me those certificates.

**Security Note: From a security standpoint having an image with a private key is a bad idea as there are attack avenues where the private key may be compromised when a container repo is accidentally publically available. Therefore this image is not pushed to my Docker Hub account.**

# Running the image

To run the image is avery straight forward process

```
docker run --rm -d --name apache-ssl -p 8080:80 -p 8081:443 0nth/httpd-ssl
```