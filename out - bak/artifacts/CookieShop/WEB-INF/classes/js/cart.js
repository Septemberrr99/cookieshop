
/**
 * 加入购物车
 */
function buy(goodid){
	$.post("goods_buy", {goodsid:goodid}, function(data){
		if(data=="ok")
		{
			layer.msg("添加到购物车!", {time:800}, function(){
               location.reload();
            });
		}
		else if(data=="fail")
		{
            layer.msg("库存不足,请购买其他商品!", {time:800}, function(){

            });
		}
		/*if(data=="ok"){
			layer.msg("操作成功!", {time:800}, function(){
				location.reload();
			});
		}else if(data=="login"){
			alert("请登录后购买!");
			location.href="login.jsp";
		}else if(data=="empty"){
			alert("库存不足!");
			location.reload();
		}else{
			alert("请求失败!");
		}*/

	});
}

function lessen(goodsid){
    $.post("goods_lessen", {goodsid:goodsid}, function(data){
        if(data=="ok"){
            layer.msg("操作成功!", {time:800}, function(){
                location.reload();
            });
        }
//		if(data=="ok"){
//			layer.msg("操作成功!", {time:800}, function(){
//				location.href="cart.action";
//			});
//		}else if(data=="login"){
//			alert("请登录后操作!");
//			location.href="login.jsp";
//		}else{
//			alert("请求失败!");
//		}
    });
}
/**
 * 购物车删除
 */
function deletes(goodid){
    $.post("goods_delete", {goodsid:goodid}, function(data){
        if(data=="ok"){
            layer.msg("删除成功!", {time:800}, function(){
                location.reload();
            });
        }
    });
}

// 送达时间选择
function submitOrder() {
    // 获取用户选择的送达时间
    // var dt = document.getElementById("delivery-time").value;
    // 获取当前时间
// 获取当前时间
    var currentTime = new Date();

// 计算三小时后的时间
    var deliveryTime = new Date(currentTime.getTime() + 11 * 60 * 60 * 1000);
    console.log(deliveryTime.toISOString());
// 将三小时后的时间设置为配送时间选择框的最小值
    document.getElementById("delivery-time").setAttribute("min", deliveryTime.toISOString().slice(0,16));



// // 将时间格式化为更美观的形式
//     var date = new Date(dt);
//     var formattedDate = date.getFullYear() + (date.getMonth() + 1) + '/' + date.getDate() + '/' ;
//     var hours = date.getHours();
//     var minutes = date.getMinutes();
//     var ampm = hours >= 12 ? 'PM' : 'AM';
//     hours = hours % 12;
//     hours = hours ? hours : 12;
//     minutes = minutes < 10 ? '0'+minutes : minutes;
//     var formattedTime = hours + ':' + minutes + ' ' + ampm;
//
// // 将格式化后的时间更新到输入框中
// //     document.getElementById("delivery-time").value = formattedDate + ' ' + formattedTime;
//     var delivertime = formattedDate + ' ' + formattedTime;


    // 判断用户是否选择了送达时间
    if (!delivertime) {
        alert("请选择送达时间");
        return;
    }

    // 创建 XMLHttpRequest 对象
    var xhr = new XMLHttpRequest();
    // 设置请求地址和请求方式
    xhr.open("POST", "/OrderConfirmServlet", true);
    // 设置请求头
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    // 发送请求并传递参数
    xhr.send("delivertime=" + delivertime);
    // 监听请求状态
    xhr.onreadystatechange = function() {
        if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
            // 处理返回的结果
            var result = xhr.responseText;
            alert(result);
        }
    };
}

