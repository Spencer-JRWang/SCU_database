drop table if exists student CASCADE;
drop table if exists module CASCADE;
drop table if exists history CASCADE;
drop table if exists exam CASCADE;

create table Student(
  student_name varchar(30),
  student_id char(4) primary key,
  class_name char(2),
  year smallint
);

create table module(
  module_name varchar(30),
  module_code varchar(6) primary key,
  organizor_name varchar(30)
);

create table history(
  module_code varchar(6) primary key,
  delivery_year smallint,
  organizor_name varchar(2),
  CONSTRAINT fk_his foreign key (module_code) references module(module_code)
);

create table exam(
  student_id char(4),
  module_code varchar(6),
  exam_year smallint, 
  score smallint,
  constraint pk_exam primary key (student_id, module_code, exam_year),
  CONSTRAINT fk_exam1 foreign key (student_id) references student(student_id),
  CONSTRAINT fk_exam2 foreign key (module_code) references history(module_code)
);
