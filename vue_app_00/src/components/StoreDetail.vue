<template>
  <div id="storeDetail">
    <div class="storeContent">
      <div>
        <img class="mdfh" src="../../public/images/mdfh.png" alt=""  @click="goback">
        <img class="bigImg" :src="'http://127.0.0.1:3000/'+bspic" alt="">
      </div>
      <div class="storeText">
        <div class="storeMs">
          <div class="scontent">
            <div class="sname">{{sname}}</div>
            <p class="stime">
              <span class="status">营业中&nbsp;</span>
              <span>周一~周五&nbsp;</span>
              <span>{{stime1}}&nbsp;</span>
              <span>周末&nbsp;&nbsp;</span>
              <span>{{stime2}}</span>
            </p>
          </div>
          <div class="stele1"></div>
          <div class="stele" @click="telephone">
            <img src="../../public/images/phone.png" alt="">
          </div>
        </div>
        <div class="storeAddress">
          <i class="iconfont icon-dingweix"></i>
          <div>
            <span class="saddress">{{saddress}}</span>
            <span class="dtjt">
              <img src="../../public/images/dtjt.png" alt="">
            </span>
            <span class="mapBtn" @click="openMap">地图</span>
          </div>
        </div>
      </div>
    </div>
    <div class="imageTitle">店铺相册</div>
    <div class="storeImages">
      <div class="storeImg" v-for="(item_img,index) of list_imges" :key="index">
        <img  :src="'http://127.0.0.1:3000/'+item_img" alt="" @click="openPT(index)">
      </div>
    </div>
    <window :winBg_dp="winBg_dp" :winBottom_dp="winBottom_dp" @qx="qxFun">
      <template slot="taskT">{{taskT}}</template>
      <template slot="taskC">{{taskC}}</template>
    </window>
  </div>
</template>
<script>
import Window from "./Window.vue"
export default {
  data() {
    return {
      sid:"",
      bspic:"",
      sname:"",
      status:"",
      stime1:"",
      stime2:"",
      timer:"",
      saddress:"",
      list_imges:[],
      winBg_dp:"yc",
      winBottom_dp:"ych",
      taskT:"电话",
      taskC:"4006681000"
    }

  },
  methods: {
    openPT(index){
      this.$router.push({path:`/Slide/${index}`});
    }, 
    onload(){
      this.sid=this.$route.params.sid;
      var url="storeDetails";
      var obj={sid:this.sid};
      this.axios.get(url,{params:obj}).then(res=>{
        this.bspic=res.data[0].bspic;
        this.sname=res.data[0].sname;
        this.stime1=res.data[0].stime1;
        this.stime2=res.data[0].stime2;
        this.saddress=res.data[0].saddress;
        var arr_imges=[res.data[0].sspic1,res.data[0].sspic2,res.data[0].sspic3,res.data[0].sspic4,res.data[0].sspic5];
        for(var i=0;i<arr_imges.length;i++){
          if(arr_imges[i]!==null){
            this.list_imges.push(arr_imges[i]);
          }
        }
      })
    },
    telephone(){
      this.winBg_dp="xs";
      this.winBottom_dp="xsh";
    },
    qxFun(){
      this.winBg_dp="yc";
      this.winBottom_dp="ych";
    },
    goback(){
      this.$router.go(-1);
    },
    openMap(){
      this.$router.push({path:`/BaiduMap/${this.sid}`});
    }
  },
  created(){
    this.onload();
  },
  destroyed() {
    this.$nextTick(function(){
      this.bus.$emit("photoes",this.list_imges);
    })
  },
  components: {
    "window":Window
  },
}
</script>
<style>
#storeDetail .mdfh{
  position: absolute;
  z-index: 1000;
  top: 20px;
  left: 20px;
}
#storeDetail .xs{
  display: block !important;
}
#storeDetail .yc{
  display: none !important;
}
#storeDetail .xsh{
  height: 140px !important;
}
#storeDetail .ych{
  height: 0px !important;
}
#storeDetail .storeContent{
  width: 100%;
  height: 388.98px;
  padding-bottom:7.5px; 
  background: #fff;
}
#storeDetail .storeContent>div,#storeDetail .bigImg{
  width:100%;
  height: 283.5px;
  position: relative;
}

#storeDetail .storeText{
  width: 100%;
  height: 82.98px !important;
}
#storeDetail .storeMs{
  width: 340px;
  height: 52px;
  margin: 15px auto 0;
  border-bottom: 1px solid #edeff0;
  display: flex;
}
.scontent{
  height: 52px;
}
#storeDetail .sname{
  width: 300px;
  height: 28px;
  font-size: 18px;
  color:#333;
}
#storeDetail .storeAddress{
  width: 340px;
  height: 24.98;
  margin: 0 auto;
  padding-top: 5px;
}
#storeDetail .stime{
  width: 300px;
  height: 19px;
  margin: 2.5px 0;
}
#storeDetail .stime>span{
  color: #828282;
  font-size: 12px;
  vertical-align: top;
}
#storeDetail .status{
  margin-right: 5px;
}
#storeDetail .stele1{
  height: 18.48px;
  border-left:1px solid #DCDCDC;
  text-align: right;
  margin: 16.75px 1.625px; 
}
#storeDetail .stele{
  width: 32.5px;
  height: 28.5px;
  margin: 11.75px 1.625px;
  text-align: right;
}
#storeDetail .stele>img{
  width: 9.48px;
  height: 18px;
  margin-top:2.5px;
  margin-right: 7.5px; 
}
#storeDetail .storeAddress{
  width: 340px;
  height: 29.98px;
  padding-top: 5px;
  display: flex;
  align-content: center
}
#storeDetail .storeAddress>div{
  width: 316.02px;
  height: 20.5px;
}
#storeDetail .storeAddress>i{
  font-size:16px;
  margin-right: 8px; 
}
#storeDetail .saddress{
  width: 250px;
  height: 19px;
  float: left;
  font-size: 12px;
  margin-top: 4px;
}
#storeDetail .dtjt{
  width: 8.5px;
  height: 19px;
  float: right;
}
#storeDetail .dtjt>img{
  width: 6px;
  height: 15px;
  line-height: 2.3;
  margin-left: 8px;
  margin-bottom: -2px;
}
#storeDetail .mapBtn{
  width: 25px;
  color:#666869;
  font-size:12px;
  float: right;
  line-height: 2.3;
}
#storeDetail .storeImages{
  display: flex;
  flex-wrap: wrap;
  padding-bottom: 5px;
}
#storeDetail .imageTitle{
  width: 100%;
  height: 50px;
  background: #fff;
  margin: 10px 0 5px;
  padding: 10px 20px;
}
#storeDetail .storeImg,#storeDetail .storeImg>img{
  width: 172px;
  height: 125px; 
}
#storeDetail .storeImg{
  border-radius: 4px;
  margin-bottom: 11px;
  overflow: hidden;
  margin: 5px 0 5px 10px;
}
#storeDetail .teleBg{
  width: 100%;
  height: 667px;
  background: rgba(0, 0, 0, 0.5);
  position: fixed;
  top:0;
}
#storeDetail .teleWin{
  width: 100%;
  height: 140px;
  background: #F6F5FB;
  position: fixed;
  bottom: 0;
  transition: all 0.2s ease-in-out;
}

#storeDetail .teleText{
  width: 100%;
  background: #fff;
  height: 40px;
  text-align: center;
  border-bottom: 1px solid #ececec;
  line-height: 40px;
  color: #333;
  font-size: 18px;
}
#storeDetail .teleNum{
  width: 100%;
  background: #fff;
  height: 50px;
  text-align: center;
  border-bottom: 1px solid #ececec;
  line-height: 50px;
  color: #333;
  font-size: 14px;
}
#storeDetail .qxBtn{
  width: 100%;
  background: #fff;
  height: 40px;
  text-align: center;
  line-height: 40px;
  color:#ccc;
  font-size: 18px;
  margin-top: 10px;
}
</style>