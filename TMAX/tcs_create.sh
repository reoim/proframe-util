#!/usr/bin/ksh
## ---------------------------------------------------------------------------------------------- ##
#  @file           tcs_create.sh  
#  @brief          tcs 서버를 생성한다. (템플릿 기반)
#
#  @dep-program    
#  @dep-input      TCS Server name
#  @dep-outfile    
#  @usage          tcs_create.sh TCS_SVR_NAME 
#                  ex) tcs_create.sh TPFM02
#  @history
#  --------   ------     --------    -----------     ---------------------------------------------
#  버    전 : 성  명  :  일  자   :  근거  자료    :          변       경        내       용
#  --------   ------     --------    -----------     ---------------------------------------------
#  VER1.00  : 이동민  :  20181019  : 신규작성      :  신규작성
## ---------------------------------------------------------------------------------------------- ##

## ---------------------------------------------------------------------------------------------- ##
#  c000_init
## ---------------------------------------------------------------------------------------------- ##
c000_init()
{
    unamestr=`uname`
    TCS_DIR=$PFMROOT'/svr/tcs_app'
    TCS_SVR_DIR=$TCS_DIR'/'$TCS_SVR_NAME

    ## 상주 배치 서버 디렉토리 생성
    cd $TCS_DIR
    if [ ! -d $TCS_SVR_DIR ]; then
        mkdir $TCS_SVR_DIR
    else
        echo "(E): 이미 같은 이름의 TCS 서버 디렉토리가 존재합니다."
        exit -1
    fi
    
}

## ---------------------------------------------------------------------------------------------- ##
#  c100_cp_template
## ---------------------------------------------------------------------------------------------- ##
c100_cp_template()
{
    ## TCS 서버 템플릿 복사
    cp -f $TCS_DIR/tcsTemplate/* $TCS_SVR_DIR
    if [ $? != 0 ]; then
        echo "(E): TCS서버 템플릿 복사 에러 ==>" $TCS_SVR_NAME
        exit -1
    else
        echo "(D): TCS서버 템플릿 복사 성공 ==>" $TCS_SVR_NAME                  
    fi
}

## ---------------------------------------------------------------------------------------------- ##
#  c200_edit_template
## ---------------------------------------------------------------------------------------------- ##
c200_edit_template()
{
    ## 복사된 템플릿 이름 변경
    cd $TCS_SVR_DIR
    mv -f tcsTemplate.c $TCS_SVR_NAME'.c' 
    if [ $? != 0 ]; then
        echo "(E): TCS서버 이름 변경 실패. tcsTemplate.c ==>" $TCS_SVR_NAME'.c'
        exit -1
    else
        echo "(D): TCS서버 이름 변경 성공. tcsTemplate.c ==>" $TCS_SVR_NAME'.c'                  
    fi

    mv -f tcsTemplate.mk $TCS_SVR_NAME'.mk' 
    if [ $? != 0 ]; then
        echo "(E): TCS서버 이름 변경 실패. tcsTemplate.mk ==> ${TCS_SVR_NAME}.mk"
        exit -1
    else
        echo "(D): TCS서버 이름 변경 성공. tcsTemplate.mk ==> ${TCS_SVR_NAME}.mk"                  
    fi


    ## 소스 내용 변경
    for FILE in `ls -l | grep rw | awk '{print $9}'`
    do
        if [ $unamestr == "AIX" ]; then
            sed  's/tcsTemplate/'$TCS_SVR_NAME'/g' $FILE > temp_file && mv -f temp_file $FILE
        elif [ $unamestr == "Linux"]; then
            sed  -i 's/tcsTemplate/'$TCS_SVR_NAME'/g' $FILE
        fi
        if [ $? != 0 ]; then
            echo "(E): TCS서버 소스 변경 실패."
            exit -1
        else
            echo "(D): TCS서버 소스 변경 성공"
            chmod 755 $FILE                  
        fi
    done

    echo "(D): 생성된 TCS 서버 소스 위치 ==> ["$TCS_SVR_DIR"]"
}


## ---------------------------------------------------------------------------------------------- ##
#  main
## ---------------------------------------------------------------------------------------------- ##
main()
{
    
    ## TX 코드
    TCS_SVR_NAME=$1

    ## 초기화 및 변수 설정 ##
    c000_init

    ## 템플릿 복사 ##
    c100_cp_template

    ## 템플릿 이름 및 소스 수정 ##
    c200_edit_template

    exit 0
}

main $@