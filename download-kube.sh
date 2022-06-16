!/bin/bash
if [[ $1 == "" ]]
then
    echo "Usage: ./change-kube-ver.sh <version>";
    exit
fi
source config.sh
version=$1
echo "Configuring version......";
./change-kube-ver.sh ${version} || exit 1
./download-kubespray-files.sh || exit 1
