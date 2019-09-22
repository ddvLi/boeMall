SET NAMES UTF8;
DROP DATABASE IF EXISTS boeMall;
CREATE DATABASE boeMall CHARSET=UTF8;
USE boeMall;

#商品类别
CREATE TABLE family_list(
	fpid INT PRIMARY KEY AUTO_INCREMENT,  #商品类别id
  fpname VARCHAR(128)										#商品类别名称
);
INSERT INTO family_list VALUES(NULL,'BOE数字艺术');
INSERT INTO family_list VALUES(NULL,'BOE移动健康生态链');

#门店列表
CREATE TABLE stores_list(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(128),
	spic VARCHAR(256),
	saddress VARCHAR(256),
	stime1 VARCHAR(256),
	stime2 VARCHAR(256),
	scity VARCHAR(128),
	bspic VARCHAR(256),
	sspic1 VARCHAR(256),
	sspic2 VARCHAR(256),
	sspic3 VARCHAR(256),
	sspic4 VARCHAR(256),
	sspic5 VARCHAR(256)
);
INSERT INTO stores_list VALUES(NULL,'京东方生活济南恒隆广场体验店','store1.png','济南恒隆广场西翼5楼 5-10中岛','08:00~20:00','08:00~20:00','济南市','bigStore1.jpg','smStore1_1.jpg','smStore1_2.jpg',NULL,NULL,NULL);
INSERT INTO stores_list VALUES(NULL,'京东方数字艺术杭州湖滨银泰体验店','store2.png','杭州市上城区东坡路7号湖滨银泰in77E区2层','09:00~21:30','10:00~22:00','杭州市','bigStore2.jpg','smStore2_1.jpg','smStore2_2.jpg','smStore2_3.jpg','smStore2_4.jpg',NULL);
INSERT INTO stores_list VALUES(NULL,'京东方生活北京枫蓝国际体验店','store3.png','北京市海淀区枫蓝国际购物中心3层','10:00~21:30','09:30~21:30','北京市','bigStore3.jpg','smStore3_1.jpg','smStore3_2.jpg','smStore3_3.jpg','smStore3_4.jpg','smStore3_5.jpg');

#用户列表
CREATE TABLE user_list(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	nickname VARCHAR(128),
	userphoto VARCHAR(60000),
	birthday VARCHAR(256),
	gender BOOL,
	uphone CHAR(11),
	upwd VARCHAR(256)
);
INSERT INTO user_list VALUES(NULL,'Tom',NULL,'2019-09-11',1,'18888888888','666666');
INSERT INTO user_list VALUES(NULL,'Lucy',NULL,NULL,0,'16666666666','123456');

#商品列表
CREATE TABLE product_list(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	ppic VARCHAR(256),
	fpid INT
);
INSERT INTO product_list VALUES(NULL,'hp1.png',1);
INSERT INTO product_list VALUES(NULL,'hp2.png',1);
INSERT INTO product_list VALUES(NULL,'hp3.png',1);
INSERT INTO product_list VALUES(NULL,'hp4.png',1);
INSERT INTO product_list VALUES(NULL,'hp5.png',1);
INSERT INTO product_list VALUES(NULL,'zn1.png',2);
INSERT INTO product_list VALUES(NULL,'zn2.png',2);
INSERT INTO product_list VALUES(NULL,'zn3.png',2);

#商品详情列表
CREATE TABLE product_detail(
	dpid INT PRIMARY KEY AUTO_INCREMENT,
	dname VARCHAR(256),
	dftype VARCHAR(256),
	dtype VARCHAR(256),
	mrState BOOL,
	dprice DECIMAL(10,2),
	dpic VARCHAR(256),
	dcount BOOL,
	pid INT
);
INSERT INTO product_detail VALUES(NULL,'BOE画屏 拾光机',NULL,NULL,1,1599,'dpic01.jpg',1,1);
INSERT INTO product_detail VALUES(NULL,'BOE画屏S2','画屏颜色','琥珀柚',1,2999,'dpic02.jpg',1,2);
INSERT INTO product_detail VALUES(NULL,'BOE画屏S2','画屏颜色','新月桦',0,2999,'dpic03.jpg',1,2);
INSERT INTO product_detail VALUES(NULL,'BOE画屏32寸','画屏颜色','原木色',1,2699,'dpic04.jpg',1,3);
INSERT INTO product_detail VALUES(NULL,'BOE画屏32寸','画屏颜色','柚木色',0,2699,'dpic05.jpg',1,3);
INSERT INTO product_detail VALUES(NULL,'BOE画屏21.5寸','画屏颜色','原木色',1,1788,'dpic06.jpg',0,4);
INSERT INTO product_detail VALUES(NULL,'BOE画屏49寸','画屏颜色','原木色',1,7999,'dpic07.jpg',0,5);
INSERT INTO product_detail VALUES(NULL,'BOE智能睡眠仪',NULL,NULL,1,2480,'dpic08.jpg',0,6);
INSERT INTO product_detail VALUES(NULL,'Cliing Leap GPS运动手表',NULL,NULL,1,698,'dpic09.jpg',0,7);
INSERT INTO product_detail VALUES(NULL,'BOE智能体脂秤','型号','(优享版)',1,399,'dpic10.jpg',0,8);
INSERT INTO product_detail VALUES(NULL,'BOE智能体脂秤','型号','(轻享版)',0,199,'dpic11.jpg',0,8);

#商品轮播图列表
CREATE TABLE lbtpics_list(
	lid INT PRIMARY KEY AUTO_INCREMENT,
	lbtpic VARCHAR(256),
	dpid INT,
	mrState BOOL,
	pid INT
);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp1_1.jpg',1,1,1);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp1_2.jpg',1,1,1);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp1_3.jpg',1,1,1);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp1_4.jpg',1,1,1);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp1_5.jpg',1,1,1);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp2_1.jpg',2,1,2);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp2_1.jpg',3,0,2);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp3_1.jpg',4,1,3);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp3_2.jpg',4,1,3);
INSERT INTO lbtpics_list VALUES(NULL,'dpic05.jpg',5,0,3);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp3_2.jpg',5,0,3);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp4_1.jpg',6,1,4);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp4_2.jpg',6,1,4);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp4_3.jpg',6,1,4);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp4_4.jpg',6,1,4);
INSERT INTO lbtpics_list VALUES(NULL,'bannerHp5_1.jpg',7,1,5);
INSERT INTO lbtpics_list VALUES(NULL,'bannerZn1_1.jpg',8,1,6);
INSERT INTO lbtpics_list VALUES(NULL,'bannerZn1_2.jpg',8,1,6);
INSERT INTO lbtpics_list VALUES(NULL,'bannerZn1_3.jpg',8,1,6);
INSERT INTO lbtpics_list VALUES(NULL,'bannerZn1_4.jpg',8,1,6);
INSERT INTO lbtpics_list VALUES(NULL,'bannerZn1_5.jpg',8,1,6);
INSERT INTO lbtpics_list VALUES(NULL,'bannerZn2_1.jpg',9,1,7);
INSERT INTO lbtpics_list VALUES(NULL,'bannerZn3_1.jpg',10,1,8);
INSERT INTO lbtpics_list VALUES(NULL,'bannerZn4_1.jpg',11,0,8);
INSERT INTO lbtpics_list VALUES(NULL,'bannerZn4_2.jpg',11,0,8);
INSERT INTO lbtpics_list VALUES(NULL,'bannerZn4_3.jpg',11,0,8);
INSERT INTO lbtpics_list VALUES(NULL,'bannerZn4_4.jpg',11,0,8);

#商品详情图片列表
CREATE TABLE xqpics_list(
	xid INT PRIMARY KEY AUTO_INCREMENT,
	xqpic VARCHAR(256),
	dpid INT,
	mrState BOOL,
	pid INT
);
INSERT INTO xqpics_list VALUES(NULL,'detailHp1_1.jpg',1,1,1);
INSERT INTO xqpics_list VALUES(NULL,'detailHp1_2.gif',1,1,1);
INSERT INTO xqpics_list VALUES(NULL,'detailHp1_3.jpg',1,1,1);
INSERT INTO xqpics_list VALUES(NULL,'detailHp1_4.jpg',1,1,1);
INSERT INTO xqpics_list VALUES(NULL,'detailHp2_1.jpg',2,1,2);
INSERT INTO xqpics_list VALUES(NULL,'detailHp2_2.jpg',2,1,2);
INSERT INTO xqpics_list VALUES(NULL,'detailHp2_3.jpg',2,1,2);
INSERT INTO xqpics_list VALUES(NULL,'detailHp2_4.jpg',2,1,2);
INSERT INTO xqpics_list VALUES(NULL,'detailHp2_5.jpg',2,1,2);
INSERT INTO xqpics_list VALUES(NULL,'detailHp2_6.jpg',2,1,2);
INSERT INTO xqpics_list VALUES(NULL,'detailHp2_1.jpg',3,0,2);
INSERT INTO xqpics_list VALUES(NULL,'detailHp2_2.jpg',3,0,2);
INSERT INTO xqpics_list VALUES(NULL,'detailHp2_3.jpg',3,0,2);
INSERT INTO xqpics_list VALUES(NULL,'detailHp2_4.jpg',3,0,2);
INSERT INTO xqpics_list VALUES(NULL,'detailHp2_5.jpg',3,0,2);
INSERT INTO xqpics_list VALUES(NULL,'detailHp2_6.jpg',3,0,2);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_1.jpg',4,1,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_2.jpg',4,1,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_3.jpg',4,1,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_4.jpg',4,1,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_5.jpg',4,1,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_6.jpg',4,1,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_7.jpg',4,1,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_1.jpg',5,0,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_2.jpg',5,0,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_3.jpg',5,0,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_4.jpg',5,0,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_5.jpg',5,0,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_6.jpg',5,0,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp3_7.jpg',5,0,3);
INSERT INTO xqpics_list VALUES(NULL,'detailHp4_1.jpg',6,1,4);
INSERT INTO xqpics_list VALUES(NULL,'detailHp4_2.jpg',6,1,4);
INSERT INTO xqpics_list VALUES(NULL,'detailHp4_3.jpg',6,1,4);
INSERT INTO xqpics_list VALUES(NULL,'detailHp4_4.jpg',6,1,4);
INSERT INTO xqpics_list VALUES(NULL,'detailHp4_5.jpg',6,1,4);
INSERT INTO xqpics_list VALUES(NULL,'detailHp4_6.jpg',6,1,4);
INSERT INTO xqpics_list VALUES(NULL,'detailHp4_7.jpg',6,1,4);
INSERT INTO xqpics_list VALUES(NULL,'detailHp5_1.jpg',7,1,5);
INSERT INTO xqpics_list VALUES(NULL,'detailHp5_2.jpg',7,1,5);
INSERT INTO xqpics_list VALUES(NULL,'detailHp5_3.jpg',7,1,5);
INSERT INTO xqpics_list VALUES(NULL,'detailHp5_4.jpg',7,1,5);
INSERT INTO xqpics_list VALUES(NULL,'detailHp5_5.jpg',7,1,5);
INSERT INTO xqpics_list VALUES(NULL,'detailHp5_6.jpg',7,1,5);
INSERT INTO xqpics_list VALUES(NULL,'detailHp5_7.jpg',7,1,5);
INSERT INTO xqpics_list VALUES(NULL,'detailZn1_1.jpg',8,1,6);
INSERT INTO xqpics_list VALUES(NULL,'detailZn2_1.jpg',9,1,7);
INSERT INTO xqpics_list VALUES(NULL,'detailZn3_1.jpg',10,1,8);
INSERT INTO xqpics_list VALUES(NULL,'detailZn4_1.jpg',11,0,8);

#商品参数图片列表
CREATE TABLE cspics_list(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	cspic VARCHAR(256),
	dpid INT,
	mrState BOOL,
	pid INT
);
INSERT INTO cspics_list VALUES(NULL,'csHp1.jpg',1,1,1);
INSERT INTO cspics_list VALUES(NULL,'csHp2.jpg',2,1,2);
INSERT INTO cspics_list VALUES(NULL,'csHp2.jpg',3,0,2);
INSERT INTO cspics_list VALUES(NULL,'csHp3.jpg',4,1,3);
INSERT INTO cspics_list VALUES(NULL,'csHp3.jpg',5,0,3);
INSERT INTO cspics_list VALUES(NULL,'csHp4.jpg',6,1,4);
INSERT INTO cspics_list VALUES(NULL,'csHp5.jpg',7,1,5);
INSERT INTO cspics_list VALUES(NULL,'csZn1.jpg',8,1,6);
INSERT INTO cspics_list VALUES(NULL,'csZn2.jpg',9,1,7);
INSERT INTO cspics_list VALUES(NULL,'csZn3.jpg',10,1,8);
INSERT INTO cspics_list VALUES(NULL,'csZn4.jpg',11,0,8);

#购物车
CREATE TABLE car_list(
	gid INT PRIMARY KEY AUTO_INCREMENT,
	gpic VARCHAR(256),
	gname VARCHAR(256),
	gprice DECIMAL(10,2),
	gtype VARCHAR(256),
	gcount INT,
	uid INT,
	dpid INT,
	gchecked BOOL
);



