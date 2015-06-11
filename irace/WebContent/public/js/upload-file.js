//提交物上传
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
    		alert('文件上传成功！');
    	} else {    		
    		console.log(res.msg);
    	}
    	
    },
    error: function(res) {        			
		console.log(res);	       			
	},  //处理完成 
    resetForm: false,
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
