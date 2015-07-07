create table T_AREA
(
   id 				              number not null,
   name							  varchar2(200) not null,
   pid						  	  number  null,
   createtime					  date  default sysdate,
   desc_name 					  varchar2(2000) null,
   modifydate					  date  default sysdate,
   lesseearea					  varchar2(20),
   isleaf						  varchar2(2) default 'N'
)
tablespace FILOS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
  -- Add comments to the table 
comment on table T_AREA
  is '区域表';
-- Add comments to the columns 
comment on column T_AREA.id
  is '主键';
comment on column T_AREA.name
  is '区域名称';
comment on column T_AREA.pid
  is '区域父ID';
comment on column T_AREA.createtime
  is '创建日期';
comment on column T_AREA.desc_name
  is '描述名字';
comment on column T_AREA.modifydate
  is '修改日期';
comment on column T_AREA.lesseearea
  is '区号';
comment on column T_AREA.isleaf
  is '是不是叶子结点';
alter table T_AREA
add constraint T_AREA_PK primary key (id);
alter table T_AREA
add constraint T_AREA_FK foreign key (pid)
  references T_AREA (id);
insert into T_AREA(id,name,lesseearea) values (SEQ_AREA.nextVal,'所有区域','');

-- Create sequence 
create sequence SEQ_AREA
minvalue 1
maxvalue 99999999999999
start with 1
increment by 1
cache 20;



--create table t_supl_suppler 时间字段和数字字段最好给定默认值
create table T_SUPL_SUPPLIER
(
  ID                       NUMBER not null,
  NAME                     VARCHAR2(200),
  CODE                     VARCHAR2(200),
  TYPE                     NUMBER,
  FOUNDED_DATE             DATE,
  REGISTERED_CAPITAL       NUMBER(11,2),
  INCOME_CAPITAL           NUMBER(11,2),
  COMPANY_CORPORATION      VARCHAR2(200),
  CORPORATION_ID_CARD      VARCHAR2(200),
  CORPORATION_LINK         VARCHAR2(200),
  CORPORATION_ADDRESS      VARCHAR2(200),
  BUSINESS_LICENCE         VARCHAR2(200),
  ORGANIZATION_CERTIFICATE VARCHAR2(200),
  TEX_CODE                 VARCHAR2(200),
  VALIDITY_PERIOD          NUMBER(11,2),
  LICENCE_ADDRESS          VARCHAR2(200),
  WORK_ADDRESS             VARCHAR2(200),
  BUSINESS_SCOPE           VARCHAR2(200),
  LINKMAN_NAME             VARCHAR2(200),
  LINKMAN_JOB              VARCHAR2(200),
  LINKMAN_TELPHONE         VARCHAR2(200),
  LINKMAN_MOBILE           VARCHAR2(200),
  LINKMAN_ZIP              VARCHAR2(200),
  COMPANY_WEB              VARCHAR2(200),
  CREDIT_TYPE              NUMBER,
  OPEN_ACCOUNT_BANK        VARCHAR2(200),
  BANK_ACCOUNT             VARCHAR2(200),
  MEMO                     VARCHAR2(4000),
  STATUS                   NUMBER,
  CREATE_DATE              DATE,
  MODIFY_DATE              DATE,
  REMARK1                  VARCHAR2(200),
  REMARK2                  VARCHAR2(200),
  REMARK3                  VARCHAR2(200),
  REMARK4                  VARCHAR2(200)
)
tablespace FILOS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table T_SUPL_SUPPLIER
  is '供应商表';
-- Add comments to the columns 
comment on column T_SUPL_SUPPLIER.ID
  is '主键';
comment on column T_SUPL_SUPPLIER.NAME
  is '企业名称';
comment on column T_SUPL_SUPPLIER.CODE
  is '编号';
comment on column T_SUPL_SUPPLIER.TYPE
  is '企业性质';
comment on column T_SUPL_SUPPLIER.FOUNDED_DATE
  is '成立日期';
comment on column T_SUPL_SUPPLIER.REGISTERED_CAPITAL
  is '注册资本(万)';
comment on column T_SUPL_SUPPLIER.INCOME_CAPITAL
  is '实收资本(万)';
comment on column T_SUPL_SUPPLIER.COMPANY_CORPORATION
  is '法定代表人';
comment on column T_SUPL_SUPPLIER.CORPORATION_ID_CARD
  is '法人身份证号码';
comment on column T_SUPL_SUPPLIER.CORPORATION_LINK
  is '法人联系方式';
comment on column T_SUPL_SUPPLIER.CORPORATION_ADDRESS
  is '法人代表住址';
comment on column T_SUPL_SUPPLIER.BUSINESS_LICENCE
  is '营业执照注册号';
comment on column T_SUPL_SUPPLIER.ORGANIZATION_CERTIFICATE
  is '组织机构代码号';
comment on column T_SUPL_SUPPLIER.TEX_CODE
  is '税务登记号';
comment on column T_SUPL_SUPPLIER.VALIDITY_PERIOD
  is '有效期(年)';
comment on column T_SUPL_SUPPLIER.LICENCE_ADDRESS
  is '注册地址';
comment on column T_SUPL_SUPPLIER.WORK_ADDRESS
  is '办公地址';
comment on column T_SUPL_SUPPLIER.BUSINESS_SCOPE
  is '经营范围';
comment on column T_SUPL_SUPPLIER.LINKMAN_NAME
  is '联系人/委托人';
comment on column T_SUPL_SUPPLIER.LINKMAN_JOB
  is '职务';
comment on column T_SUPL_SUPPLIER.LINKMAN_TELPHONE
  is '办公电话';
comment on column T_SUPL_SUPPLIER.LINKMAN_MOBILE
  is '手机';
comment on column T_SUPL_SUPPLIER.LINKMAN_ZIP
  is '邮编';
comment on column T_SUPL_SUPPLIER.COMPANY_WEB
  is '公司网址';
comment on column T_SUPL_SUPPLIER.CREDIT_TYPE
  is '信用级别';
comment on column T_SUPL_SUPPLIER.OPEN_ACCOUNT_BANK
  is '开户行';
comment on column T_SUPL_SUPPLIER.MEMO
  is '备注';
comment on column T_SUPL_SUPPLIER.STATUS
  is '状态';
comment on column T_SUPL_SUPPLIER.CREATE_DATE
  is '创建日期';
comment on column T_SUPL_SUPPLIER.MODIFY_DATE
  is '修改日期';
comment on column T_SUPL_SUPPLIER.REMARK1
  is '备注1';
comment on column T_SUPL_SUPPLIER.REMARK2
  is '备注2';
comment on column T_SUPL_SUPPLIER.REMARK3
  is '备注3';
comment on column T_SUPL_SUPPLIER.REMARK4
  is '备注4';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_SUPL_SUPPLIER
  add constraint T_SUPL_SUPPLIER_PK primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队01','李01','李01','010-1111111111',sysdate,'111111','0000000000000000','银行1');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'013','连云满中副警队2','李2','李2','010-222222222',sysdate,'22222222','0000000000000000','银行2');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'014','连云满中副警队3','李3','李3','010-333333333',sysdate,'333333333','0000000000000000','银行3');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');
insert into t_supl_supplier(id,code,name,Company_Corporation,Linkman_name,Linkman_mobile,Create_date,Linkman_zip,Bank_account,Open_account_bank)
values(SEQ_SUPL_SUPPLIER.NEXTVAL,'012','连云满中副警队','李','李','010-8888888888',sysdate,'100000','0000000000000000','银行');

-- Create sequence 
create sequence SEQ_LOG
minvalue 1
maxvalue 99999999999999999
start with 1
increment by 1
cache 20;

create table T_LOG (
	id			int not null,
	userId		int not null,
	sysNode		varchar(10) not null,--1--表示登陆系统
	logData		varchar(1000),
	logTime		timestamp
)
tablespace FILOS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
  comment on table T_LOG
  is '日志表';
  comment on table T_LOG.id
  is '主键';
  comment on table T_LOG.userId
  is '用户的ID';
  comment on table T_LOG.logType
  is '日志类型';
  comment on table T_LOG.acccessId
  is '权限的ID';
  comment on table T_LOG
  is '日志信息';
  comment on table T_LOG
  is '时间';
  alter table T_LOG
  add constraint T_LOG_PK primary key (id);
  
  
  
  1.-- 权限资源表
create table FIL_PERMISSION_RESOURCE
(
  ID          NUMBER not null,--主键
  NAME        VARCHAR2(200) not null,--资源名称
  LAYOUT      VARCHAR2(500) not null,--资源地址
  MEMO        VARCHAR2(4000),--备注
  STATUS      NUMBER,--状态（0为正常，1为作废）
  CREATE_DATE DATE,--创建日期
  MODIFY_DATE DATE,--修改日期
  REMARK1     VARCHAR2(200),--备用字段1
  REMARK2     VARCHAR2(200),--备用字段2
  REMARK3     VARCHAR2(200),--备用字段3
  REMARK4     VARCHAR2(200),--备用字段4
  PARENT_ID   NUMBER,--父菜单id（外键）参见自身表
  LEVEL_NUM   NUMBER--级别
)
tablespace FILOS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table FIL_PERMISSION_RESOURCE
  is '权限资源表';
-- Add comments to the columns 
comment on column FIL_PERMISSION_RESOURCE.ID
  is '主键';
comment on column FIL_PERMISSION_RESOURCE.NAME
  is '资源名称';
comment on column FIL_PERMISSION_RESOURCE.LAYOUT
  is '资源地址';
comment on column FIL_PERMISSION_RESOURCE.MEMO
  is '备注';
comment on column FIL_PERMISSION_RESOURCE.STATUS
  is '状态（0为正常，1为作废）';
comment on column FIL_PERMISSION_RESOURCE.CREATE_DATE
  is '创建日期';
comment on column FIL_PERMISSION_RESOURCE.MODIFY_DATE
  is '修改日期';
comment on column FIL_PERMISSION_RESOURCE.REMARK1
  is '备用字段1';
comment on column FIL_PERMISSION_RESOURCE.REMARK2
  is '备用字段2';
comment on column FIL_PERMISSION_RESOURCE.REMARK3
  is '备用字段3';
comment on column FIL_PERMISSION_RESOURCE.REMARK4
  is '备用字段4';
comment on column FIL_PERMISSION_RESOURCE.PARENT_ID
  is '父菜单id（外键）';
comment on column FIL_PERMISSION_RESOURCE.LEVEL_NUM
  is '级别';
-- Create/Recreate primary, unique and foreign key constraints 
alter table FIL_PERMISSION_RESOURCE
  add constraint FIL_PERMISSION_RESOURCE_PK primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FIL_PERMISSION_RESOURCE
  add constraint FIL_PERMISSION_RESOURCE_FK foreign key (PARENT_ID)
  references FIL_PERMISSION_RESOURCE (ID);

2.--权限角色表
create table FIL_PERMISSION_ROLE
(
  ID          NUMBER not null,--主键
  NAME        VARCHAR2(200),--角色名称
  MEMO        VARCHAR2(4000),--备注
  STATUS      NUMBER,--状态（0为正常，1为作废）
  CREATE_DATE DATE,--创建时间
  MODIFY_DATE DATE,--修改时间
  REMARK1     VARCHAR2(200),--备用字段1
  REMARK2     VARCHAR2(200),--备用字段2
  REMARK3     VARCHAR2(200),--备用字段3
  REMARK4     VARCHAR2(200)--备用字段4
)
tablespace FILOS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table FIL_PERMISSION_ROLE
  is '权限角色表';
-- Add comments to the columns 
comment on column FIL_PERMISSION_ROLE.ID
  is '主键';
comment on column FIL_PERMISSION_ROLE.NAME
  is '角色名称';
comment on column FIL_PERMISSION_ROLE.MEMO
  is '备注';
comment on column FIL_PERMISSION_ROLE.STATUS
  is '状态（0为正常，1为作废）';
comment on column FIL_PERMISSION_ROLE.CREATE_DATE
  is '创建时间';
comment on column FIL_PERMISSION_ROLE.MODIFY_DATE
  is '修改时间';
comment on column FIL_PERMISSION_ROLE.REMARK1
  is '备用字段1';
comment on column FIL_PERMISSION_ROLE.REMARK2
  is '备用字段2';
comment on column FIL_PERMISSION_ROLE.REMARK3
  is '备用字段3';
comment on column FIL_PERMISSION_ROLE.REMARK4
  is '备用字段4';
-- Create/Recreate primary, unique and foreign key constraints 
alter table FIL_PERMISSION_ROLE
  add constraint FIL_PERMISSSION_ROLE primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

3.-- 员工表
create table T_USER_USER
(
  ID                     NUMBER not null,--主键
  NAME                   VARCHAR2(200),--员工姓名
  CODE                   VARCHAR2(200),--员工编号
  PASSWORD               VARCHAR2(200),--登录密码
  SEX                    VARCHAR2(2),--性别
  AGE                    NUMBER,--年龄
  ID_CARD                VARCHAR2(50),--身份证号码
  STATUS                 NUMBER,--状态（0为正常，1为作废）
  ID_CARD_ADDRESS        VARCHAR2(200),--身份证地址
  ZIP                    VARCHAR2(50),--邮政编码
  MOBILE                 VARCHAR2(20),--手机号码
  TELEPHONE              VARCHAR2(50),--联系电话
  ADDRESS                VARCHAR2(200),--常住家庭住址
  EMAIL                  VARCHAR2(100),--电子邮箱
  JOB                    VARCHAR2(100),--职位
  DEPT_ID                NUMBER,--所属部门（外键）
  HEAD                   VARCHAR2(200),--上传头像
  MATE_NAME              VARCHAR2(100),--配偶姓名
  MATE_ID_CARD           VARCHAR2(100),--配偶身份证号
  MATE_TELPHONE          VARCHAR2(20),--配偶联系电话
  MATE_WORK_UNIT         VARCHAR2(200),--配偶工作单位
  MEMO                   VARCHAR2(4000),--备注
  LAST_LOGIN             DATE,--上次登录时间
  CREATE_DATE            DATE,--创建时间
  REMARK1                VARCHAR2(100),--备用字段1
  REMARK2                VARCHAR2(100),--备用字段2
  REMARK3                VARCHAR2(100),--备用字段3
  REMARK4                VARCHAR2(100),--备用字段4
  RMATE_ID_CARD_ADDR     VARCHAR2(200),--配偶身份证地址
  MODIFY_DATE            DATE,--修改时间
  MATE_WORK_UNIT_ADDRESS VARCHAR2(200)--配偶工作地址
)
tablespace FILOS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table T_USER_USER
  is '员工表';
-- Add comments to the columns 
comment on column T_USER_USER.ID
  is '主键';
comment on column T_USER_USER.NAME
  is '员工姓名';
comment on column T_USER_USER.CODE
  is '员工编号';
comment on column T_USER_USER.PASSWORD
  is '登录密码';
comment on column T_USER_USER.SEX
  is '性别';
comment on column T_USER_USER.AGE
  is '年龄';
comment on column T_USER_USER.ID_CARD
  is '身份证号码';
comment on column T_USER_USER.STATUS
  is '状态（0为正常，1为作废）';
comment on column T_USER_USER.ID_CARD_ADDRESS
  is '身份证地址';
comment on column T_USER_USER.ZIP
  is '邮政编码';
comment on column T_USER_USER.MOBILE
  is '手机号码';
comment on column T_USER_USER.TELEPHONE
  is '联系电话';
comment on column T_USER_USER.ADDRESS
  is '常住家庭住址';
comment on column T_USER_USER.EMAIL
  is '电子邮箱';
comment on column T_USER_USER.JOB
  is '职位';
comment on column T_USER_USER.DEPT_ID
  is '所属部门（外键）';
comment on column T_USER_USER.HEAD
  is '上传头像';
comment on column T_USER_USER.MATE_NAME
  is '配偶姓名';
comment on column T_USER_USER.MATE_ID_CARD
  is '配偶身份证号';
comment on column T_USER_USER.MATE_TELPHONE
  is '配偶联系电话';
comment on column T_USER_USER.MATE_WORK_UNIT
  is '配偶工作单位';
comment on column T_USER_USER.MEMO
  is '备注';
comment on column T_USER_USER.LAST_LOGIN
  is '上次登录时间';
comment on column T_USER_USER.CREATE_DATE
  is '创建时间';
comment on column T_USER_USER.REMARK1
  is '备用字段1';
comment on column T_USER_USER.REMARK2
  is '备用字段2';
comment on column T_USER_USER.REMARK3
  is '备用字段3';
comment on column T_USER_USER.REMARK4
  is '备用字段4';
comment on column T_USER_USER.RMATE_ID_CARD_ADDR
  is '配偶身份证地址';
comment on column T_USER_USER.MODIFY_DATE
  is '修改时间';
comment on column T_USER_USER.MATE_WORK_UNIT_ADDRESS
  is '配偶工作地址';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_USER_USER
  add constraint T_USE_USER_PK primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_USER_USER
  add constraint T_USER_USER_FK foreign key (DEPT_ID)
  references T_DEPT_DEPARTMENT (ID);

4.-- 用户角色关系表
create table T_USER_USER2ROLE
(
  ID          NUMBER not null,--主键
  EMPLOYEE_ID NUMBER,--员工ID（外键）
  ROLE_ID     NUMBER,--角色ID（外键）
  STATUS      NUMBER,--状态（0为正常，1为作废）
  CREATE_DATE DATE,--创建时间
  REMARK1     VARCHAR2(200),--备用字段1
  REMARK2     VARCHAR2(200),--备用字段2
  REMARK3     VARCHAR2(200),--备用字段3
  REMARK4     VARCHAR2(200)--备用字段4
)
tablespace FILOS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table T_USER_USER2ROLE
  is '用户角色关系表';
-- Add comments to the columns 
comment on column T_USER_USER2ROLE.ID
  is '主键';
comment on column T_USER_USER2ROLE.EMPLOYEE_ID
  is '员工ID（外键）';
comment on column T_USER_USER2ROLE.ROLE_ID
  is '角色ID（外键）';
comment on column T_USER_USER2ROLE.STATUS
  is '状态（0为正常，1为作废）';
comment on column T_USER_USER2ROLE.CREATE_DATE
  is '创建时间';
comment on column T_USER_USER2ROLE.REMARK1
  is '备用字段1';
comment on column T_USER_USER2ROLE.REMARK2
  is '备用字段2';
comment on column T_USER_USER2ROLE.REMARK3
  is '备用字段3';
comment on column T_USER_USER2ROLE.REMARK4
  is '备用字段4';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_USER_USER2ROLE
  add constraint ID primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_USER_USER2ROLE
  add constraint EMPLOYEE_ID_FK foreign key (EMPLOYEE_ID)
  references T_USER_USER (ID);
alter table T_USER_USER2ROLE
  add constraint ROLE_ID_FK foreign key (ROLE_ID)
  references FIL_PERMISSION_ROLE (ID);


5.--角色资源关系表
create table FIL_PERMISSION_RESOURCE2ROLE
(
  ID          NUMBER not null,--主键
  ROLE_ID     NUMBER not null,--角色id（外键）
  RESOURCE_ID NUMBER not null,--资源id（外键）
  STATUS      NUMBER,--状态（0为正常，1为作废）
  CREATE_DATE DATE,--创建时间
  REMARK1     VARCHAR2(200),--备用字段1
  REMARK2     VARCHAR2(200),--备用字段2
  REMARK3     VARCHAR2(200),--备用字段3
  REMARK4     VARCHAR2(200)--备用字段4
)
tablespace FILOS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table FIL_PERMISSION_RESOURCE2ROLE
  is '角色资源关系表';
-- Add comments to the columns 
comment on column FIL_PERMISSION_RESOURCE2ROLE.ID
  is '主键';
comment on column FIL_PERMISSION_RESOURCE2ROLE.ROLE_ID
  is '角色id（外键）';
comment on column FIL_PERMISSION_RESOURCE2ROLE.RESOURCE_ID
  is '资源id（外键）';
comment on column FIL_PERMISSION_RESOURCE2ROLE.STATUS
  is '状态（0为正常，1为作废）';
comment on column FIL_PERMISSION_RESOURCE2ROLE.CREATE_DATE
  is '创建时间';
comment on column FIL_PERMISSION_RESOURCE2ROLE.REMARK1
  is '备用字段1';
comment on column FIL_PERMISSION_RESOURCE2ROLE.REMARK2
  is '备用字段2';
comment on column FIL_PERMISSION_RESOURCE2ROLE.REMARK3
  is '备用字段3';
comment on column FIL_PERMISSION_RESOURCE2ROLE.REMARK4
  is '备用字段4';
-- Create/Recreate primary, unique and foreign key constraints 
alter table FIL_PERMISSION_RESOURCE2ROLE
  add constraint PERMISSION_RESOURCE2ROLE_PK primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FIL_PERMISSION_RESOURCE2ROLE
  add constraint PERMISSION_RESOURCE2ROLE_FK1 foreign key (ROLE_ID)
  references FIL_PERMISSION_ROLE (ID);
alter table FIL_PERMISSION_RESOURCE2ROLE
  add constraint PERMISSION_RESOURCE2ROLE_FK2 foreign key (RESOURCE_ID)
  references FIL_PERMISSION_RESOURCE (ID);
  
-- Create sequence 
create sequence SEQ_PRDC_PRODUCT
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;

--产品类型表

--create table
create table T_PRDC_TYPE
(
	id number not null,
	Name Varchar2(200) not null,
	Memo Varchar2(4000)	null,
	Create_date date default sysdate,
	Modify_date date default sysdate,
	prdc_type_status number default 0,
	Remark1 varchar(200) null,
	Remark2 varchar(200) null,
	Remark3 varchar(200) null,
	Remark4 varchar(200) null
)
 tablespace FILOS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
   -- Add comments to the table 
comment on table T_PRDC_TYPE
  is '产品类型表';
-- Add comments to the columns 
comment on column T_PRDC_TYPE.ID
  is '主键';
comment on column T_PRDC_TYPE.name
  is '类型名称';
comment on column T_PRDC_TYPE.Memo
  is '描述';
comment on column T_PRDC_TYPE.Create_date
  is '创建日期';
comment on column T_PRDC_TYPE.Modify_date
  is '修改日期';
comment on column T_PRDC_TYPE.prdc_type_status
  is '产品类型的状态(0正常-2删除)';
  
comment on column T_PRDC_TYPE.Remark1
  is '备注1';
comment on column T_PRDC_TYPE.Remark2
  is '备注2';
comment on column T_PRDC_TYPE.Remark3
  is '备注3';
comment on column T_PRDC_TYPE.Remark4
  is '备注4';
  alter table T_PRDC_TYPE
add constraint T_PRDC_TYPE_FK primary key (id);

--insert date
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类1','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类2','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类3','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类4','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类5','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类6','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类7','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类8','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类9','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类10','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类11','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类12','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类13','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类14','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类15','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类16','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类17','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类18','中国人民万岁....');
insert into T_PRDC_TYPE(id,Name,Memo) values(SEQ_PRDC_TYPE.nextVal,'汽动车类19','中国人民万岁....');
  
  
--产品表
--create table
create  table T_prdc_kind
(
	id number not null,
	name Varchar2(200) null,
	type_id number null,
	Type number default 0,
	Memo Varchar2(4000) null,
	Create_date date default sysdate,
	Modify_date date default sysdate,
	prdc_kind_status number default 0,
	Remark1 varchar(200) null,
	Remark2 varchar(200) null,
	Remark3 varchar(200) null,
	Remark4 varchar(200) null
)
  tablespace FILOS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
  -- Add comments to the table 
comment on table T_prdc_kind
  is '产品表';
-- Add comments to the columns 
comment on column T_PRDC_KIND.ID
  is '主键';
comment on column T_PRDC_KIND.name
  is '名称';
  comment on column T_PRDC_KIND.name
  is '产品类型';
comment on column T_PRDC_KIND.Type
  is '类型';
comment on column T_PRDC_KIND.Memo
  is '描述';
comment on column T_PRDC_KIND.Create_date
  is '创建日期';
comment on column T_PRDC_KIND.Modify_date
  is '修改日期';
comment on column T_PRDC_KIND.prdc_kind_status
  is '产品的状态(0正常-2删除)';
comment on column T_PRDC_KIND.Remark1
  is '备注1';
comment on column T_PRDC_KIND.Remark2
  is '备注2';
comment on column T_PRDC_KIND.Remark3
  is '备注3';
comment on column T_PRDC_KIND.Remark4
  is '备注4';
  alter table T_PRDC_KIND
add constraint T_PRDC_KIND_PK primary key (id);
 alter table T_PRDC_KIND
add constraint T_PRDC_KIND_FK foreign key (type_id)
  references T_prdc_type (ID);
 
 

insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类1','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类2','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类3','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类4','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类5','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类6','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类7','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类8','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类9','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类10','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类11','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类12','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类13','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类14','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类15','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类16','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类17','中国人民万岁....');
insert into T_PRDC_KIND(id,Name,Memo) values(SEQ_PRDC_KIND.nextVal,'汽动车类18','中国人民万岁....');

--产品型号表
--create table
create table t_prdc_product
(
	id number not null,
	Name Varchar2(200) null,
	Memo Varchar2(4000)	null,
	kind_id number null,
	Status number default 0,
	Create_date date default sysdate,
	Modify_date date default sysdate,
	prdc_product_status number default 0,
	Remark1 Varchar2(200) null,
	Remark2 Varchar2(200) null,
	Remark3 Varchar2(200) null,
	Remark4 Varchar2(200) null
)
tablespace FILOS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
   -- Add comments to the table 
comment on table t_prdc_product
  is '产品型号表';
-- Add comments to the columns 
comment on column t_prdc_product.ID
  is '主键';
comment on column t_prdc_product.Name
  is '型号名称';
comment on column t_prdc_product.Memo
  is '描述';
comment on column t_prdc_product.kind_id
  is '产品类型ID（外键）';
comment on column prdc_product_status.Status
  is '状态（0,为正常，1为作废）';
comment on column t_prdc_product.Create_date
  is '创建日期';
comment on column t_prdc_product.Modify_date
  is '修改日期';
comment on column t_prdc_product.Remark1
  is '备注1';
comment on column t_prdc_product.Remark2
  is '备注2';
comment on column t_prdc_product.Remark3
  is '备注3';
comment on column t_prdc_product.Remark4
  is '备注4';
alter table t_prdc_product
add constraint t_prdc_product_PK primary key (id); 
alter table t_prdc_product
  add constraint t_prdc_product_FK foreign key (kind_id)
  references T_prdc_kind (ID);
  
  
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_PRODUCT.nextVal,'B01','中国人民万岁....',1);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B02','中国人民万岁....',2);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B03','中国人民万岁....',3);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B04','中国人民万岁....',4);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B05','中国人民万岁....',5);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B06','中国人民万岁....',6);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B07','中国人民万岁....',7);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B08','中国人民万岁....',8);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B09','中国人民万岁....',9);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B010','中国人民万岁....',10);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B011','中国人民万岁....',11);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B012','中国人民万岁....',12);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B013','中国人民万岁....',13);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B014','中国人民万岁....',14);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B015','中国人民万岁....',15);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B016','中国人民万岁....',16);
insert into t_prdc_product(id,Name,Memo,kind_id) values(SEQ_PRDC_TYPE.nextVal,'B017','中国人民万岁....',17);
  
--供应商产品表:
--t_supl_equipment
create table t_supl_equipment
(
	id number not null,
	product_id number null,
	Supplier_id number null,
	Stock number null,
	Second_hand number null,
	Guidance_price Number(11,2) null,
	Ex_factory_price Number(11,2) null,
	Unit Varchar2(200) null,
	Price_unit Varchar2(200) null,
	Status number null,
	Create_date date default sysdate,
	Modify_date date default sysdate,
	Create_person Varchar2(2000) null,
	useExpire number default 0,
	Status_bak Varchar2(50) null,
	Type_bak Varchar2(50) null,
	Remark_bak Varchar2(2000) null,
	Product_desc Varchar2(4000) null,
	Remark1 Varchar2(200) null,
	Remark2 Varchar2(200) null,
	Remark3 Varchar2(200) null,
	Remark4 Varchar2(200) null
)
tablespace FILOS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
   -- Add comments to the table 
comment on table t_supl_equipment
  is '供应商产品表';
-- Add comments to the columns 
comment on column t_supl_equipment.ID
  is '主键';
comment on column t_supl_equipment.product_id
  is '产品型号ID（外键）';
comment on column t_supl_equipment.Supplier_id
  is '供应商ID（外键）';
comment on column t_supl_equipment.Stock
  is '库存';
comment on column t_supl_equipment.Second_hand
  is '二手设备（0不是，1是）';
comment on column t_supl_equipment.Guidance_price
  is '指导价';
comment on column t_supl_equipment.Ex_factory_price
  is '出厂价';
comment on column t_supl_equipment.Unit
  is '单位（台，件，辆）';
comment on column t_supl_equipment.Price_unit
  is '货币单位(美元，欧元，人民币)';
comment on column t_supl_equipment.Status
  is '状态（0,为正常，1为作废）';
comment on column t_supl_equipment.Create_date
  is '创建日期';
comment on column t_supl_equipment.Modify_date
  is '修改日期';
comment on column t_supl_equipment.Create_person
  is '创建人';
comment on column t_supl_equipment.useExpire
  is '使用年限';
comment on column t_supl_equipment.Status_bak
  is '状态';
comment on column t_supl_equipment.Type_bak
  is '类型';
comment on column t_supl_equipment.Remark_bak
  is '备注';
comment on column t_supl_equipment.Product_desc
  is '产品说明';
comment on column t_supl_equipment.Remark1
  is '备注1';
comment on column t_supl_equipment.Remark2
  is '备注2';
comment on column t_supl_equipment.Remark3
  is '备注3';
comment on column t_supl_equipment.Remark4
  is '备注4'; 
 
alter table t_supl_equipment
add constraint t_supl_equipment_PK primary key (id); 
alter table t_supl_equipment
  add constraint t_supl_equipment_FK foreign key (product_id)
  references t_prdc_product (ID);
alter table t_supl_equipment
  add constraint t_supl_equipmentOfSupplier_FK foreign key (Supplier_id)
  references t_supl_supplier (ID);
  
-- Create sequence 
create sequence SEQ_SUPL_EQUIPMENT
minvalue 1
maxvalue 99999999999999999999999
start with 1
increment by 1
cache 20;

insert into t_supl_equipment(id,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,4,50,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,2,51,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,20,52,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,21,53,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,22,54,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,23,55,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,24,56,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,25,57,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,26,58,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,27,59,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,28,60,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,29,61,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,30,62,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,31,63,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,32,64,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,33,65,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,34,66,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);
insert into t_supl_equipment(SUEQ_ID,product_id,Supplier_id,Stock,Second_hand,Guidance_price,Ex_factory_price,Unit,Price_unit,Status,Create_date,Modify_date,Create_person,useExpire) 
values(SEQ_SUPL_EQUIPMENT.nextVal,35,67,1000,0,1000.00,10000.00,'0','0',0,sysdate,sysdate,'aaa',0);

  