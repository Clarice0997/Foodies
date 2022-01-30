import request from'../utils/request.js'

//注册接口
export function register(data){
    return request({
        url:'/sys/register',
        method:"POST",
        data:{
            username:data.username,
            password:data.password,
            name:data.name,
        }
    })
}
//登录接口
export function login(data){
    return request({
        url:'/sys/loginWeb',
        method:"POST",
        data
    })
}

//从登录界面传参到首页的接口
export function validUser(){
    return request({
        url:'/sys/validUser',
        method:"POST"
    })
}
