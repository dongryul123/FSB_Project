<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ include file="/modal1_Adding.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ����</title>
</head>
<body>
<!-- jquery  -->
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="lib/Bootstrap-4-4.1.1/css/bootstrap.min.css"/>
<script type="text/javascript" src="lib/Bootstrap-4-4.1.1/js/bootstrap.min.js"></script>

<!-- datatables -->
<link rel="stylesheet" type="text/css" href="lib/DataTables-1.10.24/css/dataTables.bootstrap4.min.css"/>
<script type="text/javascript" src="lib/DataTables-1.10.24/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/DataTables-1.10.24/js/dataTables.bootstrap4.min.js"></script>
<script>
$(document).ready(function() {
	/* �ʱ� ��ȸ ���� ���� */
	$('#REQUEST_TYPE').val('1'); //����
	$('#BZWR_STS').val('01'); //ó������
	$('#BZWR_DSTC').val('2'); //��������
	
	let befor7days= new Date();
	befor7days.setDate(befor7days.getDate()-5);
	document.getElementById('FROM_DATE').valueAsDate = befor7days; //FROM_DATE
	document.getElementById('TO_DATE').valueAsDate = new Date(); //TO_DATE
	
	/* ���̺� �ʱ� �ε� */
	let jobList = loadTableData();
	
	/* ���̺� Index ������ ���� �Լ� */
	jobList.on( 'order.dt search.dt', function () {
		jobList.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i+1;
	    } );
	} ).draw();

	/* ���̺� Ŭ�� �̺�Ʈ  -> Ŭ���� row�� �ش��ϴ� �����͸� �� ������ ������*/
	$('#job_list tbody').on('click', 'td:nth-child(-n+7)', function () {
		let data = jobList.row( this ).data();
	    console.log('Table Click Event',data);
	   	
		if($('#REQUEST_TYPE').val()!='2'){ //"����-���" ���¸� ���� ����.
	        $('#BZWR_INDC_CHGR').text(data.BZWR_INDC_CHGR_TXT); //������
	        $('#BZWR_EXC_CHGR').text(data.BZWR_EXC_CHGR_TXT); //�����
	        $('#BZWR_STS_2').val(data.BZWR_STS); //ó������(��������)
	        $('#BZWR_TTL').val(data.BZWR_TTL); //����
	        $('#BZWR_CNTN').val(data.BZWR_CNTN); //���� 
	        if($('#REQUEST_TYPE').val()=='1' || data.BZWR_STS=='02'){
	        	$('#BZWR_EXC_CHGR_BTN').hide();
				$('#BZWR_STS_2').attr("disabled",true);
				$('#BZWR_TTL').attr("disabled",true);
				$('#BZWR_CNTN').attr("disabled",true);
	        }else{
	        	$('#BZWR_EXC_CHGR_BTN').show();
				$('#BZWR_STS_2').removeAttr("disabled");
				$('#BZWR_TTL').removeAttr("disabled");
				$('#BZWR_CNTN').removeAttr("disabled");
	        }
		}
	} );

	/* ���õ�  row ���̶���Ʈ */
	$('#job_list tbody').on('click', 'tr', function() {
		$('#job_list tbody > tr').css('background-color','#ffffff');
		$(this).css('background-color','#f0f5f5');
	});

	/* ���̺� ��ư �̺�Ʈ(������Է�) */
	$('#job_list tbody').on( 'click', 'button[name="first_btn"]', function () {
	    let data = jobList.row( $(this).parents('tr') ).data();
		//console.log("First Button",data);
		setData(data); //��� �������� �����͸� �����ϱ� ���� �Լ�
		$('#exampleModal').modal();
	} );

	/* ���̺� ��ư �̺�Ʈ(��ü�����Ȳ) */
	$('#job_list tbody').on( 'click', 'button[name="second_btn"]', function () {
	    let data = jobList.row( $(this).parents('tr') ).data();
		//console.log("Second Button",data);
	    setData(data); //��� �������� �����͸� �����ϱ� ���� �Լ�
		$('#exampleModalCenter').modal();
	} );
	
	
	/* �۽Ź�ư */
	$('#action_submit').click(function(){
		let dvcd = $('#REQUEST_TYPE').val();
		if(dvcd=='1'){
			console.log('��ȸ');
			loadTableData();
		}else if(dvcd=='2'){
			console.log('���');
			createNewJob();
		}else if(dvcd=='3'){
			console.log('����');
			updateJob();
		}
	});

	/* ���� ���� �̺�Ʈ ó�� */
	$('#REQUEST_TYPE').change(function() {
		let dvcd = $('#REQUEST_TYPE').val();
		if(dvcd=='1'){
			$('#BZWR_EXC_CHGR_BTN').hide();
			$('#BZWR_STS_2').attr("disabled",true);
			$('#BZWR_TTL').attr("disabled",true);
			$('#BZWR_CNTN').attr("disabled",true);
		}else if(dvcd=='2'){
			$('#BZWR_INDC_CHGR').text('�α��� ����');
			$('#BZWR_EXC_CHGR').text('');
			$('#BZWR_EXC_CHGR_BTN').show();
			$('#BZWR_STS_2').attr("disabled",true);
			$('#BZWR_TTL').val("");
			$('#BZWR_CNTN').val("");
			$('#BZWR_TTL').removeAttr("disabled");
			$('#BZWR_CNTN').removeAttr("disabled");
		}else if(dvcd=='3'){
			$('#BZWR_EXC_CHGR_BTN').show();
			$('#BZWR_STS_2').removeAttr("disabled");
			$('#BZWR_TTL').removeAttr("disabled");
			$('#BZWR_CNTN').removeAttr("disabled");
			alert('������ �����͸� �������ּ���.');
		}
	});

} );


function loadTableData(){
	/* ���̺� ������ �ε� �� ���� */
	let sendData = {
    		REQUEST_TYPE:$('#REQUEST_TYPE').val(),
    		FROM_DATE:$('#FROM_DATE').val(), 
    		TO_DATE:$('#TO_DATE').val(),
    		BZWR_STS:$('#BZWR_STS').val(),
    		BZWR_DSTC:$('#BZWR_DSTC').val()
    };
	//console.log('sendData',sendData);
	return jobList = $('#job_list').DataTable( {
        ajax : {
        	url : 'lib/testJson2.json',
        	type : 'POST',
        	data : sendData
        },
        columns : [
			{data: null },
			{data: "BZWR_TTL" },
            {data: "BZWR_STS", render : function ( data, type, row, meta ) {
            	if(data=="01"){
            		return '������';
            	}else if(data=="02"){
            		return '�Ϸ�';
            	}
            }},
            {data: "BZWR_INDC_CHGR_TXT" },
            {data: "BZWR_EXC_CHGR_TXT" },
            {data: "BZWR_REG_DT" },
            {data: "BZWR_CMPL_DT" },
            {data: null , render : function ( data, type, row, meta ) {
                return '<button name="first_btn" class="btn btn-sm btn-default">�Է�</button>'
            }},
            {data: null , render : function ( data, type, row, meta ) {
                return '<button name="second_btn" class="btn btn-sm btn-default">Ȯ��</button>'
            }}
        ],
        columnDefs: [{ className: 'text-center', targets: [0,2,3,4,5,6,7,8] }],
        order: [[ 1, 'asc' ]]
    });
}

	
/* ��� */
function createNewJob(){
	$.ajax({
		url:'',
		dataType:'application/json',
		data : { 
			REQUEST_TYPE:$('#REQUEST_TYPE').val(), //����(��ȸ,���,����)
			BZWR_DSTC:$('#BZWR_DSTC').val(), //��������
			BZWR_INDC_CHGR:'�α��� ����', //�������ô����
			BZWR_EXC_CHGR:'�����', //������������
			BZWR_STS:'1', //�������� (��� �� �������� ����)
			BZWR_TTL:$('#BZWR_TTL').val(), //��������
			BZWR_CNTN:$('#BZWR_CNTN').val() //��������
		},
		success:function(data){
			alert('��� �Ǿ����ϴ�.');
	   }
	})
}


/* ���� */
function updateJob(){
	$.ajax({
		url:'',
		dataType:'application/json',
		data : { 
			REQUEST_TYPE:$('#REQUEST_TYPE').val(), //����(��ȸ,���,����)
			BZWR_DSTC:$('#BZWR_DSTC').val(), //��������
			BZWR_EXC_CHGR:'�����', //������������
			BZWR_STS:$('#BZWR_STS_2').val(), //��������
			BZWR_TTL:$('#BZWR_TTL').val(), //��������
			BZWR_CNTN:$('#BZWR_CNTN').val() //��������
		},
		success:function(data){
			alert('���� �Ǿ����ϴ�.');
	   }
	})
}
</script>
<div class="container" style="margin-top:30px">
	<!-- ��ȸ ���� -->
	<div>
		<div>
			<label style="font-weight:bold;">����&nbsp;</label>
			<select id="REQUEST_TYPE" style="margin-right:25px">
			    <option value="1">��ȸ</option>
			    <option value="2">���</option>
			    <option value="3">����</option>
			</select>
			<label style="font-weight:bold">��ȸ�Ⱓ&nbsp;</label>
			<input type="date" id="FROM_DATE" style="width:145px" value=""/>
			<label style="font-weight:bold">~&nbsp;</label>
			<input type="date" id="TO_DATE" value=""  style="margin-right:25px;width:145px"/>
			<label style="font-weight:bold;">ó������&nbsp;</label>
			<select id="BZWR_STS" style="margin-right:25px">
			    <option value="01">����</option>
			    <option value="02">�Ϸ�</option>
			    <option value="03">��ü</option>
			</select>
			<label style="font-weight:bold;">��������&nbsp;</label>
			<select id="BZWR_DSTC">
			    <option value="1">���þ���</option>
			    <option value="2">������</option>
			</select>
			<input type='button' id="action_submit" class="btn btn-sm btn-primary" style="float:right" value='�۽�'/>
		</div>
	</div>
	<hr/>
	<!-- ��� -->	
	<div>
		<table id="job_list" class="table table-sm table-bordered">
	        <thead>
	            <tr>
	            	<th>No</th>
	                <th>����</th>
	                <th>ó������</th>
	                <th>������</th>
	                <th>�����</th>
	                <th>�������</th>
	                <th>�Ϸ�����</th>
	                <th>������Է�</th>
	                <th>��ü�����Ȳ</th>
	            </tr>
	        </thead>
	    </table>
	</div>
	<hr/>
	<!-- �� -->
	<div>
		<table class="table table-bordered table-sm display" style="text-align:center;">
			<tr>
				<th scope="col" width="10%">������</th>
				<td scope="col" id="BZWR_INDC_CHGR" width="10%"></td>
				<th scope="col" width="10%">�����</th>
				<td scope="col" width="10%">
					<span id="BZWR_EXC_CHGR"></span>
					<button id="BZWR_EXC_CHGR_BTN" class="btn btn-sm btn-info" style="display:none">����</button>
				</td>
				<th scope="col" width="10%">ó������</th>
				<td scope="col" width="10%">
					<select id="BZWR_STS_2" class="form-control" disabled>
					    <option value="01">������</option>
					    <option value="02">�Ϸ�</option>
					</select>
				</td>
				<td scope="col"></td>
			</tr>
			<tr>
				<th scope="row">����</th><td colspan="6"><input type="text" id="BZWR_TTL" class="form-control input-sm" disabled/></td>
			</tr>
			<tr>
				<th scope="row">����</th><td colspan="6"><textarea ID="BZWR_CNTN" class="form-control input-sm" rows="5" disabled></textarea></td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>