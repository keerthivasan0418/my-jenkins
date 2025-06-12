#!/bin/bash

image_name="shopping-ui-3"
tag="latest"
dockerhub_username="keerthivasan041803"
dockerhub_repo="dev"
dockerhub_pri_repo="prod"
main_name="$dockerhub_username/$dockerhub_repo"
main_name_pri=$dockerhub_username/$dockerhub_pri_repo
full_name=$main_name:$tag
full_name_pri=$main_name_pri:$tag
branch=$1




echo "logging into docker hub"
docker login -u="keerthivasan041803" -p="kee@77189"


echo "building the immage "
sudo docker build -t $image_name:$tag .



if [ $branch == "dev" ] then 
    echo "tagging the image $main_name"
    sudo docker tag $image_name:$tag $full_name
    echo "pushing the docker image"
    sudo docker push $main_name
fi

if [$branch =="master"] then 
    echo "tagging the image $main_name_pri"
    sudo docker tag $image_name:$tag $full_name_pri  
    echo "pushing the image to pri repo"
    sudo docker push $main_name_pri 
fi 