<template>
  <div id="slide">
    <div class="bg">
      <div class="close" @click="goback">
        <i class="iconfont icon-guanbi"></i>
      </div>
      <div class="download">
        <img src="../../public/images/download.png" alt="">
      </div>
      <div class="indexText">
        <p>{{indexText+1}}/{{indexlist}}</p>
      </div>
    </div>
    <mt-swipe @change="handleChange" :auto="0" :show-indicators="false" class="slide" :continuous="false" :defaultIndex="nowIndex">
      <mt-swipe-item v-for="(item_img, index) of imglist" :key="index">
        <img class="images" :src="'http://127.0.0.1:3000/'+item_img" alt=""> 
      </mt-swipe-item>
    </mt-swipe>
  </div>
</template>
<script>
export default {
  data(){
    return {
      imglist:[],
      nowIndex:"",
      indexlist:"",
      indexText:""
    }
  },
  methods:{
    goback(){
      this.$router.go(-1);
    },
    onload(){
      this.nowIndex=parseInt(this.$route.params.index);
    },
    handleChange(index){
      this.indexText=index;
    },  
  },
  created(){
    this.bus.$on("photoes",(data)=>{
      this.imglist=data;
      this.indexlist=data.length;
    });
    this.onload();
  },
}
</script>
<style scoped>
#slide .indexText{
  width: 100%;
  position: fixed;
  color:#fff;
  bottom: 30px;
  z-index: 1;
  text-align: center;
  font-size: 16px;
}
#slide .download{
  position: absolute;
  bottom: 0px;
  right: 0px;
}
#slide .download>img{
  width: 35px;
}
#slide .close{
  position: absolute;
  top: 10px;
  left: 10px;
  font-size:16px;
  font-weight: bold;
  color:#fff;
}
#slide .bg{
  width: 100%;
  height: 667px;
  background: #000 !important;
  position: relative;
}
#slide .slide{
  width: 100%;
  height: 283.5px;
  position: fixed;
  top:191.75px;
}
#slide .images{
  width: 100%;
}
</style>