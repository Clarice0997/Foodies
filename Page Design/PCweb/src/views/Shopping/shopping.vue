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
    <!-- 搜索框 -->
    <el-row :gutter="0" >
      <div class="input">
        <el-col :span="8" :offset="7"><el-input  placeholder="请输入您所想要的店铺名" v-model="input" clearable></el-input></el-col>
        <el-col :span="2" :offset="0"><el-button type="primary" icon="el-icon-search">搜索</el-button></el-col>
      </div>
    </el-row>
    <!-- 主体 -->
    <!-- <div style="overflow: auto"> -->
    <!-- <ul v-infinite-scroll="load" infinite-scroll-disabled="disabled" > -->
      <!-- <li> -->
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
      <!-- </li> -->
    <!-- </ul> -->
      <!-- <p v-if="loading">加载中...</p>
      <p v-if="noMore">没有更多了</p>
    </div> -->
  </div>
</template>

<script>
export default {
  data() {
      return {
        input:'',
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
            },
            {
              Sid:1,
              Sname:'高价位小面包1111111',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },
            {
              Sid:2,
              Sname:'高价位小面包22222222',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },
            {
              Sid:3,
              Sname:'高价位小面包33333',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },
            {
              Sid:4,
              Sname:'高价位小面包444444',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },
            {
              Sid:5,
              Sname:'高价位小面包555555',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },
            {
              Sid:6,
              Sname:'高价位小面包666666',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },
            {
              Sid:7,
              Sname:'高价位小面包77777',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },
            {
              Sid:8,
              Sname:'高价位小面包88888',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },
            {
              Sid:9,
              Sname:'高价位小面包9999',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },
            {
              Sid:10,
              Sname:'高价位小面包10101010',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },
            {
              Sid:11,
              Sname:'高价位小面包111111',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },
            {
              Sid:12,
              Sname:'高价位小面包21211221',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },
            {
              Sid:13,
              Sname:'高价位小面包13131',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },
            {
              Sid:14,
              Sname:'高价位小面包141414',
              Slogo: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01518e598baa15a801215603abf075.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218565&t=d7c530633752acb1bdd74b662a2dbe26',
              Spicture:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.sjht360.com.cn%2Fd%2Ffile%2Fp%2F2021%2F07-19%2F420c91902c812a32ae682101090865c2.jpg&refer=http%3A%2F%2Fwww.sjht360.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1646218354&t=c6b6fd95112eb1a149be1be4dadfce87',
              Saddress:'福建省福州市晋安区岳峰镇XX路106号',
              Sphone:'0591-12345678',
              Sbegin_business_time:'周一至周五8：00-19：00周末11：30-19：00',
              Sstars:3.7,
              food:306
            },

            ],
        // loading:false
      };
    },
  // computed: {
  //     noMore () {
  //       return this.shop.length >= 14
  //     },
  //     disabled () {
  //       console.log(this.shop.length)
  //       return this.loading || this.noMore
  //     }
  //   },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
    // load () {
    //   this.loading = true
    //   setTimeout(() => {
    //     this.shop.length += 2
    //     this.loading = false
    //   }, 2000)
    // }
  }
}
</script>

<style scoped >
.input{
  margin: 10px;
}
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