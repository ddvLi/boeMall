<template>
  <div id="myfooter">
    <img :src="focused?selectedImage:normalImage" alt="" class="imgstyle"/>
  </div>
</template>
<script>
export default {
  props:{
    focused:false,
    selectedImage:{default:""},
    normalImage:{default:""}
  }
}
</script>
<style scoped>
#myfooter .imgstyle{
    width: 22.98px;
    height: 22.98px;
    margin-bottom: 2.5px;
  }
</style>