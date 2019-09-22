<template>
  <div id="caritem">
    <div class="main">
      <div class="check">
        <span class="select">
          <i class="iconfont icon-Oval wxz" :class="wxz_dp"  @click="selected"></i>
          <i class="iconfont icon-Groupx13 xz" :class="xz_dp"  @click="notSelected"></i>
        </span>
      </div>
      <div class="right">
        <div class="img">
          <img :src="'http://127.0.0.1:3000/'+taskImg" alt="">
        </div>
        <div class="rightContent">
          <div class="title">
            <slot name="taskName"></slot>&nbsp;<slot name="taskType1"></slot>
          </div>
          <div class="describe">
           <slot name="taskType2"></slot>
          </div>
          <div class="price">
            <span class="priceText">
              ￥<slot name="taskPrice"></slot>
            </span>
            <span class="countText">
              <i class="iconfont icon-Groupx12" @click="subCount"></i>
              <span>{{taskCount}}</span>
              <i class="iconfont icon-Groupx11" @click="addCount"></i>
            </span>
          </div>
        </div>
      </div>
    </div>  
  </div>
</template>
<script>
export default {
  data(){
    return {
      xz_dp:"yc",
      wxz_dp:"xs_in"
    }
  },
  props:[
    "taskImg",
    "taskCount",
    "checkStatus",
  ],
  methods:{
    change(check){
      if(check==false){
        this.wxz_dp="xs_in";
        this.xz_dp="yc";
      }
    },
    subCount(){
      this.$emit("sub",this.taskCount);
    },
    addCount(){
      this.$emit("add",this.taskCount);
    },
    selected(){
      this.xz_dp="xs_in";
      this.wxz_dp="yc";
      this.$emit("sel");
    },
    notSelected(){
      this.wxz_dp="xs_in";
      this.xz_dp="yc";
      this.$emit("nsel");
    }
  },
  created() {
    this.bus.$on("check",this.change.bind(this));
  },
  components:{
    
  },
  watch: {
    checkStatus(){
      if(this.checkStatus==true){
        this.xz_dp="xs_in";
        this.wxz_dp="yc"
      }else{
        this.wxz_dp="xs_in";
        this.xz_dp="yc";
      }
    }
  }
}
</script>
<style scoped>
#caritem .countText>span{
  width: 37.5px;
  height: 25px;
  background: #eee;
  font-size: 18px;
  text-align: center;
  margin: 0 7px;
  border-radius: 15px;
  line-height: 25px;
}
#caritem .countText>i{
  font-size: 20px
}
#caritem .countText{
  display: flex;
  align-items: center;
}
#caritem .priceText{
  color: #ED6054;
  font-size: 18px;
}
#caritem .price{
  width: 225px;
  height: 28px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
#caritem .describe{
  font-size: 12px;
  color: #999;
}
#caritem .title{
  width: 220px;
  height: 22px;
  color: #333;
  font-size:14px;
}
#caritem .img,#caritem .img>img{
  width: 80.5px;
  height: 80.5px;
  margin-right: 11px;
}
#caritem .right{
  display: flex;
  align-items: center;
}
#caritem .xs_in{
  display: inline-block;
}
#caritem .yc{
  display: none;
}
#caritem .xz1{
  font-size: 16px;
}
#caritem .wxz1{
  font-size: 16px;
  color: #9A9A9A;
}
#caritem .select{
  display: inline-block;
  width: 100%;
  text-align: center;
  border-top: 20px solid #fff;
  border-bottom: 15px solid #fff;
}
#caritem .check{
  width: 40.52px;
}
#caritem .main{
  display: flex;
  align-items: center;
}
#caritem{
  border-top:1px solid #eee;
  padding: 10px 18px 9px 0;
  background: #fff;
}
</style>