// pages/test/test.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    info: 'hello world',
    src: '/image/头像.jpg',
    randomNum: Math.random() * 10,
    randomNumFix: Math.random().toFixed(2) * 10,
    count: 1,
    count2: 2,
    msg: '你好',
    condition: 'false',
    type: '1',
    block: '0',
    arr1: ["苹果", "草莓", "梨"],
    List1: [{
        id: 1,
        name: '小红'
      },
      {
        id: 2,
        name: '小白'
      },
      {
        id: 3,
        name: '小黄'
      }
    ]
  },

  /**
   * 定义按钮触摸的事件处理函数
   */

  lg(event) {
    console.log(event)
    console.log(event.target.dataset)
    console.log(event.target.dataset.info)
  },
  /**
   * 定义按钮触摸 count增加事件
   */
  countadd() {
    this.setData({
      count: this.data.count + 1
    })
  },
  countadd2(e) {
    this.setData({
      count2: this.data.count2 + e.target.dataset.info
    })
  },

  /**
   * 定义文本框输入事件
   */
  inputHandler(e) {
    // e.detail.value变化后文本框最新数据
    console.log(e.detail.value)
  },

  /**
   * 数据绑定
   */
  iptHandler(e) {
    this.setData({
      msg: e.detail.value
    })
  },

  /**
   * block显示与隐藏
   */
  blockHandler() {
    if (this.data.block == 0) {
      this.setData({
        block: this.data.block = 1
      })
    } else {
      this.setData({
        block: this.data.block = 0
      })
    }
  },

  /**
   * Get请求
   */
  getInfo(){
    wx.request({
      url: 'https://www.escook.cn/api/get',
      data: {
        name:'rp',
        age:20
      },
      header: {'content-type':'application/json'},
      method: 'GET',
      dataType: 'json',
      responseType: 'text',
      success: (result)=>{
        console.log(result);
      },
      fail: ()=>{},
      complete: ()=>{}
    });
  },

  /**
   * Post请求
   */
   postInfo(){
    wx.request({
      url: 'https://www.escook.cn/api/post',
      data: {
        name:'rp',
        age:20
      },
      header: {'content-type':'application/json'},
      method: 'POST',
      dataType: 'json',
      responseType: 'text',
      success: (result)=>{
        console.log(result);
      },
      fail: ()=>{},
      complete: ()=>{}
    });
  },  


  


  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getInfo()
    this.postInfo()
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})