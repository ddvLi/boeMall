<template>
  <div class="page-tabbar">
    <!-- 切换面板列表index -->
    <mt-tab-container class="page-tabbar-container" v-model="active">
      <mt-tab-container-item id="mall">
        <mall></mall>
      </mt-tab-container-item>
      <mt-tab-container-item id="store">
        <store></store>
      </mt-tab-container-item>
      <mt-tab-container-item id="mine">
        <mine></mine>
      </mt-tab-container-item>
    </mt-tab-container>
    <!-- 底部按钮 -->
    <mt-tabbar v-model="active" fixed>
      <mt-tab-item id="mall" @click.native="changeState(0)">
        <myfooter 
          :selectedImage="require('../public/images/footer1_1.png')"
          :normalImage="require('../public/images/footer1_2.png')"
          :focused="currentIndex[0].isSelect">
        </myfooter>
        商城
      </mt-tab-item>
      <mt-tab-item id="store" @click.native="changeState(1)">
        <myfooter
          :selectedImage="require('../public/images/footer2_1.png')"
          :normalImage="require('../public/images/footer2_2.png')"
          :focused="currentIndex[1].isSelect">
        </myfooter>
        门店
      </mt-tab-item>
      <mt-tab-item id="mine" @click.native="changeState(2)">
        <myfooter
          :selectedImage="require('../public/images/footer3_1.png')"
          :normalImage="require('../public/images/footer3_2.png')"
          :focused="currentIndex[2].isSelect">
        </myfooter>
        我的
      </mt-tab-item>
    </mt-tabbar>
  </div>
</template>
<script>
import Mall from "./components/Mall.vue"
import Store from "./components/Store.vue"
import Mine from "./components/Mine.vue"
import Myfooter from "./components/Myfooter.vue"


export default {
  data() {
    return {
      active:"mall",
      uid:"",
      unameomg:"商城",
      currentIndex:[
        {isSelect:true,unameomg:"商城"},
        {isSelect:false,unameomg:"门店"},
        {isSelect:false,unameomg:"我的"}
      ]
    }
  },
  methods: {
    changeState(n){
      for(var i=0;i<this.currentIndex.length;i++){
        if(n==i){
          this.currentIndex[i].isSelect=true;
          this.unameomg=this.currentIndex[i].unameomg
        }else{
          this.currentIndex[i].isSelect=false;
        }
      }
    }
  },
  created() {
   
  },
  components:{
    "mall":Mall,
    "store":Store,
    "mine":Mine,
    "myfooter":Myfooter
  }
}
</script>
<style scoped>
  *{box-sizing: border-box}
  .mint-tabbar.is-fixed{
    border-top: 0.013333rem solid #C0BFC4;
    padding-top: 5px;
  }
  .mint-tabbar>.mint-tab-item{
    height: 46.48px;
    color: #999;
    padding: 2.5px 0 0;
  }
  .mint-tabbar>.mint-tab-item.is-selected{
    background-color: #fff;
    color: #000;
  }
  .page-wrap{
    overflow:auto;/*溢出显示轮动条*/
    padding-bottom: 60px;
  }
</style>