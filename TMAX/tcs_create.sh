#!/usr/bin/ksh
## ---------------------------------------------------------------------------------------------- ##
#  @file           tcs_create.sh  
#  @brief          tcs ������ �����Ѵ�. (���ø� ���)
#
#  @dep-program    
#  @dep-input      TCS Server name
#  @dep-outfile    
#  @usage          tcs_create.sh TCS_SVR_NAME 
#                  ex) tcs_create.sh TPFM02
#  @history
#  --------   ------     --------    -----------     ---------------------------------------------
#  ��    �� : ��  ��  :  ��  ��   :  �ٰ�  �ڷ�    :          ��       ��        ��       ��
#  --------   ------     --------    -----------     ---------------------------------------------
#  VER1.00  : �̵���  :  20181019  : �ű��ۼ�      :  �ű��ۼ�
## ---------------------------------------------------------------------------------------------- ##

## ---------------------------------------------------------------------------------------------- ##
#  c000_init
## ---------------------------------------------------------------------------------------------- ##
c000_init()
{
    unamestr=`uname`
    TCS_DIR=$PFMROOT'/svr/tcs_app'
    TCS_SVR_DIR=$TCS_DIR'/'$TCS_SVR_NAME

    ## ���� ��ġ ���� ���丮 ����
    cd $TCS_DIR
    if [ ! -d $TCS_SVR_DIR ]; then
        mkdir $TCS_SVR_DIR
    else
        echo "(E): �̹� ���� �̸��� TCS ���� ���丮�� �����մϴ�."
        exit -1
    fi
    
}

## ---------------------------------------------------------------------------------------------- ##
#  c100_cp_template
## ---------------------------------------------------------------------------------------------- ##
c100_cp_template()
{
    ## TCS ���� ���ø� ����
    cp -f $TCS_DIR/tcsTemplate/* $TCS_SVR_DIR
    if [ $? != 0 ]; then
        echo "(E): TCS���� ���ø� ���� ���� ==>" $TCS_SVR_NAME
        exit -1
    else
        echo "(D): TCS���� ���ø� ���� ���� ==>" $TCS_SVR_NAME                  
    fi
}

## ---------------------------------------------------------------------------------------------- ##
#  c200_edit_template
## ---------------------------------------------------------------------------------------------- ##
c200_edit_template()
{
    ## ����� ���ø� �̸� ����
    cd $TCS_SVR_DIR
    mv -f tcsTemplate.c $TCS_SVR_NAME'.c' 
    if [ $? != 0 ]; then
        echo "(E): TCS���� �̸� ���� ����. tcsTemplate.c ==>" $TCS_SVR_NAME'.c'
        exit -1
    else
        echo "(D): TCS���� �̸� ���� ����. tcsTemplate.c ==>" $TCS_SVR_NAME'.c'                  
    fi

    mv -f tcsTemplate.mk $TCS_SVR_NAME'.mk' 
    if [ $? != 0 ]; then
        echo "(E): TCS���� �̸� ���� ����. tcsTemplate.mk ==> ${TCS_SVR_NAME}.mk"
        exit -1
    else
        echo "(D): TCS���� �̸� ���� ����. tcsTemplate.mk ==> ${TCS_SVR_NAME}.mk"                  
    fi


    ## �ҽ� ���� ����
    for FILE in `ls -l | grep rw | awk '{print $9}'`
    do
        if [ $unamestr == "AIX" ]; then
            sed  's/tcsTemplate/'$TCS_SVR_NAME'/g' $FILE > temp_file && mv -f temp_file $FILE
        elif [ $unamestr == "Linux"]; then
            sed  -i 's/tcsTemplate/'$TCS_SVR_NAME'/g' $FILE
        fi
        if [ $? != 0 ]; then
            echo "(E): TCS���� �ҽ� ���� ����."
            exit -1
        else
            echo "(D): TCS���� �ҽ� ���� ����"
            chmod 755 $FILE                  
        fi
    done

    echo "(D): ������ TCS ���� �ҽ� ��ġ ==> ["$TCS_SVR_DIR"]"
}


## ---------------------------------------------------------------------------------------------- ##
#  main
## ---------------------------------------------------------------------------------------------- ##
main()
{
    
    ## TX �ڵ�
    TCS_SVR_NAME=$1

    ## �ʱ�ȭ �� ���� ���� ##
    c000_init

    ## ���ø� ���� ##
    c100_cp_template

    ## ���ø� �̸� �� �ҽ� ���� ##
    c200_edit_template

    exit 0
}

main $@