<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../shared/header.jsp"%>
<%@ include file="../shared/sidebar.jsp"%>

<!-- BEGIN LOADER -->
<div class="apploader-base">
	<div class="apploader"></div>
</div>
<!--  END LOADER -->

<div id="content" class="main-content">
	<div class="layout-px-spacing">

		<div class="row layout-top-spacing">

			<div class="col-md-12 mb-1">
				<div class="statbox widget box box-shadow">

					<div class="widget-content widget-content-area">
					
						<form>
							<div class="row">
								<div class="col-md-1">
									<label class="mt-2">Division</label>
								</div>
					
								<div class="col-md-2">								
									
									<select class="form-control form-control-sm" id="drpDivision" onchange="divListChange(this)">
										<option value="0">--Select--</option>
										<c:forEach items="${divList}" var="diviList">
											<option value="${diviList.intId}">${diviList.chrvDivisionNm}</option>
										</c:forEach>

									</select>	
								</div>
								
								<div class="col-md-1">							
									<label class="mt-2">Range</label>
									
								</div>
								<div class="col-md-2">
									<select class="form-control form-control-sm" id="drpRngList" onchange="rngListChange(this)">										
										<option selected="selected" value="0">-- All --</option>
										
									</select>																		
								</div>
								
								<div class="col-md-1">							
									<label class="mt-2">Forest Block</label>
									
								</div>
								<div class="col-md-2">
									<select class="form-control form-control-sm" id="drpNfbList">										
										<option selected="selected" value="">-- All --</option>
										
									</select>																		
								</div>
								
								<!-- <div class="col-md-3">
									<button type="button" class="btn btn-success"><i class="fa fa-search">&nbsp;</i>Search</button>
								</div> -->
			
							</div>
						</form>
					
					</div>
				</div>
			</div>
		</div>
	
		<div class="row layout-top-spacing">
			<div class="col-md-12 mb-1">
				<div class="statbox widget box box-shadow">
					<div class="widget-content widget-content-area">
					
						<div class="row">
							<div class="col-md-12">
								<p><small class="text-danger">Drag to arrange the order.</small></p>
							</div>
						</div>
					
						<div class='parent ex-1'>
                            <div class="row">

                                <div class="col-sm-6">
                                    <div id='left-defaults' class='dragula widget-header'>
                                    
                                    	<h4>Selection</h4>
                                    	
                                    	<div class="media  d-md-flex d-block text-sm-left text-center">                                            
                                            <div class="media-body">
                                                <div class="d-xl-flex d-block justify-content-between">
                                                    <div class="">
                                                        <h6 class="">Division</h6>   
                                                         <input type="hidden" value="Division">                                                      
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-info btn-sm"><i class="fa fa-arrows-alt">&nbsp;</i>Drag</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    	
										 <div class="media  d-md-flex d-block text-sm-left text-center">                                            
                                            <div class="media-body">
                                                <div class="d-xl-flex d-block justify-content-between">
                                                    <div class="">
                                                        <h6 class="">Range</h6>   
                                                         <input type="hidden" value="Range">                                                      
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-info btn-sm"><i class="fa fa-arrows-alt">&nbsp;</i>Drag</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
										
                                        <div class="media  d-md-flex d-block text-sm-left text-center">                                            
                                            <div class="media-body">
                                                <div class="d-xl-flex d-block justify-content-between">
                                                    <div class="">
                                                        <h6 class="">Type</h6>   
                                                         <input type="hidden" value="Type">                                                      
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-info btn-sm"><i class="fa fa-arrows-alt">&nbsp;</i>Drag</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                         <div class="media  d-md-flex d-block text-sm-left text-center">                                            
                                            <div class="media-body">
                                                <div class="d-xl-flex d-block justify-content-between">
                                                    <div class="">
                                                        <h6 class="fields">ReNotification of GR Boundary No. & Date</h6>
                                                        <input type="hidden" value="GRReNotifnNoDt">                                                        
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-info btn-sm"><i class="fa fa-arrows-alt">&nbsp;</i>Drag</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="media  d-md-flex d-block text-sm-left text-center">                                            
                                            <div class="media-body">
                                                <div class="d-xl-flex d-block justify-content-between">
                                                    <div class="">
                                                        <h6 class="">No. of Boundary Point</h6>   
                                                         <input type="hidden" value="NoofBounPoint">                                                      
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-info btn-sm"><i class="fa fa-arrows-alt">&nbsp;</i>Drag</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div id='right-defaults' class='dragula widget-header'>
                                    
                                    	<h4>Result</h4>
                                    
                                        <div class="media  d-md-flex d-block text-sm-left text-center">                                            
                                            <div class="media-body">
                                                <div class="d-xl-flex d-block justify-content-between">
                                                    <div class="" >
                                                        <h6 class="fields" id="resFbName">NFB Name</h6>  
                                                         <input type="hidden" value="NfbName">                                                        
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-info btn-sm"><i class="fa fa-arrows-alt">&nbsp;</i>Drag</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
										<div class="media  d-md-flex d-block text-sm-left text-center">                                            
                                            <div class="media-body">
                                                <div class="d-xl-flex d-block justify-content-between">
                                                    <div class="">
                                                        <h6 class="">NFA (Ha.)</h6>     
                                                        <input type="hidden" value="NFA">                                                    
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-info btn-sm"><i class="fa fa-arrows-alt">&nbsp;</i>Drag</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                         <div class="media  d-md-flex d-block text-sm-left text-center">                                            
                                            <div class="media-body">
                                                <div class="d-xl-flex d-block justify-content-between">
                                                    <div class="">
                                                        <h6 class="">Notification No. & Date</h6>  
                                                        <input type="hidden" value="NotifnNoDt">                                                        
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-info btn-sm"><i class="fa fa-arrows-alt">&nbsp;</i>Drag</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                       

                                        <div class="media  d-md-flex d-block text-sm-left text-center">                                            
                                            <div class="media-body">
                                                <div class="d-xl-flex d-block justify-content-between">
                                                    <div class="">
                                                        <h6 class="fields">GRFL Area Certified by FSO(Ha.)</h6>   
                                                        <input type="hidden" value="FsoCertifiedArea">                                                       
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-info btn-sm"><i class="fa fa-arrows-alt">&nbsp;</i>Drag</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        
                                    </div>
                                </div>
						
							</div>
							
							
							<div class="row small pt-2 pb-2">
								<div class="col-md-5">
									<strong>Max Area</strong> <span id="maxArea"></span>
								</div>
								<div class="col-md-5">
								<strong>Min Area</strong> <span id="minArea"></span>
								</div>
								<div class="col-md-2">
									<strong>Avg Area</strong> <span id="avgArea"></span>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12 text-center mb-2">
								
									<button type="button" class="btn btn-success" onclick="generateReport_click();"><i class="fa fa-file-o">&nbsp;</i>Generate Report</button>
									<!-- <button type="button" class="btn btn-success" onclick="viewReport_click();"><i class="fa fa-file-o">&nbsp;</i>View Report</button> -->
								</div>
							</div>
						</div>
					
						
					</div>
				</div>
			</div>
		</div>
	
	</div>
</div>

  <%@ include file="../shared/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	 $(".header-title-lg").text("ODISHA FLI-DSS (Forest Land Notification Status)");
	
	 getMinMaxAvgNfba(null,null);
});

</script>

<script>
/* On change of Division */
function divListChange(e) {
	getMinMaxAvgNfba(e.value,null);
   divisionWiseRange(e);
   
}
function rngListChange(e){
	getMinMaxAvgNfba($('#drpDivision').val(),e.value);
	rangeWiseNfb($('#drpDivision').val(),e.value)
}

function divisionWiseRange(e){
 if ($(e).val() != '') {
        $.ajax({
            url: '/Utility/getDivwiseRange',
            data: {
                'divid': e.value
            },
            type: "GET",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function(data) {
                $('#drpRngList').html('');
                var options = '';
                $('#drpRngList').append($("<option></option>").attr("value", "").text("--All--"));
                $.each(data, function(a, b) {
                    options += '<option value="' + b.strValue + '">' + b.text + '</option>';

                });
                $('#drpRngList').append(options);

            },
            error: function(errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}


function rangeWiseNfb(divid,rid){
	 if (rid != '') {
	        $.ajax({
	            url: '/Utility/getRangeWiseFB',
	            data: {
	                'divid': divid,
	                'rid' : rid
	            },
	            type: "GET",
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            success: function(data) {
	                $('#drpNfbList').html('');
	                var options = '';
	                $('#drpNfbList').append($("<option></option>").attr("value", "").text("--All--"));
	                $.each(data, function(a, b) {
	                    options += '<option value="' + b.value + '">' + b.strValue + '</option>';

	                });
	                $('#drpNfbList').append(options);

	            },
	            error: function(errormessage) {
	                alert(errormessage.responseText);
	            }
	        });
	    }
	}

</script>

<script type="text/javascript">
	var isGenReport=true;
	function generateReport_click() {
		alert("400opls")
		var res=0;
		$(".apploader-base").css("display", "block");
		
		var selectedFields=new Array();
		var x = document.getElementById("right-defaults").querySelectorAll("h6"); 
		var fields = document.getElementById("right-defaults").querySelectorAll("input[type=hidden]"); 
		for(var i=0; i<fields.length;i++){
			//alert(fields[i].value);
			selectedFields.push(fields[i].value);
		}
		//console.log(selectedFields);
		
		div_id = ($("#drpDivision").val() == null || $("#drpDivision").val() == "") ? 0 : $("#drpDivision").val();
        range_code = ($("#drpRngList").val() == null || $("#drpRngList").val() == "") ? "" : $("#drpRngList").val();
        nfbid = ($("#drpNfbList").val() == null || $("#drpNfbList").val() == "") ? "" : $("#drpNfbList").val();
		
		 $.ajax({
			 	async:false,
	            url: '/Reports/getForestLandData',
	            data: {
	                'divId': div_id,
	                'rngCode': range_code,
	                'nfbid':nfbid,
	                'fields':selectedFields
	            },
	            contentType: 'application/html; charset=utf-8',
	            type: 'GET',
	            dataType: 'html',
	            success: function(result) {
	            	res=1;
	            	$(".apploader-base").css("display", "none");
	            	costumeNotification("PDF report has been successfully generated.");
	            	if(isGenReport){
	            		var v="/Reports/filedown/"+'${userID}'+"ForestLandNotification.pdf";
	            		//alert(v);
	            		window.open(v);
	            	}
	            	
	            },
	            error: function(errormessage) {
	            	$(".apploader-base").css("display", "none");
	            	costumeNotification("Unable to generate PDF report! Please try again!");
	            }
	            
	        });
		 
		 //getMinMaxAvgNfba(div_id,range_code);
		 
		return res;
	}
</script>

<script type="text/javascript">
function viewReport_click(){
	isGenReport=false;
	if(generateReport_click()>0){
		//window.history.forward(1);
		setTimeout(function(){ 
			//window.open("/reports/downloads/ForestLandNotification.pdf");
			window.open("/Reports/partialPdfFlNotificationStatus");
		 }, 2000);
		
	}
	
}
</script>

<script type="text/javascript">
	function getMinMaxAvgNfba(divid,rid){
		$("#maxArea").text("");
		$("#minArea").text("");
		$("#avgArea").text("");
		
		divid=divid!=null?divid:0;
		getMaxNareaFb(divid,rid);
		getMinNareaFb(divid,rid);
		getAvgNarea(divid,rid);
	}
</script>

<script type="text/javascript">
	function getMaxNareaFb(divid,rid){
	        $.ajax({
	            url: '/Utility/getMaxNareaFb',
	            data: {
	                'divid': divid,
	                'rangeCode' : rid
	            },
	            type: "GET",
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            success: function(data) {
	              $("#maxArea").text(data[0].nareaha.toFixed(2)+" Ha. ("+data[0].nfb_name+" Forest Block under "+data[0].chrv_range_nm+" Range of "+data[0].chrv_division_nm+" Division.)");
	            },
	            error: function(errormessage) {
	                alert(errormessage.responseText);
	            }
	        });
	}
</script>

<script type="text/javascript">
	function getMinNareaFb(divid,rid){
	        $.ajax({
	            url: '/Utility/getMinNareaFb',
	            data: {
	                'divid': divid,
	                'rangeCode' : rid
	            },
	            type: "GET",
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            success: function(data) {
	              $("#minArea").text(data[0].nareaha.toFixed(2)+" Ha. ("+data[0].nfb_name+" Forest Block under "+data[0].chrv_range_nm+" Range of "+data[0].chrv_division_nm+" Division.)");
	            },
	            error: function(errormessage) {
	                alert(errormessage.responseText);
	            }
	        });
	}
</script>

<script type="text/javascript">
	function getAvgNarea(divid,rid){
	        $.ajax({
	            url: '/Utility/getAvgNarea',
	            data: {
	                'divid': divid,
	                'rangeCode' : rid
	            },
	            type: "GET",
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            success: function(data) {
	              $("#avgArea").text(data.toFixed(2));
	            },
	            error: function(errormessage) {
	                alert(errormessage.responseText);
	            }
	        });
	}
</script>
