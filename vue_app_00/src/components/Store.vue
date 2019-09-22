<template>
  <div id="store">
    <div class="headBg">
      <img src="../../public/images/storeBg.png" alt="">
    </div>
    <div class="content">
      <div class="storesContent">
        <div class="storeItem" v-for="(item_store,i_store) of list_store" :key="i_store" @click="send(item_store.sid)">
          <div>
            <img class="storeImg" :src="'http://127.0.0.1:3000/'+item_store.spic" alt="">
            <div class="storeType">数字艺术</div>
          </div>
          <div class="storeAddress">
            <div class="storeName">{{item_store.sname}}</div>
            <div class="addressDetail">
              <p class="addressText">{{item_store.saddress}}</p>
              <div class="addressDw">
                <i class="iconfont icon-dizhi dwd"></i>
                <span class="city">{{item_store.scity}}</span>
              </div>
            </div>
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
      list_store:[],
      sid:""
    }
  },
  methods: {
    onload(){
      this.axios.get("store").then(res=>{
        this.list_store=res.data;
      })
    },
    send(sid){
      this.$router.push({path:`/StoreDetail/${sid}`});
    }
  },
  created() {
    this.onload();  
  },
}
</script>
<style scoped>
  *{box-sizing: border-box}
  #store{
    background: #F6F5FB;
  }
  #store .headBg{
    height: 285px;
  }
  #store .headBg>img{
    width:100%;
    height:285px;
  }
  #store .content{
    width: 100%;
    padding: 0 17.5px 15px;
    margin: 20px 0 30px;
  }
  #store .storesContent{
    width: 100%;
  }
  #store .storeItem{
    width: 100%;
    height: 160px;
    margin-bottom: 17.5px;
    border-radius: 5px;
    overflow: hidden;
  }
  #store .storeItem>div{
    width: 100%;
    height: 108px;
    position: relative;
  }
  #store .storeImg{
    width: 339.5px;
    height: 108px;
  }
  #store .storeType{
    width: 57.97px;
    height: 16.97px;
    background: #fff;
    border-radius: 8px;
    position: absolute;
    text-align: center;
    top:80px;
    left: 14px;
    font-size: 12px;
    line-height: 16.97px;
  }
  #store .storeAddress{
    width: 312.5px;
    height: 52.5px !important;
    background: #fff;
    padding: 12.5px 12.5px 2.5px 15px;
  }
  #store .storeName{
    height: 17.5px;
    color:#333;
    font-size: 14px;
    margin-bottom:2.5px; 
    line-height: 5px;
  }
  #store .addressDetail{
    height: 19px;
  }
  #store .addressDw{
    width: 51.56px;
    height: 19px;
    float: right;
    line-height: 8px;
  }
  #store .addressText,.dwd,.city{
    height: 19px;
    font-size:11px;
    color:#afafaf;
    line-height: 8px;
    margin: 0;
  }
  #store .addressText{
    width: 250.5px;
    float: left;
  }
</style>