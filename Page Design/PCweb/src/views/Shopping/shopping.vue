<template>
  <div class="shopping">
    <!-- 导航栏 -->
    <el-menu router :default-active="$route.path" class="el-menu-demo" mode="horizontal" 
      @select="handleSelect" background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
      <el-menu-item index="/home">首 页</el-menu-item>
      <el-menu-item index="/shopping">购 物</el-menu-item>
      <el-menu-item index="/list">订 单</el-menu-item>
      <el-menu-item index="/mine">我 的 消 息</el-menu-item>
    </el-menu>
  </div>
</template>

<script>
export default {
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
  },
};
</script>

<style scoped >
</style>