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
    count2: 2
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
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

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