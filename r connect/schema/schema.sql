/*一、创建表格*/
create table Student(
          Sno char(6) primary key,
          Sname varchar(8) ,
          Ssex char(2) ,
          Sage smallint,
          Sdept varchar(15) 
        );
create table Course(
          Cno char(4) primary key,
          Cname varchar(20) ,
          Cpno char(4),
          Ccredit smallint
        );
create table SC(
          Sno char(4),
          Cno char(6),
          Grade decimal(12,1),
          PRIMARY KEY (Sno, Cno)
        );
alter table Student add column address varchar(60);
alter table Student add inDate date;
drop table Student;
drop table cource;
drop table sc;

/*二、创建数据完整性*/
create table Student(
          Sno char(6) primary key,
          Sname varchar(8) not null unique,
          Ssex char(2) CHECK (Ssex IN ('男', '女')),
          Sage smallint CHECK (Sage > 16),
          Sdept varchar(15) default 'JSJ'
        );
create table Course(
          Cno char(4) primary key,
          Cname varchar(20),
          Cpno char(4) check (cno != cpno),
          Ccredit smallint check (ccredit in (0,1,2,3,4,5))
        );
create table SC(
          Sno char(4),
          Cno char(6),
          Grade decimal(12,1),
          CONSTRAINT fk_sno FOREIGN KEY (Sno) REFERENCES Student(Sno),
          CONSTRAINT fk_cno FOREIGN KEY (Cno) REFERENCES Course(Cno)
);

/*利用alter table进行添加删除完整性约束*/
/*删除主码*/
alter table sc drop constraint pk_sc;
/*删除外码*/
alter table sc drop constraint sc_cno_fkey;
/*添加主码*/
alter table sc add constraint pk_sc primary key (sno, cno);
/*添加外码*/
alter table sc add constraint sc_cno_fkey foreign key (cno) references course (cno);
/*添加自定义约束*/
alter table sc add constraint grade_check check (0<grade and grade<100);
/*删除自定义约束*/
alter table sc drop constraint grade_check;

/*查看信息*/
select * from student;
select * from course;
select * from sc;

/*三、数据完整性实验*/
INSERT INTO STUDENT
      VALUES (3001, '赵达', '男', 20, 'SX');
INSERT INTO STUDENT
      VALUES (3002, '杨丽', '女', 21, 'JSJ');
INSERT INTO STUDENT
      VALUES (3001, '李寅', '女', 21, 'SX');
INSERT INTO STUDENT
      VALUES (3005, '王明明', '女', 21, 'SX');
select * from student;
insert into sc
      values (3001, 1081, 90);
insert into sc
      values (3001, 1081, 79);
insert into sc
      values (3001, 1082, 89);
/*插入指定的行*/
insert into course (cno, cname, ccredit)
      values (1081, '电子商务', 4);
insert into course (cno, cname, ccredit)
      values (1082, '数据库原理', 4);
/*删除指定的行*/
delete from sc
      where cno = '101';
/*修改指定的行*/
UPDATE STUDENT
SET SAGE = SAGE + 2
WHERE SNO = '5001';
