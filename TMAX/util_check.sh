#!/usr/bin/ksh
## ---------------------------------------------------------------------------------------------- ##
#  @file           util_check.sh  
#  @brief          
#
#  @dep-program    Proframe utility 함수 목록 중 적용되지 않은 (누락된) 함수가 있는지 확인
#  @dep-input      유틸리티 리스트 파일
#  @dep-outfile    
#  @usage          util_check.sh FILENAME
#                  ex) util_check.sh file1.txt
#  @history
#  --------   ------     --------    -----------     ---------------------------------------------
#  버    전 : 성  명  :  일  자   :  근거  자료    :          변       경        내       용
#  --------   ------     --------    -----------     ---------------------------------------------
#  VER1.00  : 이동민  :  20190211  : 신규작성      :  신규작성
## ---------------------------------------------------------------------------------------------- ##


FILENAME=$1

if [ $# -lt 1]; then
    echo ""
    echo '-------------------------------------------'
    echo 'Usage: util_check.sh FILENAME'
    echo '   ex) util_check.sh file1.txt'
    echo '-------------------------------------------'
    echo ""
    exit -1
fi

if [ -f $FILENAME ]; then
    while read LIST; do
        if grep -q $LIST $PFMINCDIR/*.h; then
            echo ""
        else
            echo "$LIST not found"
        fi 
    done < $FILENAME
else
    echo "(E): $FILENAME does not exist."
    exit -1
fi