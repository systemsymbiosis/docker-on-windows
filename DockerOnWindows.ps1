﻿cd "C:\Dev\Learning Samples\AWS\ECS\aws-ecs-windows-aspnet\AWSECSSample\AWSECSSample"
dir

docker-compose  -f "C:\Dev\Learning Samples\AWS\ECS\aws-ecs-windows-aspnet\AWSECSSample\docker-compose.yml" -f "C:\Dev\Learning Samples\AWS\ECS\aws-ecs-windows-aspnet\AWSECSSample\docker-compose.override.yml" -p dockercompose9599444262858790027 config

docker run -d --name aspnetcontainer awsecssample:dev

docker ps -a

#One liner to stop / remove all of Docker containers:
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker start aspnetcontainer

docker stop aspnetcontainer

docker stop dockercompose9599444262858790027_awsecssample_1

docker rm aspnetcontainer

docker rm dockercompose9599444262858790027_awsecssample_1

docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" aspnetcontainer

docker images

aws ecr get-login --no-include-email --region us-west-2

Invoke-Expression -Command (aws ecr get-login --no-include-email --region us-west-2 --profile WebSiteFactory)

cd "C:\Dev\Learning Samples\AWS\ECS\aws-ecs-windows-aspnet\AWSECSSample\AWSECSSample"

docker build -t awsecssample .

docker tag awsecssample:dev 871989493406.dkr.ecr.us-west-2.amazonaws.com/ecs:v1

docker push 871989493406.dkr.ecr.us-west-2.amazonaws.com/ecs:v1

docker login -u austindimmer -p '2vM1qBV&4#Dp$6'


docker logout                                   # to make sure you're logged out and not cause any clashes
docker tag <imageId> myusername/docker-whale    # use :1.0.0 for specific version, default is 'latest'
docker login --username=myusername              # use the username/pwd to login to docker hub
docker push myusername/docker-whale             # use :1.0.0 for pushing specific version, default is 'latest'

docker images
docker version
docker info
docker search microsoft
docker pull microsoft/windowsservercore
docker plugin ls
docker service ls
docker service inspect


docker service
docker service create
docker service inspect
docker service logs
docker service ls
docker service ps
docker service rollback
docker service rm
docker service scale
docker service update


docker swarm
docker swarm ca
docker swarm init
docker swarm join-token
docker swarm join
docker swarm leave
docker swarm unlock-key
docker swarm unlock
docker swarm update

Docker image build	
Build an image from a Dockerfile
docker image history	
Show the history of an image
docker image import	
Import the contents from a tarball to create a filesystem image
docker image inspect	
Display detailed information on one or more images
docker image load	
Load an image from a tar archive or STDIN
docker image ls	
List images
docker image prune	
Remove unused images
docker image pull	
Pull an image or a repository from a registry
docker image push	
Push an image or a repository to a registry
docker image rm	
Remove one or more images
docker image save	
Save one or more images to a tar archive (streamed to STDOUT by default)
docker image tag	
Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE

WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all volumes not used by at least one container
        - all images without at least one container associated to them
        - all build cache

docker ps -a

https://blog.sixeyed.com/weekly-windows-dockerfile-1/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch01\ch01-whale"
docker build -t  dockeronwindows/ch01-whale .
docker container run dockeronwindows/ch01-whale

https://blog.sixeyed.com/windows-weekly-dockerfile-2/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch01\ch01-az"
docker build -t dockeronwindows/ch01-az .
docker container run -it dockeronwindows/ch01-az
docker container run dockeronwindows/ch01-az

https://blog.sixeyed.com/weekly-windows-dockerfile-3/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch02\ch02-powershell-env"
docker container run dockeronwindows/ch02-powershell-env

docker container run `  
 --interactive --tty `
 dockeronwindows/ch02-powershell-env `
 cmd

docker container run `  
--detach `
dockeronwindows/ch02-powershell-env `
powershell Test-Connection 'localhost' -Count 1000

https://blog.sixeyed.com/weekly-windows-dockerfile-4/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch02\ch02-dotnet-helloworld"

docker image build -t dockeronwindows/ch02-dotnet-helloworld .
docker container run dockeronwindows/ch02-dotnet-helloworld

https://blog.sixeyed.com/weekly-windows-dockerfile-5/
dotnet restore src
dotnet publish src
docker image build --file Dockerfile.slim --tag dockeronwindows/ch02-dotnet-helloworld:slim .

docker container run dockeronwindows/ch02-dotnet-helloworld:slim


https://blog.sixeyed.com/weekly-windows-dockerfile-6/
docker image build --tag docker-on-windows/ch02-dotnet-hello-world:multistage --file Dockerfile.multistage .
docker container run docker-on-windows/ch02-dotnet-hello-world:multistage

https://blog.sixeyed.com/weekly-windows-dockerfile-7/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch02\ch02-static-website"
docker image build -t dockeronwindows/ch02-static-website .
docker image build -t dockeronwindows/ch02-static-website --build-arg ENV_NAME=TEST .
docker container run -d -P dockeronwindows/ch02-static-website
docker container exec c7f hostname
docker container inspect c7f
$ docker system prune -a --volumes

https://blog.sixeyed.com/weekly-windows-dockerfile-8/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch02\ch02-fs-1"
docker image build -t dockeronwindows/ch02-fs-1 .
docker image inspect --help
docker images
docker image inspect dockeronwindows/ch02-fs-1
docker run --rm stefanscherer/winspector microsoft/iis
docker run --rm stefanscherer/winspector dockeronwindows/ch02-fs-1
#Running a container from this image you can see the new file:

docker container run dockeronwindows/ch02-fs-1 `
powershell cat c:\data\file1.txt
#'from image 1'  
#Of course that file isn't in the base image:

docker container run microsoft/nanoserver `
powershell cat c:\data\file1.txt
#cat : Cannot find path 'C:\data\file1.txt'...  
#And if you modify the file in one container:

docker container run dockeronwindows/ch02-fs-1 `
powershell "echo additional >> c:\data\file1.txt; cat C:\data\file1.txt"
#'from image 1'  
#additional  
#That only edits the file in that container's writeable layer. Run another container from the image and the contents return to the original state:

docker container run dockeronwindows/ch02-fs-1 `
powershell cat c:\data\file1.txt
#'from image 1'  
#One liner to stop / remove all of Docker containers:
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker images
docker ps -a
docker container ls --all
docker image rm 97ebd5a4d4b3
docker container rm 825671e7d302