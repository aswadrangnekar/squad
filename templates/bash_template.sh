#!/bin/bash
#
# SCRIPT DESCRIPTION
#

SCRIPT_NAME=$0
CMD_ARG1=$1
# NOW=`date +%s`

help(){
    echo "Usage: $SCRIPT_NAME [OPTION]..."
    echo "Cleanup and check script for Jenkins"
    echo "  -h, --help              Show this help output"
    echo "  -x, --xyz               Does XYZ for you"
    echo "  -c, --check             Checks somethigs"
    echo "  -cc, --cleancontainers  Cleans all containers"
    exit 0;
}

run_pep8_check(){
    # RUN SOME CHECKS HERE
    echo -n "> Ran some checks!!"
}

run_something(){
    echo -n "> Run something"
}

run_container_cleaner(){
    echo "> Cleaning all docker containers"

    containers = $(docker ps -a -q)
    echo "> Stop all containers ..."
    if [ ! -z $containers ]; then
        docker stop $(docker ps -a -q)
    else
        echo "No containers found..."
    fi

    echo "> Delete all containers ..."
    if [ ! -z $containers ]; then
        docker rm $(docker ps -a -q)
    else
        echo "Nothing to delete..."
    fi

    echo "> Delete all images ..."
    if [ ! -z "$(docker images -q)" ]; then
        docker rmi -f $(docker images -q)
    else
        echo "No images to delete..."
    fi

    echo "> Clean unused volumes ..."
    docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes
}


# default behavior
xyz=""
checks=0
clean_containers=0

while [ "$#" -gt 0 ]; do
    case "$1" in
        -h|--help) shift; help;;
        -x|--xyz) shift; xyz="something";;
        -c|--check) shift; checks=1;;
        -cc|--cleancontainers) shift; clean_containers=1;;
        # *) defaults="$defaults $1"; shift;
        *) help; shift;
    esac
done


if [ $checks -eq 1 ]; then
    run_checks
    exit $?
fi

if [ $xyz -z something ]; then
    run_something
    exit $?
fi

if [ $clean_containers -eq 1 ]; then
    set_projectdir
    exit $?
fi
