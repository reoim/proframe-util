#!/usr/bin/ksh
## ---------------------------------------------------------------------------------------------- ##
#  @file           ucs_create.sh  
#  @brief          ucs 상주배치 서버를 생성한다. (템플릿 기반)
#
#  @dep-program    
#  @dep-input      배치코드(BAT_CODE)
#  @dep-outfile    
#  @usage          ucs_create.sh BAT_CODE 
#                  ex) ucs_create.sh UCOM_APP_C001
#  @history
#  --------   ------     --------    -----------     ---------------------------------------------
#  버    전 : 성  명  :  일  자   :  근거  자료    :          변       경        내       용
#  --------   ------     --------    -----------     ---------------------------------------------
#  VER1.00  : 이동민  :  20181017  : 신규작성      :  신규작성
## ---------------------------------------------------------------------------------------------- ##

## ---------------------------------------------------------------------------------------------- ##
#  c000_init
## ---------------------------------------------------------------------------------------------- ##
c000_init()
{
    unamestr=`uname`
    UCS_DIR=$PFMROOT'/svr/ucs'
    BAT_DIR=$UCS_DIR'/'$BAT_CODE

    ## 상주 배치 서버 디렉토리 생성
    cd $UCS_DIR
    if [ ! -d $BAT_DIR ]; then
        mkdir $BAT_DIR
    else
        echo "(E): 이미 같은 이름의 상주서버 디렉토리가 존재합니다."
        exit -1
    fi
    
}

## ---------------------------------------------------------------------------------------------- ##
#  c100_cp_template
## ---------------------------------------------------------------------------------------------- ##
c100_cp_template()
{
    ## 상주배치 서버 템플릿 복사
    cp -f $UCS_DIR/ucsTemplate/* $BAT_DIR
    if [ $? != 0 ]; then
        echo "(E): 상주배치서버 템플릿 복사 에러 ==>" $BAT_CODE
        exit -1
    else
        echo "(D): 상주배치서버 템플릿 복사 성공 ==>" $BAT_CODE                  
    fi
}

## ---------------------------------------------------------------------------------------------- ##
#  c200_edit_template
## ---------------------------------------------------------------------------------------------- ##
c200_edit_template()
{
    ## 복사된 템플릿 이름 변경
    cd $BAT_DIR
    mv -f ucsTemplate.c $BAT_CODE'.c' 
    if [ $? != 0 ]; then
        echo "(E): 상주배치서버 이름 변경 실패. ucsTemplate.c ==>" $BAT_CODE'.c'
        exit -1
    else
        echo "(D): 상주배치서버 이름 변경 성공. ucsTemplate.c ==>" $BAT_CODE'.c'                  
    fi

    mv -f ucsTemplate.mk $BAT_CODE'.mk' 
    if [ $? != 0 ]; then
        echo "(E): 상주배치서버 이름 변경 실패. ucsTemplate.mk ==> ${BAT_CODE}.mk"
        exit -1
    else
        echo "(D): 상주배치서버 이름 변경 성공. ucsTemplate.mk ==> ${BAT_CODE}.mk"                  
    fi


    ## 소스 내용 변경
    for FILE in `ls -l | grep rw | awk '{print $9}'`
    do
        if [ $unamestr == "AIX" ]; then
            sed  's/ucsTemplate/'$BAT_CODE'/g' $FILE > temp_file && mv -f temp_file $FILE
        elif [ $unamestr == "Linux"]; then
            sed  -i 's/ucsTemplate/'$BAT_CODE'/g' $FILE
        fi
        if [ $? != 0 ]; then
            echo "(E): 상주배치서버 소스 변경 실패."
            exit -1
        else
            echo "(D): 상주배치서버 소스 변경 성공"
            chmod 755 $FILE                  
        fi
    done

    echo "(D): 생성된 상주배치서버 소스 위치 ==> "$BAT_DIR
}


## ---------------------------------------------------------------------------------------------- ##
#  main
## ---------------------------------------------------------------------------------------------- ##
main()
{
    
    ## 배치코드
    BAT_CODE=$1

    ## 초기화 및 변수 설정 ##
    c000_init

    ## 템플릿 복사 ##
    c100_cp_template

    ## 템플릿 이름 및 소스 수정 ##
    c200_edit_template

    exit 0
}

main $@