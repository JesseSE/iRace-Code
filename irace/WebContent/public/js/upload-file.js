//提交物上传
//当对话框完全关闭时执行
 $(function () { 
	 $('#myModal').on('hidden.bs.modal', function () {      	
		 alert(document.getElementById("submitname").value);
		 var submitName = document.getElementById("submitname").value;
	 
	 })
 });







