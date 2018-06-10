cd "C:\Dev\Learning Samples\AWS\ECS\aws-ecs-windows-aspnet\AWSECSSample\AWSECSSample"
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

https://blog.sixeyed.com/weekly-windows-dockerfile-9-container-filesystem-part-2/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch02\ch02-fs-2"
docker image build -t dockeronwindows/ch02-fs-2 .

docker container run dockeronwindows/ch02-fs-2 `
powershell ls C:\data

https://blog.sixeyed.com/weekly-windows-dockerfile-10-volumes/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch02\ch02-volumes"
docker image build -t dockeronwindows/ch02-volumes .

docker container run `
--name c1 dockeronwindows/ch02-volumes `
"Set-Content -Value 'abc' -Path c:\app\logs\file1.txt"

docker container run `
 --volumes-from c1 dockeronwindows/ch02-volumes `
 "cat c:\app\logs\file1.txt"

docker container inspect -f '{{ json .Mounts }}' c1 |    ConvertFrom-Json
docker volume ls


https://blog.sixeyed.com/windows-weekly-dockerfile-11-a-stateful-asp-net-core-app/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch02\ch02-hitcount-website"
docker image build --tag dockeronwindows/ch02-hitcount-website .
docker container run --detach --publish 80 --name week-11 dockeronwindows/ch02-hitcount-website

$ip = docker container inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' week-11
Write-Host $ip
start "http://$ip"

#First remove the original container:

docker rm -f week-11
#Now create a directory on the host for the volume mapping, and run a container using a volume with that path:

mkdir C:\app-state

docker container run -d -p 80 `
 -v C:\app-state:C:\dotnetapp\app-state `
 --name week-11 `
 dockeronwindows/ch02-hitcount-website
#Browse to the new container and refresh to bump up the hit count:

start "http://$(docker container inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' week-11)"  
#You can see the contents of the file from the host:

cat C:\app-state\hit-count.txt
26  
#And now you can replace the container, and the new one will have the same state:

docker container rm -f week-11

docker container run -d -p 80 `
 -v C:\app-state:C:\dotnetapp\app-state `
 --name week-11 `
 dockeronwindows/ch02-hitcount-website

start "http://$(docker container inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' week-11)"  


https://blog.sixeyed.com/windows-weekly-dockerfile-12-nerddinner/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch02\ch02-nerd-dinner"

docker image build -t dockeronwindows/ch02-nerd-dinner .
docker container run -d -p 85:80 --name week-12 dockeronwindows/ch02-nerd-dinner
docker container ls
start "http://$(docker container inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' week-12)"  


https://blog.sixeyed.com/windows-weekly-dockerfile-13-iis-logging/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch03\ch03-iis-log-watcher"

docker container run -d -p 86:80 --name iis1 microsoft/iis:windowsservercore  
start "http://localhost:86/"
docker container exec -it iis1 powershell "ls C:\inetpub\logs\LogFiles\W3SVC1"
docker container exec -it iis1 powershell "cat C:\inetpub\logs\LogFiles\W3SVC1\u_ex180520.log"

docker image build -t dockeronwindows/ch03-iis-log-watcher .
docker container rm -f iis2
docker container run -d -p 8098:80 --name iis2 dockeronwindows/ch03-iis-log-watcher
start "http://localhost:8098/"
docker container logs iis2


https://blog.sixeyed.com/windows-weekly-dockerfile-14-environment-variables/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch03\ch03-iis-environment-variables"

docker container run --env ENV_01='Hello' --env ENV_02='World' microsoft/nanoserver `
powershell 'Write-Output "$env:ENV_01 $env:ENV_02"'

docker container run `
--env ENV_01='Hello' --env ENV_02='World' `
microsoft/nanoserver `
powershell 'cmd /c echo %ENV_01% %ENV_02%'

docker image build -t dockeronwindows/ch03-iis-environment-variables .
docker container run -d -p 88:80 --name iisEnvironment dockeronwindows/ch03-iis-environment-variables
docker container rm -f iisEnvironment
start "http://localhost:88/"

docker image build --file Dockerfile.servicemonitor -t dockeronwindows/ch03-iis-environment-variables:servicemonitor .
docker container run -d -p 89:80 --name iisEnvironmentServicemonitor `
dockeronwindows/ch03-iis-environment-variables:servicemonitor
start "http://localhost:89/"

  
https://blog.sixeyed.com/windows-weekly-dockerfile-15-healthchecks/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch03\ch03-iis-healthcheck"

#One liner to stop / remove all of Docker containers:
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)



docker image build -t dockeronwindows/ch03-iis-healthcheck .
docker container run -d -p 89:80 --name healthchceck dockeronwindows/ch03-iis-healthcheck

docker container ls
$ip = docker container inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' healthchceck
Write-Host $ip
start "http://$ip"
iwr -method POST http://$ip/toggle/unhealthy
iwr -method POST http://$ip/toggle/healthy

docker swarm init
# docker : Error response from daemon: could not choose an IP address to advertise since this system has multiple addresses on interface WiFi
ipconfig /all
$ip = 192.168.1.3
docker swarm init --advertise-addr 192.168.1.3
docker node ls

docker service create -d --name wwf-15 `
--publish published=89,target=80,mode=host `
dockeronwindows/ch03-iis-healthcheck

docker service ls
docker service ps wwf-15
docker service inspect wwf-15
docker service rm wwf-15

$ip = 192.168.1.3
Write-Host $ip
start "http://192.168.1.3:89"
iwr -method POST http://192.168.1.3:89/toggle/unhealthy
iwr -method POST http://192.168.1.3:89/toggle/healthy
docker service ps wwf-15

docker service rm wwf-15

https://blog.sixeyed.com/windows-weekly-dockerfile-16-sql-server/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch03\ch03-nerd-dinner-db"

docker container run -d -p 1433:1433 --name sql-db -e sa_password=DockerCon! -e ACCEPT_EULA=Y microsoft/mssql-server-windows-express:2017-GA
$ip = docker container inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' sql-db
Write-Host $ip

SELECT host_platform, host_distribution, host_release  
FROM sys.dm_os_host_info;  

docker image build -t dockeronwindows/ch03-nerd-dinner-db .
docker container run `
  -d -p 1433:1433 `
  --name nerd-dinner-db `
  dockeronwindows/ch03-nerd-dinner-db

$ip = docker container inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' nerd-dinner-db
Write-Host $ip

INSERT INTO dbo.webpages_Roles (RoleName)  
VALUES ('Temp')  


docker container exec `
 nerd-dinner-db `
 powershell "Invoke-SqlCmd -Database NerdDinner -Query 'SELECT * FROM webpages_Roles'"

mkdir -p C:\databases\nerd-dinner

#One liner to stop / remove all of Docker containers:
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker container run `
  -d -p 1433:1433 `
  -v C:\databases\nerd-dinner:C:\data `
  --name nerd-dinner-db `
  dockeronwindows/ch03-nerd-dinner-db

$ip = docker container inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' nerd-dinner-db
Write-Host $ip


https://blog.sixeyed.com/windows-weekly-dockerfile-17-connecting-containers/
cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch03\ch03-nerd-dinner-web"
docker container ls
docker container run -d --name c1 microsoft/nanoserver ping -n 1000 localhost
docker container run -d --name c1 --network=nat --ip 172.22.194.57 microsoft/nanoserver ping -n 1000 localhost
docker container run -d --name c1 --network=nat --ip 172.22.194.57 microsoft/nanoserver ping nerd-dinner-db
docker container run -d -p 84:80 --name c1 microsoft/nanoserver
docker network connect nat c1
docker network inspect nat
docker inspect c1
docker container stop c1
docker container rm c1
docker container run -d -p 83:80 --name c1 microsoft/nanoserver
docker container run --name c2 microsoft/nanoserver ping c1
docker inspect c2

docker container exec `
 c1 `
 powershell "ping nerd-dinner-db"

docker container exec `
 c1 `
 powershell "ping 8.8.8.8"

# https://docs.docker.com/v17.09/engine/userguide/networking/
# https://docs.docker.com/engine/reference/commandline/network/
#Docker creates a network called nat by default
docker network inspect nat
docker network inspect bridge
docker network inspect none

docker network connect	#Connect a container to a network
docker network create	#Create a network
docker network disconnect	#Disconnect a container from a network
docker network inspect	#Display detailed information on one or more networks
docker network ls	#List networks
docker network prune    #Remove all unused networks
docker network rm	#Remove one or more networks


# https://docs.docker.com/v17.09/engine/userguide/networking/
docker network create --driver nat isolated_nw
docker network inspect isolated_nw
docker network ls
docker container ls

docker container run -d -p 89:80 --name c3 --network isolated_nw microsoft/nanoserver
docker container run -d -p 89:80 --name c4 --network isolated_nw microsoft/nanoserver ping c3
docker inspect c3
docker inspect c4

# https://github.com/docker/for-win/issues/294
docker network create -d transparent transparent
docker network ls

Get-VMSwitch | fl
Get-NetAdapter | fl
Get-NetNAT | fl

# Yes this still fails I'm afraid.
docker run --rm -ti microsoft/nanoserver ping 8.8.8.8
docker run --rm -ti --network=nat microsoft/nanoserver ping 8.8.8.8

# This succeeds:
docker run --rm -ti --network=transparent microsoft/nanoserver ping 8.8.8.8
docker run --rm -ti --network=nat microsoft/nanoserver ipconfig /all

docker ps -a

cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch03\ch03-nerd-dinner-web"

docker image build -t dockeronwindows/ch03-nerd-dinner-web .

docker container stop nerd-dinner-web
docker container rm nerd-dinner-web


docker container run -d -p 88:80 --name nerd-dinner-web dockeronwindows/ch03-nerd-dinner-web


docker container run `
  -d -p 1433:1433 `
  --name nerd-dinner-db `
  dockeronwindows/ch03-nerd-dinner-db

docker container run -d -p 8081:80 --name nerd-dinner-web dockeronwindows/ch03-nerd-dinner-web
start "http://localhost:8081"

docker inspect nerd-dinner-web

# [WebException: The remote name could not be resolved: 'nerd-dinner-homepage']
# https://blog.sixeyed.com/windows-weekly-dockerfile-18-splitting-ui/
# https://blog.sixeyed.com/windows-weekly-dockerfile-19-integrating-ui-containers/

cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch03\ch03-nerd-dinner-homepage"
docker image build --tag dockeronwindows/ch03-nerd-dinner-homepage .
docker container run -d -p 87:80 --name nerd-dinner-homepage dockeronwindows/ch03-nerd-dinner-homepage


cd "C:\Dev\Learning Samples\Docker\docker-on-windows\ch03\ch03-nerd-dinner-web"
docker image build -t dockeronwindows/ch03-nerd-dinner-web:v2 .

md C:\databases\nd

#One liner to stop / remove all of Docker containers:
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker container run -d -p 1433:1433 --name nerd-dinner-db -v C:\databases\nd:C:\data dockeronwindows/ch03-nerd-dinner-db

docker container run -d -P  `
  --name nerd-dinner-homepage `
  dockeronwindows/ch03-nerd-dinner-homepage

docker container run -d -P `
  --name nerd-dinner `
  dockeronwindows/ch03-nerd-dinner-web:v2

$ip = docker container inspect --format '{{ .NetworkSettings.Networks.nat.IPAddress }}' nerd-dinner
Write-Host $ip
start "http://$ip"

# [WebException: The remote name could not be resolved: 'nerd-dinner-homepage']
docker network inspect nat
# https://github.com/docker/for-win/issues/500
docker network ls
docker network rm nat
docker network rm transparent
docker network rm isolated_nw

# https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-containers/swarm-mode#creating-an-overlay-network
docker network create --driver=overlay overlaytest


#Once an overlay network has been created, services can be created and attached to the network. A service is created with the following syntax:

# Deploy a service to the swarm
# C:\> docker service create --name=<SERVICENAME> --endpoint-mode dnsrr --network=<NETWORKNAME> <CONTAINERIMAGE> [COMMAND] [ARGS…]
# Here, <SERVICENAME> is the name you'd like to give to the service--this is the name you will use to reference the service via service discovery (which uses Docker's native DNS server). <NETWORKNAME> is the name of the network that you would like to connect this service to (for example, "myOverlayNet"). <CONTAINERIMAGE> is the name of the container image that will defined the service.
# Note: The second argument to this command, --endpoint-mode dnsrr, is required to specify to the Docker engine that the DNS Round Robin policy will be used to balance network traffic across service container endpoints. Currently, DNS Round-Robin is the only load balancing strategy supported on Windows.Routing mesh for Windows docker hosts is not yet supported, but will be coming soon. Users seeking an alternative load balancing strategy today can setup an external load balancer (e.g. NGINX) and use Swarm’s publish-port mode to expose container host ports over which to load balance.
docker volume create nerddbtestvolume
docker volume ls
docker volume ls -f dangling=true
docker swarm init --advertise-addr 192.168.1.3
docker node ls
docker swarm leave
docker swarm leave --force


docker service create -d --name nerd-dinner-db `
--mount type=volume,source=nerddbtestvolume,target=C:/data/ `
--publish published=8091,target=80,mode=host `
--endpoint-mode dnsrr --network=overlaytest `
--replicas 2 `
dockeronwindows/ch03-nerd-dinner-db

docker service create -d --name nerd-dinner-homepage `
--publish published=8092,target=80,mode=host `
--endpoint-mode dnsrr --network=overlaytest `
--replicas 2 `
dockeronwindows/ch03-nerd-dinner-homepage

docker service create -d --name nerd-dinner `
--publish published=8093,target=80,mode=host `
--endpoint-mode dnsrr --network=overlaytest `
--replicas 2 `
dockeronwindows/ch03-nerd-dinner-web:v2

docker network inspect overlaytest

start "http://localhost:8093"


docker service ls
docker service ps nerd-dinner
docker service ps nerd-dinner-db

docker service inspect nerd-dinner-db
docker service inspect nerd-dinner-homepage
docker service inspect nerd-dinner

docker service rm nerd-dinner-db
docker service rm nerd-dinner-homepage
docker service rm nerd-dinner


docker service ls
docker inspect serviceid

docker node ls


Stop-Service docker
Start-Service docker

# https://docs.microsoft.com/en-us/virtualization/windowscontainers/container-networking/advanced#bind-a-network-to-a-specific-network-interface
#C:\> docker network create -d overlay -o com.docker.network.windowsshim.interface="Ethernet 2" TransparentNet2
docker network create -d overlay -o com.docker.network.windowsshim.interface="WiFi" overlaytest
# Note: The value for com.docker.network.windowsshim.interface is the network adapter's Name, which can be found with:

Get-NetAdapter

docker network ls
docker network rm overlaytest
docker network create -d overlay -o com.docker.network.windowsshim.interface="WiFi" overlaytest
docker network inspect overlaytest
