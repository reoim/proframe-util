#!/usr/bin/ksh
## ---------------------------------------------------------------------------------------------- ##
#  @file           util_check.sh  
#  @brief          
#
#  @dep-program    Proframe utility �Լ� ��� �� ������� ���� (������) �Լ��� �ִ��� Ȯ��
#  @dep-input      ��ƿ��Ƽ ����Ʈ ����
#  @dep-outfile    
#  @usage          util_check.sh FILENAME
#                  ex) util_check.sh file1.txt
#  @history
#  --------   ------     --------    -----------     ---------------------------------------------
#  ��    �� : ��  ��  :  ��  ��   :  �ٰ�  �ڷ�    :          ��       ��        ��       ��
#  --------   ------     --------    -----------     ---------------------------------------------
#  VER1.00  : �̵���  :  20190211  : �ű��ۼ�      :  �ű��ۼ�
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