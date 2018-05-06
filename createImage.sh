#!/bin/sh

#  createImage.sh
#  setting
#
#  Created by 沈传冰 on 2018/5/6.
#  Copyright © 2018年 沈传冰. All rights reserved.
imagePath=$2/cloud_ico.png
#outputPath=$2
#mkdir $outputPath
echo $1 $imagePath $2 $3
cd $2
sudo sips -Z $1 $imagePath --out "$2/$1.png"
echo $1 $imagePath $2 $3 $0
