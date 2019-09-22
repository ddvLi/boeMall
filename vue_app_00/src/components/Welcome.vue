<template>
  <div id="wel">
    <img class="wel" src="../../public/images/welcome.png" alt="">
  </div>
</template>
<script>
export default {
  data(){
    return {
      t:"",
      time:3
    }
  },
  created() {
    if(this.t==""){
      this.t=setInterval(()=>{
      this.time=this.time-1;
        if(this.time==0){
          clearInterval(this.t);
          this.$router.push("/Home");  
        }
      },1000);
    }
  }
}
</script>
<style scoped>
  body{
    background: #D4D9DC;
    outline:none;
  }
  #wel{
    background: #D4D9DC;
  }
  #wel,.wel{
    width: 100%;
    height: 100vh;
  }
  
  
  
</style>