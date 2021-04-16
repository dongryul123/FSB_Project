<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- jquery  -->
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	
	<!-- bootstrap -->
	<link rel="stylesheet" type="text/css" href="lib/Bootstrap-4-4.1.1/css/bootstrap.min.css"/>
	<script type="text/javascript" src="lib/Bootstrap-4-4.1.1/js/bootstrap.min.js"></script>
	


    
<!--     ��Ӵٿ� style -->
    <style>
	.dropbtn {
	  background-color: #4CAF50;
	  color: white;
	  padding: 16px;
	  font-size: 16px;
	  border: none;
	}
	
	.dropdown {
	  position: relative;
	  display: inline-block;
	}
	
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f1f1f1;
	  min-width: 160px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}
	
	.dropdown-content a {
	  color: black;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	}
	
	.dropdown-content a:hover {background-color: #ddd;}
	
	.dropdown:hover .dropdown-content {display: block;}
	
	.dropdown:hover .dropbtn {background-color: #3e8e41;}
	</style>

  </head>
  <script>
	function setData(data){
		let dataObjFromMain; //dataObjFromMain.JOB_CD ó�� �����ؼ� ���.
		dataObjFromMain=data;
		console.log('dataObjFromMain',dataObjFromMain); //Ȯ�ο�
		
		/* ���⿡ DB�� ������ ��û�ϰ� �޾ƿ��� view�� �����ϴ� ���� �ۼ� */
	}
  </script>
  <body>
    <!--
    <h1>In Page</h1>
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">����� �߰�</button> 
	-->
	
	
	<!-- 	### ����� �߰� -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">����� �߰�</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
		    <b>���� ������&emsp;</b> <em>OOO</em>
		    &emsp;&emsp;&emsp;&emsp;&emsp;
		    <b>���� �����&emsp;</b> <em>OOO</em>
	     	
	     	<br/><br/>
	     	
			<table>				
				<tr><!--��(row)����-->
	                <th><b>�߰� �����</b></th>
	                	
	               
	                	<!-- <input type="text" name = "UserID" value="" placeholder = "����� �Է�" style="width:100px; right:30%;"/> -->
	                	<!-- <input type="text" class="form-control" id="recipient-name" style="width:100px; padding-left:10px"> -->
	                	<td>
	                	&emsp;
	                		<select name="solar_birth_yn" id="solar_birth_yn">
		                		<option value="none">�� ��</option>
		 				       	<option value="1">IT</option>
					       	 	<option value="2">�Ϲݺ���</option>
					   		</select>
					   	&emsp;
					   		<select name="solar_birth_yn" id="solar_birth_yn">
		                		<option value="none">��</option>
		 				       	<option value="1">�������</option>
					       	 	<option value="2">����������</option>
					   		</select>
					   	&emsp;
					   		<select name="solar_birth_yn" id="solar_birth_yn">
		                		<option value="none">���</option>
		 				       	<option value="1">ȫ�浿</option>
					       	 	<option value="2">�赿��</option>
					   		</select>
					    </td>

	                <!-- <th rowspan="2"><input type="submit" value="�α���"/></th> -->
        	    </tr>
			</table>
			
			
			<hr>
	      
	        <form>
	          <div class="form-group">
	            <label for="recipient-name" class="col-form-label">�� ��</label>
	            <input type="text" class="form-control" id="recipient-name">
	          </div>
	          <div class="form-group">
	            <label for="message-text" class="col-form-label">�� ��</label>
	            <textarea class="form-control" id="message-text" style="height:100px"></textarea>
	          </div>
	        </form>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">�ݱ�</button>
	        <button type="button" class="btn btn-primary">���</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 	### ������Ȳ üũ -->
		<!-- Button trigger modal -->
	<!--  
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
	  ������Ȳ
	</button>
	-->
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle">������Ȳ</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
		     <table class="table">
				 <thead>
				   <tr>
				      <th>������</th>
				      <th>�����</th>
				      <th>ó�� ����</th>
   				      <th>���� ����</th>
				   </tr>
				 </thead>
				 <tbody>
				   <tr>
				      <td>John</td>
				      <td>Doe</td>
				      <td>������</td>
				      <td>2021.03.01</td>
				   </tr>
				   <tr>
				      <td>Doe</td>
				      <td>Moe</td>
				      <td>������</td>
   				      <td>2021.04.02</td>
				   </tr>
				   <tr>
				      <td>Moe</td>
				      <td>Ryul</td>
				      <td>�Ϸ�</td>
				      <td>2021.04.10</td>
				   </tr>
				 </tbody> 
			</table>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">�ݱ�</button>
	      </div>
	    </div>
	  </div>
</div>




 </body>
</html>