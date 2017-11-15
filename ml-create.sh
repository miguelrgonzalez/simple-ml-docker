#!/bin/sh

VERSION=9.0-3
PORTS=8000-8050

usage() {
    echo "Usage $0 -n marklogic1 [-v 9.0-3]"
    echo " -n Container name"
    echo " -v MarkLogic version"
    echo " -p 8000-8050 [port range to map]"
    echo " -? show this message"
}

create() {
    docker run -d --name=$NAME --hostname=$NAME.local -p $PORTS:$PORTS mlregistry.marklogic.com/marklogic/ml-$VERSION
}

while getopts "n:v:p:?" opt; do
    case $opt in
        v)
            VERSION="$OPTARG"
            ;;
        n)
            NAME="$OPTARG"
            ;;
        p)
            PORTS="$OPTARG"
            ;;
        ?)
            usage
            exit 0
            ;;
        \?)
            usage
            exit 1
            ;;
    esac
done

if [ -z "$NAME" ]; then
    echo "error: You must provide a container name! "
    usage
    exit 1
fi

create
exit 0
