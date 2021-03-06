<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- 触发模态框 -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">提交阶段产物</h4>
			</div>
			<div class="modal-body">


				<!-- 提交表单 --->
				<form role="form" id="submitform"
					action="<%=request.getContextPath()%>/upload/submit" method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="name">名称</label> <input type="text"
							class="form-control" id="submitname" name="submitname"
							placeholder="请输入名称">
					</div>
					<div class="form-group">
						<input type="file" id="inputfile" name="inputfile">
					</div>
					<div class="form-group">
						<label for="describle">描述</label>
						<textarea class="form-control" rows="4" id="describle"
							name="describle"></textarea>
					</div>
					<!-- 存放apply ID -->
					<input id="applyidforsubmit" name="applyidforsubmit" type="hidden">
				</form>
				<!-- 提交表单  -->

			</div>
			<div class="modal-footer" style="height: 55px;">
				<button type="button" class="btn btn-default" data-dismiss="modal"
					style="margin-left: -130px;">关闭</button>
				<button type="button" style="margin-left: -70px;"
					data-dismiss="modal" class="btn btn-primary"
					onclick="javascript:$('#submitform').submit();">提交更改</button>
			</div>
		</div>
	</div>
</div>
<!-- 触发模态框 -->

<!-- <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
 <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
 <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
 <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/public/js/jquery.form.min.js"></script>
<script type="text/javascript">
	//提交物上传
	/**
	 * 上传文件设置
	 */
	var submitUploadOptions = {
		beforeSubmit : function() {
			if ($("#inputfile").val() == "") {
				alert("没有选择要提交的文件！");
				return false;
			} else if ($("#submitname").val() == "") {
				alert("请为您的提交产物命名！");
				return false;
			} else if ($("#describle").val() == "") {
				alert("请对提价物做简单介绍！");
				return false;
			} else {
				return true;
			}
		}, //提交前处理 
		success : function(res) {
			if (res.code == 200) {
				//关闭窗口
				//$('#myModal').modal('hide');    		
				alert('文件上传成功！');
				//$('modal-backdrop fade in').remove();

			} else {
				//console.log(res.msg);
				alert(res.msg);
			}

		},
		error : function(res) {
			console.log(res);
		}, //处理完成 
		resetForm : false,
		dataType : 'json'
	};

	/**
	 * 上传文件是触发事件
	 */
	$("#submitform").submit(function() {
		$(this).ajaxSubmit(submitUploadOptions);
		return false;
	});

	function setApplyIdForSubmit(apply) {
		document.getElementById("applyidforsubmit").value = apply;
	}

	$(function() {
		$('#myModal').on('hide.bs.modal', function() {
			document.getElementById("inputfile").value = "";
			document.getElementById("submitname").value = "";
			document.getElementById("describle").value = "";
		})
	});
</script>

