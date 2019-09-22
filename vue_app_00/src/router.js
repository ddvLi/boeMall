import Vue from 'vue'
import Router from 'vue-router'

import Welcome from "./components/Welcome.vue"
import Mall from "./components/Mall.vue"
import Home from "./Home.vue"
import Store from "./components/Store.vue"
import Mine from "./components/Mine.vue"
import Login from "./components/Login.vue"
import StoreDetail from "./components/StoreDetail.vue"
import BaiduMap from "./components/BaiduMap.vue"
import Caritem from "./components/Caritem.vue"
import Product from "./components/Product.vue"
import Car from "./components/Car.vue"
import Slide from "./components/Slide.vue"



Vue.use(Router)
export default new Router({
  routes: [
    {path:'/',component:Welcome},
    {path:'/Home',component:Home},
    {path:'/Mall',component:Mall},
    {path:'/Store',component:Store},
    {path:'/Mine',component:Mine},
    {path:'/Login',component:Login},
    {path:'/StoreDetail/:sid',component:StoreDetail},
    {path:'/BaiduMap/:sid',component:BaiduMap},
    {path:'/Caritem',component:Caritem},
    {path:'/Product/:pid',component:Product},
    {path:"/Car/:uid",component:Car},
    {path:'/Slide/:index',component:Slide}
  ]
})
