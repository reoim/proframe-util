#!/usr/bin/ksh
## ---------------------------------------------------------------------------------------------- ##
#  @file           convert_charset.sh  
#  @brief          charset을 변경한다.
#
#  @dep-program    
#  @dep-input      기존 charset, 변경할 charset, 변경대상폴더 
#  @dep-outfile    
#  @usage          convert_charset.sh  {기존 charset} {변경할 charset} {변경대상폴더}  
#                  ex) convert_charset.sh UTF-8 eucKR /myhome/test
#  @history
#  --------   ------     --------    -----------     ---------------------------------------------
#  버    전 : 성  명  :  일  자   :  근거  자료    :          변       경        내       용
#  --------   ------     --------    -----------     ---------------------------------------------
#  VER1.00  : 이동민  :  20181019  : 신규작성      :  신규작성
## ---------------------------------------------------------------------------------------------- ##
if [ $# != 3 ]; then
    echo "========================================================================="
    echo "Check input parameters."
    echo "usage: convert_charset.sh  {from charset} {to charset} {to directory}"
    echo "ex) convert_charset.sh UTF-8 eucKR /myhome/test"
    echo "If you want to check available charset of your system, try: locale -a"
    echo "========================================================================="
    exit -1
fi

from_charset=$1
to_charset=$2
charset_dir=$3

cd $charset_dir
if [ $? != 0 ]; then
    echo "Error: Ensure if the directory path is correct. dir = [${charset_dir}]"
    exit -1
fi

list=`ls`
for filename in $list
do
    echo $filename
    iconv -f $from_charset -t $to_charset $filename > /dev/null 2>&1 
    if [ $? != 0 ]; then
        echo "[$filename] Converting failed. Check from/to charset."
    else
        iconv -f $from_charset -t $to_charset $filename > $filename.bak
        mv $filename.bak $filename
        echo "[$filename] Converting successed. [$from_charset] ==> [$to_charset]"
    fi
done

exit 0