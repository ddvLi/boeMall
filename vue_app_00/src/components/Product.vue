<template>
  <div id="product">
    <div class="pdetails" :class="pdetails_dp">
      <mt-swipe :auto="5000" class="banner">
        <mt-swipe-item v-for="(item_bimg,index) of bImglist" :key="index">
          <img class="bImg" :src="'http://127.0.0.1:3000/'+item_bimg.lbtpic" alt="">
        </mt-swipe-item>
      </mt-swipe>
      <div class="car" :class="car_dp" @click="goCar">
        <i class="iconfont icon-gouwuche-x fontW"></i>
      </div>
      <span class="gwcNum" :class="gwcNum_dp">{{carNum}}</span>
      <div class="fh" :class="fh_dp" @click="goback">
        <img src="../../public/images/mdfh.png" alt="">
      </div>
      <div class="describe">
        <div class="title">{{dname}}&nbsp;{{dtype}}
        </div>
        <div class="price">￥{{dprice}}</div>
        <div class="gaps"></div>
        <div class="typeBtn" @click="selProduct">
          <i class="iconfont icon-youjiantou"></i>
          <span class="xzTitle">已选</span>
          <span class="xzContent">{{dtype}}&nbsp;&nbsp;{{countText}}件</span>
        </div>
        <div class="address">
          <i class="iconfont icon-youjiantou"></i>
          <span>送至</span>
          <div class="addresses">
            <div class="dzms">
              <span>北京市朝阳区</span>
              <span class="addressBtn">&nbsp;立即创建</span>
            </div>
            <span class="kc">{{kcText}}&nbsp;</span>
            <span class="myf">在线支付免运费</span>
          </div>
        </div>
        <div class="gaps"></div>
      </div>
      <div class="dTitle">商品详情</div>
      <div class="details" :class="details_dp">
        <div class="dImges">
          <p>
            <img class="dImg" v-for="(item_dimg,index) of dImglist" :key="index" :src="'http://127.0.0.1:3000/'+item_dimg.xqpic" alt="">
          </p>
        </div>
      </div>
      <div class="bottom-tips" :class="bottomTips_dp">所选地区暂时无货，非常抱歉</div>
      <div class="bottom">
        <div class="collection">
          <i class="iconfont icon-Groupx5 wsc" :class="wsc_dp"></i>
          <i class="iconfont icon-GroupCopyx ysc" :class="ysc_dp"></i>
          <span class="scText">收藏</span>
        </div>
        <button class="addCar" :disabled="addCar_qx" @click="addCar" :class="addCar_dp">加入购物车</button>
        <button class="buy" :disabled="buy_qx" :class="buy_dp">立即购买</button>
      </div>
    </div>
    <div class="csdetails" :class="csdetails_dp">
      <div class="csjianju"></div>
      <div class="param">
        <p>
          <img :src="'http://127.0.0.1:3000/'+csImg" alt="">
        </p>
      </div>
    </div>
    <div class="pjdetails" :class="pjdetails_dp">
      <div class="pjjianju"></div>
      <div>
        <div class="allp" :class="allp_dp" @click="allp">全部评价</div>
        <div class="haop" :class="haop_dp" @click="haop">好评</div>
        <div class="zhongp" :class="zhongp_dp" @click="zhongp">中评</div>
        <div class="chap" :class="chap_dp" @click="chap">差评</div>
      </div>
      <div class="pjms">
        <span class="pls">共 0 条评论</span>
        <span class="hpd">好评度 100%</span>
      </div>
    </div>
    <div class="top" :class="top_dp">
      <div class="kzmb">
        <div class="kzBtn">
          <div class="xqbtn" :class="xqbtn_dp" @click="xqfun">
            详情
            <span :class="xqhk_dp"></span>
          </div>
          <div class="csbtn" :class="csbtn_dp" @click="csfun">
            参数
            <span :class="cshk_dp"></span>
          </div>
          <div class="pjbtn" :class="pjbtn_dp" @click="pjfun">
            评价
            <span :class="pjhk_dp"></span>
          </div>
        </div>
      </div>
      <span class="gwcNum1" :class="gwcNum1_dp">{{carNum}}</span>
      <div class="shopping">
        <i class="iconfont icon-gouwuche-x" @click="goCar"></i>
      </div>
      <img class="fhjt" src="../../public/images/dtfh.png" alt="" @click="goback">
    </div>
    <div class="selBg" :class="selBg_dp"></div>
    <div class="selected" :class="selected_dp">
      <div class="selPro">
        <div class="selTop">
          <div class="imgBg">
            <img class="selpic" :src="'http://127.0.0.1:3000/'+selpic" alt="">
          </div>
          <div class="topRight">
            <div class="selClose">
              <i class="iconfont icon-guanbi" @click="closeSel"></i>
            </div>
            <div class="selPrice">￥{{selprice}}</div>
            <span>{{seldtype}}</span>
          </div>
        </div>
        <div class="selContents">
          <div class="xzTypes" :class="xzTypes_dp">
            <div class="typeTitle">{{dftype}}</div>
            <span class="typeColor" :class="seltype0_dp" @click="sel0fun">{{seltype0}}</span>
            <span class="typeColor" :class="seltype1_dp" @click="sel1fun">{{seltype1}}</span>
          </div>
          <div class="num">
            <span>数量</span>
            <div class="changNum">
              <i class="iconfont icon-Groupx12"  @click="sub"></i>
              <span class="numspan">{{count}}</span>
              <i class="iconfont icon-Groupx11" @click="add"></i>
            </div>
          </div>
        </div>
      </div>
      <div class="selqrBtn" @click="selqrFun">确 定</div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
      pid:"",
      bImglist:[],
      dname:"",
      dtype:"",
      dprice:"",
      count:1,
      dcount:"",
      dImglist:[],
      wsc_dp:"xs_in",
      ysc_dp:"yc",
      pdetails_dp:"xs",
      csdetails_dp:"yc",
      pjdetails_dp:"yc",
      bottomTips_dp:"",
      buy_qx:"",
      addCar_qx:"",
      addCar_dp:"",
      buy_dp:"",
      car_dp:"xs",
      fh_dp:"xs",
      xqbtn_dp:"active1",
      csbtn_dp:"",
      pjbtn_dp:"",
      xqhk_dp:"active2",
      cshk_dp:"",
      pjhk_dp:"",
      top_dp:"",
      n:1,
      csImg:"",
      allp_dp:"pjactive",
      haop_dp:"",
      zhongp_dp:"",
      chap_dp:"",
      details_dp:"xs",
      selBg_dp:"yc",
      selected_dp:"ycWy",
      selpic:"",
      selprice:"",
      seldtype:"",
      dftype:"",
      seltype0:"",
      seltype1:"",
      seltype0_dp:"typeActive xs",
      seltype1_dp:"xs",
      xzTypes_dp:"",
      data:{},
      kcText:"",
      mrState:1,
      xzState:"",
      xzPrice:"",
      xzPic:"",
      xzCount:"",
      xzDtype:"",
      countText:"1",
      dpid:"",
      zxDpid:"",
      carNum:"",
      gwcNum_dp:"yc",
      gwcNum1_dp:"yc"
    }
  },
  methods:{
    goCar(){
      if(sessionStorage.getItem("uid")==null){ 
        this.$router.push("/Login");
      }else{
        this.uid=sessionStorage.getItem("uid");
        this.$router.push({path:`/Car/${this.uid}`});
      }
    },
    selqrFun(){
      this.selBg_dp="yc";
      this.selected_dp="ycWy";
      if(this.data.proText2[0]==null){
        this.xzState=1;
        this.zxDpid=this.data.proText1.dpid;
        this.xzPic=this.data.bannerImg1[0].lbtpic;
      }else{
        this.xzState=this.mrState;
      }
      this.xzDtype=this.seldtype;
      this.xzCount=this.count;
      this.dtype=this.xzDtype;
      this.countText=this.xzCount;
      this.details_dp="xs";
      this.dprice=this.xzPrice;
      if(this.xzState==0){
        this.seltype1_dp="typeActive";
        this.seltype0_dp="";
        this.bImglist=this.data.bannerImg2;
        this.dImglist=this.data.detailImg2;
        this.csImg=this.data.csImages2[0].cspic;
        this.xzDpid=this.data.proText2[0].dpid;
        this.xzPic=this.data.bannerImg2[0].lbtpic;
      }else{
        this.xzState=1;
        this.seltype0_dp="typeActive";
        this.seltype1_dp="";
        this.bImglist=this.data.bannerImg1;
        this.dImglist=this.data.detailImg1;
        this.csImg=this.data.csImages1[0].cspic;
        this.xzDpid=this.data.proText1[0].dpid;
        this.xzPic=this.data.bannerImg1[0].lbtpic;
      }
    },
    sub(){
      if(this.count>1){
        this.count--      
      }else{
        this.$toast({message:"不能再少啦~",position:"top"})
      }   
    },
    add(){
      if(this.pid==1 && this.count<6 && this.dcount==1){
        this.count++;
      }else if(this.pid!==1 && this.count<3 && this.dcount==1){
        this.count++;
      }else if(this.dcount==1){
        this.$toast({message:"不能再加啦~",position:"top"});
      }else{
        this.count=1;
      }    
    },
    sel0fun(){
      if(this.data.proText2[0]==null){
        this.seltype0_dp="typeActive xs";
        this.seltype1_dp="yc";
      }else{
        this.seltype0_dp="typeActive xs";
        this.seltype1_dp="xs";
      }
      this.mrState=this.data.proText1[0].mrState;
      this.seldtype=this.data.proText1[0].dtype;
      this.selprice=this.data.proText1[0].dprice;
      this.selpic=this.data.bannerImg1[0].lbtpic;
    },
    sel1fun(){
      this.seltype0_dp="";
      this.seltype1_dp="typeActive xs";
      this.mrState=this.data.proText2[0].mrState;
      this.seldtype=this.data.proText2[0].dtype;
      this.selprice=this.data.proText2[0].dprice;
      this.selpic=this.data.bannerImg2[0].lbtpic;
    },
    closeSel(){
      this.selBg_dp="yc";
      this.selected_dp="ycWy";
      this.details_dp="xs";
      this.count=this.xzCount;
      if(this.xzState==1){
        this.seltype0_dp="typeActive xs";
        this.seltype1_dp="xs";
      }else{
        this.seltype1_dp="typeActive xs";
        this.seltype0_dp="xs";
      }
    },
    selProduct(){
      if(this.dcount==0){
        this.$toast({message:"商品库存不足",position:"bottom"});
      }
      this.details_dp="yc";
      this.selBg_dp="xs";
      this.selected_dp="xsWy";
      this.selpic=this.xzPic;
      this.selprice=this.xzPrice;
      if(this.xzDtype==null){
        this.dftype="";
        this.xzTypes_dp="yc";
      }else{
        this.dftype=this.xzDtype;
        this.xzTypes_dp="xs";
      }
      if(this.data.proText2[0]==null){
        this.seltype0=this.data.proText1[0].dtype;
        this.seltype1_dp="yc";
        this.seldtype=this.seltype0;
        this.zxDpid=this.data.proText1.dpid;
        this.xzPic=this.data.bannerImg1[0].lbtpic;
      }else{
        this.seltype0=this.data.proText1[0].dtype;
        this.seltype1=this.data.proText2[0].dtype;
      }
      if(this.xzState==1){
        this.seldtype=this.xzDtype;
        this.seltype0_dp="typeActive";
        this.zxDpid=this.data.proText1[0].dpid;
        this.xzPic=this.data.bannerImg1[0].lbtpic;
      }else{
        this.seldtype=this.xzDtype;
        this.seltype0_dp="";
        this.seltype1_dp="typeActive";
        this.zxDpid=this.data.proText2[0].dpid;
        this.xzPic=this.data.bannerImg2[0].lbtpic;
      }  
    },
    allp(){
      this.allp_dp="pjactive";
      this.haop_dp="";
      this.zhongp_dp="";
      this.chap_dp="";
    },
    haop(){
      this.allp_dp="";
      this.haop_dp="pjactive";
      this.zhongp_dp="";
      this.chap_dp="";
    },
    chap(){
      this.allp_dp="";
      this.haop_dp="";
      this.zhongp_dp="";
      this.chap_dp="pjactive";
    },
    zhongp(){
      this.allp_dp="";
      this.haop_dp="";
      this.zhongp_dp="pjactive";
      this.chap_dp="";
    },
    goback(){
      this.$router.go(-1);
    },
    handleScroll(){
      var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
      if(scrollTop>375 && this.n===1){
        this.top_dp="tmd1"
      }else if(scrollTop>300 && this.n===1){
        this.top_dp="tmd5" 
      }else if(scrollTop>200 && this.n===1){
        this.top_dp="tmd4"
      }else if(scrollTop>100 && this.n===1){
        this.top_dp="tmd3"
      }else if(scrollTop>0 && this.n===1){
        this.top_dp="tmd2"
      }else if(scrollTop==0 && this.n===1){
        this.top_dp="tmd0"
      }else{
        this.top_dp="tmd1"
      }
      if(scrollTop==0){
        this.car_dp="xs_in";
        this.fh_dp="xs_in";
      }else{
        this.car_dp="yc";
        this.fh_dp="yc";
      }
    },
    addCar(){
      if(sessionStorage.getItem("uid")==null){ 
        this.$router.push("/Login");
      }else{
        this.uid=sessionStorage.getItem("uid");
        var objCar={
          gpic:this.xzPic,
          gname:this.dname,
          gprice:this.xzPrice,
          gtype:this.xzDtype,
          gcount:this.xzCount,
          uid:this.uid,
          dpid:this.xzDpid,
          gchecked:0
        }
        var url="addCar";
        this.axios.post(url,this.qs.stringify(objCar)).then(res=>{
          console.log(res.data);
          if(res.data.code==1){
            this.$toast({message:"已加入购物车",position:"bottom"});
            this.getCount();
          }
        })
      }
    },
    getCount(){
      if(sessionStorage.getItem("uid")!==null){
        this.uid=sessionStorage.getItem("uid");
        var url="gcount";
        var obj={uid:this.uid};
        this.axios.get(url,{params:obj}).then(res=>{
          if(res.data.code==1){
            if(res.data.data[0].gcount>9){
              this.carNum="9+";
            }else{
              this.carNum=res.data.data[0].gcount;
            }
            if(this.carNum==0){
              this.gwcNum_dp="yc";
              this.gwcNum1_dp="yc";
            }else if(this.carNum==null){
              this.gwcNum_dp="yc";
              this.gwcNum1_dp="yc";
            }else{
              this.gwcNum_dp="xs_in";
              this.gwcNum1_dp="xs_in";
            }
          }else{
            this.gwcNum_dp="yc";
            this.gwcNum1_dp="yc";
          }  
        })
      }else{
        this.gwcNum_dp="yc";
        this.gwcNum1_dp="yc";
      }
    },
    xqfun(){
      this.xqbtn_dp="active1";
      this.xqhk_dp="active2";
      this.csbtn_dp="";
      this.cshk_dp="";
      this.pjbtn_dp="";
      this.pjhk_dp="";
      this.pdetails_dp="xs";
      this.csdetails_dp="yc";
      this.pjdetails_dp="yc";
      this.n=1;
      this.top_dp="tmd0";
      var pid=this.pid;
    },
    csfun(){
      this.xqbtn_dp="";
      this.xqhk_dp="";
      this.csbtn_dp="active1";
      this.cshk_dp="active2";
      this.pjbtn_dp="";
      this.pjhk_dp="";
      this.pdetails_dp="yc";
      this.csdetails_dp="xs";
      this.pjdetails_dp="yc";
      this.n=2;
      var pid=this.pid;
    },
    pjfun(){
      this.xqbtn_dp="";
      this.xqhk_dp="";
      this.csbtn_dp="";
      this.cshk_dp="";
      this.pjbtn_dp="active1";
      this.pjhk_dp="active2";
      this.pdetails_dp="yc";
      this.csdetails_dp="yc";
      this.pjdetails_dp="xs";
      this.n=3;
      var pid=this.pid;
    },
    onload(){
      this.pid=this.$route.params.pid;
      var obj={pid:this.pid}
      this.axios.get("productDetail",{params:obj}).then(res=>{
        this.data=res.data;
        this.getCount();
        this.bImglist=res.data.bannerImg1;
        this.dname=res.data.proText1[0].dname;
        this.dtype=res.data.proText1[0].dtype;
        this.dprice=res.data.proText1[0].dprice;
        this.csImg=res.data.csImages1[0].cspic;
        this.dcount=res.data.proText1[0].dcount;
        this.xzState=res.data.proText1[0].mrState;
        this.xzPrice=res.data.proText1[0].dprice;
        this.xzDtype=res.data.proText1[0].dtype;
        this.xzDpid=res.data.proText1[0].dpid;
        this.xzCount=1;
        this.xzPic=res.data.bannerImg1[0].lbtpic;
        this.dpid=res.data.proText1[0].dpid;
        if(this.dcount===1){
          this.kcText="有货",
          this.bottomTips_dp="ych";
          this.addCar_qx=false;
          this.buy_qx=false;
          this.addCar_dp="addCarB";
          this.buy_dp="buyB"
        }else{
          this.kcText="无货";
          this.bottomTips_dp="xsh";
          this.addCar_qx=true;
          this.buy_qx=true;
          this.addCar_dp="buttonJY";
          this.buy_dp="buttonJY";
        };
        this.dImglist= res.data.detailImg1;
      })
    },
    backTop(){
      const that = this
      var timer = setInterval(() => {
        var ispeed = Math.floor(-that.scrollTop / 5)
        document.documentElement.scrollTop = document.body.scrollTop = that.scrollTop + ispeed
        if (that.scrollTop === 0) {
          clearInterval(timer)
        }
      }, 16)
    },
    scrollToTop () {
      const that = this
      let scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
      that.scrollTop = scrollTop;
    }
  },
  created(){
    this.onload();
    this.backTop();
  },
  mounted(){
    window.addEventListener('scroll', this.handleScroll);
    window.addEventListener('scroll', this.scrollToTop);
  },
  destroyed(){
    window.removeEventListener('scroll', this.handleScroll);
  },
}
</script>
<style>
  #product .gwcNum1{
    width: auto;
    font-size: 8px;
    background: #ED6054;
    border:1px solid #ED6054;
    position: absolute;
    border-radius: 50%;
    color: #fff;
    text-align: center;
    line-height: 11px;
    top: 18px;
    right: 9px;
    z-index: 2000;
  }
  #product .gwcNum{
    width: auto;
    font-size: 8px;
    background: #ED6054;
    border:1px solid #ED6054;
    position: absolute;
    border-radius: 50%;
    color: #fff;
    text-align: center;
    line-height: 11px;
    top: 15px;
    right: 12px;
    z-index: 2000;
  }
  #product .xsWy{
    bottom: 0 !important;
  }
  #product .ycWy{
    bottom:-370px !important;
  }
  #product .numspan{
    color:#333;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 49.984px;
    height: 25px;
    margin: 0 4px;
    background: #F6F6F6;
    border-radius: 15px;
  }
  #product .changNum>i{
    width: 20px;
    height: 32px;
    color:#333;
    line-height: 32px;
    font-size: 20px;
  }
  #product .changNum{
    padding-right: 15px;
    display: flex;
    justify-content: flex-end;
    align-items: center;
  }
  #product .num{
    width: 100%;
    padding-top: 12px;
    font-size: 12px;
    color:#333;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  #product .typeActive{
    border: 1px solid #000 !important;
    background: #fff !important;
  }
  #product .typeColor{
    padding: 5px 10px;
    color: #333;
    font-size: 12px;
    text-align: center;
    border: 1px solid #F6F6F6;
    background: #F6F6F6;
    border-radius: 15px;
    margin-right: 12px;
    margin-top: 12px;
    display: inline-block;
  }
  #product .typeTitle{
    color:#333;
    font-size: 12px;
  }
  #product .xzTypes{
    width: 100%;
    padding: 12px 0 15px;
    border-bottom: 1px  solid #eee;
  }
  #product .selContents{
    width: 100%;
    padding: 0 18.5px;
  }
  #product .selPrice{
    width: 100%;
    height: 28px;
    color: #ED6054;
    font-size: 18px;
  }
  #product .selClose{
    width: 100%;
    height: 45px;
    display: flex;
    justify-content: flex-end;
    align-items: center;
  }
  #product .topRight{
    width: 195.016px;
    height: 103px;
    font-size: 14px;
    color :#999;
  }
  #product .imgBg{
    border:1px solid #ededed;
    box-shadow: 0px 2px 2px #ededed;
    background: #fff;
    overflow: hidden; 
    margin-top: -22.5px;
    margin-right: 16.5px; 
    border-radius: 6px;
  }
  #product .selpic,#product .imgBg{
    width: 125.5px;
    height: 125.5px;
  }
  #product .selTop{
    display: flex;
    justify-content: space-between;
    padding: 0 15.5px 20px 22.5px;
  }
  #product .selqrBtn{
    width: 100%;
    height: 40px;
    background: #ED6054;
    color: #fff;
    font-size: 16px;
    text-align: center; 
    line-height: 40px;
  }
  #product .selPro{
    width: 100%;
    height: auto;
    background: #fff;
    padding-bottom:50px !important;
  }
  #product .selected{
    width: 100%;
    height: auto;
    position: fixed;
    bottom: 0px;
    z-index: 1200;
    transition: all 0.3s ease-in-out;
  }
  #product .selBg{
    width: 100%;
    height: 667px;
    background:rgba(0,0,0,0.5);
    position: fixed;
    z-index: 1000;
    bottom:0;
  }
  #product .pjjianju{
    width: 100%;
    height: 60px;
  }
  #product .csjianju{
    width: 100%;
    height: 100px;
  }
  #product .pls{
    height: 50px;
    float: left !important;
    line-height: 50px;
  }
  #product .hpd{
    height: 50px;
    float: right !important;
    line-height: 50px;
  }
  #product .pjms{
    width: 100%;
    height: 50px !important;
    background: #fff;
    margin: 0 !important;
    padding: 0 20px;
    color: #333 !important;
    font-size: 14px !important;
    display: block !important;
  }
  #product .pjactive{
    color:#fff !important;
    background: #000 !important;
  }
  #product .allp{
    width: 80px;
    height: 25px;
    color:#333;
    background:#eee;
    text-align: center;
    margin: 0 5px 0 20px;
    line-height: 25px;
    border-radius: 15px;
  }
  #product .haop,#product .zhongp,#product .chap{
    width: 50px;
    height: 25px;
    color:#333;
    background:#eee;
    text-align: center;
    margin: 0 5px;
    line-height: 25px;
    border-radius: 15px;
  }
  #product .pjdetails>div{
    width: 100%;
    height: 60px;
    display: flex;
    justify-content: left;
    align-items: center;
    font-size:12px;
  }
  #product .fhjt{
    position: absolute;
    top: 20px;
    left: 20px;
  }
  #product .param{
    width: 342px;
    height: auto;
    margin: 0 auto !important;
  }
  #product .param>p>img{
    width: 342px;
  }
  #product .csdetails,#product .pjdetails{
    width: 100%;
    height: 677px;
    background: #F5F5FB;
  }
  #product .tmd5{
    opacity: 0.8 !important;
    display: block !important;
  }
   #product .tmd4{
    opacity: 0.6 !important;
    display: block !important;
  } 
   #product .tmd3{
    opacity: 0.4 !important;
    display: block !important;
  }
   #product .tmd2{
    opacity: 0.2 !important;
    display: block !important;
  }
  #product .tmd0{
    display: none !important;
  }
  #product .tmd1{
    opacity: 1 !important;
    display: block !important;
  }
  #product .kzBtn span{
    width: 15px;
    height: 10px;
    display: block;
    margin: 0 auto;
  }
  #product .shopping{
    width: 13px;
    height: 13px;
    position: absolute;
    right: 25px;
    top:21px;
    z-index: 100;
  }
  #product .active1{
    color:rgb(51,51,51) !important;
  } 
  #product .active2{
    border-bottom:3px solid  rgb(51,51,51) !important;
  }
  #product .xqbtn,#product .pjbtn,#product .csbtn{
    width: 50px;
    height: 32.5px;
    text-align: center;
    color:rgb(153, 153,153);
    font-size: 12px;
  }
  #product .kzBtn{
    width: 150px;
    height: 32.5px;
    display: flex;
    position: relative;
  }
  #product .kzmb{
    width: 150px;
    margin: 22px auto 0;
  }
  #product .top{
    width: 100%;
    height: 57.48px;
    background: #fff;
    position: fixed;
    top:0;
    transition: all 0.5s linear;
    display: none;
  }
  #product .xsh{
    height: 30px !important;
  }
  #product .ych{
    height: 0px !important;
  }
  #product .bottom-tips{
    width: 100%;
    height: 30px;
    background: #000;
    color: #fff;
    position: fixed;
    font-size: 12px;
    align-items: center;
    justify-content: center;
    bottom: 40px;
    display: flex;
    overflow: hidden;
  }
  #product .addCar, #product .buy{
    width: 150px;
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
    color:#fff;
    font-size: 16px;
    outline: none;
    border: none;
  }
  #product .addCarB{
    background: #ED6054;
  }
  #product .buyB{
    background: #D9B680;
  }
  #product .buttonJY{
    background: #999;
  }
  #product .xs_in{
    display: inline-block;
  }
  #product .yc{
    display: none !important;
  }
  #product .scText{
    width: 24px;
    height: 19px;
    color: #999;
    font-size: 12px;
  }
  #product .ysc{
    width: 12.4px;
    height: 19px;
    font-size: 11px;
    margin-top: 1.5px;
    color:#ED6054;
    border-color: #ED6054;
  }
  #product .wsc{
    width: 12.4px;
    height: 19px;
    font-size: 11px;
    margin-top: 1.5px;
  }
  #product .collection{
    width: 75px;
    height: 40px;
    background: #fff;
    padding: 0 17px;
    color:#333;
    font-size: 12px;
    display: flex;
    justify-content: space-around !important;
    align-items: center;
  }
  #product .bottom{
    width: 100%;
    height: 40px;
    display: flex;
    position: fixed;
    bottom: 0;
  }
  #product .dImg{
    width: 100%;
  }
  #product .dImges{
    width: 100%;
    height: auto;
  }
  #product .dTitle{
    width: 100%;
    height: 60px !important;
    background: #fff;
    padding:0 16.5px;
    color:#333;
    font-size: 16px;
    line-height: 60px;
  }
  #product .details{
    width: 100%;
    background: #F5F5FB;
    height: auto;
    padding: 10px 16.5px 60px
  }
  #product .myf{
    font-size: 12px;
    color:#333;
  }
  #product .kc, #product .addressBtn{
    font-size: 12px;
    color:#ED6054;
  }
  #product .dzms{
    width: 295px;
    height: 19px;
    font-size: 12px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap; 
  }
  #product .addresses{
    width: 295px;
    height: 41px;
  }
  #product .address>span{
    width: 34.984px;
    height: 19px;
    display: block;
    font-size: 12px;
    color:#999;
    line-height: 1.6;
  } 
  #product .address>i{
    font-size: 16px;
    position: absolute;
    top:10px;
    right: 12.5px;
  }
  #product .xzContent{
    width: 295px;
    height: 19px;
    font-size: 12px;
    color:#333;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: pre-wrap;
  }
  #product .xzTitle{
    width: 34.984px;
    height: 19px;
    font-size:12px;
    color:#999;
  }
  #product .typeBtn>i{
    position: absolute;
    font-size:16px;
    right: 12.5px;
  }

  #product .typeBtn{
    width: 100%;
    height: 42.48px;
    padding-left: 16.5px;
    display: flex;
    align-items: center;
  }
  #product .address{
    width: 100%;
    height: 62px;
    padding: 10px 0 10px 16.5px;
    border-top: 1px solid #eee;
    position: relative;
    align-items: baseline;
    display: flex;
  }
  #product .gaps{
    width: 100%;
    height: 10.5px;
    background: #F5F5FB;
  }
  #product .price{
    width: 100%;
    height: 35.5px;
    padding-left: 15px;
    padding-bottom: 7.5px;
    color:#ED6054;
    font-size: 18px;
  }
  #product .title{
    width: 100%;
    height: 41.5px;
    padding: 9px 0 4.5px 17.5px;
    color:#333;
    font-size:18px;
  }
  #product .banner{
    width: 100%;
    height: 375px;
  }
  #product .bImg{
    width: 100%;
    height: 375px;
  }
  #product .mint-swipe-indicators{
    width: 60px;
    bottom: 5px !important;
    transform: translateX(198%) !important;
  }
  #product .mint-swipe-indicator{
    width: 5px;
    height: 5px;
    background: #fff;
    opacity:0.5
  }
  #product .mint-swipe-item{
    background: #fff !important;
  }
  #product .is-active{
    background: #343434;
  }
  #product .car{
    width: 26.5px;
    height: 26.5px;
    background: #000;
    position: absolute;
    border-radius: 50%;
    opacity: 0.6;
    top: 20px;
    right: 20px;
    text-align: center;
    z-index: 1000;
  }
  #product .fontW{
    color:#fff;
    font-size:12px;
  }
  #product .fh{
    width: 26.5px;
    height: 26.5px;
    background: #000;
    position: absolute;
    border-radius: 50%;
    opacity: 0.6;
    left: 20px;
    top: 20px;
    text-align: center;
    z-index: 1000;
  }
  #product .fh>img{
    width: 19px;
    height: 19px;
    margin: 3px
  }
  #product .describe{
    width: 100%;
    height: 202.48px;
    background: #fff;
  }
</style>