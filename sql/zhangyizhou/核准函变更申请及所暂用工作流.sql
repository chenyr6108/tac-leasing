CREATE TABLE T_BPM_DEF_PROCESS(
PROCESS_DEF_ID NVARCHAR(50),
PROCESS_TYPE NVARCHAR(50),
PROCESS_NAME NVARCHAR(50),
PROCESS_STATUS INT,
START_EVENT NVARCHAR(50),
PRIMARY KEY(PROCESS_DEF_ID)
);

CREATE TABLE T_BPM_DEF_DATA(
PROCESS_DEF_ID NVARCHAR(50),
DATA_DEF_ID NVARCHAR(50),
DATA_NAME NVARCHAR(50),
DATA_TYPE NVARCHAR(50),
DATA_SCOPE INT,--p_g,e_i,e_o
INIT_VALUE NVARCHAR(50),
CONNECT_DEF_ID NVARCHAR(50),
SOURCE NVARCHAR(50),
TARGET NVARCHAR(50),
PRIMARY KEY(PROCESS_DEF_ID,DATA_DEF_ID,CONNECT_DEF_ID)
);

CREATE TABLE T_BPM_DEF_FLOW(
PROCESS_DEF_ID NVARCHAR(50),
FLOW_DEF_ID NVARCHAR(50),
FLOW_DEF_CODE INT,
FLOW_NAME NVARCHAR(50),
FLOW_TYPE INT,
FLOW_CODE NVARCHAR(50),
MULTI_INSTANCE NVARCHAR(50),
GATEWAY_TYPE NVARCHAR(50),
USER_LIST NVARCHAR(500),
OPERATE_LIST NVARCHAR(50),
PRIMARY KEY(PROCESS_DEF_ID,FLOW_DEF_ID)
);

CREATE TABLE T_BPM_DEF_CONNECT(
PROCESS_DEF_ID NVARCHAR(50),
CONNECT_DEF_ID NVARCHAR(50),
CONNECT_NAME NVARCHAR(50),
SOURCE NVARCHAR(50),
TARGET NVARCHAR(50),
CONDITION NVARCHAR(200),
GATEWAY_DEFAULT INT, --1,0
PRIMARY KEY(PROCESS_DEF_ID,CONNECT_DEF_ID)
);

CREATE TABLE T_BPM_INS_PROCESS(
PROCESS_INS_ID INT IDENTITY(1,1), 
PROCESS_DEF_ID NVARCHAR(50),
PROCESS_NAME NVARCHAR(50),
PROCESS_STATUS INT,
FLOW_STATUS INT,
FLOW_STATUS_NAME NVARCHAR(500),
CURRENT_CHARGE NVARCHAR(500),
CURRENT_CHARGE_NAME NVARCHAR(500),
CURRENT_DELEGATE NVARCHAR(500),
CURRENT_DELEGATE_NAME NVARCHAR(500),
BEGIN_DATE DATETIME,
END_DATE DATETIME,
PRIMARY KEY(PROCESS_INS_ID)
);

CREATE TABLE T_BPM_INS_FLOW(
FLOW_INS_ID INT IDENTITY(1,1), 
PROCESS_INS_ID INT,
PROCESS_DEF_ID NVARCHAR(50),
FLOW_DEF_ID NVARCHAR(50),
FLOW_DEF_CODE INT,
FLOW_NAME NVARCHAR(50),
FLOW_TYPE INT,
FLOW_CODE NVARCHAR(50),
MULTI_INSTANCE NVARCHAR(50),
GATEWAY_TYPE NVARCHAR(50),
FLOW_STATUS INT,
USER_LIST NVARCHAR(500),
OPERATE_LIST NVARCHAR(50),
PRIMARY KEY(FLOW_INS_ID)
);


CREATE TABLE T_BPM_INS_CONNECT(
CONNECT_INS_ID INT IDENTITY(1,1), 
PROCESS_INS_ID INT,
PROCESS_DEF_ID NVARCHAR(50),
CONNECT_DEF_ID NVARCHAR(50),
CONNECT_NAME NVARCHAR(50),
SOURCE_ID INT,
SOURCE NVARCHAR(50),
TARGET_ID INT,
TARGET NVARCHAR(50),
CONDITION NVARCHAR(200),
GATEWAY_DEFAULT INT, --1,0
PRIMARY KEY(CONNECT_INS_ID)
);



CREATE TABLE T_BPM_INS_DATA(
DATA_INS_ID INT IDENTITY(1,1), 
PROCESS_INS_ID INT,
PROCESS_DEF_ID NVARCHAR(50),
DATA_DEF_ID NVARCHAR(50),
DATA_NAME NVARCHAR(50),
DATA_TYPE NVARCHAR(50),
DATA_SCOPE INT,--p_g,e_i,e_o
VALUE NVARCHAR(50),
CONNECT_INS_ID INT,
CONNECT_DEF_ID NVARCHAR(50),
SOURCE_ID INT,
SOURCE NVARCHAR(50),
TARGET_ID INT,
TARGET NVARCHAR(50),
PRIMARY KEY(DATA_INS_ID)
);

CREATE TABLE T_BPM_INS_TASK(
TASK_INS_ID INT IDENTITY(1,1),
TASK_STATUS INT,
PROCESS_INS_ID INT,
FLOW_INS_ID INT,
FLOW_DEF_ID NVARCHAR(50),
URL NVARCHAR(500),
DESCRIPTION NVARCHAR(50),
CHARGE NVARCHAR(50),
DELEGATE NVARCHAR(50),
OPERATOR NVARCHAR(50),
BEGIN_DATE DATETIME,
DUE_DATE DATETIME,
END_DATE DATETIME,
RESULT NVARCHAR(50),
COMMENT NVARCHAR(500),
PRIORITY INT,
OPERATE_LIST NVARCHAR(50),
PRIMARY KEY(TASK_INS_ID)
);

CREATE TABLE [dbo].[T_APRV_APPROVAL] (
[APRV_ID] int IDENTITY(1, 1) NOT NULL,
[APRV_CODE] nvarchar(50) NULL,
[RECT_ID] int NULL,
[APPLY_USER_ID] int NULL,
[COMPANY_CODE] int NULL,
[SUMMARY] nvarchar(50) NULL,
[CONTENT] nvarchar(2000) NULL,
[AUDIT_DATA] nvarchar(2000) NULL,
[PROCESS_ID] int NULL,
HIS_PROCESS nvarchar(50) NULL,
[CREATE_TIME] datetime NULL,
[UPDATE_TIME] datetime NULL,
PRIMARY KEY ([APRV_ID] ASC)
);


INSERT INTO T_BPM_DEF_PROCESS(PROCESS_DEF_ID,PROCESS_TYPE,PROCESS_NAME,PROCESS_STATUS,START_EVENT)
VALUES
('P_APRV_V0.0','P_SIGN','核准函变更审批流程',1,'startnode');

INSERT INTO T_BPM_DEF_FLOW(PROCESS_DEF_ID,FLOW_DEF_ID,FLOW_DEF_CODE,FLOW_NAME,FLOW_TYPE,FLOW_CODE,MULTI_INSTANCE,GATEWAY_TYPE,USER_LIST,OPERATE_LIST)
VALUES
('P_APRV_V0.0','startnode',1,'新建',1,'R',null,null,null,null),
('P_APRV_V0.0','gate0d',2,'主管介入判定D',3,'G',null,'D',null,null),
('P_APRV_V0.0','tosubmit',4,'待主管提交',2,'A','N',null,'${UP_USER}','PR'),
('P_APRV_V0.0','gate1',8,'主管处理结果判定',3,'G',null,'D',null,null),
('P_APRV_V0.0','failnode1',16,'主管驳回',1,'E',null,null,null,null),
('P_APRV_V0.0','gate0c',32,'主管介入判定C',3,'G',null,'C',null,null),
('P_APRV_V0.0','exam',64,'审查部会签中',2,'A','S',null,'${RISK_LIST}','PR'),
('P_APRV_V0.0','gate_exam',128,'审批流转_审查',3,'G',null,'D',null,null),
('P_APRV_V0.0','failnode_exam',256,'审查驳回',1,'E',null,null,null,null),
('P_APRV_V0.0','toaduit1',512,'会签中',2,'A','S',null,'${USER_LIST}','PR'),
('P_APRV_V0.0','gate2',1024,'审批流转2',3,'G',null,'D',null,null),
('P_APRV_V0.0','failnode',2048,'审批驳回',1,'E',null,null,null,null),
('P_APRV_V0.0','gate_exam_c',131072,'会签结束',3,'G',null,'C',null,null),
('P_APRV_V0.0','examproc',4096,'审查部会办中',2,'A','N',null,'436','IC'),
('P_APRV_V0.0','gate_examproc',8192,'流转_审查',3,'G',null,'D',null,null),
('P_APRV_V0.0','completenode_examproc',16384,'处理完成',1,'E',null,null,null,null),
('P_APRV_V0.0','itproc',32768,'资讯部会办中',2,'A','N',null,'100','C'),
('P_APRV_V0.0','completenode',65536,'处理完成',1,'E',null,null,null,null);

INSERT INTO T_BPM_DEF_DATA(PROCESS_DEF_ID,DATA_DEF_ID,DATA_NAME,DATA_TYPE,DATA_SCOPE,INIT_VALUE,CONNECT_DEF_ID,SOURCE,TARGET)
VALUES
('P_APRV_V0.0','APPLY_USER','本人','java.lang.String',1,null,'',null,null),
('P_APRV_V0.0','UP_USER','上级','java.lang.String',1,null,'',null,null),
('P_APRV_V0.0','USER_LIST','会签名单','java.lang.String',1,null,'',null,null),
('P_APRV_V0.0','RISK_LIST','风控名单','java.lang.String',1,null,'',null,null),
('P_APRV_V0.0','IT_SUPPORT','资讯支持','java.lang.String',1,null,'',null,null),
('P_APRV_V0.0','result','主管提交结果','java.lang.String',2,null,'submit','tosubmit','gate1'),
('P_APRV_V0.0','result','审查提交结果','java.lang.String',2,null,'submit_exam','exam','gate_exam'),
('P_APRV_V0.0','result','审批结果','java.lang.String',2,null,'aduit2e','toaduit1','gate2'),
('P_APRV_V0.0','result','审查处理结果','java.lang.String',2,null,'submit_examproc','examproc','gate_examproc');

INSERT INTO T_BPM_DEF_CONNECT(PROCESS_DEF_ID,CONNECT_DEF_ID,CONNECT_NAME,SOURCE,TARGET,CONDITION,GATEWAY_DEFAULT)
VALUES
('P_APRV_V0.0','create','新建','startnode','gate0d',null,null),
('P_APRV_V0.0','noup','无主管直接跳过','gate0d','gate0c','${UP_USER eq null or UP_USER eq ""}',null),
('P_APRV_V0.0','hasup','有主管需要审核','gate0d','tosubmit','${UP_USER ne null and UP_USER ne ""}',null),
('P_APRV_V0.0','submit','主管提交','tosubmit','gate1',null,null),
('P_APRV_V0.0','fail1','主管驳回','gate1','failnode1','${result eq "R"}',null),
('P_APRV_V0.0','pass1','主管通过','gate1','gate0c','${result eq "P"}',null),
('P_APRV_V0.0','to_exam','发往审查','gate0c','exam',null,null),
('P_APRV_V0.0','submit_exam','审查部提交','exam','gate_exam',null,null),
('P_APRV_V0.0','reject_exam','审查部驳回','gate_exam','failnode_exam','${result eq "R"}',null),
('P_APRV_V0.0','acpect_exam','审查部通过','gate_exam','toaduit1','${result eq "P" and (USER_LIST ne null and USER_LIST ne "")}',null),
('P_APRV_V0.0','ignore_exam','会签跳过','gate_exam','gate_exam_c','${result eq "P" and (USER_LIST eq null or USER_LIST eq "")}',null),
('P_APRV_V0.0','aduit2e','流出审批','toaduit1','gate2',null,null),
('P_APRV_V0.0','fail','退回','gate2','failnode','${result eq "R"}',null),
('P_APRV_V0.0','end_huixian','会签结束','gate2','gate_exam_c','${result eq "P"}',null),
('P_APRV_V0.0','to_examproc','发往审查','gate_exam_c','examproc','${result eq "P"}',null),
('P_APRV_V0.0','submit_examproc','审查部提交','examproc','gate_examproc',null,null),
('P_APRV_V0.0','complete_examproc','审查处理','gate_examproc','completenode_examproc','${result eq "C"}',null),
('P_APRV_V0.0','toit','发往资讯','gate_examproc','itproc','${result eq "I"}',null),
('P_APRV_V0.0','complete','通过','itproc','completenode',null,null);