.<template>
  <div class="truehome">
    <!-- 导航栏 -->
    <el-menu router :default-active="$route.path" class="el-menu-demo" mode="horizontal" @select="handleSelect"
      background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
      <el-menu-item index="/truehome">首 页</el-menu-item>
      <el-menu-item index="/shopping">购 物</el-menu-item>
      <el-menu-item index="/list" disabled>订 单</el-menu-item>
      <el-menu-item index="/mine" disabled>我 的 消 息</el-menu-item>
    </el-menu>
    <h1>欢迎您{{user.name}}</h1>
  </div>
</template>

<script>
import { validUser } from "../../api/index.js";
// import { getCookie } from "../../utils/cookie.js";
export default {
  data() {
    return {
      user: {},
    };
  },
  created() {
    // console.log(getCookie("token"));
    validUser().then((res) => {
      console.log(res);
      this.user = res.data
    });
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
  }
}
</script>

<style>
</style>