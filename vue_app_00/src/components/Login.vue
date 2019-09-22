<template>
  <div id="login">
    <div class="header">
      <img src="../../public/images/boebg.png" alt="">
    </div>
    <div class="content" :class="centent_dp">
      <div class="cBody">
        <div class="bodyTop" :class="bodyTop_dp">
          <div class="left" @click="dxFun" :class="leftFont">验证码登录</div>
          <span class="fgx"></span>
          <div class="right" @click="zhFun" :class="rightFont">账号登陆</div>
          <div class="hk" :class="hkyd">
            <span></span>
          </div>
        </div>
        <div class="bodyBottom">
          <div>
            <div class="uphone" :class="uphone_dp">
              <div class="tb">
                <img src="../../public/images/zhtb.png" alt="">
              </div>
              <mt-field placeholder="请输入手机号" :attr="{maxlength:11}" v-model="uphoneVal"></mt-field>
            </div>
            <div class="txcode" :class="dxcode_dp">
              <div class="tb">
                <img src="../../public/images/yzmtb.png" alt="">
              </div>
              <mt-field placeholder="请输入验证码" :attr="{maxlength:6}" v-model="codeVal"></mt-field>
              <span class="yzmBtn" :class="yzmBtn_dp" @click="hqyzmFun">获取验证码</span>
              <span class="timer" :class="timer_dp">{{time}}s</span>
            </div>
            <div class="upwd1" :class="upwd1_dp">
              <div class="tb">
                <img src="../../public/images/mmtb.png" alt="">
              </div>
              <mt-field :type="typeStr" placeholder="请输入登录密码" :attr="{maxlength:16}" v-model="upwd1Val"></mt-field>
              <div class="yanjing">
                <img src="../../public/images/by.png" :class="by_dp" @click="zyFun" alt="">
                <img src="../../public/images/zy.png" :class="zy_dp" @click="byFun" alt="">
              </div>
            </div>
            <div class="upwd2" :class="upwd2_dp">
              <div class="tb">
                <img src="../../public/images/mmtb.png" alt="">
              </div>
              <mt-field :type="typeStr" placeholder="请输入8-16位字母+数字组合" :attr="{maxlength:16}" v-model="upwd2Val"></mt-field>
              <div class="yanjing">
                <img src="../../public/images/by.png" :class="by_dp" @click="zyFun" alt="">
                <img src="../../public/images/zy.png" :class="zy_dp" @click="byFun" alt="">
              </div>
            </div>
            <div class="upwd3" :class="upwd3_dp">
              <div class="tb">
                <img src="../../public/images/mmtb.png" alt="">
              </div>
              <mt-field :type="typeStr" placeholder="确认密码" :attr="{maxlength:16}" v-model="upwd3Val"></mt-field>
              <div class="yanjing">
                <img src="../../public/images/by.png" :class="by_dp" @click="zyFun" alt="">
                <img src="../../public/images/zy.png" :class="zy_dp" @click="byFun" alt="">
              </div>
            </div>
          </div>
          <div class="xzzc" :class="xzzc_dp">
            <span @click="xzzcFun">现在注册</span>
            <span class="wjmm" :class="wjmm_dp">忘记密码？</span>
          </div>
          <mt-button class="dlBtn" :class="dlBtn_dp" @click="login">登录</mt-button>
          <div class="tjm" :class="tjm_dp" @click="tjmFun">
            <div>我有推荐码</div>
            <div class="tjtb"> 
              <img :class="tjtb1_dp" src="../../public/images/tjjt01.png" alt="">
              <img :class="tjtb2_dp" src="../../public/images/tjjt02.png" alt="">
            </div>
          </div>
          <div class="tjmSr" :class="tjmSr_dp">
            <div class="tjr">
              <img src="../../public/images/tjr.png" alt="">
            </div>
            <div class="srk">
              <input type="text" placeholder="推荐码（选填）" maxlength="4">
            </div>
          </div>
          <mt-button class="zcBtn" :disabled="zcBtn_qx" :class="zcBtn_dp" @click="reg">注册</mt-button>
          <div class="yszc" :class="yszc_dp">
            <div @click="yszcFun">
              <i class="xz weui-icon-success" :class="xz_dp"></i>
              <i class="wxz weui-icon-circle" :class="wxz_dp"></i>
              <span>同意</span>
            </div>
            <span>
              <a href="javascript:;">《BOE商城用户协议》</a>
              <a href="javascript:;">《BOE商城隐私政</a>
              <a href="javascript:;">策》《BOE商城退换货或退款规则》</a>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="bigBg" :class="bigBg_dp">
      <div class="window">
        <div> 
          <div class="agreement">
            <div class="title">欢迎您的注册！</div>
            <div class="xyContent">
              在您正式注册并开始使用“【BOE商城】”App、相关程序及网站前，您需要与我们以在线形式签署以下两份重要协议：
              <span class="line">
                <a href="javacript:;">《BOE商城用户协议》</a>
                <span>及</span>
                <a href="javascript:;">《BOE商城隐私政策》</a>
                <span class="bold">。请完整、仔细阅读本协议下的条款和条件，特别是其中约定了责任限免的条款、文字加粗内容及争议解决条款，该等内容将会对您产生实质性的影响。
                </span>
              </span>  
              我们向您提供的服务还需要您遵守其他条款及服务准则（包括但不限于
              <a href="javascript:;">
                《BOE商城退换货或退款规则》
              </a>
              等，简称“服务规则”），您应同时阅读了解并予以一并接受。
            </div>
          </div>
          <div class="agreeButton">
            <div class="btyBtn" @click="btyFun">不同意</div>
            <div class="tyBtn" @click="tyFun">同意</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      uphone_dp:"xs",
      dxcode_dp:"xs",
      upwd1_dp:"yc",
      upwd2_dp:"yc",
      upwd3_dp:"yc",
      by_dp:"xs",
      zy_dp:"yc",
      bodyTop_dp:"xs_h",
      xzzc_dp:"xs",
      dlBtn_dp:"xs",
      tjtb1_dp:"xs",
      tjtb2_dp:"yc",
      zcBtn_dp:'yc',
      zcBtn_qx:true,
      xz_dp:"xs_in",
      wxz_dp:"yc",
      tjmSr_dp:"yc",
      tjm_dp:"yc",
      yszc_dp:"yc",
      wjmm_dp:"yc",
      hkyd:"hkzy",
      rightFont:"mrzt",
      leftFont:"active",
      typeStr:"password",
      yzmBtn_dp:"xs",
      timer_dp:"yc",
      t:"",
      time:120,
      dxCode:"",
      uphoneVal:"",
      codeVal:"",
      upwd1Val:"",
      upwd2Val:"",
      upwd3Val:"",
      loginState:1,
      regState:1,
      centent_dp:"",
      i:0,
      o:0,
      n:0,
      bigBg_dp:"yc",
    }
  },
  methods: {
    btyFun(){
      this.bigBg_dp="yc";
      this.bodyTop_dp="xs_h";
      this.dxcode_dp="xs";
      this.upwd2_dp="yc";
      this.upwd3_dp="yc";
      this.xzzc_dp="xs";
      this.dlBtn_dp="xs";
      this.tjm_dp="yc";
      this.zcBtn_dp="yc";
      this.yszc_dp="yc";
      this.regState=1;
      if(this.loginState==1){
        this.upwd1_dp="yc";
      }else{
        this.upwd1_dp="xs";
        this.dxcode_dp="yc";
      }
    },
    tyFun(){
      this.bigBg_dp="yc";
    },
    yszcFun(){
      if(this.n==0){
        this.xz_dp="yc";
        this.wxz_dp="xs_in";
        this.n=1;
      }else{
        this.xz_dp="xs_in";
        this.wxz_dp="yc";
        this.n=0;
      }
    },
    //用户注册
    reg(){
      var upwd_reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
      if(this.codeVal!==this.dxCode && this.regState==2){
        this.$toast({message:"验证码错误或已过期",position:"top"});
      }else if(upwd_reg.test(this.upwd2Val)===false){
        this.$toast({message:"请输入8-16位字母+字母组合",position:"top"});
      }else if(this.upwd3Val!==this.upwd2Val){
        this.$toast({message:"两次密码不一致",position:"top"});
      }else if(this.n==1){
        this.$toast({message:"请先阅读并同意用户注册协议",position:"top"});
      }else{
        var obj={uphone:this.uphoneVal,upwd:this.upwd3Val};
        var url="reg";
        this.axios.post(url,this.qs.stringify(obj)).then(res=>{
          if(res.data.code==1){
            this.$toast({message:"注册成功",position:"top"});
            this.bodyTop_dp="xs_h";
            this.upwd1_dp="yc";
            this.upwd2_dp="yc";
            this.upwd3_dp="yc";
            this.xzzc_dp="xs";
            this.dlBtn_dp="xs";
            this.tjm_dp="yc";
            this.zcBtn_dp="yc";
            this.yszc_dp="yc";
            this.regState=1;
            this.loginState=1;
            this.uphoneVal="";
            this.codeVal="";
            this.upwd1Val="";
            this.upwd2Val="";
            this.upwd3Val="";
            this.timer_dp="yc";
            this.yzmBtn_dp="xs";
          }
        })
      }
    },
    tjmFun(){
      if(this.i==0){
        this.tjtb1_dp="yc";
        this.tjtb2_dp="xs";
        this.tjmSr_dp="xs";
        this.i++;
      }else{
        this.tjtb1_dp="xs";
        this.tjtb2_dp="yc";
        this.tjmSr_dp="yc";
        this.i=0;
      }
    },
    xzzcFun(){
      this.bodyTop_dp="yc_h";
      this.upwd1_dp="yc";
      this.upwd2_dp="xs";
      this.upwd3_dp="xs";
      this.xzzc_dp="yc";
      this.dlBtn_dp="yc";
      this.tjm_dp="xs";
      this.zcBtn_dp="xs";
      this.yszc_dp="xs";
      this.regState=2;
      this.bigBg_dp="xs";
    },
    //用户登录
    login(){
      //短信验证码登录
      var uphone_reg=/^1[3456789]\d{9}$/;
      var url="login";
      var obj={uphone:this.uphoneVal};
      if(uphone_reg.test(this.uphoneVal)===false){
        this.$toast({message:"请输入正确的手机号",position:"top"});
        return;
      }else if(this.codeVal=="" && this.loginState==1){
        this.$toast({message:"无效的请求参数",position:"top"});
      }else if(this.codeVal==this.dxCode && this.loginState==1){
        this.axios.get(url,{params:obj}).then(res=>{
          if(res.data.code==1){
            sessionStorage.setItem("uid",res.data.data[0].uid);
            this.$router.push('/Home');
          } 
        })  
      }else if(this.codeVal!==this.dxCode && this.loginState==1){
        this.$toast({message:"验证码错误或已过期",position:"top"});
      }else if(this.upwd1Val=="" && this.loginState==2){
        this.axios.get('uphone',{params:obj}).then(res=>{
          if(res.data.code==1){
            this.$toast({message:"请输入正确的密码",position:"top"});
          }else{
            this.$toast({message:"手机号尚未注册，请先注册",position:"top"});
          }
        })
      }else{//账号密码登录
        var obj={uphone:this.uphoneVal,upwd:this.upwd1Val};
        this.axios.get(url,{params:obj}).then(res=>{
          if(res.data.code==1){
            sessionStorage.setItem("uid",res.data.data[0].uid);
            this.$router.push('/Home');
          }else if(res.data.code==0){
            this.$toast({message:"请输入正确的密码",position:"top"});
          }else{
            this.$toast({message:"手机号尚未注册，请先注册",position:"top"});
          }
        })
      }  
    },
    //发送短信验证码
    sendCode(){
      this.yzmBtn_dp="yc";
      this.timer_dp="xs";
      this.time=120;
      //随机生成短信验证码
      for(var i=0,str="";i<6;i++){
        var number=Math.floor(Math.random()*10);
        str+=number;
      }
      this.dxCode=str;
      this.$toast({message:`请输入验证码：${this.dxCode}`,position:"top"});
      //验证码倒数计时
      if(this.t==""){
        this.t=setInterval(()=>{
          this.time=this.time-1;
          if(this.time==0){
            clearInterval(this.t);
            this.dxCode="";
            this.yzmBtn_dp="xs";
            this.timer_dp="yc";
          }
        },1000);
      }else{
        //重新获取验证码
        this.t=setInterval(()=>{
          this.time=this.time-1;
          if(this.time==0){
            clearInterval(this.t);
            this.yzmBtn_dp="xs";
            this.timer_dp="yc";
          }
        },1000);
      }
      //随机生成短信验证码
      for(var i=0,str="";i<6;i++){
        var number=Math.floor(Math.random()*10);
        str+=number;
      }
      this.dxCode=str;
      this.$toast({message:`请输入验证码：${this.dxCode}`,position:"top"}); 
    },
    //获取验证码
    hqyzmFun(){
      var uphone_reg=/^1[3456789]\d{9}$/;
      if(uphone_reg.test(this.uphoneVal)==false){
        this.$toast({message:"请输入正确的手机号",position:"top"});
        return;
      }else{
        var url="uphone";
        var obj={uphone:this.uphoneVal};
        this.axios.get(url,{params:obj}).then(res=>{
          if(res.data.code==1 && this.regState==1){
            this.sendCode();
          }else if(res.data.code==0 && this.regState==1){
            this.$toast({message:"账号不存在，请先注册",position:"top"});
          }else if(res.data.code==1 && this.regState==2){
            this.$toast({message:"该用户已注册，请直接登录",position:"top"});
          }else{
            this.sendCode();
          } 
        }) 
      }
    },
    zyFun(){
      this.zy_dp="xs";
      this.by_dp="yc";
      this.typeStr="text";
    },
    byFun(){
      this.zy_dp="yc";
      this.by_dp="xs";
      this.typeStr="password";
    },
    dxFun(){
      this.dxcode_dp="xs";
      this.upwd1_dp="yc";
      this.wjmm_dp="yc";
      this.hkyd="hkzy";
      this.leftFont="active";
      this.rightFont="mrzt";
      this.loginState=1;
    },  
    zhFun(){
      this.dxcode_dp="yc";
      this.upwd1_dp="xs";
      this.wjmm_dp="xs_in";
      this.hkyd="hkyy";
      this.leftFont="mrzt";
      this.rightFont="active";
      this.loginState=2;
    }
  },
  created() {
    
  },
  watch: {
    uphoneVal(){
      this.o++
    },
    codeVal(){
      this.o++;
    },
    upwd2Val(){
      this.o++;
    },
    upwd3Val(){
      this.o++;
    },
    o(){
      if(this.uphoneVal!=="" && this.codeVal!=="" && this.upwd2Val!=="" && this.upwd3Val!==""){
        this.zcBtn_qx=false;
      }else{
        this.zcBtn_qx=true;
      }
    }
  },
}
</script>
<style>
  *{box-sizing: border-box;}
  .mint-toast{
    width: 200px !important;
    height: 33.97px !important;
    line-height: 1 !important;
    border-radius: 0.2rem !important;
    z-index: 1500 !important;
  }
 
  #login{
    width: 100%;
    height: 667px;
    background: #fff;
  }
  #login .bigBg{
    position: fixed;
    z-index: 1000;
    top: 0;
    right: 0;
    left: 0;
    bottom: 0;
    background: rgba(0, 0, 0, .6);
  }
  #login .window{
    width: 280px;
    height: 403px;
    background: #fff;
    display: block;
    border-radius: 0.08rem;
    position: absolute;
    text-align: center;
    top:0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
    overflow: hidden;
  }
  #login  .agreement{
    width: 100%;
    height: 325px;
    margin: 23px 0 5px;
  }
  #login .title{
    width: 100%;
    height: 27px;
    color: #333;
    font-size: 17px;
    font-weight: bold;
    text-align: center;
  }
  #login .xyContent{
    width: 242px;
    height: 308px;
    margin: 7.5px 19px;
    font-size:14px;
    text-align: justify;
  }
  #login .line{
    text-decoration: underline;
  }
  #login .xyContent a{
    color: #4099E3;
    text-decoration: underline;
  }
  #login .bold{
    color:#000;
  }
  #login .agreeButton{
    width: 100%;
    height: 49.98px;
    display: flex;
  }
  #login .btyBtn,#login .tyBtn{
    width: 50%;
    height: 49.98px;
    color: #151515;
    text-align: center;
    line-height: 49.99px;
    font-size: 16px;  
  }
  #login .tyBtn{
    color:#ED6054;
  }
  #login input{
    font-size:15px;
  }
  #login .xs_h{
    height: 30px !important;
  }
  #login .yc_h{
    height: 0 !important; 
    overflow: hidden;
  }
  #login .xs_in{
    display: inline-block !important;
  }
  #login .xs{
    display: block !important;
  }
  #login .yc{
    display: none !important;
  }
  #login .header{
    width: 100%;
    height: 176.5px;
  }
  #login .header>img{
    width: 100%;
  }
  #login .content{
    width: 100%;
    height: auto;
    margin-top:37.5px; 
  }
  #login .cBody{
    width: 287.03px;
    height: 100%;
    margin:0 auto;
  }
  #login .bodyTop{
    width: 100%;
    height: 30px;
    display: flex;
    position: relative;
    overflow: hidden;
  }
  #login .left,#login .right{
    width: 100%;
    height: 100%;
    flex: 1;
    font-size: 16px;
    text-align: center;
    line-height: 1.5;
  }
  #login .fgx{
    width: 1px;
    height: 8px;
    background: #D9D9D9;
    position: absolute;
    top: 7px;
    left: 50%;
  }
  #login .active{
    color: #000 !important;
  }
  #login .mrzt{
    color:#666 !important;
  }
  #login .hk{
    height: 4px;
    text-align: center;
    position: absolute;
    bottom: 0;
    background-color: transparent; 
  }
  #login .hkzy{
    left:0% !important;
    right: 50% !important;
    transition:right 0.3s cubic-bezier(0.35,0,0.25,1) 0.09s,left 0.3s cubic-bezier(0.35,0,0.25,1); 
  }
  #login .hkyy{
    left:50% !important;
    right:0% !important;
    transition: right 0.3s cubic-bezier(0.35,0,0.25,1),left 0.3s cubic-bezier(0.35,0,0.25,1) 0.09s;
  }

  #login .hk>span{
    width: 16px;
    height: 100%;
    margin: auto;
    background: #000;
    display: block;
    transition: right 0.3s cubic-bezier(0.35,0,0.25,1);
    text-align: center;
  }
  #login .bodyBottom{
    width: 100%;
    height: auto;
    margin-top: 25px;
  }
  #login .uphone, #login .txcode, #login .upwd1,#login .upwd2,#login .upwd3{
    width: 100%;
    height: 40px;
    padding: 5px 7.5px;
    position: relative;
    border-bottom:1px solid #eee;
  }
  #login .xzzc{
    width: 100%;
    height: 19px;
    margin-top: 15.5px;
  }
  #login .xzzc>span{
    font-size: 12px;
    color: #333;
    text-align: left;
    float: left;
    line-height: 19px;
  }
  #login .dlBtn{
    width: 100%;
    height: 35px;
    background: #232323;
    color:#fff;
    font-size:15px;
    margin: 44px 0 19px;
    border-radius: 0.133333rem;
    border:0.013333rem solid rgba(0, 0, 0, 0.2);
  }
  #login .tb{
    width: 19.98px;
    height: 15px;
    float: left;
    margin-top: 2px;
  }
  #login .tb>img{
    width: 15px;
    height: 15px;
  }
  #login .mint-cell{
    width: 240px;
    height: 21.59px;
    min-height: 30px !important;
    bottom: 1px;
  }
  #login .mint-cell-wrapper{
    padding: 0 !important;
  }
  #login .yzmBtn,#login .timer{
    color: #000000;
    font-size: 15px;
    background: #fff;
    position: absolute;
    height: 30px;
    z-index: 1;
    right: 10px;
    bottom: 5px;
    line-height: 30px;
  }
  #login .yanjing{
    width: 21.48px;
    height: 20.5px;
    background: #fff;
    position: absolute;
    top: 11px;
    right: 15px;
    z-index: 1;
  }
  #login .yanjing>img{
    width: 17px;
    height: 11px;
    margin-top: 5px;
  }
  #login .wjmm{
    float: right!important;
    line-height: 19px;
  }
  #login .tjm{
    width: 287.03px;
    height: 35px;
    margin-top:10px;
    padding: 0 7px;
  }
  #login .tjm>div{
    width: 90px;
    height: 35px;
    line-height: 35px;
    font-size:15px;
    color:#000;
    float: left;
  }
  #login .tjtb{
    width: 182.03px !important;
    height: 7px !important;
    float: left;
    margin-top: 14px;
  }
  #login .zcBtn{
    width: 100%;
    height: 35px;
    background: #232323;
    color: #fff;
    font-size:15px;
    margin: 44px 0 19px;
  }
  #login .yszc{
    width: 100%;
    height: 40.27px;
  }
  #login .yszc>div{
    width: 50.38px;
    height: 19px;
    float: left;
  } 
  #login .yszc>div>span{
    color:#999999;
    font-size: 12px;
    vertical-align:top;
  }
  #login .xz{
    color:#000;
    margin: 0 2.4px 10px;
  }
   #login .wxz{
    margin: 0 2.4px 10px;
  }
  #login .yszc>span>a{
    color:#333;
    font-size:12px;
    float: left !important;
  }
  #login .tjmSr{
    width: 100%;
    height: 40px;
    padding: 5px 7.5px;
    border-bottom: 1px solid #eee;
  }
  #login .tjr{
    width: 21.48px;
    height: 30px;
    line-height: 30px;
    float: left;
  }
  #login .tjr>img{
    width: 17px;
    height: 16px;
    display: block;
    margin-top: 4px;
  }
  #login .srk{
    display: inline-block;
  }
  #login .srk>input{
    outline: none;
    border: none;
  }
</style>