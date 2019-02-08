/*
 * @file           sfw200015.c
 * @filetype       c source file
 * @brief          내부연동 tpcall async N-tx reply 처리
 * @author         dongmin
 * @version
 * @dep-header
 * @history
 *    Version:   Name  :    Date   :     Reference :       Desciption    :
 *    --------   ------     --------     -----------     -------------------------------------------
 *    VER1.00  : dongmin :  20180403   :  proframe 구축 :  신규 개발
 * 
 */
/**************************************
 * KIND     : Service Module Interface
 * NODE ID  : 0
 * NAME     : 내부연동 tpcall async N-tx reply 처리
 * DESCRIPTION :
 *   sfw200015
 *************************************/

#include "sfw200015.h"

static MapperMapInfo mappingInfo = {PMAP_FLAG_TRACE_ON, 0, "", "", "", ""};

#if defined (__cplusplus)
    extern "C"
#endif

/**************************************
 * COMMENTS :
 *   SFW200015
 *************************************/
long sfw200015(sfw200001_in *input, sfw200001_out *output)
{
    sfw200015Context __context;
    sfw200015Context *context = &__context;

    long rc = RC_NRM;

    bzero(context, sizeof(sfw200015Context));
    context->input = input;
    context->output = output;
    {
        /**************************************
         * KIND     : Intermediary Module Function Call
         * NODE ID  : 1
         * NAME     : 초기값설정
         * DESCRIPTION :
         * 
         ************************************/
        PFM_TRY(a100_init_proc(context));
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:INNER_MODULE_EXCEPTION NODEID1------------------//

        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:INNER_MODULE_EXCEPTION NODEID1------------------//
         
    }
    {
        /**************************************
         * KIND     : Intermediary Module Function Call
         * NODE ID  : 2
         * NAME     : 입력값검증
         * DESCRIPTION :
         * 
         ************************************/
        PFM_TRY(b100_input_check(context));
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:INNER_MODULE_EXCEPTION NODEID2------------------//

        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:INNER_MODULE_EXCEPTION NODEID2------------------//
         
    }
    {
        /**************************************
         * KIND     : Intermediary Module Function Call
         * NODE ID  : 3
         * NAME     : 메인처리
         * DESCRIPTION :
         * 
         ************************************/
        PFM_TRY(c100_main_proc(context));
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:INNER_MODULE_EXCEPTION NODEID3------------------//

        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:INNER_MODULE_EXCEPTION NODEID3------------------//
         
    }
    {
        /**************************************
         * KIND     : Intermediary Module Function Call
         * NODE ID  : 4
         * NAME     : 출력처리
         * DESCRIPTION :
         * 
         ************************************/
        PFM_TRY(d100_output_proc(context));
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:INNER_MODULE_EXCEPTION NODEID4------------------//

        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:INNER_MODULE_EXCEPTION NODEID4------------------//
         
    }


    return RC_NRM;

PFM_CATCH:

    {
        /**************************************
         * KIND     : Virtual Module
         * NODE ID  : 5
         * NAME     : 예외처리
         * DESCRIPTION :
         * 
         ************************************/
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:VIRTUAL_MODULE NODEID5------------------//
        // TODO Auto-generated method stub
        
        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:VIRTUAL_MODULE NODEID5------------------//
         
    }

    return rc;
}

/**************************************
 * KIND     : Intermediary Module Function
 * NODE ID  : 1
 * NAME     : 초기값설정
 * DESCRIPTION :
 * 
 ************************************/
static long a100_init_proc(sfw200015Context *context)
{
    long rc = RC_NRM;

    // User Variables Declaration

    {
        /**************************************
         * KIND     : Virtual Module
         * NODE ID  : 6
         * NAME     : 초기값정의
         * DESCRIPTION :
         * 
         ************************************/
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:VIRTUAL_MODULE NODEID6------------------//
        // TODO Auto-generated method stub
        char cur_date[8+1]={0,};
        char cur_time[6+1]={0,};
        
        pfmGetDate(cur_date);
        pfmGetTime(cur_time);
        
        PFM_DBG("==== 초기값 정의 시작 ====");
        PFM_DBG("현재일자 = [%s]", cur_date);
        PFM_DBG("현재시간 = [%s]", cur_time);
       
        PFM_DBG("==== 초기값 정의 종료 ====");
        
        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:VIRTUAL_MODULE NODEID6------------------//
         
    }

    return RC_NRM;

PFM_CATCH:

    return rc;
}

/**************************************
 * KIND     : Intermediary Module Function
 * NODE ID  : 2
 * NAME     : 입력값검증
 * DESCRIPTION :
 * 
 ************************************/
static long b100_input_check(sfw200015Context *context)
{
    long rc = RC_NRM;

    // User Variables Declaration

    {
        /**************************************
         * KIND     : Virtual Module
         * NODE ID  : 7
         * NAME     : 입력값체크
         * DESCRIPTION :
         * 
         ************************************/
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:VIRTUAL_MODULE NODEID7------------------//
        // TODO Auto-generated method stub
        PFM_DBG("==== 입력값 체크 시작 ====");
        PFM_DBG("==== 입력값 체크 종료 ====");
        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:VIRTUAL_MODULE NODEID7------------------//
         
    }

    return RC_NRM;

PFM_CATCH:

    return rc;
}

/**************************************
 * KIND     : Intermediary Module Function
 * NODE ID  : 3
 * NAME     : 메인처리
 * DESCRIPTION :
 * 
 ************************************/
static long c100_main_proc(sfw200015Context *context)
{
    long rc = RC_NRM;

    // User Variables Declaration

    {
        /**************************************
         * KIND     : Intermediary Module Function Call
         * NODE ID  : 8
         * NAME     : 사원정보조회
         * DESCRIPTION :
         * 
         ************************************/
        PFM_TRY(c110_main_proc(context));
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:INNER_MODULE_EXCEPTION NODEID8------------------//

        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:INNER_MODULE_EXCEPTION NODEID8------------------//
         
    }

    return RC_NRM;

PFM_CATCH:

    return rc;
}

/**************************************
 * KIND     : Intermediary Module Function
 * NODE ID  : 8
 * NAME     : 사원정보조회
 * DESCRIPTION :
 * 
 ************************************/
static long c110_main_proc(sfw200015Context *context)
{
    long rc = RC_NRM;

    // Variables Declaration
    getReplyInfo reply_input;
    sfw200002_out svc_out;

    // User Variables Declaration


    // Variables Initialization
    bzero(&reply_input, sizeof(reply_input));
    bzero(&svc_out, sizeof(svc_out));

    {
        /**************************************
         * KIND     : Service Module Call
         * NODE ID  : 13
         * NAME     : PERSIST 단건조회
         * DESCRIPTION :
         * 
         ************************************/
        PfmLinkHeader linkHeader = { "sfw200002", "SFW200002", "PFM5", 'R', 1, 1, 1, 1, 'N', 'a'};
        sfw200002_in temporaryInput;
        sfw200002_out temporaryOutput;

        bzero(&temporaryInput, sizeof(sfw200002_in));
        bzero(&temporaryOutput, sizeof(sfw200002_out));
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:BEFORE_CODE NODEID13------------------//
        /* 입력값 셋팅 */
        PFM_STRCPY(temporaryInput.edu_empno, INPUT->edu_empno);
        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:BEFORE_CODE NODEID13------------------//
         

        /**************************************
         *   KIND        : Service Module Callee Info
         *   NAME        : true
         *   INPUT       : sfw200002_in
         *   OUTPUT      : sfw200002_out
         *************************************/
        PFM_TRYNJ(pfmServiceModuleCall(&temporaryInput, &temporaryOutput, &linkHeader, sizeof(sfw200002_in), sizeof(sfw200002_out)));
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:SERVICE_MODULE_EXCEPTION NODEID13------------------//
		if( rc != RC_NRM )
        {
        	PFM_ERR("서비스[sfw200002] 호출 오류 - [%ld] ", rc  );
        	return RC_ERR;
        }     
        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:SERVICE_MODULE_EXCEPTION NODEID13------------------//
         
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:AFTER_CODE NODEID13------------------//
        /* 연동후에는 TPCALL의 cd 값을 구하여 저장 */
        reply_input.cd = pfmSMLinkGetASyncCallDesc(); 
        if( reply_input.cd == -1 ) { 
            PFM_ERR("Get ACall Descripter Error !!"); 
            return RC_ERR; 
        } 
        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:AFTER_CODE NODEID13------------------//
         
    }
    {
        /**************************************
         * KIND     : Virtual Module
         * NODE ID  : 11
         * NAME     : 다른작업수행
         * DESCRIPTION :
         * 
         ************************************/
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:VIRTUAL_MODULE NODEID11------------------//
        // TODO Auto-generated method stub
        PFM_DBG("sleep 1 sec");
        sleep(1);
        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:VIRTUAL_MODULE NODEID11------------------//
         
    }
    {
        /**************************************
         * KIND     : Virtual Module
         * NODE ID  : 12
         * NAME     : Async콜에 대한 GetReply
         * DESCRIPTION :
         * 
         ************************************/
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:VIRTUAL_MODULE NODEID12------------------//
        PFM_TRYNJ(pfmDlCall( "pfmServiceModuleExt", "pfmServiceModuleCallGetReply",  &reply_input, &svc_out ));
        if (rc != RC_NRM)
        {
            PFM_ERR("pfmServiceModuleCallGetReply Error [%ld]", rc);
            return RC_ERR;
        } 
        PFM_STRCPY(OUTPUT->edu_empno, svc_out.edu_empno);
        PFM_STRCPY(OUTPUT->edu_name, svc_out.edu_name);
        PFM_STRCPY(OUTPUT->edu_dept, svc_out.edu_dept);
        PFM_STRCPY(OUTPUT->edu_phone_no, svc_out.edu_phone_no);
        PFM_STRCPY(OUTPUT->edu_reg_date, svc_out.edu_reg_date);
        PFM_STRCPY(OUTPUT->edu_reg_time, svc_out.edu_reg_time);
        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:VIRTUAL_MODULE NODEID12------------------//
         
    }

    return RC_NRM;

PFM_CATCH:

    return rc;
}

/**************************************
 * KIND     : Intermediary Module Function
 * NODE ID  : 4
 * NAME     : 출력처리
 * DESCRIPTION :
 * 
 ************************************/
static long d100_output_proc(sfw200015Context *context)
{
    long rc = RC_NRM;

    // User Variables Declaration

    {
        /**************************************
         * KIND     : Virtual Module
         * NODE ID  : 9
         * NAME     : 출력값체크
         * DESCRIPTION :
         * 
         ************************************/
        //DO_NOT_MODIFY_THIS_LINE-----------START_OF_CODE:VIRTUAL_MODULE NODEID9------------------//
        // TODO Auto-generated method stub
        PFM_DBG("==== 출력값 체크 시작 ====");
        PFM_DBG("==== 출력값 체크 종료 ====");
        //DO_NOT_MODIFY_THIS_LINE-----------END_OF_CODE:VIRTUAL_MODULE NODEID9------------------//
         
    }

    return RC_NRM;

PFM_CATCH:

    return rc;
}

