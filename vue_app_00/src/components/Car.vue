<template>
  <div id="car">
    <div class="carTop">
      <div class="fhjt">
        <img @click="goback" src="../../public/images/dtfh.png" alt="">
      </div>
      <span class="carNum">购物车{{selcount}}/{{totalCount}}</span>
      <span class="toggle" :class="bianji_dp" @click="bianji">编辑</span>
      <span class="toggle" :class="wancheng_dp" @click="wancheng">完成</span>
    </div>
    <div class="carNone" :class="carNone_dp">
      <div class="none">
        <div class="img">
          <img src="../../public/images/kgwc.png" alt="">
        </div>
        <div class="not-content">购物车内暂无商品</div>
      </div>
      <div class="content-search">
        <div class="gap"></div>
        <div class="all-search">大家都在搜</div>
        <div class="search-item">
          <span>BOE画屏</span>
          <span>原木色</span>
          <span>红木色</span>
        </div>  
      </div>
    </div>
    <div class="carHas" :class="carHas_dp">
      <div class="gapTop"></div>
      <div class="carMid">
        <caritem :taskImg="item_car.gpic" v-for="(item_car, index) of list_car" :key="index" :taskCount="item_car.gcount" @add="addCount(item_car.gcount,item_car.gid,item_car.dpid)" @sub="subCount(item_car.gcount,item_car.gid,item_car.dpid)" :checkStatus="checkStatus" @sel="selected(item_car.gid)" @nsel="notSelected(item_car.gid)">
          <template slot="taskName">{{item_car.gname}}</template>
          <template slot="taskType1">{{item_car.gtype}}</template>
          <template slot="taskType2">{{item_car.gtype}}</template>
          <template slot="taskPrice">{{item_car.gprice}}</template>
        </caritem>
      </div>
      <div class="carBottom">
        <div class="all">
          <span class="iconfont icon-Oval allwxz" :class="wxzAll_dp"  @click="allSel"></span>
          <span class="iconfont icon-Groupx13 allxz" :class="xzAll_dp" @click="allNosel"></span>
          <span class="allText">全选</span>
        </div>
        <div class="carJs" :class="carJs_dp">
          <span class="hjText" :class="hjText_dp">合计：</span>
          <span class="redWord" :class="redWord_dp">￥{{money}}.00</span>
          <div class="jsCount">结算({{selcount}})</div>
        </div>
        <div class="deleteBtn" :class="deleteBtn_dp" @click="delCar">删除</div>
      </div>
    </div>
  </div>
</template>
<script>
import Caritem from "./Caritem.vue"
export default {
  data(){
    return {
      uid:"",
      gid:"",
      carNone_dp:"",
      carHas_dp:"",
      gcount:"",
      selcount:0,
      totalCount:0,
      list_car:[],
      list_count:[],
      xzAll_dp:"yc",
      wxzAll_dp:"xs_in",
      money:0,
      deleteBtn_dp:"",
      carJs_dp:"",
      wancheng_dp:"yc",
      bianji_dp:"xs",
      hjText_dp:"",
      redWord_dp:"",
      checkStatus:"",
      selData:"",
      check:false
    }
  },
  methods:{
    delCar(){
      var obj={uid:this.uid};
      this.axios.delete("delCar",{params:obj}).then(res=>{
        if(res.data.code==1){
          this.onload(); 
        }else{
          this.$toast({message:"请选择商品",position:"middle"});
        }
      })
    },
    getSeldata(){
      var obj={uid:this.uid};
      this.axios.get("selData",{params:obj}).then(res=>{
        if(res.data.code==1){
          this.selData=res.data.data
          for(var i=0,csum=0,psum=0;i<res.data.data.length;i++){
            csum+=res.data.data[i].gcount;
            psum+=res.data.data[i].gcount*res.data.data[i].gprice;
          }
          this.selcount=csum;
          this.money=psum;
        }else{
          this.selcount=0;
          this.money=0
        }
      })
    },
    notSelected(gid){
      var obj={uid:this.uid,gid,gchecked:0}
      var url="select"
      this.axios.put(url,this.qs.stringify(obj)).then(res=>{
        if(res.data.code==1){
          this.getSeldata()
        }
      }) 
    },
    selected(gid){
      var obj={uid:this.uid,gid,gchecked:1}
      var url="select"
      this.axios.put(url,this.qs.stringify(obj)).then(res=>{
        if(res.data.code==1){
          this.getSeldata();
        }
      })
    },
    allSel(){
      this.xzAll_dp="xs_in";
      this.wxzAll_dp="yc";
      this.checkStatus=true;
      var obj={uid:this.uid,gchecked:1};
      var url="allSelect";
      this.axios.put(url,this.qs.stringify(obj)).then(res=>{
        this.getSeldata();
      })
    },
    allNosel(){
      this.xzAll_dp="yc";
      this.wxzAll_dp="xs_in";
      this.checkStatus=false;
      var obj={uid:this.uid,gchecked:0};
      var url="allSelect";
      this.axios.put(url,this.qs.stringify(obj)).then(res=>{
        this.getSeldata();
      })
    },
    addCount(gcount,gid,dpid){
      if(dpid==1 && gcount<6){
        gcount++;
        var obj={uid:this.uid,gcount,gid};
        var url="updateCar";
        this.axios.put(url,this.qs.stringify(obj)).then(res=>{
          if(res.data.code==1){
            this.onload();
            this.getSeldata();
          }else{
            this.onload();
            this.getSeldata();
          }
        })
      }else if(dpid!==1 && gcount<3){
        gcount++;
        var obj={uid:this.uid,gcount,gid};
        var url="updateCar";
        this.axios.put(url,this.qs.stringify(obj)).then(res=>{
          if(res.data.code==1){
            this.onload();
            this.getSeldata();
          }else{
            this.onload();
            this.getSeldata();
          }
        })
      }else{
        this.$toast({message:"不能再加啦~",position:"middle"});
      }
    },
    subCount(gcount,gid,dpid){
      if(gcount==1){
        this.$toast({message:"不能再少啦~",position:"middle"});     
      }else{
        gcount--
        var obj={uid:this.uid,gcount,gid,dpid}
        var url="updateCar";
        this.axios.put(url,this.qs.stringify(obj)).then(res=>{
           if(res.data.code==1){
            this.onload();
            this.getSeldata();
          }else{
            this.onload();
            this.getSeldata();
          }
        })
      }
    },
    wancheng(){
      this.bianji_dp="xs";
      this.wancheng_dp="yc"
      this.deleteBtn_dp="yc_z";
      this.carJs_dp="xs_z";
      this.hjText_dp="xs_in";
      this.redWord_dp="xs_in";
      this.allNosel();
      this.bus.$emit("check",this.check)
    },
    bianji(){
      this.bianji_dp="yc";
      this.wancheng_dp="xs"
      this.deleteBtn_dp="xs_z"
      this.carJs_dp="yc_z";
      this.hjText_dp="yc";
      this.redWord_dp="yc";
      this.allNosel();
      this.bus.$emit("check",this.check)
    },
    goback(){
      this.allNosel();
      this.$router.go(-1);
    },
    onload(){
      this.uid=this.$route.params.uid;
      var obj={uid:this.uid};
      this.axios.get("car",{params:obj}).then(res=>{
        if(res.data.code==0){
          this.carNone_dp="xs";
          this.carHas_dp="yc";        
        }else{
          this.carNone_dp="yc";
          this.carHas_dp="xs";
          this.totalCount=0;
          for(var i=0,obj={},arr=[];i<res.data.carCount.length;i++){
            this.totalCount+=res.data.carCount[i].gcount;
            obj=Object.assign(res.data.carText[i],res.data.carCount[i])
            arr.push(obj);
          }
          this.list_car=arr;
        }
      })
    }
  },
  created() {
    this.onload();
  },
  components: {
    "caritem":Caritem
  },
  watch:{
    selData(){
      if(this.selData.length===this.list_car.length){
        this.xzAll_dp="xs_in";
        this.wxzAll_dp="yc";
      }else{
        this.xzAll_dp="yc";
        this.wxzAll_dp="xs_in";
      }
    }
  }
}
</script>
<style scoped>
*{box-sizing: border-box}
#car .xs_z{
  z-index: 2 !important;
}
#car .yc_z{
  z-index: 1 !important;
}
#car .fhjt,#car .fhjt>img{
  line-height: 55.97px;
  vertical-align: middle;
}
#car .jsCount{
  width: 150px;
  height: 40px;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #ED6054;
  font-size: 18px;
  color: #fff;
}
#car .redWord{
  font-size:18px;
  color: #ED6054;
  margin-right: 15px;
  font-weight: bold;
}

#car .hjText{
  font-size: 12px;
  color: #333;
}
#car .deleteBtn{
  width: 150px;
  height: 40px;;
  display: flex;
  background: #000;
  color: #fff;
  justify-content: center;
  align-items: center;
  font-size: 18px;
  position: fixed;
  bottom: 0;
  right: 0;
  z-index: 1;
}
#car .carJs{
  display: flex;
  align-items: center;
  position: fixed;
  bottom: 0;
  right: 0;
  z-index: 2
}
#car .allxz{
  font-size: 16px;
}
#car .allwxz{
  font-size: 16px;
  color: #9A9A9A;
}
#car .allText{
  margin-left: 10px;
}
#car .all{
  display: flex;
  align-items: center;
  font-size: 12px;
  color: #333;
}
#car .carNum{
  color:#333334;
  font-size: 20px;
  margin-right: 120px
}
#car .toggle{
  color:#333334;
  font-size: 14px;
}
#car .carTop{
  width: 100%;
  height: 55.98px;
  padding: 0 17.5px 0 18px;
  top: 0px;
  position: fixed;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #fff;
  z-index: 2
}
#car .gapTop{
  width: 100%;
  height: 10px;
  background: #F6F5FB;
  position: fixed;
  top:55px;
}
#car .carMid{
  margin-top: 64px;
}
#car .carBottom{
  width: 100%;
  height: 40px;
  padding-left: 16px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  position: fixed;
  bottom: 0;
  background: #fff;
  z-index: 2;
}
#car .carHas{
  width: 100%;
}
#car .xs_in{
  display: inline-block !important;
}
#car .xs{
  display: block !important;
}
#car .yc{
   display: none !important;
}
#car .search-item>span{
  background: #F6F6F6;
  border-radius: 15px;
  height: 26.5px;
  font-size:12px;
  display: inline-block;
  padding: 3.75px 7.5px;
  margin-top:  10px;
  margin-right: 10px;
}
#car .search-item{
  width: 357.5px;
  height: 36.5px;
  margin-left: 17.5px;
}
#car .all-search{
  width: 357.5px;
  height: 22px;
  margin-left: 17.5px;
  margin-top: 20px;
  font-size:14px;
  color:#333;
}
#car .gap{
  width: 100%;
  height: 10px;
  background: #F6F5FB;
}
#car .content-search{
  padding-bottom: 20px
}
#car .img{
  width: 43.98px;
  height: 56.14px;
  margin: 0 auto 10px;
}
#car .img>img{
  width: 43.98px;
  height: 56.14px;
  line-height: 56.14px;
  position: absolute;
  z-index: 5;
}
#car .not-content{
  width: 100%;
  height: 22px;
  color: #999;
  font-size:14px;
  margin-bottom: 22px;
  text-align: center;
  line-height: 22px;
}
#car .none{
  padding-top: 80px;
}
#car .carNone{
  width: 100%;
  height: 667px;
  background: #fff;
} 
</style>