<template>
  <div id="window">
    <div class="winBg" :class="winBg_dp"></div>
    <div class="winBottom" :class="winBottom_dp">
      <div class="winText">
        <slot name="taskT"></slot>
      </div>
      <div class="winContent">
        <slot name="taskC"></slot>
      </div>
      <div class="qxBtn" @click="qxFun">取 消</div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
     
    }
  },
  props:[
    "winBg_dp",
    "winBottom_dp"
  ],
  methods:{
    qxFun(){
      this.$emit("qx",this.winBg_dp,this.winBottom_dp)    
    }
  },
  created(){
    
  },
  components:{

  }
}
</script>
<style scoped>
  #window .winBg{
    width: 100%;
    height: 667px;
    background: rgba(0, 0, 0, 0.5);
    position: fixed;
    top:0;
    z-index: 1001;
  }
  #window .winBottom{
    width: 100%;
    height: 140px;
    background: #F6F5FB;
    position: fixed;
    bottom: 0;
    transition: all 0.2s ease-in-out;
    z-index: 1002;
  }
  #window .winText{
    width: 100%;
    background: #fff;
    height: 40px;
    text-align: center;
    border-bottom: 1px solid #ececec;
    line-height: 40px;
    color: #333;
    font-size: 18px;
  }
  #window .winContent{
    width: 100%;
    background: #fff;
    height: 50px;
    text-align: center;
    border-bottom: 1px solid #ececec;
    line-height: 50px;
    color: #333;
    font-size: 14px;
  }
  #window .qxBtn{
    width: 100%;
    background: #fff;
    height: 40px;
    text-align: center;
    line-height: 40px;
    color:#ccc;
    font-size: 18px;
    margin-top: 10px;
  }
  #window .xs{
    display: block !important;
  }
  #window .yc{
    display: none !important;
  }
  #window .xsh{
    height: 140px !important;
  }
  #window .ych{
    height: 0px !important;
  }

</style>