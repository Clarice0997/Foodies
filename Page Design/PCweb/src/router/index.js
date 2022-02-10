import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect:'/home'
  }, 
  {
    path: '/home',
    component:()=>import("../views/Home/home.vue")
  },
  {
    path: '/truehome',
    component:()=>import("../views/Home/truehome.vue")
  },
  {
    path: '/shopping',
    component:()=>import("../views/Shopping/shopping.vue")
  },
  {
    path: '/shop',
    component:()=>import("../views/Shopping/shop.vue")
  },
  {
    path: '/list',
    component:()=>import("../views/List/list.vue")
  },
  {
    path: '/mine',
    component:()=>import("../views/Mine/mine.vue")
  },
  {
    path: '/login',
    component:()=>import("../views/Login/login.vue")
  },
  {
    path: '/register',
    component:()=>import("../views/Register/register.vue")
  }
]

const router = new VueRouter({
  routes
})

export default router
