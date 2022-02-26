<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">



          <link rel="stylesheet" href="css/custom.css">
<!--    <link rel="stylesheet" href="css/custom.css"> -->
   <title>ȸ������</title>

       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
      
       <script type="text/javascript">
   function joinCheckFunction() {
      mem_id = document.getElementById('mem_id').value;
      $.ajax({
         type:'POST',
         url:'./MemberJoinCheckServlet',
         data : {mem_id:mem_id},
         success: function(result) {
            if(result == 0) {
               $('#checkMessage').html('����� �� �ִ� ���̵��Դϴ�.');
               $('#checkType').attr('class','modal-content panel-success');
            }
            else {
               $('#checkMessage').html('����� �� ���� ���̵��Դϴ�.');
               $('#checkType').attr('class','modal-content panel-warning');
            }
            $('#checkModal').modal("show");
         }//�Ķ���� ������   // ��
      })
   }
   </script>


</head>
<body>
	<%
		String mem_id = null;
		if(session.getAttribute("mem_id") != null) {
			mem_id = (String) session.getAttribute("mem_id");
		}
		if (mem_id != null) {
			session.setAttribute("messageType", "���� �޽���");
			session.setAttribute("messageContent", "���� �α��� �����Դϴ�.");
			return;
		}
	%>
	<jsp:include page="header.jsp"></jsp:include>
<%-- <%@ include file="/./inc/header.jsp" %> --%>

	<div class="wrapper" align="center" style="margin-top:100px; height: 500px;">

	<form action="./join" method="post">
		<div class="wrap" style="width:430px;height:380px; border: 1px solid black; padding:0px;">
			
			<div class="subjecet">
				<h2>ȸ������</h2>
			</div>
			<hr>
			<!-- ���̵� -->
			<div style="display:flex;justify-content:center;margin-bottom:15px;margin-top:20px;">
				<div class="id_name" style="margin-left:85px;margin-right:12px;">���̵�</div>
				<div class="id_input_box" style="margin-left:2px;">
					<input class="id_input" id="mem_id" name="mem_id" >
					<button class="btn btn-primary" onclick="joinCheckFunction();" type="button">�ߺ�üũ</button>
				</div>
			</div>
			
			<!-- ��й�ȣ -->
			<div style="display:flex;justify-content:center;margin-bottom:15px;">
				<div class="pw_name" style="margin-right:12px;">��й�ȣ</div>
				<div class="pw_input_box">
					<input class="pw_input" type="password" name="mem_pw1" >
				</div>
			</div>
			
			<!-- ��й�ȣ Ȯ�� -->
			<div style="margin-left:-30px;display:flex;justify-content:center;margin-bottom:15px;">
				<div class="pwck_name" style="margin-right:9px;">��й�ȣ Ȯ��</div>
				<div class="pwck_nput_box">
					<input class="pwck_input" type="password" name="mem_pw2">
				</div>
			</div>
			
			<!-- �̸� -->
			<div style="margin-right:-22px;display:flex;justify-content:center;margin-bottom:15px;">
				<div class="user_name" style="margin-right:20px;">�̸�</div>
				<div class="user_input_box">
					<input class="user_input" name="mem_name">
				</div>
			</div>
			
			<!-- ��ȭ��ȣ -->
			<div style="display:flex;justify-content:center;margin-bottom:15px;">
				<div class="tel_name" style="margin-right:12px;">��ȭ��ȣ</div>
				<div class="tel_input_box">
					<input class="tel_input" name="mem_tel">
				</div>
			</div>
			
			<!-- �̸��� -->
			<div style="margin-right:-14px;display:flex;justify-content:center;margin-bottom:15px;">
				<div class="mail_name" style="margin-right:12px;">�̸���</div>
				<div class="mail_input_box">
					<input class="mail_input" type="email" name="mem_email" >
				</div>
			</div>
				
			<!-- �����ϱ� -->			
			<div>
				<input type="submit" style="margin-top:10px;" class="join_button" value="�����ϱ�">
			</div>
		
		</div>
	</form>
</div>


   <%
   String messageContent = null;
   if(session.getAttribute("messageContent")!=null) {
      messageContent = (String) session.getAttribute("messageContent");      
   }
   String messageType = null;
   if(session.getAttribute("messageType")!=null) {
      messageType = (String) session.getAttribute("messageType");      
   }
   if(messageContent != null) {
   %>
   <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="vertical-alignment-helper">
         <div class="modal=dialog vertical-align-center">
            <div class="modal-content  <%if(messageType.equals("���� �޽���")) out.println("panel-warning"); else out.println("panel-success");%>">
                  <div class="modal-header panel-heading">
                     <h4 class="modal-title">
                        <%=messageType %>
                     </h4>
                  </div>
                  <div class="modal-body">
                     <%=messageContent %>
                  </div>
            </div>
            
         </div>
      </div>
   </div>
   
   <script>
      $('#messageModal').modal("show");
      
   </script>
   <% 
      session.removeAttribute("messageContent");
      session.removeAttribute("meesageType");
   }         
   %>
   
   
   <div class="modal fade" id="checkModal" tabindex ="-1" role="dialog" aria-hidden="true">
      <div class="vertical-alignment-helper">
         <div class="modal-dialog vertical-align-center">
            <div id="checkType"class= "modal-content panel-info">
               <!-- �ǽð� ����� ���� ���� ���� ������ ��� -->
               <div class="modal-header panel-heading">
                  <h4 class="modal-title">
                     Ȯ�� �޽���
                  </h4>
               </div>
               <div class="modal-body" id="checkMessage">
               </div>
            </div>            
         </div>
      </div>
   </div>
   <jsp:include page="footer.jsp"></jsp:include>
     
</body>
</html>