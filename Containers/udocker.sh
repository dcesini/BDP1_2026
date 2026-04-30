##### Launch an ubuntu container
docker run -i -t ubuntu /bin/bash
#---from inside the container
apt-get update
apt-get install fortunes
apt-get install cowsay
apt-get install lolcat
export PATH=/usr/games/:$PATH
fortune | cowsay | lolcat
######  -------------  exit the contair

docker ps -a
docker commit ef048ccf6bd0  ubuntu_with_fortune
docker tag ubuntu_with_fortune dcesini/bdp1_2026:ubuntu_with_fortune_1.0
docker push dcesini/BDP1_2026:ubuntu_with_fortune_1.0

docker run  -e PATH=/usr/games/:${PATH} -e LC_ALL=C  dcesini/BDP1_2026:ubuntu_with_fortune_1.0 /bin/bash -c 'fortune | cowsay | lolcat'

#### Alternatively you can use a Dockerfile

cat Dockerfile
#################################
FROM ubuntu

RUN apt-get update && apt-get install -y fortunes cowsay lolcat

ENV PATH=/usr/games:${PATH}
ENV LC_ALL=C

ENTRYPOINT fortune | cowsay | lolcat

###############################


docker build -t ubuntu_with_fortune4 .
docker run  ubuntu_with_fortune4 /bin/bash -c 'fortune | cowsay | lolcat'
# OR SIMPLY

docker run  ubuntu_with_fortune4

#######################

###################### INSTALL UDOCKER AS A USER ################# 
wget https://github.com/indigo-dc/udocker/releases/download/1.3.17/udocker-1.3.17.tar.gz
tar zxvf udocker-1.3.17.tar.gz
export PATH=`pwd`/udocker-1.3.17/udocker:$PATH
udocker install
#############################

######### PULL A DOCKERHUB IMAGE ##########
udocker pull dcesini/BDP1_2026:ubuntu_with_fortune_5.0
udocker images
#######################

######## RUN THE CONTAINER from that image ###############

udocker run dcesini/BDP1_2026:ubuntu_with_fortune_5.0

