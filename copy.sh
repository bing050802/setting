#!/bin/bash

launchImage2="logo@2x.png"
launchImage3="logo@3x.png"
slogan2="slogan@2x.png"
slogan3="slogan@3x.png"
logo_image2="icon_logo_2_cloudoc_2@2x.png"
logo_image3="icon_logo_2_cloudoc_2@3x.png"
app_icsons="AppIcon.appiconset"




destDiret=$1
inport=$2

enDiretory=$destDiret'/Cloudoc2/en.lproj'
baseDiretory=$destDiret'/Cloudoc2/Base.lproj'
HansDiretory=$destDiret'/Cloudoc2/zh-Hans.lproj'
app_icon_path=$inport/$app_icsons"/"
app_icon_dpath=$destDiret'/Cloudoc2/NEWYHZ.xcassets/AppIcon_2.appiconset/'
app_icon_AppIcon_contents=$destDiret'/Cloudoc2/NEWYHZ.xcassets/AppIcon_2.appiconset/contents.json'
ls $inport

#
#jq -r '[.images[] | {size: .size,filename: .filename,scale: .size}]' $app_icon_AppIcon_contents
#images=$(jq -r ".images[] | [.size,.filename,.scale] " $app_icon_AppIcon_contents)
#echo $images
#for image in ${images[@]};
#do
#echo $image
#
#
#
#done

#复制图标
rm -rf $app_icon_dpath
cp -rf $app_icon_path $app_icon_dpath
echo $app_icon_path
echo $app_icon_dpath
echo "复制图标 成功了吗" $?

#ls $enDiretory
#根据工程的launchImage名字来更改源文件的名字
launchImage2_path=$inport/$launchImage2
echo "logo@2x.png的路径" "launchImage2_path=$launchImage2_path"
launchImage_d_2=$(find $enDiretory -name "icon_logo_2_cloudoc_2_en*@2x.png";)
echo "launchImage_d_2=$launchImage_d_2"
cp -f $launchImage2_path $launchImage_d_2


launchImage3_path=$inport/$launchImage3
echo $launchImage3_path
launchImage_d_3=$(find $enDiretory -name "icon_logo_2_cloudoc_2_en*@3x.png";)
echo $start3
cp -f $launchImage3_path $launchImage_d_3

slogan2_path=$inport/$slogan2
slogan2_d=$(find $enDiretory -name "slogan*@2x.png";)
echo $slogan2_d
cp -f $slogan2_path $slogan2_d


slogan3_path=$inport/$slogan3
slogan3_d=$(find $enDiretory -name "slogan*@3x.png";)
echo $start3
cp -f $slogan3_d $slogan3_path





for d in {$enDiretory,$baseDiretory,$HansDiretory};
do
for i in {2,3};
    do
        dpath="$d""/icon_logo_2_cloudoc_2@"$i"x.png"
        echo $dpath
        spath="$inport""/logo@"$i"x.png"
        cp -f $spath $dpath
        echo $spath
        echo $dpath
        echo $i
    done
done

setting_path=$inport/"setting.txt"
echo $setting_path
linenum=0
cat $setting_path | while read line;
do
    if [ $linenum -eq 0 ]
    then
    echo "修改英文appName"
    infoPlist_dpath=$destDiret'/Cloudoc2/en.lproj/InfoPlist.strings'
    : > $infoPlist_dpath
   echo "$infoPlist_dpath cleaned up."
   echo $infoPlist_dpath
    echo $line  > $infoPlist_dpath
fi
if [ $linenum -eq 1 ]
then
echo "修改中文appName"
infoPlist_dpath=$destDiret'/Cloudoc2/zh-Hans.lproj/InfoPlist.strings'
: > $infoPlist_dpath
echo "$infoPlist_dpath cleaned up."
echo $infoPlist_dpath
echo $line  > $infoPlist_dpath
fi

    linenum=`expr $linenum + 1`;
echo $line;
done

#for k in {0,1,2,3,4,5};
#do
#    echo $k
#    if [ $k -eq 0 ]
#    then
#        echo "修改英文appName"
#    infoPlist_dpath=$destDiret'/Cloudoc2/en.lproj/InfoPlist.strings'
#    : > $infoPlist_dpath
#    echo "$infoPlist_dpath cleaned up."
#    echo $infoPlist_dpath
#    echo $i  > $infoPlist_dpath
#    fi
#done









#ls $enDiretory
#start22=$(find $inport -name "icon_logo_2_cloudoc_2_en*@2x.png");
#fileName=$(basename "$start2")
#result=$inport/$fileName
#echo $result $start22
#ls $Inport
#mv -f $start22 $result
#echo $start22
#ls $Inport
#
##复制launchImage2 到目标工程,并覆盖
#cp -f result enDiretory
#
#cp -f


