<template>
  <div class="register">
    <!-- 导航栏 -->
    <el-menu router :default-active="$route.path" class="el-menu-demo" mode="horizontal" 
      @select="handleSelect" background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
      <el-menu-item index="/home">首 页</el-menu-item>
      <el-menu-item index="/shopping">购 物</el-menu-item>
      <el-menu-item index="/list" disabled>订 单</el-menu-item>
      <el-menu-item index="/mine" disabled>我 的 消 息</el-menu-item>
    </el-menu>
    <!-- 主体 -->
    <div class="body">
    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
      <h1>客中行Foodies | 注册</h1>
        <el-form-item label="用户名" prop="username">
          <el-input prefix-icon="el-icon-user" v-model="ruleForm.username"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input prefix-icon="el-icon-lock" :show-password="true" v-model="ruleForm.password"></el-input>
        </el-form-item>
        <el-form-item label="姓名" prop="name">
          <el-input prefix-icon="el-icon-user" v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')">立即注册</el-button>
          <el-button @click="toLogin">已有账号，立即登录</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import {register} from'../../api/index.js'
export default {
  data() {
      return {
        ruleForm: {
          username: '',
          password: '',
          name:''
        },
        rules: {
          username: [
            { required: true, message: '请输入您的用户名', trigger: 'blur' },
            // { min: 3, max: 8, message: '长度在 3 到 8 个字符', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '请输入密码', trigger: 'blur' },
            // { min: 8, max: 16, message: '长度在 8 到 16 个字符', trigger: 'blur' }
          ],
          name: [
            { required: true, message: '请输入您的姓名', trigger: 'blur' }
          ],
        }
      };
    },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
    submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            console.log(this.ruleForm);
              register(this.ruleForm).then(res=>{
                console.log(res);
                if(res.success){
                  this.$message({
                    message:"恭喜你，注册成功!!",
                    type:"success",
                    duration:1000
                  })
                }else{
                  this.$message({
                    message:res.data.msg,
                    type:"error",
                    duration:1000
                  })
                }
              })
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      toLogin() {
        this.$router.push('/login')
      }
  },
};
</script>

<style scoped>
.body{
    width:600px;
    height: 100%;
    margin: auto;
    display: flex;
    align-items: center;
    border: gray solid 3px;
    border-radius: 20px;
    background-image: linear-gradient(to top, #e6e9f0 0%, #eef1f5 100%);
}
/* .demo-ruleForm{
    background-color: rgb(54, 54, 54);
} */
h1{
    margin: 15px 0px 15px 50px;
    width:500px;
    color: rgb(34, 181, 218);
    text-align: center;
}
</style>