<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!-- 触发模态框 -->
<!-- 
<a href="##" data-toggle="modal" data-target="#myModal">点击弹框</a>
-->
<!-- <h3 class='team-state-submit' data-toggle="modal" data-target="#myModal">比赛正在进行，点击提交阶段产物</h3>
 -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               提交阶段产物
            </h4>
         </div>
         <div class="modal-body">
            

         <!-- 提交表单 --->
         <form role="form">
            <div class="form-group">
                 <label for="name">名称</label>
                <input type="text" class="form-control" id="submitname" 
                placeholder="请输入名称">
            </div>
           <div class="form-group">               
               <input type="file" id="inputfile">              
           </div>
           <div class="form-group">
               <label for="inputfile">描述</label>
               <textarea class="form-control" rows="3"></textarea>               
           </div>
           <!-- 
           <button type="submit" class="btn btn-default">提交</button>
           -->
       </form>
       <!-- 提交表单  -->

         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary">
               提交更改
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
<!-- 触发模态框 -->
    
    
