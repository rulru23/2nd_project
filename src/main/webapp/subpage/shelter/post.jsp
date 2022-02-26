<%@page import="paging.PagingDAO"%>
<%@page import="animal.AnimalInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  
<title>Insert title here</title>

<style>

img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 450px;
}

</style>

<%AnimalInfoDAO aniDAO = new AnimalInfoDAO(); %>
<%PagingDAO paDAO = new PagingDAO(); %>

<%String kindCd; %>
<%String sexCd = "�˼�����"; %>
<%String neuterYn = "�̻�"; %>

<%String url; %>
<%int index; %>

<%String sido = request.getParameter("sido"); %>
<%String currentPageNo = request.getParameter("currentPageNo"); %>
<%String strIndex = request.getParameter("index"); %>
<%index = Integer.parseInt(strIndex); %>

<% url = paDAO.updateUrl(sido, currentPageNo);%>
<% aniDAO.updateUrl(url); %>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<div id = "main">
   <div id = "title">
      <div class="container mt-5 mb-5">
         <hr>
         <div class = "row mt-3">
         
            <div class = "col-lg-1">
            �����ȣ
            </div>
            
            <div class = "col-lg-8">
            [<%=aniDAO.getAniInfo().get(index).getNoticeNo() %>]
            </div>
            
<!--             <div class = "col-lg-3">
            ��¥
            </div> -->
         </div>
         <hr>
         <!--  <div class = "row mt-3">
         
            <div class = "col-lg-1">
            ���� ������
            </div>
            
            <div class = "col-lg-8">
            �����̸�
            </div>
            
            <div class = "col-lg-3">
            ��ȸ�� ���ƿ� ���
            </div>
         </div>
         <hr> -->
      </div>
   </div>
   
   <div id = "content">
      <div class="container mt-3 mb-4" >

      <div id="carouselExampleIndicators" class="carousel slide mb-5" data-bs-ride="carousel">
           <div class="carousel-indicators">
<!--              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
             <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
             <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button> -->
           </div>
           <div class="carousel-inner" height = "100px">
               	<img src="<%=aniDAO.getAniInfo().get(index).getPopfile()%>" style="margin-left: auto; margin-right: auto;">
             <!--  endfor --> 
           </div>
      </div>
      
	      <table class="table table-hover">
	         <thead class="table-light">
	          <tr>
	            <th scope="col" width="20%">���</th>
	            <th scope="col" width="50%">����</th>
				<th scope="col" width="30%"></th>
	          </tr>
	        </thead>
	        <tbody>
	          <tr>
	            <td>���� ������</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getNoticeSdt() %></td>
	          </tr>
	          <tr>
	            <td>���� ������</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getNoticeEdt() %></td>
	          </tr>
	          <tr>
	            <td >����</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getProcessState() %></td>
	          </tr>
	          <tr>
	            <td >����</td>
	            <%kindCd = aniDAO.getAniInfo().get(index).getKindCd().replace("[��] ", ""); %>
	            <td colspan="2"><%=kindCd %></td>
	          </tr>
	          <tr>
	            <td >����</td>
            	<%switch(aniDAO.getAniInfo().get(index).getSexCd()) {
					case "M" :
						sexCd = "����";
						break;
					case "F" :
						sexCd = "����";
						break;
					case "Q" :
						sexCd = "�̻�";
						break;
				}%>
	            <td colspan="2"><%=sexCd %></td>
	          </tr>
	          <tr>
	            <td >�߼�ȭ ����</td>
	            <%switch(aniDAO.getAniInfo().get(index).getNeuterYn()) {
					case "Y" :
						neuterYn = "��";
						break;
					case "N" :
						neuterYn = "�ƴϿ�";
						break;
					case "U" :
						neuterYn = "�̻�";
						break;
				}%>
	            <td colspan="2"><%=neuterYn %></td>
	          </tr>
	          <tr>
	            <td >Ư¡</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getSpecialMark().replace("." , "<br>") %></td>
	          </tr>
	          <tr>
	            <td >��ȣ���</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getCareAddr() %></td>
	          </tr>
	          <tr>
	            <td >��ȣ�� �̸� </td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getCareNm()%></td>
	          </tr>
	          <tr>
	            <td >��ȣ�� ��ȭ��ȣ</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getCareTel()%></td>
	          </tr>
	          <tr>
	            <td >�����</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getCareNm()%></td>
	          </tr>
	          <tr>
	            <td >����� ����ó</td>
	            <td colspan="2"><%=aniDAO.getAniInfo().get(index).getCareTel()%></td>
	          </tr>
	        </tbody>
	      </table>

      </div>
   </div>
   <div id = "tools">
      <div class="container mt-5 mb-4" align="center">
      <hr>
      <button type="button" class="btn btn-primary">�����ƿ�</button>
      </div>
   </div>
<!--    <div id = "replies">
      <div class="container mt-1 mb-5" >
         <hr>
         <h3>Reply</h3><br>
          Reply for
         <div class = "row mb-1">
            <div class = "col-lg-1">
            ���� ������
            </div>
            <div class = "col-lg-1">
            ���� �̸�
            </div>
            <div class = "col-lg-9">
            ��� ��¥
            </div>
            <div class = "col-lg-1">
            ���� x ���
            </div>
         </div>
         ��� ����
         <hr>
         
         <div class = "row mb-1">
            <div class = "col-lg-1">
            ���� ������
            </div>
            <div class = "col-lg-1">
            ���� �̸�
            </div>
            <div class = "col-lg-9">
            ��� ��¥
            </div>
            <div class = "col-lg-1">
            ���� x ���
            </div>
         </div>
         ��� ����<br>
         ��� ����<br>
         ��� ����<br>
         ��� ����<br>
         ��� ����<br>
         
         <hr>
         
         <div class = "row mb-1">
            <div class = "col-lg-1">
            ���� ������
            </div>
            <div class = "col-lg-1">
            ���� �̸�
            </div>
            <div class = "col-lg-9">
            ��� ��¥
            </div>
            <div class = "col-lg-1">
            ���� x ���
            </div>
         </div>
         ��� ����<br>
         ��� ����<br>
         ��� ����<br>
         ��� ����<br>
         ��� ����<br>
         
         <hr>
         endfor
         
          form 
         <h4 >Comment</h4>
         <div class = "row mt-4">
            <div class = "col-lg-11">
               <div class="form-floating">
                 <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
                 <label for="floatingTextarea">�Ƹ��ٿ� ���� ��� �մϴ�..</label>
               </div>
            </div>
            <div class = "col-lg-1">
               <button type="button" class="btn btn-secondary" id ="submit">���</button>
            </div>
         </div>
      </div>
   
   </div> -->
</div>


</body>
</html>