<template>
  <div id="baiduMap">
    <img class="dtfh" src="../../public/images/dtfh.png" alt="" @click="goback">
    <baidu-map class="bm-view" ak="DX3r2Qeyio3WudUgFbQQmMwqGYXypdLi" :center="dw" :zoom="zIndex" :scroll-wheel-zoom="true">
      <bm-marker :position="dw" :dragging="true" animation="BMAP_ANIMATION_BOUNCE"></bm-marker>    
    </baidu-map>
    <div class="Btn">
      <div class="bt">
        <img src="../../public/images/add.png" alt="" @click="lsFun">
      </div>
      <div>
        <img src="../../public/images/del.png" alt="" @click="sjFun">
      </div>
    </div>
    <div class="mapBottom">
      <div>
        <p class="sname">{{sname}}</p>
        <p class="saddress">{{saddress}}</p>
      </div>
      <img class="mapQh" src="../../public/images/mapQh.png" alt="" @click="openGd">
    </div>
    <window :winBg_dp="winBg_dp" :winBottom_dp="winBottom_dp" @qx="qxFun">
      <template slot="taskT">{{taskT}}</template>
      <template slot="taskC">{{taskC}}</template>
    </window>
  </div>
</template>
<script>
import BaiduMap from 'vue-baidu-map/components/map/Map.vue'
import {BmMarker,BmControl} from 'vue-baidu-map'
import Window from "./Window.vue"
export default {
  data(){
    return {
      dw:"",
      sid:"",
      sname:"",
      saddress:"",
      zIndex:15,
      winBg_dp:"yc",
      winBottom_dp:"ych",
      taskT:"地图",
      taskC:"高德地图"
    }
  },
  methods:{
    onload(){
      this.sid=this.$route.params.sid;
      if(this.sid==1){
        this.dw={lng: 117.029417, lat:36.669933};
      }else if(this.sid==2){
        this.dw={lng: 120.170101, lat:30.256884};
      }else{
        this.dw={lng: 116.363841, lat:39.958475};
      }
      var url="storeDetails";
      var obj={sid:this.sid};
      this.axios.get(url,{params:obj}).then(res=>{
        this.sname=res.data[0].sname;
        this.saddress=res.data[0].saddress;
      })
    },
    goback(){
      this.$router.go(-1);
    },
    openGd(){
      this.winBg_dp="xs";
      this.winBottom_dp="xsh";
    },
    qxFun(){
      this.winBg_dp="yc";
      this.winBottom_dp="ych";
    },
    lsFun(){
      this.zIndex--;
    },
    sjFun(){
       this.zIndex++;
    }
  },
  created(){
    this.onload();
  },
  components: {
    BmMarker,
    BaiduMap,
    "window":Window
  },
}
</script>

<style>
#baiduMap .dtfh{
  position: absolute;
  z-index: 1000;
  top: 40px;
  left: 15px;
}
#baiduMap .bm-view {
  width: 100%;
  height: 667px;
}
#baiduMap .Btn{
  width: 50px;
  height: 100px;
  background: #F7F5FF;
  border:1px solid #E5E5E3;
  position: fixed;
  right:5px;
  bottom: 110px;
  z-index: 1;
}
#baiduMap .Btn>div{
  width: 90%;
  height: 50px;
  margin: 0 auto;
  text-align: center;
  line-height: 50px;
}
#baiduMap .bt{
  border-bottom: 1px solid #E5E5E3;
}
#baiduMap .mapBottom{
  width: 100%;
  height: 100px;
  background: #F7F5FF;
  position: fixed;
  bottom: 0;
  left: 0;
  z-index: 1;
}
#baiduMap .mapBottom>div{
  width: 80%;
  padding: 20px 10px;
}
#baiduMap .sname{
  height: 30px;
  color: #2F2D32;
  line-height: 30px;
}
#baiduMap .saddress{
  height: 30px;
  color: #949398;
  font-size: 14px;
  line-height: 30px;
}
#baiduMap .mapQh{
  width: 90px;
  position: absolute;
  bottom: 10px;
  right: -3px;
}
#baiduMap .xs{
  display: block !important;
}
#baiduMap .yc{
  display: none !important;
}
#baiduMap .xsh{
  height: 140px !important;
}
#baiduMap .ych{
  height: 0px !important;
}
</style>