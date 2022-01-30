.<template>
  <div class="home">
    <!-- 导航栏 -->
    <el-row>
      <el-menu router :default-active="$route.path" class="el-menu-demo" mode="horizontal" 
        @select="handleSelect" background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
        <el-menu>
          <!-- <img float="left" height="50px" width="120px" src="../../assets/image/商标.png" alt=""> -->
        </el-menu>
        <el-menu-item index="/home">首 页</el-menu-item>
        <el-menu-item index="/shopping">购 物</el-menu-item>
        <el-menu-item index="/list">订 单</el-menu-item>
        <!-- <el-menu-item index="/mine">我 的 消 息</el-menu-item> -->
        <div class="tologin">
          <el-button type="primary" @click="toLogin">登录</el-button>
          <el-button @click="toRegister">注册</el-button>
        </div>
        <!-- <el-menu-item index="register"><a href="https://www.ele.me" target="_blank">订单管理</a></el-menu-item> -->
        <el-submenu index="/mine">
          <template slot="title"> 我 的 消 息 </template>
          <el-menu-item index="2-1">选项1</el-menu-item>
          <el-menu-item index="2-2">选项2</el-menu-item>
          <el-menu-item index="2-3">选项3</el-menu-item>
          <el-submenu index="2-4">
            <template slot="title">选项4</template>
            <el-menu-item index="2-4-1">选项1</el-menu-item>
            <el-menu-item index="2-4-2">选项2</el-menu-item>
            <el-menu-item index="2-4-3">选项3</el-menu-item>
          </el-submenu>
        </el-submenu>
      </el-menu>
    </el-row>
    <!-- 页头 -->
    <!-- <el-page-header @back="goBack" content="详情页面"></el-page-header> -->
    <el-row>
      <div class="lunbotu">
        <el-carousel :interval="4000"  trigger="click" height="350px">
          <el-carousel-item v-for="item in 6" :key="item">
            <h3 class="medium">{{ item }}</h3>
          </el-carousel-item>
        </el-carousel>
      </div>
    </el-row>
    
    <el-row :gutter="24" >
      <div class="input">
        <el-col :span="22"><el-input  placeholder="请输入内容" v-model="input" clearable></el-input></el-col>
        <el-col :span="2"><el-button  type="primary" >搜索</el-button></el-col>
      </div>
    </el-row>
    
    
  </div>
</template>

<script>
export default {
    data() {
      return {
        input:''
      };
    },
    methods: {
    handleSelect(key, keyPath) {
        console.log(key, keyPath);
    },
    toLogin() {
      this.$router.push("/login");
    },
    toRegister() {
      this.$router.push("/register");
    },
  },
};
</script>

<style scoped >
.tologin{
    margin: 10px 50px 10px 10px;
    float: right;
}
  .lunbotu{
    float: left;
    width: 100%;
    border: brown solid 3px;
    z-index:-1;
  }
  .input{
    float: left;
    border: rgb(46, 165, 42) solid 3px;
    margin-top: -150px;
    margin-left: 35%;
    z-index: 999;
  }
  .el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 200px;
    margin: 0;
  }
  
  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }
  
  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
</style>