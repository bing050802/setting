#!/bin/bash

readonly PROGNAME=$(basename $0)
readonly ARGS="$@"

readonly imageContents=$1
imageFile=$2
OUTPATH=$3



imageWithSize(){
    local   size=$1
    local   inputFile=$2
    local   fileName=$3
    local   outputPath=$4
    local   imagePath=$outputPath/$filename

    sips -Z $size $inputFile --out $imagePath;
    if [ $? -eq 0 ];then
        echo "create image size $size $filename sucess"
    else
        echo "create image size $size $filename failed"

    fi

}

imageWithContents(){
    local imageFile=$1
    local outputPath=$2
    local inputFile=$3
    while IFS=: read -r size filename; do
        echo $size $filename
        imageWithSize $size $imageFile $filename $outputPath
    done < $inputFile
}



main(){
    local imageOuputPath
    if [ -d $OUTPATH ];then
        imageOuputPath=$OUTPATH
    else
        imageOuputPath=$(dirname $imageFile)/images
        mkdir $imageOuputPath
    fi

    imageWithContents $imageFile $imageOuputPath $imageContents
}

main
