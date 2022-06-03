use master
create  database library
use library 
create table admin
(
admin_id int ,
f_name varchar(20),
l_name varchar(20),
constraint admin_id_pk primary key(admin_id)
);
create table book
(
book_id int primary key,
publish_date varchar(20),
title varchar(20) ,
author_id int ,
constraint title_un unique (title),
constraint author_book_fk foreign key (author_id)
references author (author_id) 
);
create table author
( author_id int primary key,
f_name varchar(20),
l_name varchar(20)
); 


 create table boobook_catigory
 (
 book_id int not null,
 catigory varchar (20) primary key, 
  constraint book_catigory_fk foreign key (book_id)
  references book (book_id)
  );
  create table members
  (
  member_id int primary key ,
  joined_date varchar(20) ,
  passward varchar(20),
  admin_id int,
  constraint admin_member_fk foreign key(admin_id)
  references admin (admin_id)
  );
  create table member_phone
  (
  phone varchar(20) primary key,
  member_id int,
  );



  alter table member_phone
  add constraint member_phone_fk foreign key(member_id)
  references members(member_id);


  create table member_name
  (
  f_name varchar(20) primary key,
  l_name varchar(20),
  member_id int ,
  constraint member_name_fk foreign key (member_id)
  references members(member_id)
  );




  create table payment
  (
  payment int primary key,
  p_date varchar(20),
  member_id int ,
    constraint member_payment_fk foreign key (member_id)
  references members(member_id)
  );





  create table loan
  (loan_id int primary key,
  member_id int ,
  loan_date varchar(20),
  return_date varchar(20),
  book_id int,
   constraint member_loan_fk foreign key (member_id)
  references members(member_id)
  );





  alter table loan
  add constraint book_loan_fk foreign key (book_id)
  references book (book_id);




   create table fine
   (
   fine_id int primary key,
   loan_id int,
   member_id int,
   fine_date varchar(20),
   fine_amount int
   constraint fine_loan_fk foreign key (loan_id)
  references loan(loan_id)

   );
    alter table fine
	 add constraint member_fine_fk foreign key (member_id)
  references members(member_id);
  insert into book (book_id,publish_date,title,author_id)
values('1','11/2/2000','the run','1'),
       ('2','3/6/2010','the risk','2'),
	   ('3','11/2/2020','fine','3'),
	   ('4','8/7/2010','rock','4'),
   ('5','19/5/2030','system information','5');



insert into boobook_catigory (book_id,catigory)
values('1','fantasty'),
      ('2','advaenture'),
	  ('3','fantasty'),
	  ('4','excitemnt'),
	  ('5','horror');






insert into author(author_id,f_name,l_name)
values ('1','mohamed','ali'),
       ('2','ahmed','hosam'),
	   ('3','hassan','mostafa'),
	   ('4','arfa','khaled'),
	   ('5','mahmude','atef');








insert into members(member_id,joined_date,passward)
values('1','1/2/2020','1232443'),
      ('2','4/5/2020','3535443'),
	  ('3','1/2/2020','5434243'),
	  ('4','1/8/2020','176543'),
	  ('5','1/6/2020','8768643');

insert into member_name(member_id,f_name,l_name)
values('1','mohamed','ahmed'),  
      ('2','khaled','abdulaah'),  
	  ('3','nada','alaa'),  
	  ('4','sara','abdelhamid'),  
	  ('5','hoda','ftah');  
insert into member_phone(member_id,phone)
values ('1','12324252'),
('2','123456'),
('3','123456'),
('4','568756252'),
('5','346564252');










insert into loan(loan_id,loan_date,return_date,member_id)
values('1','1/2/2020','3/2/2020','1'),
      ('2','4/2/2020','6/2/2020','2'),
	  ('3','4/2/2020','9/2/2020','3'),
	  ('4','5/7/2020','8/7/2020','4'),
	  ('5','1/6/2020','3/6/2020','5');





delete loan









insert into loan (loan_id,loan_date,return_date,member_id,book_id)
values('1','1/2/2020','3/2/2020','1','1'),
      ('2','4/2/2020','6/2/2020','2','2'),
	  ('3','4/2/2020','9/2/2020','3','3'),
	  ('4','5/7/2020','8/7/2020','4','4'),
	  ('5','1/6/2020','3/6/2020','5','5'); 
insert into fine (fine_id,fine_date,fine_amount,loan_id,member_id)
values ('1','1/2/2020','200','1','1'),
      ('2','6/2/2020','455','2','2'),
	  ('3','8/2/2020','256','3','3'),
	  ('4','23/2/2020','260','4','4'),
	  ('5','5/2/2020','765','5','5');







	  select *from book;


	  select b.book_id ,title,f_name+' '+l_name as'member name'
from book b,loan l,member_name m
where b.book_id=l.book_id and l.member_id=m.member_id;




select b.book_id ,title,f_name+' '+l_name as'member name'
from book b join loan l on  b.book_id=l.book_id
join member_name m 
on l.member_id=m.member_id;


select f_name +''+l_name as 'author name ' 
from author
order by f_name;







select phone
from member_phone
where phone is not null;

select phone
from member_phone
where member_id=2;





select *from member_phone




select count(*)as "the number of loan",max(loan_date)as"the last date",min(loan_date)as "the first date"
from loan ;
select *from loan;





select *from loan;




select loan_id,loan_date,f_name+''+l_name as'member name'
from loan l,member_name m
where l.member_id=m.member_id;






select fine_amount
from fine
where fine_amount like '2%';