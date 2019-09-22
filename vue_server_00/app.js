const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session");
//post请求插件
const bodyParser=require("body-parser");

var pool = mysql.createPool({
   host:"127.0.0.1",  //数据库地址
   user:"root",       //数据库用户名
   password:"",       //数据库密码
   port:3306,         //数据库端口
   database:"boeMall",     //数据库名称
   connectionLimit:15 //连接数量
});

var server = express();
//3:配置跨域模块 50
server.use(cors({
//   //允许跨域访问程序地址列表
   origin:["http://127.0.0.1:8080",
   "http://localhost:8080"],
   credentials:true //请求验证
}))
//4:配置session模块
server.use(session({
 secret:"128位字符串",  //安全字符串
 resave:true,          //请求时更新数据
 saveUninitialized:true//保存初始数据
}));
//4.1:配置项目静态目录
server.use(express.static("public"));
//post请求需要
server.use(bodyParser.urlencoded({
	extended:false
}));


//http://127.0.0.1:3000/01.jpg
//5:启动监听3000
server.listen(3000);

//商品列表加载
server.get("/products",(req,res)=>{
  var output={hp:[],zn:[]}
	function getHp(){
		return new Promise(
			function (resolve,reject){
				var sql1="SELECT pid,ppic FROM product_list WHERE fpid=1";
				pool.query(sql1,[],(err,result)=>{
					if(err)throw err;
					output.hp=result;
					resolve();
				})
			}
		)
	}
	function getZn(){
		return new Promise(
			function (resolve,reject){
				var sql2="SELECT pid,ppic FROM product_list WHERE fpid=2";
				pool.query(sql2,[],(err,result)=>{
					if(err)throw err;
					output.zn=result;
					resolve();
				})
			}
		)
	}
	(async function(){
		await Promise.all([getHp(),getZn()]);
		res.send(output);
 })()   
})

//门店列表
server.get("/store",(req,res)=>{
	var sql="SELECT sid,sname,spic,saddress,scity FROM stores_list";
	pool.query(sql,[],(err,result)=>{
		if(err)throw err;
		res.send(result);
	})
})

//搜索帐户是否存在
server.get("/uphone",(req,res)=>{
	var uphone=req.query.uphone;
	var sql="SELECT uid FROM user_list WHERE uphone=?";
	pool.query(sql,[uphone],(err,result)=>{
		if(err)throw err;
		if(result.length>0){
			res.send({code:1,msg:"success"});
		}else{
			res.send({code:0,msg:"error"});
		}
	})
})

//用户登录
server.get("/login",(req,res)=>{
	var uphone=req.query.uphone;
	var upwd=req.query.upwd;
	if(upwd==undefined){//短信验证码登录
		var sql1="SELECT uid FROM user_list WHERE uphone=?";
		pool.query(sql1,[uphone],(err,result)=>{
			if(err)throw err;
			if(result.length>0){
				req.session.uid=result[0].uid;
				res.send({code:1,msg:"login success",data:result});	
			}
		})
	}else{//账号密码登录
		var sql2="SELECT uid,uphone,upwd FROM user_list WHERE uphone=? AND upwd=?";
		pool.query(sql2,[uphone,upwd],(err,result)=>{
			if(err)throw err;
			if(result.length>0){
				req.session.uid=result[0].uid;
				res.send({code:1,msg:"login success",data:result});
			}else{
				var sql3="SELECT uphone FROM user_list WHERE uphone=?";
				pool.query(sql3,[uphone],(err,result)=>{
					if(err)throw err;
					if(result.length>0){
						res.send({code:0,msg:"upwd error"});
					}else{
						res.send({code:-1,msg:"uphone error"})
					}
				})		
			}
		})
	}	
})

//用户注册
server.post("/reg",(req,res)=>{
	var obj=req.body;
	var sql="INSERT INTO user_list SET ?";
	pool.query(sql,[obj],(err,result)=>{
		if(err)throw err;
		if(result.affectedRows>0){
			res.send({code:1,msg:"reg success"});
		}
	})
})
//门店详情加载
server.get("/storeDetails",(req,res)=>{
	var sid=req.query.sid;
	var sql="SELECT sname,saddress,stime1,stime2,bspic,sspic1,sspic2,sspic3,sspic4,sspic5 FROM stores_list WHERE sid=?";
	pool.query(sql,[sid],(err,result)=>{
		if(err)throw err;
		res.send(result);
	})
})

//商品详情加载
server.get("/productDetail",(req,res)=>{
	var pid=req.query.pid;
	output={
		proText1:[],
		bannerImg1:[],
		detailImg1:[],
		csImages1:[],
		proText2:[],
		bannerImg2:[],
		detailImg2:[],
		csImages2:[]
	}
	function getText1(){
		return new Promise(
			function(resolve,reject){
				var sql="SELECT dpid,dname,dftype,dtype,dprice,dcount,mrState FROM product_detail WHERE pid=? AND mrState=1";
				pool.query(sql,[pid],(err,result)=>{
					if(err)throw err;
					output.proText1=result;
					resolve();
				})
			}	
		)
	}
	function getbImg1(){
		return new Promise(
			function(resolve,reject){
				var sql="SELECT lbtpic FROM lbtpics_list WHERE pid=? AND mrState=1";
				pool.query(sql,[pid],(err,result)=>{
					if(err)throw err;
					output.bannerImg1=result;
					resolve();
				})
			}
		)
	}
	function getdImg1(){
		return new Promise(
			function(resolve,reject){
				var sql="SELECT xqpic FROM xqpics_list WHERE pid=? AND mrState=1";
				pool.query(sql,[pid],(err,result)=>{
					if(err)throw err;
					output.detailImg1=result;
					resolve();
				})
			}
		)
	}
	function getcImg1(){
		return new Promise(
			function (resolve,reject){
				var sql="SELECT cspic FROM cspics_list WHERE pid=? AND mrState=1";
				pool.query(sql,[pid],(err,result)=>{
					if(err)throw err;
					output.csImages1=result;
					resolve();
				})
			}
		)
	}
	function getText2(){
		return new Promise(
			function(resolve,reject){
				var sql="SELECT dpid,dname,dftype,dtype,dprice,dcount,mrState FROM product_detail WHERE pid=? AND mrState=0";
				pool.query(sql,[pid],(err,result)=>{
					if(err)throw err;
					output.proText2=result;
					resolve();
				})
			}	
		)
	}
	function getbImg2(){
		return new Promise(
			function(resolve,reject){
				var sql="SELECT lbtpic FROM lbtpics_list WHERE pid=? AND mrState=0";
				pool.query(sql,[pid],(err,result)=>{
					if(err)throw err;
					output.bannerImg2=result;
					resolve();
				})
			}
		)
	}
	function getdImg2(){
		return new Promise(
			function(resolve,reject){
				var sql="SELECT xqpic FROM xqpics_list WHERE pid=? AND mrState=0";
				pool.query(sql,[pid],(err,result)=>{
					if(err)throw err;
					output.detailImg2=result;
					resolve();
				})
			}
		)
	}
	function getcImg2(){
		return new Promise(
			function (resolve,reject){
				var sql="SELECT cspic FROM cspics_list WHERE pid=? AND mrState=0";
				pool.query(sql,[pid],(err,result)=>{
					if(err)throw err;
					output.csImages2=result;
					resolve();
				})
			}
		)
	}
	(async function(){
		await Promise.all([getText1(),getbImg1(),getdImg1(), getcImg1(),getText2(),getbImg2(),getdImg2(), getcImg2()]);
		res.send(output);
 })();
})

//个人中心加载
server.get("/mine",(req,res)=>{
	var uid=req.query.uid;
	var sql="SELECT uphone,userphoto,nickname FROM user_list WHERE uid=?";
	pool.query(sql,[uid],(err,result)=>{
		if(err)throw err;
		res.send(result);
	});
})

//添加购物车
server.post("/addCar",(req,res)=>{
	var obj=req.body;
	var sql="INSERT INTO car_list SET ?";
	pool.query(sql,[obj],(err,result)=>{
		if(err)throw err;
		if(result.affectedRows>0){
			res.send({code:1,msg:"addCar success"});
		}		
	})	
})

//购物车查询
server.get("/car",(req,res)=>{
	var uid=req.query.uid;
	var output={
		carText:{},
		carCount:{}
	}
	function getText(){
		return new Promise(
			function (resolve,reject){
				var sql="SELECT gid,gpic,gname,gprice,gtype,dpid,gchecked FROM car_list WHERE uid=? GROUP BY dpid ORDER BY gid desc";
				pool.query(sql,[uid],(err,result)=>{
					if(err)throw err;
					if(result.length>0){
						output.carText=result;
						resolve();
					}else{
						res.send({code:0,msg:"error"});
					}
				})
			}	
		)
	}
	function getCount(){
		return new Promise(
			function (resolve,reject){
				var sql="SELECT SUM(gcount) AS gcount FROM car_list WHERE uid=? GROUP BY dpid ORDER BY gid desc";
				pool.query(sql,[uid],(err,result)=>{
					if(err)throw err;
					output.carCount=result;
					resolve();
				})
			}
		)
	}
	(async function(){
		await Promise.all([getText(),getCount()]);
		res.send(output);
 })();
})

//获取购物车商品总数量
server.get("/gcount",(req,res)=>{
	var uid=req.query.uid;
	var sql="SELECT SUM(gcount) AS gcount FROM car_list WHERE uid=?";
	pool.query(sql,[uid],(err,result)=>{
		if(err)throw err;
		if(result.length>0){
			res.send({code:1,msg:"success",data:result});
		}else{
			res.send({code:0,msg:"error"});
		}
	})
})

//购物车修改
server.put("/updateCar",(req,res)=>{
	var uid=req.body.uid;
	var gid=req.body.gid;
	var gcount=req.body.gcount;
	var sql="UPDATE car_list SET gcount=? WHERE uid=? AND gid=?";
	pool.query(sql,[gcount,uid,gid],(err,result)=>{
		if(err)throw err;
		if(result.affectedRows>0){
			res.send({code:1,msg:"updateCar success"});
		}else{
			res.send({code:0,msg:"updateCar error"});
		}
	})
})

//修改购物车单选选中状态
server.put("/select",(req,res)=>{
	var uid=req.body.uid;
	var gid=req.body.gid;
	var gchecked=req.body.gchecked;
	var sql="UPDATE car_list SET gchecked=? WHERE uid=? AND gid=?";
	pool.query(sql,[gchecked,uid,gid],(err,result)=>{
		if(err)throw err;
		if(result.affectedRows>0){
			res.send({code:1,msg:"selected success"});
		}else{
			res.send({code:0,msg:"selected error"});
		}
	});
})

//获取购物车选中选项数据
server.get("/selData",(req,res)=>{
	var uid=req.query.uid;
	var sql="SELECT gprice,gcount FROM car_list WHERE uid=? AND gchecked=1";
	pool.query(sql,[uid],(err,result)=>{
		if(err)throw err;
		if(result.length>0){
			res.send({code:1,msg:"selData success",data:result});
		}else{
			res.send({code:0,msg:"selData error"})
		}
	});
})

//修改购物车全选选中状态
server.put("/allSelect",(req,res)=>{
	var uid=req.body.uid;
	var gchecked=req.body.gchecked;
	var sql="UPDATE car_list SET gchecked=? WHERE uid=?";
	pool.query(sql,[gchecked,uid],(err,result)=>{
		if(err)throw err;
		if(result.affectedRows>0){
			res.send({code:1,msg:"allSelect success"});
		}else{
			res.send({code:0,msg:"allSelect error"});
		}
	})
})

//删除购物车
server.delete("/delCar",(req,res)=>{
	var uid=req.query.uid;
	var sql="DELETE FROM car_list WHERE gchecked=1 AND uid=?";
	pool.query(sql,[uid],(err,result)=>{
		if(err)throw err;
		if(result.affectedRows>0){
			res.send({code:1,msg:"delCar success"});
		}else{
			res.send({code:0,msg:"delCar error"});
		}
	})
})