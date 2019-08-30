#!/bin/bash

function intoDocker(){
    sign=$(/usr/bin/docker ps --format 'table {{.ID}}\t{{.Names}}' | grep $1 | awk '{print $1}')
    echo $sign;
    if [ ! -n "$sign" ] ; then
        echo "无对应的镜像";
    else
        /usr/bin/docker exec -it $sign /bin/bash
    fi
}

intoDocker $1