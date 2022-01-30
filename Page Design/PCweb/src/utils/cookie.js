export function setCookie(key, value, time) {
    //cookie的key、value和时间（单位秒）
    let t = new Date().getTime()
    if (time) {
        t += time * 1000;
    } else {
        t += 60 * 60 * 1000;
    }
    document.cookie = key + "=" + value + ";expires=" + new Date(t).toUTCString();
}

export function getCookie(key) {
    const arr = document.cookie.split("; ")
    for (let index = 0; index < arr.length; index++) {
        const arr2 = arr[index].split("=");
        if (arr2[0] === key) {
            return arr2[1];
        }
    }
}

export function removeCookie() {
    // document.cookie = key + "=" +";expires=-1";
    setCookie(key,"",-1);//把时间设置成过期也是删除
}