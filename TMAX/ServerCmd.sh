#!/usr/bin/ksh
####################################################################################################
# @file             ServerCmd.sh
# @brief            ���ռ����� ����� �����ϴ� COMMEND
#
# @update           ���� �����ҿ��� ������ servercmd�� �Ź� ���ռ����� ���̺귯���� ����������
#                   servercmd ������ copy �ؾ��ϴ� �������� �ְ� 
#                   servercmd ���� �ۿ��� ����� PfmDevSvr.xml ������ ���о���̴� ������ �־        
#                   ���ռ����� ���̺귯���� ���� ������ classpath�� �����ϰ� 
#                   servercmd �������� PfmDevSvr.xml �� ��ġ�� ������ �̵��Ͽ� �����ϵ��� ������.
####################################################################################################

## ���� ���̺귯������ servercmd ���� ���̺귯��
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/servercmd/relaxngDatatype.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/servercmd/xsdlib.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/servercmd/jax-qname.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/servercmd/jaxb-api.jar
export  SERVERCMDCP=${SERVERCMDCP}:${JEUS_HOME}/webhome/app_home/servercmd/jaxb-xjc.jar


## ���� ���̺귯������ ���ռ����� ���̺귯�� ���
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

## PfmDevSvr.xml (���ռ��� ��������)�� �о���� ���� �������� ��ġ�� �̵��Ͽ� servercmd ����
cd $JEUS_HOME/webhome/app_home/pfmdevsvr/WEB-INF/lib
java -Xms128M -Xmx512M -classpath $SERVERCMDCP com.tmax.proframe.devsvrcmd.mgr.ServerCmd $0 $1 $2 $3 $4 $5 $6 $7 $8 $9
