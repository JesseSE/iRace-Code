//提交物上传
//当对话框完全关闭时执行
$(function () { $('#myModal').modal('hide')});
$(function () { $('#myModal').on('hide.bs.modal', function () {
	alert('嘿，我听说您喜欢模态框...');})
});


 /**
  * 上传文件设置
  */
 var submitUploadOptions = {
	beforeSubmit: function() {
    	if($("#inputfile").val() == "") {
    		alert("没有选择要提交的文件！");
    		return false;
    	}else if($("#submitname").val() == "") {
    		alert("请为您的提交产物命名！");
    		return false;
    	}else if($("#describle").val() == "") {
    		alert("请对提价物做简单介绍！");
    		return false;
    	} else {    		
    		return true;
    	}
    },  //提交前处理 
    success: function(res) {    	
    	if(res.code == 200) {
    		console.log("提交成功！")
    	} else {    		
    		alert(res.msg);
    	}
    	
    },
    error: alert("上传文件失败"),  //处理完成 
    resetForm: true,
    dataType:  'json'
};
 
 /**
  * 上传文件是触发事件
  */
 $("#submitform").submit(function(){		
 	$(this).ajaxSubmit(submitUploadOptions);
 	return false;
 });


 function setApplyIdForSubmit(apply){	 
	 document.getElementById("applyidforsubmit").value = apply;
}
