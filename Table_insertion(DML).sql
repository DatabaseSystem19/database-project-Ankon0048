--data inserted for users table

insert into users values('sonjoy1','sonjoy','male','sonjoy@gmail.com','01793425032','sonjoypass');
insert into users values('talha1','talha','male','talha@gmail.com','01793425031','talhapass');
insert into users values('anik1','anik','male','anik@gmail.com','01793425033','anikpass');
insert into users values('kawshik1','kawshik','male','kawsikh@gmail.com','01793425033','kawshikpass');
insert into users values('tuli1','tuli','female','tuli@gmail.com','01793425034','tulipass');
insert into users values('nibir1','nibir','male','nibir@gmail.com','01793425035','nibirpass');
insert into users values('dipto1','dipto','male','dipto@gmail.com','01793425036','diptopass');
insert into users values('safwan1','safwan','male','safwan@gmail.com','0179342733','safwanpass');
insert into users values('mahadi1','mahadi','male','mahadi@gmail.com','01793425038','mahadipass');
insert into users values('mahmud1','mahmud','male','mahmud@gmail.com','01793425039','mahmudpass');

--data inserted for items table

insert into items values(1,'Inception','film','warner bros','31-may-22',2,2.2);
insert into items values(2,'DOOM','game','Activision','31-may-22',3,3.21);
insert into items values(3,'Otritiyo','book','artcell','31-jul-22',4,4.2);
insert into items values(4,'Oppenheimer','film','christopher nolan','11-may-22',2,2.21);
insert into items values(5,'Max Payne','game','rockstar','31-jul-22',3,3.2);
insert into items values(6,'Database Systems','book','apress','21-jan-22',4,4.21);
insert into items values(7,'game of thrones','book','voyager books','11-feb-22',4,4.21);
insert into items values(8,'witcher','book','hachette book group','31-mar-22',4,4.21);
insert into items values(9,'harry potter','book','bloomsburry','22-mar-22',4,4.22);
insert into items values(10,'The great gatsby','book','chares scribners sons','31-oct-22',4,4.22);

--data inserted for transaction table

insert into transactions values(101.111,'sonjoy1',1,'31-may-25','22-july-25',0);
insert into transactions values(102.111,'sonjoy1',2,'31-may-25','22-july-25',20);
insert into transactions values(103.111,'mahadi1',3,'31-may-25','22-june-25',10);
insert into transactions values(104.111,'mahmud1',4,'31-may-25','22-june-25',8);
insert into transactions values(105.111,'tuli1',5,'31-may-25','22-june-25',0);
insert into transactions values(106.111,'sonjoy1',6,'31-may-25','22-june-25',30);
insert into transactions values(107.111,'safwan1',7,'31-may-25','22-june-25',20);
insert into transactions values(108.111,'talha1',8,'31-may-25','22-june-25',40);
insert into transactions values(109.111,'nibir1',9,'31-may-25','22-june-25',0);
insert into transactions values(110.111,'nibir1',10,'31-may-25','22-june-25',10);

--data inserted to admin table

insert into admin values('ankon1','sonjoy1','special',101.111);
insert into admin values('ankon1','talha1','regular',102.111);
insert into admin values('ankon1','anik1','regular',103.111);
insert into admin values('ankon1','kawshik1','regular',104.111);
insert into admin values('ankon1','nibir1','regular',105.111);
insert into admin values('ankon1','tuli1','special',106.111);
insert into admin values('ankon1','dipto1','regular',107.111);
insert into admin values('ankon1','safwan1','regular',108.111);
insert into admin values('ankon1','mahadi1','regular',109.111);
insert into admin values('ankon1','mahmud1','regular',110.111);

--data inserted in user_history table

insert into user_history values('sonjoy1',1,'31-may-25','22-july-25',0,2,10);
insert into user_history values('sonjoy1',2,'31-may-25','22-july-25',20,1,20);
insert into user_history values('mahadi1',3,'31-may-25','22-june-25',10,3,0);
insert into user_history values('mahmud1',4,'31-may-25','22-june-25',8,2,0);
insert into user_history values('tuli1',5,'31-may-25','22-june-25',0,1,20);
insert into user_history values('sonjoy1',6,'31-may-25','22-june-25',20,5,30);
insert into user_history values('safwan1',7,'31-may-25','22-june-25',30,4,50);
insert into user_history values('talha1',8,'31-may-25','22-june-25',40,3,5);
insert into user_history values('nibir1',9,'31-may-25','22-june-25',0,4,15);
insert into user_history values('nibir1',10,'31-may-25','22-june-25',10,3,5);

--showing data of table

select * from users;

select * from items;

select * from transactions;

select * from admin;

select * from user_history;