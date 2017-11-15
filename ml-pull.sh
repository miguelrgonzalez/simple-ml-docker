#!/bin/sh


usage() {
    echo "Usage $0 [-v 9.0-3]"
    echo " -v MarkLogic version"
    echo " -? show this message"
}

pull() {
    docker pull mlregistry.marklogic.com/marklogic/$VERSION
}

while getopts "v:?" opt; do
    case $opt in
        v)
            VERSION="$OPTARG"
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

if [ -z "$VERSION" ]; then
    echo "error: You must provide a version! "
    usage
    exit 1
fi

pull
exit 0
