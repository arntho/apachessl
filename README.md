docker build -t simply4it/apachessl . && echo "BUILD READY" && docker run -it -p 8443:8443 simply4it/apachessl
