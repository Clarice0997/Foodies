<template>
  <div class="list">
    <!-- 导航栏 -->
    <el-menu router :default-active="$route.path" class="el-menu-demo" mode="horizontal" 
      @select="handleSelect" background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
      <el-menu-item index="/home">首 页</el-menu-item>
      <el-menu-item index="/shopping">购 物</el-menu-item>
      <el-menu-item index="/list">订 单</el-menu-item>
      <el-menu-item index="/mine">我 的 消 息</el-menu-item>
    </el-menu>
    <!-- 子菜单 -->
    <el-row>
      <el-button @click="sydd" plain>所有订单</el-button>
      <el-button @click="dpjdd" type="primary" plain>待评价</el-button>
      <el-button @click="ywcdd" type="success" plain>已完成</el-button>
      <el-button @click="dsjqrdd" type="info" plain>待商家确认</el-button>
      <el-button @click="dqzdd" type="warning" plain>待取中</el-button>
      <el-button @click="yqxdd" type="danger" plain>已取消</el-button>
    </el-row>
    <!-- 主体 -->
    <el-row v-for="(shop,i) in shops" :key="shops[i].Sid">
      <router-link class="dbbox" tag="el-button" :to="{path:'/shop',query:{Sid:0+shops[i].Sid}}">
        <el-col :span="8">
          <div class="height240">
            <el-image style="height: 50px" :src="shops[i].Slogo" fit=cover></el-image>
            <span class="dp">{{shops[i].Sname}}</span>
            <div class="dp">该店铺已节约食物：<span style="color:green;font-size:36px">{{shops[i].food}}</span>g</div>
          </div>
        </el-col>
        <el-col :span="8" >
          <div class="height240">
            <el-image style="height: 240px" :src="shops[i].Spicture" fit=cover></el-image>
          </div>
        </el-col>
        <el-col :span="8" >
          <div class="height240">
            <el-rate v-model="shops[i].Sstars" disabled show-score text-color="#ff9900" score-template="{shops[i].Sstars}"></el-rate>
            <div class="dp">店铺地址：{{shops[i].Saddress}}</div>
            <div class="dp">联系电话：{{shops[i].Sphone}}</div>
            <div class="dp">营业时间：{{shops[i].Sbegin_business_time}}</div>
          </div>
        </el-col>
      </router-link>
    </el-row>
  </div>
</template>

<script>
export default {
  data() {
      return {
        shops:[{
          Sid:0,
          Sname:'高价位小面包',
          Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
          Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
          Saddress:'福建省福州市晋安区岳峰镇XX路106号',
          Sphone:'0591-12345678',
          Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
          Sstars:3.7,
          food:306
        }]
      };
    },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
    sydd(){
      console.log("这是所有订单");
    },
    dpjdd(){
      console.log("这是待评价订单");
    },
    ywcdd(){
      console.log("这是已完成订单");
    },
    dsjqrdd(){
      console.log("这是待商家确认订单");
    },
    dqzdd(){
      console.log("这是待取中订单");
    },
    yqxdd(){
      console.log("这是已取消订单");
    },
  },
};
</script>

<style scoped >
/* 店铺盒子 */
.dbbox{
  /* border: chartreuse solid 3px; */
  float: left;
  width: 80%;
  margin: 50px 10% 0 10%;
  border-radius: 50px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, .12), 0 0 6px rgba(0, 0, 0, .04)
}
.height240{
  height: 240px;
  /* border: chartreuse solid 3px; */
}
/* 五角星的大小 */
::v-deep .el-rate__icon {
    font-size: 50px;
}
/* 店铺文字部分 */
.dp{
  margin: 34px;
  font-size: 17px;
  /* background-color: aqua; */
}
</style>