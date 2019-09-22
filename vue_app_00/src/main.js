import Vue from 'vue'
import App from './App.vue'
import router from './router'
import bus from './bus'
//引入第三方组件库 mint ui
//1:完整引入mint-ui组件库中所有组件
import MintUI from "mint-ui"
//2:单独引入mint-ui组件库中样式文件
import "mint-ui/lib/style.css"
//3:将mint-ui注册vue实例中
Vue.use(MintUI)
//4:将字体图标引入到当前项目中
import "./font/iconfont.css"
import "./font/appfont.css"

//5:引入axios 第三方ajax模块
import axios from "axios"
//6:配置axios 基础路径
axios.defaults.baseURL="http://127.0.0.1:3000/"
//7:配置axios 保存session信息
axios.defaults.withCredentials=true
//8:将axios 注册vue 实例中
//由于axios不支持 use 将实例添加vue原型
Vue.prototype.axios = axios;
//9.引入qs模块
import qs from "qs";
Vue.prototype.qs=qs;
Vue.prototype.bus=bus;






Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App),
  data:{
    eventHub: new Vue()
  }
}).$mount('#app')

