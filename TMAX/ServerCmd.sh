#!/usr/bin/ksh
####################################################################################################
# @file             ServerCmd.sh
# @brief            통합서버의 명령을 수행하는 COMMEND
#
# @update           기존 연구소에서 제공한 servercmd는 매번 통합서버의 라이브러리와 설정파일을
#                   servercmd 폴더에 copy 해야하는 불편함이 있고 
#                   servercmd 폴더 밖에서 실행시 PfmDevSvr.xml 파일을 못읽어들이는 문제가 있어서        
#                   통합서버의 라이브러리를 직접 보도록 classpath를 수정하고 
#                   servercmd 실행전에 PfmDevSvr.xml 이 위치한 폴더로 이동하여 실행하도록 수정함.
####################################################################################################

## 다음 라이브러리들은 servercmd 전용 라이브러리
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/servercmd/relaxngDatatype.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/servercmd/xsdlib.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/servercmd/jax-qname.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/servercmd/jaxb-api.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/servercmd/jaxb-xjc.jar


## 다음 라이브러리들은 통합서버의 라이브러리 사용
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/pfmdevsvr/WEB-INF/lib/poi-2.5.1.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/pfmdevsvr/WEB-INF/lib/poi-contrib-2.5.1.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/pfmdevsvr/WEB-INF/lib/poi-scratchpad-2.5.1.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/pfmdevsvr/WEB-INF/lib/jaxb-impl.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/pfmdevsvr/WEB-INF/lib/jaxb-libs.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/pfmdevsvr/WEB-INF/lib/jaxp-api.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/pfmdevsvr/WEB-INF/lib/jeus.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/pfmdevsvr/WEB-INF/lib/pfm_jaxb_model.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/pfmdevsvr/WEB-INF/lib/jakarta-regexp-1.4.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/pfmdevsvr/WEB-INF/lib/pfmdevsvr.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/pfmdevsvr/WEB-INF/lib/smd-c-codegen.jar 
echo $SERVERCMDCP

## PfmDevSvr.xml (통합서버 설정파일)을 읽어오기 위해 설정파일 위치로 이동하여 servercmd 실행
cd $JEUS_HOME/webhome/app_home/pfmdevsvr/WEB-INF/lib
java -Xms128M -Xmx512M -classpath $SERVERCMDCP com.tmax.proframe.devsvrcmd.mgr.ServerCmd $0 $1 $2 $3 $4 $5 $6 $7 $8 $9
