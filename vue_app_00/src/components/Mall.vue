<template>
  <div id="mall">
    <div class="top" :class="top_dp">
      <div class="search">
        <div class="headsearch">
          <i class="iconfont icon--px-x fdj"></i>
          <span class="hptext">BOE画屏</span>
        </div>
        <div class="headcar">
          <i class="iconfont icon-gouwuche-x gwc" @click="goCar"></i>
          <span class="gwcNum" :class="gwcNum_dp">{{carNum}}</span>
        </div>
      </div>
    </div>
    <div class="banner">
      <mt-swipe :auto="5000" @change="handleChange">
        <mt-swipe-item>
          <a href="javascript:;">
            <img @click="fun1" class="slide-image" src="../../public/images/banner1.png" alt="">
          </a>
        </mt-swipe-item>
        <mt-swipe-item>
          <a href="javascript:;">
            <img @click="fun2" class="slide-image" src="../../public/images/banner2.png" alt="">
          </a>
        </mt-swipe-item>
        <mt-swipe-item>
          <a href="javascript:;">
            <img @click="fun3" class="slide-image" src="../../public/images/banner3.png" alt="" >
          </a> 
        </mt-swipe-item>
      </mt-swipe>
    </div>
    <div>
      <img class="bgImg" :class="bgImg1_dp" src="../../public/images/banner1.png" alt="">
      <img class="bgImg" :class="bgImg2_dp" src="../../public/images/banner2.png" alt="">
      <img class="bgImg" :class="bgImg3_dp" src="../../public/images/banner3.png" alt="">
    </div>
    <div class="main">
      <div class="floor">
        <div class="titleHp">
          <div>
            <div class="titleJt">
              <img src="../../public/images/text01.png" alt="">
            </div>
            <div class="titleTextHp">
              <span>BOE数字艺术</span>
            </div>
            <div class="titleJt">
              <img src="../../public/images/text02.png" alt="">
            </div>
          </div>
        </div>
        <div class="product" v-for="(item_hp,i_hp) of list_hp" :key="i_hp" @click="productHp(item_hp.pid)">
          <img class="pic" :src="'http://127.0.0.1:3000/'+item_hp.ppic" alt="">
        </div>   
      </div>
      <div class="floor">
        <div class="titleZn">
          <div>
            <div class="titleJt">
              <img src="../../public/images/text01.png" alt="">
            </div>
            <div class="titleTextZn">
              <span>BOE移动健康生态链</span>
            </div>
            <div class="titleJt">
              <img src="../../public/images/text02.png" alt="">
            </div>
          </div>
        </div>
        <div class="product" v-for="(item_zn,i_zn) of list_zn" :key="i_zn" @click="productZn(item_zn.pid)">
          <img class="pic" :src="'http://127.0.0.1:3000/'+item_zn.ppic" alt="">
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      bgImg1_dp:'xs',
      bgImg2_dp:'yc',
      bgImg3_dp:'yc',
      list_hp:[],
      list_zn:[],
      top_dp:"",
      uid:"",
      carNum:"",
      gwcNum_dp:"yc"
    }
  },
  methods: {
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
            }else if(this.carNum==null){
              this.gwcNum_dp="yc";
            }else{
              this.gwcNum_dp="xs_in";
            }
          }else{
            this.gwcNum_dp="yc";
          }  
        })
      }else{
        this.gwcNum_dp="yc";
      }
    },
    goCar(){
      if(sessionStorage.getItem("uid")==null){ 
        this.$router.push("/Login");
      }else{
        this.uid=sessionStorage.getItem("uid");
        this.$router.push({path:`/Car/${this.uid}`});
      }
    },
    handleScroll () {
      var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
      if(scrollTop==0){
        this.top_dp="toptmd0";
      }else{
        this.top_dp="toptmd1";
      }
    },
    productHp(pid){
      this.$router.push({path:`/Product/${pid}`});
    },
    productZn(pid){
      this.$router.push({path:`/Product/${pid}`});
    },
    fun1(){
      var pid=1;
      this.$router.push({path:`/Product/${pid}`});
    },
    fun2(){
      var pid=2;
      this.$router.push({path:`/Product/${pid}`});
    },
    fun3(){
      var pid=4;
      this.$router.push({path:`/Product/${pid}`});
    },
    handleChange(index){
      if(index==0){
        this.bgImg1_dp='xs';
        this.bgImg2_dp='yc';
        this.bgImg3_dp='yc';
      }else if(index==1){
        this.bgImg1_dp='yc';
        this.bgImg2_dp='xs';
        this.bgImg3_dp='yc';
      }else{
        this.bgImg1_dp='yc';
        this.bgImg2_dp='yc';
        this.bgImg3_dp='xs';
      }
    },
    onload(){
      this.axios.get("products").then(res=>{
        this.list_hp=res.data.hp;
        this.list_zn=res.data.zn;
        this.getCount();
      })
    }
  },
  created() {
    this.onload();
  },
  mounted () {
    window.addEventListener('scroll', this.handleScroll);
  },
  destroyed () {
    window.removeEventListener('scroll', this.handleScroll);
    window.removeEventListener('scroll', this.scrollToTop);
  }
}

</script>
<style>
  *{box-sizing: border-box}
  #mall .gwcNum{
    width: auto;
    font-size: 8px !important;
    background: #ED6054;
    border:1px solid #ED6054;
    position: absolute;
    border-radius: 50%;
    color: #fff;
    text-align: center;
    line-height: 11px;
    top: -2px;
    right:-15px;
  }
  #mall .toptmd0{
    background: rgba(255, 255, 255, 0)
  }
  #mall .toptmd1{
    background: rgba(255, 255, 255, 1)
  }
  #mall .top{
    width: 100%;
    height: 38px;
    position: fixed;
    top:0;
    z-index: 1000;
    transition: all 0.2s ease-in;
  }
  #mall{
    background: #F6F5FB;
  }
  #mall .xs{
    display: block;
  }
  #mall .xs_in{
    display: inline-block;
  }
  #mall .yc{
    display: none;
  }
  #mall .search{
    display: flex;
    align-items: center;
    position: absolute;
    top:12%;
    left:6%;
    width: 330px;
    height: 27.48px;
  }
  #mall .search>.headsearch{
    width: 305.83px;
    height: 27.48px;
    background:#DFDFDF;
    border-radius: 25px;
    padding: 0 15px;
  }
  #mall .headcar{
    width: 7%;
    height: 27.48px;
  }
  #mall .fdj{
    font-size: 16px;
    line-height: 27.48px;
    color:#999999;
  }
  #mall .hptext{
    margin-left:10px;
    color:#999999;
    font-size:14.5px;
    line-height: 27.48px; 
  }
  #mall .gwc{
    font-size: 16px;
    line-height: 27.48px;
    margin-left:9.5px;
    color:#000; 
  }
  #mall .banner{
    width: 339.5px;
    height: 200px;
    justify-content: center;
    position: absolute;
    overflow: visible;
    top:69px;
    z-index: 100;
    left:18px;
  }
  #mall .slide-image,#mall .mint-swipe-item{
    width: 339.5px;
    height: 181.5px !important;
    border-radius: 4px;
  }
  
  #mall .mint-swipe-indicators{
    bottom: 0px;
  }
  #mall .mint-swipe-indicator{
    width:42.48px ;
    height: 4px;
    background: #CDCDCF;
    margin-left: 3px;
    border-radius: 4px;
    opacity: 1;
    justify-content:space-between;
  }
  #mall .is-active{
    background: #343434;
  }
  #mall .bgImg{
    width: 100%;
    height: 234.48px;
    filter: blur(0.18rem);
  }
  #mall .main{
    padding: 25px 0 5px;
    position: relative;
    top:5px;
    margin-bottom: 60px;
  }
  #mall .floor{
    padding-top: 15px;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }
  #mall .titleHp,#mall .titleZn{
    width: 208.42px;
    height: 28px;
    margin-bottom: 4.5px;
    font-size:18px;
    align-items: center;
    display: flex;
    color:#333;
    line-height: 1.6;
  }
  #mall .titleZn{
    width: 262.48px;
  }
  #mall .titleHp>div, #mall .titleZn>div{
    width: 100%;
    text-align: left;
    align-items: center;
    display: flex;
  }
  #mall .titleJt{
    display: flex;
  }
  #mall .titleJt>img{
    width: 45.3px;
    height: 3.48px;
  }
  #mall .titleTextHp,.titleTextZn{
    width: 208.42px;
    height: 28px;
    text-align: center;
  }
  #mall .titleTextZn{
    width: 262.48px;
  }
  #mall .pic{
    margin-top: 12.5px;
    width: 345px;
    height: 150px;
    border-radius: 4px;
    box-shadow: 0px 0px 8px 0px #888888;
  }
</style>