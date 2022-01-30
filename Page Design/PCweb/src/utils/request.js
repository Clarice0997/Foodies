import axios from "axios";
import { getCookie } from "./cookie.js"

const instance = axios.create({
    baseURL: 'http://120.78.172.212:6003/students'
});

//拦截headers里的token，将token存入cookie
instance.interceptors.request.use((config) => {
    if (getCookie("token")) {
        config.headers.Authorization = "Bearer " + getCookie("token");
    }
//草泥马的Bearer后面有个空格，我日你仙人！
//草泥马的Bearer后面有个空格，我日你仙人！
//草泥马的Bearer后面有个空格，我日你仙人！
//草泥马的Bearer后面有个空格，我日你仙人！
//草泥马的Bearer后面有个空格，我日你仙人！
    console.log(config);
    return config;
});

instance.interceptors.response.use(
    (res) => {
        console.log('utils/request.js加载成功');
        return res.data
    },
    (err) => {
        console.log('utils/request.js加载失败');
        return err
    }
)

export default instance 