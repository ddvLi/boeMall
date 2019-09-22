<template>
  <div id="mine">
    <div class="myheader">
      <div class="myheaderL">
        <i class="iconfont icon-Groupx16"></i>
      </div>
      <div class="myheaderM">
        <P class="my">我的</P>
        <div class="userImg">
          <img class="user" :src="'http://127.0.0.1:3000/'+userImg" alt="">
        </div>
        <p>{{userText}}</p> 
      </div>
      <div class="myheaderR">
        <i class="iconfont icon-news"></i>
      </div>
    </div>
    <div class="mymid">
      <div class="midT">
        <p class="myOrder">我的订单</p>
        <span class="allOrder">查看全部订单 ></span>
      </div>
      <div class="midC">
        <div>
          <i class="iconfont icon-daifukuan tb"></i>
          <p class="wz">待付款</p>
        </div>
        <div>
          <i class="iconfont icon-daifahuo tb"></i>
          <p class="wz">待发货</p>
        </div>
        <div>
          <i class="iconfont icon-daishouhuo tb"></i>
          <p class="wz">待收获</p>
        </div>
        <div>
          <i class="iconfont icon-daipingjia tb"></i>
          <p class="wz">待评价</p>
        </div>
        <div>
          <i class="iconfont icon-tuikuan tb"></i>
          <p class="wz">退款/售后</p>
        </div>
      </div>
    </div>
    <div class="mybottom">
      <div class="bottomItem">
        <p class="bottomTxt">优惠卷</p>
        <img class="jt" src="../../public/images/jt.png">
      </div>
      <div class="bottomItem">
        <p class="bottomTxt">我的收藏</p>
        <img class="jt" src="../../public/images/jt.png">
      </div>
      <div class="bottomItem">
        <p class="bottomTxt">收货地址</p>
        <img class="jt" src="../../public/images/jt.png">
      </div>
      <div class="bottomItem">
        <p class="bottomTxt">客服中心</p>
        <img class="jt" src="../../public/images/jt.png">
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
      userText:"",
      uid:"",
      userImg:"",
      uphone:"",
      userphoto:"",
      nickname:""
    }
  },
  methods:{
    onload(){
      if(sessionStorage.getItem("uid")==null){ 
        this.userText="账号登陆";
        this.userImg="user.png";
      }else{
        this.uid=sessionStorage.getItem("uid");
        var url="mine";
        var obj={uid:this.uid};
        this.axios.get(url,{params:obj}).then(res=>{
          this.userphoto=res.data[0].userphoto;
          this.nickname=res.data[0].nickname;
          this.uphone=res.data[0].uphone;
          if(this.userphoto==null){
            this.userImg="user.png";
          }else{
            this.userImg=this.userphoto;
          }
          if(this.nickname==null){
            this.userText=this.uphone;
          }else{
            this.userText=this.nickname;
          }
        })  
      }
    }
  },
  created(){
    this.onload();
  }
}
</script>
<style scoped>
#mine .my{
  margin-top:10px !important;
  color:#333 !important;
}
#mine .myheader{
  width: 100%;
  height: 150px;
  background: #fff;
  display: flex;
  justify-content: space-between;
}
#mine .myheaderL,.myheaderR{
  width: 34px;
  height: 34px;
  margin: 15px;
  line-height: 24px;
}
#mine .myheaderL>i,.myheaderR>i{
  color:rgb(153,153, 153);
  font-size:25px;
}
#mine .myheaderM{
  height: 150px;
}
#mine .userImg{
  width: 79.48px;
  height: 79.48px;
  border-radius: 50%; 
  margin: 0 auto;
  display: block;
  overflow: hidden;
}
#mine .user{
  width: 100%;
}
#mine .myheaderM>p{
  height: 25px;
  font-size:16px;
  color:#999999;
  line-height: 1.6;
  margin: 0 auto;
  text-align: center;
}
#mine .mymid{
  width: 100%;
  height: 120px;
  background: #fff;
  margin: 10px 0;
}
#mine .midT{
  width: 345px;
  height: 48.98px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid #eeeeee;
}
#mine .myOrder{
  font-size: 14px;
  color: #333;
  line-height: 1.6;
}
#mine .allOrder{
  font-size: 12px;
  color:rgb(153,153, 153);
  line-height:1.6;
  font-family: -apple-system-font,Helvetica Neue,sans-serif;
}
#mine .midC{
  width: 100%;
  height: 70px;
  display: flex;
  justify-content: space-around;
  align-items: center;
  text-align: center;
  color:#000;
}
#mine .midC>div{
  height: 47px;
  position: relative;
  text-align: center;
  color:#000;
}
#mine .tb{
  width: 18px;
  height: 18px;
  font-size: 18px;
}
#mine .wz{
  height: 19px;
  font-size: 12px;
  display: block;
  margin-top: 5px;
}
#mine .mybottom{
  background: #fff;
}
#mine .bottomItem{
  width:345px;
  height: 49.98px;
  margin: 0 auto;
  font-size: 14px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid #eeeeee;
}
#mine .bottomTxt{
  font-size: 14px;
  color: #000;
  line-height: 1.6;
  text-align: center;
}
#mine .jt{
  width: 6px;
  height: 14.72px;
}
</style>