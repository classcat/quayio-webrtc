# WebRTC

## Summary

Dockerized WebRTC ( [EasyRTC](http://www.easyrtc.com/) ) Demo Applications.  
Run WebRTC service under the control of supervisor daemon in a docker container.  

Ubuntu Vivid/Trusty images with the following services :

+ EasyRTC on node v0.10.37
+ supervisord
+ sshd

built on the top of the formal Ubuntu images.

## Maintainer

[ClassCat Co.,Ltd.](http://www.classcat.com/) (This website is written in Japanese.)

## TAGS

+ latest - vivid
+ vivid
+ trusty

## Pull Image

```
$ sudo docker pull classcat/webrtc
```

## Usage

```
$ sudo docker run -d --name (container-name) \  
-p 2022:22 -p 8080:8080 \  
-e ROOT_PASSWORD=(root-password) \  
-e SSH_PUBLIC_KEY="ssh-rsa xxx" \  
classcat/webrtc
```

## Example usage

```
$ sudo docker run -d --name mywebrtc \  
-p 2022:22 -p 8080:8080 \  
-e ROOT_PASSWORD=mypassword \  
classcat/webrtc
```
