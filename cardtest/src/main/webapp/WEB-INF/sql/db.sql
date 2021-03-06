CREATE TABLE user_info (
  user_idx number(11) NOT NULL ,
  user_register_date date default sysdate,
  user_name varchar(200)  NOT NULL,
  user_social_secunum varchar(200)  DEFAULT NULL,
  user_sex varchar(200)  DEFAULT NULL ,
  user_comp varchar(200)  DEFAULT NULL ,
  user_comp_enterdate date DEFAULT NULL,
  user_dept varchar(200)  DEFAULT NULL ,
  user_spot varchar(200)  DEFAULT NULL ,
  user_army_serv varchar(200)  DEFAULT NULL,
  user_marital_status varchar(200)  DEFAULT NULL,
  user_army_serv_enter date DEFAULT NULL,
  user_army_serv_leave date DEFAULT NULL,
  user_army_serv_period varchar(200)  DEFAULT NULL,
  user_telnum_wired varchar(200)  DEFAULT NULL,
  user_telnum_wireless varchar(200)  DEFAULT NULL,
  user_email varchar(200)  DEFAULT NULL ,
  user_zipcode varchar(200)  DEFAULT NULL,
  user_address varchar(200)  DEFAULT NULL,
  PRIMARY KEY (user_idx)
);


SELECT * FROM user_info

SELECT instr(user_email,'@') FROM user_info

SELECT substr(user_email,0,instr(user_email,'@',1,1)-1) as f_email, substr(user_email,instr(user_email,'@',1,1),length(user_email)) as s_email FROM user_info

CREATE TABLE user_info_career (
  career_idx number(11) NOT NULL ,
  user_idx number(11) NOT NULL,
  career_comp_name varchar(200) DEFAULT NULL,
  career_enterdate date DEFAULT NULL,
  career_leavedate date DEFAULT NULL,
  career_spot varchar(200) DEFAULT NULL,
  career_responsib varchar(200) DEFAULT NULL,
  PRIMARY KEY (career_idx)
);

CREATE TABLE user_info_edu (
  edu_idx number(11) NOT NULL ,
  user_idx number(11) DEFAULT NULL,
  edu_school_name varchar(200) DEFAULT NULL,
  edu_status varchar(200) DEFAULT NULL,
  /*edu_year varchar(200) DEFAULT NULL,
  edu_month varchar(200) DEFAULT NULL,
  */
  
  edu_date date DEFAULT NULL,
  
  PRIMARY KEY (edu_idx)
);

SELECT * FROM user_info_edu

CREATE TABLE user_info_licen (
  licen_idx number(11) NOT NULL ,
  user_idx number(11) DEFAULT NULL,
  licen_name varchar(200) DEFAULT NULL,
  licen_skill_level varchar(200) DEFAULT NULL,
  PRIMARY KEY (licen_idx)
);

CREATE TABLE user_info_qualifi (
  qualifi_idx number(11) NOT NULL ,
  user_idx number(11) DEFAULT NULL,
  qualifi_name varchar(200) DEFAULT NULL,
  qualifi_getdate date DEFAULT NULL,
  PRIMARY KEY (qualifi_idx)
);

CREATE TABLE user_info_skill (
  skill_idx number(11) NOT NULL ,
  user_idx number(11) DEFAULT NULL,
  skill_project_name varchar(1000) DEFAULT NULL,
  skill_startdate date DEFAULT NULL,
  skill_enddate date DEFAULT NULL,
  skill_customer_comp varchar(1000) DEFAULT NULL,
  skill_work_comp varchar(1000) DEFAULT NULL,
  skill_applied varchar(1000) DEFAULT NULL,
  skill_industry varchar(1000) DEFAULT NULL,
  skill_role varchar(1000) DEFAULT NULL,
  skill_model varchar(1000) DEFAULT NULL,
  skill_os varchar(1000) DEFAULT NULL,
  skill_lang varchar(1000) DEFAULT NULL,
  skill_dbms varchar(1000) DEFAULT NULL,
  skill_comm varchar(1000) DEFAULT NULL,
  skill_tool varchar(1000) DEFAULT NULL,
  skill_etc varchar(1000) DEFAULT NULL,
  PRIMARY KEY (skill_idx)
);

CREATE TABLE user_info_training (
  training_idx number(11) NOT NULL ,
  user_idx number(11) DEFAULT NULL,
  training_name varchar(200) DEFAULT NULL,
  training_startdate date DEFAULT NULL,
  training_enddate date DEFAULT NULL,
  training_agency varchar(200) DEFAULT NULL,
  PRIMARY KEY (training_idx)
);

CREATE TABLE IMAGE(
	img_idx number(11) primary key,
	user_idx number(11),
	img_name varchar(1000)
);
/* ?????? ???????????? ?????????(?????? ????????? ????????? ???) */
CREATE TABLE user_info_hobby (
hobby_idx number(11) NOT NULL,
user_idx number(11) DEFAULT NULL,
hobby_name varchar(200) DEFAULT NULL,
hobby_date date DEFAULT NULL,
PRIMARY KEY (hobby_idx)
);

SELECT * FROM user_info_hobby;

create sequence user_info_seq;
create sequence user_info_edu_seq;
create sequence user_info_career_seq;
create sequence user_info_licen_seq;
create sequence user_info_qualifi_seq;
create sequence user_info_skill_seq;
create sequence user_info_training_seq;
create sequence user_info_hobby_seq;
create sequence img_seq;
commit;


drop table user_info;
drop table user_info_career;
drop table user_info_edu;
drop table user_info_licen;
drop table user_info_qualifi;
drop table user_info_skill;
drop table user_info_training;
drop table user_info_hobby;

drop sequence user_info_seq;
drop sequence user_info_edu_seq;
drop sequence user_info_career_seq;
drop sequence user_info_licen_seq;
drop sequence user_info_qualifi_seq;
drop sequence user_info_skill_seq;
drop sequence user_info_training_seq;
drop sequence user_info_hobby_seq;

