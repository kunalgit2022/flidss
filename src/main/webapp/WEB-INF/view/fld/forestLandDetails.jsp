<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tl" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../shared/header.jsp"%>
<%@ include file="../shared/sidebar.jsp"%>
<tl:eval expression="@environment.getProperty('api.geoserverurl')"
	var="geoserverUrl"></tl:eval>
<script
	src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.4.3/build/ol.js"></script>
<style>
.disabled {
	/*/  pointer-events:none; //This makes it not clickablemultiselect-selected-text
    opacity:0.6;         //This grays it out to look disabled*/
	display: none;
}
/* .ol-scale-bar{
          right: 8px;
          left: auto;
      } */
</style>
<div class="apploader-base">
	<div class="apploader"></div>
</div>
<!--  BEGIN CONTENT AREA  -->
<div id="content" class="main-content">
	<div class="layout-px-spacing">

		<div class="row layout-top-spacing">

			<div class="col-md-12 mb-1">
				<div class="statbox widget box box-shadow">
					<!-- <div class="widget-header">
                        <div class="row">
                            <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                <h4>Select Polygon</h4>
                            </div>
                        </div>
                    </div>-->
					<div class="widget-content widget-content-area">

						<form>
							<div class="row">
								<div class="col-md-2 mb-1 col-joint">
									<div class="btn-group custom-btn-group" id="btnDivDist">
										<button type="button" class="btn btn-dark" name="distdiv"
											value=1 id="btnDivision">Division</button>
										<button type="button" class="btn btn-secondary" name="distdiv"
											value=2 id="btnDistrict">District</button>
									</div>
								</div>

								<div class="col-md-2 mb-1" id="distDiv" style="display: none;">
									<select class="form-control form-control-sm" id="drpDistrict">
										<option value="">--Select District--</option>
										<c:forEach items="${distList}" var="dList">
											<%-- <c:if test="${dList.intId} ne '0'"> --%>
											<option value="${dList.intId}">${dList.chrvDistrictNm}</option>
											<%-- </c:if> --%>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-2 mb-1" id="divsnDiv">
									<select class="form-control form-control-sm" id="drpDivision"
										onchange="divListChange(this)">
										<option value="">--Select Division--</option>
										<c:forEach items="${divList}" var="diviList">
											<option value="${diviList.intId}">${diviList.chrvDivisionNm}</option>
										</c:forEach>

									</select>
								</div>
								<div class="col-md-2 mb-1" id="flDiv">
									<%-- <select class="form-control form-control-sm" id="drpfltype" path="" name="drpfltype" >
	                                    <!-- <option value="" selected="selected">-- Forest Land Type --</option> -->
										<c:forEach items="${fLandType}" var="flType">
											<option value="${flType.intId}">${flType.chrvFbLandType}</option>
										</c:forEach>
	                                </select> --%>
									<select class="form-control form-control-sm fav_clr"
										id="drpfltype" name="drpfltype" multiple="multiple">
										<!-- <option value="" selected="selected">-- Forest Land Type --</option> -->
										<!-- <option value="0">Select All</option> -->
										<c:forEach items="${fLandType}" var="flType">
											<option value="${flType.intId}">${flType.chrvFbLandType}</option>
										</c:forEach>
									</select>
									<script type="text/javascript">
	                                    $(document).ready(function() {
	                                        $('#drpfltype').multiselect();
	                                        //$('#drpfltype').multiselect('select', 1);
	                                    });
	                                </script>
									<%-- <select class="form-control form-control-sm" id="drpfltype" path="" name="drpfltype"> 
										<!-- <option selected="selected">-- Forest Land Type --</option>
										<option>Notified Forest</option>
										<option>DLC & Other Revenue Forest</option>
										<option>Deemed Forest</option> -->
										<option value="">-- Forest Land Type --</option>
										<c:forEach items="${fLandType}" var="flType">
											<option value="${flType.intId}">${flType.chrvFbLandType}</option>
										</c:forEach>
									</select> --%>
								</div>
								<div class="col-md-2 mb-1">
									<button type="button" id="btnAdvance"
										class="btn btn-success btn-md" data-toggle="modal"
										data-target="#advanceFilterModal">Advance Filter</button>
								</div>
								<div class="col-md-2 mb-1">
									<div class="btn-group custom-btn-group">
										<button type="button" class="btn" id="btnMapView">Map</button>
										<button type="button" class="btn btn-secondary"
											id="btnDataView">Data</button>

									</div>
								</div>
								<div class="col-md-2">
									<button type="button" class="btn btn-success" id="btnShow">Show</button>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>

		</div>

		<div id="divformMap" style="width: 100%;"></div>
		<div id="divforData" style="width: 100%;"></div>
		<!-- <div id="divMap" style="width:100%;"></div> -->
	</div>
</div>

<!--  ADVANCE FILTER MODAL  -->
<div class="modal fade" id="advanceFilterModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">Advance
					Filter</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" id="advModalClose">
					<svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
						width="24" height="24" viewBox="0 0 24 24" fill="none"
						stroke="currentColor" stroke-width="2" stroke-linecap="round"
						stroke-linejoin="round" class="feather feather-x">
						<line x1="18" y1="6" x2="6" y2="18"></line>
						<line x1="6" y1="6" x2="18" y2="18"></line></svg>
				</button>
			</div>
			<div class="modal-body">

				<form action="">
					<div class="row">
						
						<div class="col-md-6">
							<div class="form-group" id="rngDiv">
								<label>Range</label> 
								<select class="form-control" id="drpRngList"
								name="drpRngList">
									<option value="">--Select--</option>
									<%-- <c:forEach items="${rngList}" var="rList">
											<option value="${rList.intId}">${rList.chrvRangeNm}</option>
										</c:forEach> --%>
								</select>
							</div>
							<div class="form-group" id="tehsilDiv">
								<label>Tehsil</label> 
								<select class="form-control"
								id="drpTehList" name="drpTehList">
									<option value="">--Select--</option>
									<c:forEach items="${tehsList}" var="tehList">
										<option value="${tehList.intId}">${tehList.chrvTahasilNm}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group" id="riDiv">
								<label>RI Circle</label> 
									<select class="form-control" id="drpRic" name="drpRic">
										<option value="">--Select--</option>
									</select>
							</div>
							<div class="form-group" id="villDiv">
								<label>Village</label> 
								<select class="form-control" id="drpVill" name="drpVill">
									<option value="">--Select--</option>
									<!-- <option selected="selected">-- Select --</option>
                       				<option>1</option>
                       				<option>2</option> -->
								</select>
							</div>							
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Area</label> 
								<select class="form-control" id="ddlArea">
									<!-- <option selected="selected">-- Select --</option>
                        				<option>1</option>
                        				<option>2</option> -->
								</select>
							</div>
							<div class="form-group">
								<label>Operator</label> 
								<select class="form-control"
								id="ddlOperator">
									<option selected="selected">-- Operator --</option>
									<option value="==">==</option>
									<option value=">=">>=</option>
									<option value="<="><=</option>
								</select>
							</div>
							<div class="form-group">
								<label>Value</label> <input type="text" maxlength="10" id="txtValue"
								class="form-control" placeholder="Enter Value">
							</div>
						</div>											
					</div>
					<hr>
					<div class="row form-group">
						<div class="col-md-12 text-center">
							<button type="button" class="btn btn-sm btn-success mr-1"
								id="btnApply">Apply</button>
							<button type="reset" class="btn btn-sm btn-warning" id="btnClear">Clear</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>

<!--  VIEW MODAL  -->
<div class="modal fade" id="viewModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">View
					Details</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
						width="24" height="24" viewBox="0 0 24 24" fill="none"
						stroke="currentColor" stroke-width="2" stroke-linecap="round"
						stroke-linejoin="round" class="feather feather-x">
						<line x1="18" y1="6" x2="6" y2="18"></line>
						<line x1="6" y1="6" x2="18" y2="18"></line></svg>
				</button>
			</div>
			<div class="modal-body">

				<div class="table-responsive">
					<table class="table table-bordered">
						<tbody>

						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
</div>

<!-- <input type="hidden" id="hfDivLayerName">
	<input type="hidden" id="hfDivLayerLink"> -->


<%@ include file="../shared/footer.jsp"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.4.3/proj4.js"></script>
<script src="https://epsg.io/32645.js"></script>
<script src="/v5.3.0-dist/32644.js"></script>
<script src="/assets/js/custom/layer_style.js"></script>

<script type="text/javascript">
    $(function () {
        $("#txtValue").keypress(function (e) {
            var keyCode = e.keyCode || e.which;
 
            $("#lblError").html("");
 
            //Regex for Valid Characters i.e. Alphabets.
            var regex = /^[0-9-]+$/;
 
            //Validate TextBox value against the Regex.
            var isValid = regex.test(String.fromCharCode(keyCode));
            return isValid;
        });
    });
</script>


<script type="text/javascript">
var status = 0;
var hdn_fid;
var geoserverUrl = '${geoserverUrl}';

$(document).ready(function() {
	//nfbData();
	forestlandmapview();
	fldDataview();
	
	 
	 $("#btnMapView").addClass("btn-dark");
    /* Set Page Header */
    $(".header-title-lg").text(" ODISHA FLI-DSS (Forest Land Information)");
    /*  Show Forest Land Details in modal popup */
    if(${infoBoxFld!=null && infoBoxFld==true}){
        $('#infoModal').modal({
            backdrop: 'static',
            keyboard: false
        })
        $("#infoModal").modal('show');
    } else {
        $("#infoModal").modal('hide');
    }
    
    /* End  Show Forest Land Details in modal popup */
    
    //Start of Select All
	   /*  $('#drpfltype').multiselect({
		  templates: {
		    li: '<li><a href="javascript:void(0);"><label class="pl-2"></label></a></li>'
		  }
		}); */

	  $(document).on('change', '.multiselect-container :checkbox:first', function() {
	  $('#drpfltype').multiselect(this.checked ? 'selectAll' : 'deselectAll').multiselect('refresh');
	  
	}); 

		  /*   $('#drpfltype').change(function(e) {
		         var selected = $(e.target).val();
		        var all=$("input[type='checkbox'][value='0']")

				alert(selected.length);
		    });  */
		    
    //End of select all
    
    /* highlight on click */
    //change button class on click function
    $("#btnDivision").click(function () {
		    $("#btnDivision").addClass("btn-dark").removeClass("btn-secondary");
		    $("#btnDistrict").addClass("btn-secondary").removeClass("btn-dark");
				//$("#forestAdmin").show();
			
		});
    
	    $("#btnDistrict").click(function () {
	    	$("#btnDistrict").addClass("btn-dark").removeClass("btn-secondary");
		    $("#btnDivision").addClass("btn-secondary").removeClass("btn-dark");   
			//$("#forestAdmin").hide();
	});
	    $("#btnDataView").click(function () {
		    $("#btnDataView").addClass("btn-dark").removeClass("btn-secondary");
		    $("#btnMapView").addClass("btn-secondary").removeClass("btn-dark");
		    $("#divformMap").hide();
		    $("#divforData").show();
		   /*  $(".tbody").html("");
		    $(".tbody").html(layerinfo); */
		   /*  if($("#tab2").hasClass("active")){
		    	bindRevData();
		    } */
			
		});
	    
	
	    $("#btnMapView").click(function () {
	    	$("#btnMapView").addClass("btn-dark").removeClass("btn-secondary");
		    $("#btnDataView").addClass("btn-secondary").removeClass("btn-dark");    
		    //$("#flDiv").hide();
		    $("#divformMap").show();
		    $("#divforData").hide();
	});
 //end of change button class on click function 
	  
    /*  On change of Forest Type and Dist/Division */
    var value1="";
    $('#drpfltype').on('change', function() {
    	flTypeListChange();
    	
    	 value1=$('#drpfltype').val();
    	 BindCondn();  
    	
    	 $("#drpdistDivList").val($("#drpdistDivList option:first").val());
    	 $("#distId").val($("#distId option:first").val());
         $("#divId").val($("#divId option:first").val());
         //clearSelectValue();
         if($("#drpDivision").val() != '')
     	{
     		//BindRangeDivwise($("#drpDivision").val())
     	}
         if($("#drpDistrict").val() != '')
      	{
        	 //distwiseRangeChange();
        	 //distwiseTehsilChange();
      	}
    });
      $('#drpdistDivList').on('change', function() {
    	  flTypeListChange();
        $("#distId").val($("#distId option:first").val());
        $("#divId").val($("#divId option:first").val());
        //clearSelectValue();
        if (value1 == "") {
            $("#drpdistDivList").val($("#drpdistDivList option:first").val());
            viewNotification(4);
            return false;
        } 
    });  
    /* End  On change of Forest Type and Dist/Division */
});
/* on change by button click division */
	$("#btnDivision").click(function(){
	  $("#divsnDiv").show();
	  $("#distDiv").hide();
	  if($("#drpDivision").val() != '')
    	{
    		BindRangeDivwise($("#drpDivision").val())
    	}
	  if($("#btnDivision").hasClass("btn-dark"))
	  {
	  	  $("#rngDiv").hide();  
	  	  $("#tehsilDiv").show();
	  }
	});
/* End */
/* on change by button click district */
	$("#btnDistrict").click(function(){
		  $("#distDiv").show();
		  $("#divsnDiv").hide();
		});
		

/*On change of District */
//Bind District wise Range dropdownlist
$("#drpDistrict").change(function() { 
	
	$("#chkDist").prop('checked', false);
	$("#chkDist" ).trigger( "click");
	$("#chkDist").prop('checked', true);
	clearSelectValue();
	distwiseRangeChange();
	distwiseTehsilChange();
});

//Bind District wise Range dropdownlist
$("#drpRngList").change(function() { 
	$("#chkRange" ).trigger( "click");
});


function distwiseRangeChange()
{
    var drpDistrict = $('#drpDistrict').val();
    if ($('#drpDistrict').val() != '') {
        $.ajax({
        	async: false,
            url: "/Utility/getDistwiseRange",
            data: {
                'distid': drpDistrict
            },
            type: "GET",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function(data) {
                var options = '';
                    $('#drpRngList').html('');
                    $('#drpRngList').append($("<option></option>").attr("value", "").text("--Select--"));
                    $.each(data, function(a, b) {
                        options += '<option value="' + b.strValue + '">' + b.text + '</option>';
                    });
                    $('#drpRngList').append(options);
                    
                  //Range for DGPS Checkbox
                    $('#drpRng').html('');
                    $('#drpRng').append($("<option></option>").attr("value", "").text("--Select--"));
                    $('#drpRng').append(options);   
            },
            error: function(errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}
//end

//Dist Wise Tehsil
function distwiseTehsilChange()
{
    var drpDistrict = $('#drpDistrict').val();
    if ($('#drpDistrict').val() != '') {
        $.ajax({
        	async: false,
            url: "/Utility/getDistwiseTahasil",
            data: {
                'distid': drpDistrict
            },
            type: "GET",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	  var optionstehsil = '';	
	           	   $('#drpTehList').html('');
	                  $('#drpTehList').append($("<option></option>").attr("value", "").text("--Select--"));
	                  $.each(data, function(a, b) {
	                	  optionstehsil += '<option value="' + b.value + '">' + b.text + '</option>';
	                  });
	                  $('#drpTehList').append(optionstehsil);
            },
            error: function(errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}
/*End On change of District */
  
 //Fltype change 
  function flTypeListChange() {
	 //clearSelectValue();
	    $('#divform').empty();
}; 

/* On change of Division */
function divListChange(e) {
	
    clearSelectValue();
    $('#divform').empty();
    if($(e).val() != '' && $(e).val() !=0)
    	{
    	try{
    	$("#chkDivision").prop('checked', false);
    	
    		//getDivLayer($(e).val());
    		
    		$("#chkDivision" ).trigger( "click");
    		$("#chkDivision").prop('checked', true);
    		
    		BindRangeDivwise($(e).val());
    		BindTehsilDivwise($(e).val());
    	}catch (e) {
			// TODO: handle exception
		}
    	
    	}
}
/* End On change of Division */
/* function getDivLayer(divid){
	$.ajax({
		async: false,
        url: '/Utility/getDivLayerList',
        data: {
        	'divid':divid,
            'type': 3
        },
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function(data) {
        	divLayerName=data[0].text;
        	
        	
        	$("#hfDivLayerName").val(data[0].text);
        	$("#hfDivLayerLink").val(data[0].strValue);
        	
        },
        error: function(errormessage) {
            alert(errormessage.responseText);
        }
    });	
} */

function BindRangeDivwise(e)
{
	if (e != '') {
        $.ajax({
        	 async: false,
            url: "/Utility/getDivwiseRange",
            data: {
                'divid': e
            },
            type: "GET",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function(data) {
            	//alert('runnig...');
            	//Range For Advance Filter
                $('#drpRngList').html('');
                var options = '';	
                $('#drpRngList').append($("<option></option>").attr("value", "").text("--Select--"));
                $.each(data, function(a, b) {
                    options += '<option value="' + b.strValue + '">' + b.text + '</option>';

                });
                $('#drpRngList').append(options);
                
                //Range for DGPS Checkbox
                $('#drpRng').html('');
                $('#drpRng').append($("<option></option>").attr("value", "").text("--Select--"));
                $('#drpRng').append(options);  
            },
            error: function(errormessage) {
                alert(errormessage.responseText);
            }
        });	
	}
}

//Bind Tehsil DivWise
function BindTehsilDivwise(e)
{
	if (e != '') {
        $.ajax({
        	 async: false,
            url: "/Utility/getDivwiseTahasil",
            data: {
                'divid': e
            },
            type: "GET",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function(data) {
                  var optionstehsil = '';	
	           	   $('#drpTehList').html('');
	                  $('#drpTehList').append($("<option></option>").attr("value", "").text("--Select--"));
	                  $.each(data, function(a, b) {
	                	  optionstehsil += '<option value="' + b.value + '">' + b.text + '</option>';
	                  });
	                  $('#drpTehList').append(optionstehsil);

            },
            error: function(errormessage) {
                alert(errormessage.responseText);
            }
        });	
	}
}
//End

//Clear Dropdownlist
function clearSelectValue() {

    $('#drpRngList').html('');
    $('#drpTehList').html('');
    $('#drpRngList').append($("<option></option>").attr("value", "").text("--Select--"));
    $('#drpTehList').append($("<option></option>").attr("value", "").text("--Select--"));

}
//Bind Area Type on change of forest land type
function BindCondn() {
	//var fltype=$("#drpfltype").val();
	var fltype=($("#drpfltype").val()== null||$("#drpfltype").val()=="")?0:$("#drpfltype").val();
	//alert('sm'+fltype[0]+'prd');
    //$('#divform').empty();
    if (fltype!= ' '|| fltype!=0) {
    	//alert(fltype);
        $.ajax({
            url: '/Utility/getAreaType',
            data: {'forestLandType':fltype},
            type: "GET",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function(data) {    
                $('#ddlArea').html('');
                var options = '';
                $('#ddlArea').append($("<option></option>").attr("value", "").text("--Select--"));
                
                
                $.each(data, function(a, b) {
                    //if(b.isNumeric){
                        options += '<option value="' + b.strValue + '"  >' + b.text+ '</option>';
                    //}
                });
                $('#ddlArea').append(options);
               

               // setSelectedtext();

            },
            error: function(errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}
//End of Area Type on change


//On check of don't show message in modal
$("#chkDontShow").click(function() {
    if ($("#chkDontShow").is(":checked")) {
        $.ajax({
            url: '/api/Utility/dontShowAgain',
            data: {
                'sessionName': 'infoBoxFld'
            },
            contentType: 'application/html; charset=utf-8',
            type: 'GET',
            dataType: "html",
        })
    }
});

//Check if a button is clicked or not
$("#btnDataView").click(function(){
    $(this).data('clicked', true);
});
$("#btnMapView").click(function(){
    $(this).data('clicked', true);
});
$("#btnDistrict").click(function(){
    $(this).data('clicked', true);
});
$("#btnDivision").click(function(){
    $(this).data('clicked', true);
});


//Button Show 
 $("#btnShow").click(function() 
	{	
	 $("#gdtab").show();
	 	if($("#drpDistrict").val()!=0 || $("#drpDivision").val()!=0 && $("#drpfltype").val()!=0)
		 {
	 		  if(/* $('#btnDataView').data('clicked') && */ $("#btnDataView").hasClass("btn-dark")) 
	 		 	{
		 			
	 			 	LoadFBLayer();
	 		    	 //fldDataview();
	 			}
	 	 		else if(/* $('#btnMapView').data('clicked') && */ $("#btnMapView").hasClass("btn-dark"))
	 	 		{
	 	 			
	 	 			if($("#chkNFB").is(":checked") && $("#chkRFFinal").is(":checked"))
	 				 {
	 	 				//$("#chkRange" ).trigger( "click");
	 	 				$("#chkVillage" ).trigger( "click");
	 				 }
	 	 			else if($("#chkNFB").is(":checked"))
		            {					   
	 	 				$("#chkRange" ).trigger( "click");	   
		            }
	 	 			 else if($("#chkRFFinal").is(":checked"))
		            {					   
	 	 				$("#chkVillage" ).trigger( "click");	   
		            }
	 	 			else if($("#chkCmpnstryAL").is(":checked"))
		            {					   
	 	 				$("#chkVillage" ).trigger( "click");	   
		            }
	 	 			//forestlandmapview();
	 	 			LoadFBLayer();
	 	 			
	 			}
		 }
	 	else
	 	{
	 		
	 		viewNotification(11);
	 		LoadFBLayer();
	 	}	 
	 	
    }); 
	
		$("#btnAdvance").click(function()
		{
			//on selection of district
			 if($("#drpfltype").val() == 1 && $("#btnDistrict").hasClass("btn-dark"))
			 {
				  //alert("rng");
			 	  $("#rngDiv").show();  
			 	  $("#tehsilDiv").hide();
			 	  $("#riDiv").hide();
			 	  $("#villDiv").hide();
			 	 $('.modal-backdrop').remove();
			 }
			 else if($("#drpfltype").val() == 1 && $("#btnDivision").hasClass("btn-dark"))
			 {
				 //alert("rng");
			 	  $("#rngDiv").show();  
			 	  $("#tehsilDiv").hide();
			 	  $("#riDiv").hide();
			 	  $("#villDiv").hide();
			 	 $('.modal-backdrop').remove();
			 }
			 else if($("#drpfltype").val() == 2 && $("#btnDivision").hasClass("btn-dark"))
			 {
				 //alert("rng");
				  $("#rngDiv").hide();  
			 	  $("#tehsilDiv").show();
			 	  $("#riDiv").show();
			 	  $("#villDiv").show();
			 	 $('.modal-backdrop').remove();
			 }
			 else if($("#drpfltype").val() == 2 && $("#btnDistrict").hasClass("btn-dark"))
			 {
				 //alert("tehsil");
				  $("#rngDiv").hide();  
			 	  $("#tehsilDiv").show();
			 	  $("#riDiv").show();
			 	  $("#villDiv").show();
			 	 $('.modal-backdrop').remove();
			 }
			 else if($("#drpfltype").val() == 4 && $("#btnDivision").hasClass("btn-dark"))
			 {
				 //alert("rng");
				  $("#rngDiv").hide();  
			 	  $("#tehsilDiv").show();
			 	  $("#riDiv").show();
			 	  $("#villDiv").show();
			 	 $('.modal-backdrop').remove();
			 }
			 else if($("#drpfltype").val() == 4 && $("#btnDistrict").hasClass("btn-dark"))
			 {
				 //alert("tehsil");
				  $("#rngDiv").hide();  
			 	  $("#tehsilDiv").show();
			 	  $("#riDiv").show();
			 	  $("#villDiv").show();
			 	 $('.modal-backdrop').remove();
			 }
			 else if($("#drpfltype").val()[0]==1 && $("#drpfltype").val()[1]==2)
			 {
				  $("#rngDiv").show();  
			 	  $("#tehsilDiv").show();
			 	  $("#riDiv").show();
			 	  $("#villDiv").show();
			 	 $('.modal-backdrop').remove();
			 }
			 $('.modal-backdrop').remove();
		});
			
//end


//Button Apply
$("#btnApply").click(function() {
	 $('#advanceFilterModal').modal('hide');
	 $('.modal-backdrop').remove();
});

//Button search
/* $("#btnSearch").click(function() {
    $('#divform').empty();
    var selection, dist_id, div_id, tahasil_id, range_code;
    status = 0;
    if ($('#drpfltype').val() != "")

    { */
        /* selection=($("#drpdistDivList").val()==null || $("#drpdistDivList").val()=="")?"":$("#drpdistDivList").val(); */
       /*  dist_id = ($("#distId").val() == null || $("#distId").val() == "") ? 0 : $("#distId").val();
        div_id = ($("#divId").val() == null || $("#divId").val() == "") ? 0 : $("#divId").val();
        tahasil_id = ($("#drpTehList").val() == null || $("#drpTehList").val() == "") ? 0 : $("#drpTehList").val();
        range_code = ($("#drpRngList").val() == null || $("#drpRngList").val() == "") ? "" : $("#drpRngList").val();
        
        $(".apploader-base").css("display", "block");
        $.ajax({
            url: '/partialForestLandDetails',
            data: {
                'land_type': $("#drpfltype").val(),
                'selection': $("#drpdistDivList").val(),
                'dist_id': dist_id,
                'div_id': div_id,
                'tahasil_id': tahasil_id,
                'range_code': range_code
            },
            contentType: 'application/html; charset=utf-8',
            type: 'GET',
            dataType: "html",
            success: function(result) {
            	
            	 $(".apploader-base").css("display", "none");
            	 
                $('#divform').show();
                $('#map').hide();
                $('#divform').empty();
                $('#divform').html(result);
                if ($("#hdnTotal").val() != "0") {
                    addRevForestPaggination($("#hdnTotal").val(), $("#hdnCurrent").val());
                }

            },
            error: function(errormessage) {
                alert(errormessage.responseText);
            }
        });
    } else { */
        //AlertNotify("Please cdltp type.");
  /*   }
}); */

/* Add RF Data-apply paggination technique*/
function addRevForestPaggination(totalRecord, pageSize) {
    var pageNo = 1;
    status = 1;
    if (totalRecord > pageSize) {
        totalRecord = totalRecord - pageSize;
        var len = Math.ceil(parseInt(totalRecord) / pageSize);
        let index = 0;
        let counter = parseInt(pageSize) + 1;
        getRevForestData(index, len, pageNo, pageSize, counter);
    }
}
/* End- Add RF Data-apply paggination technique*/

/* Get RF data by looping */
/* function getRevForestData(index, len, pageNo, pageSize, counter) {
  
    var selection, dist_id, div_id, tahasil_id, range_code;

    dist_id = ($("#distId").val() == null || $("#distId").val() == "") ? 0 : $("#distId").val();
    div_id = ($("#divId").val() == null || $("#divId").val() == "") ? 0 : $("#divId").val();
    tahasil_id = ($("#drpTehList").val() == null || $("#drpTehList").val() == "") ? 0 : $("#drpTehList").val();
    range_code = ($("#drpRngList").val() == null || $("#drpRngList").val() == "") ? "" : $("#drpRngList").val();
    //for (let i = 0;  i < len; i++) {

    if (status == 1) {

        $.ajax({
            url: '/getRevForestData',
            async: true,
            data: {
                'land_type': $("#drpfltype").val(),
                'selection': $("#drpdistDivList").val(),
                'dist_id': dist_id,
                'div_id': div_id,
                'tahasil_id': tahasil_id,
                'range_code': range_code,
                'pageNo': pageNo,
                'pageSize': pageSize
            },
            contentType: 'application/html; charset=utf-8',
            type: 'GET',
            dataType: "html",
            success: function(result) {
                // console.log(result);
                let data = JSON.parse(result);
                let jsonObj = [];
                let jsonitem = {};
                $.each(data, function(a, b) {
                    dtForest.row.add([counter, b.village, b.chrvTahasilNm, b.khataNo, b.plotNo, b.areaAc,
                        '<button type="button" class="btn btn-sm btn-success waves-effect waves-light"><i aria-hidden="true" class="fa fa-eye" id="btneye" ></i></button>' +
                        '<button type="button" class="btn btn-sm btn-info  waves-effect waves-light"><i aria-hidden="true" class="fa fa-map" ></i></button>'
                    ]);
                    counter = parseInt(counter) + 1;
                    if (a == data.length - 1) {
                        dtForest.draw(false);
                        pageNo = pageNo + 1;
                        index = index + 1;
                        if (index < len) {
                            getRevForestData(index, len, pageNo, pageSize, counter);
                        }
                    }
                });

            },
            error: function(errormessage) {
                alert(errormessage.responseText);
            }
        });

    }
} */
/* End- Get RF data by looping */
    
/* View NFB Details in modal popup*/
function BindFBDetails(fid) {
    $.ajax({
        url: '/partialFbWiseForestLandDetails',
        data: {
            'fid': fid
        },
        contentType: "application/json; charset=utf-8",
        type: 'GET',
        dataType: "html",

        success: function(result) {
            $('#modalDiv').empty();
            $('#modalDiv').html(result);
            $('#nfb_header').text("FB Name: " + $("#hdnNFBName").val());
            //$('#nfbModal').modal('toggle');
            $('#nfbModal').modal('show');

        },
        error: function(errormessage) {
            alert(errormessage.responseText);
        }
    });
}
/* END- View NFB Details in modal popup*/

/* View Map View of NFB Details */
function MapView(fid, nfbname) {
	   $("#divforData").hide();
	    $("#divformMap").show();
	    return;
   
}
/* End- View Map View of NFB Details */

/* View Map View */
function forestlandmapview() {
	
	
	/* if(!$("#btnMapView").hasClass("btn btn-dark"))
	{ */
	    var paramdist = $("#drpDistrict").val();
	    var paramdivision = $("#drpDivision").val();
	    //var paramrange = (($("#drpRngList").val() != "" || $("#drpRngList").val() != null) ? $("#drpRngList").val() : "");
	   // $("#map_header").text("Map View of Forest Block: " + nfbname);
	   // $("#hdn_fid").val(fid);
	   // $('#map').show();
	  // $('#divformMap').html("");
	    $("#divforData").hide();
	    $("#divformMap").show();
	   // $('#divform').hide();
	    $(".apploader-base").css("display", "block");
	    $.ajax({
	        async:false,
	    	url: '/forestlandmapview',
	        data: {
	            //'layer': 'cmv',
	            'distid': paramdist,
	            'divid': paramdivision
	            //'rangeCode': ""
	        },
	        contentType: "application/json; charset=utf-8",
	        type: 'GET',
	        dataType: "html",
	
	        success: function(result) {
	           // $('#modalDiv').empty();
	            $('#divformMap').html(result);
	            $(".apploader-base").css("display", "none");
	            
	        },
	        error: function(errormessage) {
	            alert(errormessage.responseText);
	        }
	    });
	//}
}
/* End- View Map View  */

/* View Map View */

function fldDataview() {
    if($('#drpfltype').val() != "")
    {	
	    $.ajax({
	        async:false,
	    	url: '/ForestlandDataView',
	        data: {
	        },
	        contentType: "application/json; charset=utf-8",
	        type: 'GET',
	        dataType: "html",
	
	        success: function(result) {
	            $('#modalDiv').empty();
	            $('#divforData').html(result);
	            $(".apploader-base").css("display", "none");	            
	        },
	        error: function(errormessage) {
	            alert(errormessage.responseText);
	        }
	    });
    }
    else
    	{
    	  //viewNotification(11);
    	}
}
/* End- View Map View  */

/* On click of back button */
function back() {
	$('#divforData').show();
	$("#divformMap").hide();
    //$('#map').hide();
}
/* End- On click of back button */


/* Bind RF/DLC Plot Details in a modal popup */
function BindRfDetails(village_code, plot_no) {
	//alert(village_code);
	$.ajax({
        url: '/plotwiseRevenueForestDetails',
        data: {
            'villageCode': village_code,
            'plotNo': plot_no
        },
        contentType: "application/json; charset=utf-8",
        type: 'GET',
        dataType: "html",

        success: function(result) {
            $('#rfmodalDiv').empty();
            $('#rfmodalDiv').html(result);
            if($("#drpfltype").val()==2)
            	$('#rf_header').text("Revenue Forest Plot Details");
            else
            	$('#rf_header').text("DLC Forest Plot Details");
            $('#rfModal').modal('show');
        },
        error: function(errormessage) {
            alert(errormessage.responseText);
        }
    });
}
/* End Bind RF/DLC Plot Details in a modal popup */

/* Start Map View of RF/DLC Plot Details */
function revMapView(village, village_code, plot_no) {
	var paramdist = ($("#drpDistrict").val()==0 ? 0 : $("#drpDistrict").val());
    var paramdivision = ($("#drpDivision").val() == 0 ?  0 :$("#drpDivision").val());
    $("#map_header").text("Map View of Revenue Forest Plot: " + plot_no + " (" + village + ")");
    $("#hdn_plot_no").val(plot_no);
     hdn_plot_no=plot_no;
    $("#hdn_tid").val($("#drpTehList").val());
    //$('#map').show();
    $("#divforData").hide();
    $("#divformMap").empty();
    $('#divform').hide();
    $(".apploader-base").css("display", "block");
    $.ajax({
        url: '/partialrevMapview',
        data: {
        	'land_type': $("#drpfltype").val(),
        	'distid': paramdist,
            'divid': paramdivision,
            'village_code': village_code
        },
        contentType: "application/json; charset=utf-8",
        type: 'GET',
        dataType: "html",

        success: function(result) {
            $('#modalDiv').empty();
            $('#divMap').html(result);
            $(".apploader-base").css("display", "none");
        },
        error: function(errormessage) {
            alert(errormessage.responseText);
        }
    });
} 
/* End Map View of RF/DLC Plot Details */


/* Bind CAF Details in a modal popup */
function BindCADetails(e) {
	 	
	var table = $('#tblCafDetails').DataTable();
	$('#mdlTahasil').text(table.cell(e, 1).data());
	$('#mdlRICircle').text(table.cell(e, 2).data());
	$('#mdlvillage').text(table.cell(e, 3).data());
	$('#mdlKhataNo').text(table.cell(e, 4).data());
	$('#mdlPlotNo').text(table.cell(e, 5).data());
	$('#mdlArea').text(table.cell(e, 6).data());
	
	 table.rows().every(function (rowIdx, tableLoop, rowLoop) {
	     if(rowIdx==e){
		  var data = this.node();
		  let slno=e;
		  let controlId=++slno;
		  
	      $('#mdlPS').text($(data).find('#hdnPs'+controlId).val());
	      $('#mdlThanaNo').text($(data).find('#hdnThanano'+controlId).val());
	      $('#mdlKissam').text($(data).find('#hdnKissam'+controlId).val());
	      $('#mdlDistrict').text($(data).find('#hdnDist'+controlId).val());
	      $('#mdlDivision').text($(data).find('#hdnDiv'+controlId).val());
	      $('#mdlRange').text($(data).find('#hdnRan'+controlId).val());
	      $('#mdlRORClass').text($(data).find('#hdnRorcls'+controlId).val());
	      $('#mdlLandClass').text($(data).find('#hdnLandcls'+controlId).val());
	      $('#mdlAreaha').text($(data).find('#hdnAreaha'+controlId).val())
		  $('#mdlGisAreaha').text($(data).find('#hdnCAreaha'+controlId).val())
	      $('#mdlVariation').text($(data).find('#hdnVariation'+controlId).val());
	      $('#mdlWacdha').text($(data).find('#hdnCden'+controlId).val());
	     }
	}); 
	
     $('#caModal').modal('show');
     
     
	
	/* $.ajax({
        url: '/plotwiseCADetails',
        data: {
            'villageCode': village_code,
            'plotNo': plot_no
        },
        contentType: "application/json; charset=utf-8",
        type: 'GET',
        dataType: "html",

        success: function(result) {
            $('#camodalDiv').empty();
            $('#camodalDiv').html(result);
            if($("#drpfltype").val()==4)
            	$('#ca_header').text("Compensatory Afforestation Details");
           
            $('#caModal').modal('show');
        },
        error: function(errormessage) {
            alert(errormessage.responseText);
        }
    }); */
}
/* End Of CAF Details */ 


/* Bind RI Circle  dropdownlist Tehsilwise */
       $("#drpTehList").change(function () {
    	   var tahasil_id = ($("#drpTehList").val() == null || $("#drpTehList").val() == "") ? 0 : $("#drpTehList").val();
    	   bindRiCircle(tahasil_id);
    }); 
    
    function bindRiCircle(tahasil_id){
    	$.ajax({
       	  url: '/Utility/getTehsilWiseRICircle',
       	  	async:false,
             data: {'tid':tahasil_id},
             type: "GET",
             contentType: "application/json;charset=utf-8",
             dataType: "json",
             success: function (data) {
           	  //console.log(data);
                 $('#drpRic').html('');
                 var options = '';
                 $('#drpRic')
                     .append($("<option></option>")
                         .attr("value", "")
                         .text("--Select--"));
                 $.each(data, function (a, b) {
                     options += '<option value="' + b.value + '">'+b.text + '</option>';
     
                 });
                 $('#drpRic').append(options);
             },
             error: function (errormessage) {
                 alert(errormessage.responseText);
             }
         });  
    }
    
/* End of RI Circle */
 
 /* Bind Village dropdownlist RI Circle Wise */
       $("#drpRic").change(function () {
    	var ric = $("#drpRic option:selected").text();
    	   $.ajax({
        	  url: '/Utility/getRICircleWiseVillage',
        	  async:false,
              data: {'tid':$('#drpTehList').val(),'ricname':ric},
              type: "GET",
              contentType: "application/json;charset=utf-8",
              dataType: "json",
              success: function (data) {
            	  console.log(data);
                  $('#drpVill').html('');
                  var options = '';
                  $('#drpVill')
                      .append($("<option></option>")
                          .attr("value", "")
                          .text("--Select--"));
                  $.each(data, function (a, b) {
                      options += '<option value="' + b.strValue + '">'+b.text+'</option>';
      
                  });
                  $('#drpVill').append(options);
              },
              error: function (errormessage) {
                  alert(errormessage.responseText);
              }
          });  
    }); 
/* End of RI Circle */
$("#advModalClose").click(function() {
	 $('#advanceFilterModal').modal('hide');
	 $("#btnClear" ).trigger( "click");
	 $('.modal-backdrop').remove();
});

</script>


<script type="text/javascript">
function loadByQueryStringByFbid() {
	let fbid=getUrlParameter('fbid');
	
	if(fbid){
		
		let fbname='';
	let divid=0;
	let range='';
	
	 $.ajax({
	        url: '/Utility/getNfbById',
	        async:false,
	        data: {
	            'fbid': fbid
	        },
	        contentType: "application/json; charset=utf-8",
	        type: 'GET',
	        dataType: "json",

	        success: function(result) {
	        	fbname=result.nfbMaster.nfbName;
	        	divid=result.divisionMaster.intId;
	        	range=result.nfbMaster.rangeMaster.chrvRangeCd;
	        },
	        error: function(errormessage) {
	            alert(errormessage.responseText);
	        }
	    });
	
    setTimeout(function() {
    	$('#drpDivision').val(divid);
    	$('#drpDivision').trigger( "change");
    	$('#drpRngList').val(range);
    	$('#drpRngList').trigger( "change");
    	 
    	 $('#chkNFB').trigger('click');
    	 $('#btnShow').trigger('click');
    	 
    	 selectedFb(parseInt(fbid),fbname);
    	
    }, 500);
	}
}
		function selectedFb(fbid,fbname){ 
			setTimeout(function() {
				MapView(fbid);
			$('input[type="search"]').val(fbname).trigger('keyup');
			}, 2000);
		}

		
		function loadByQueryStringByVillPlot() {
			let villcode=getUrlParameter('villcode');
			let plotno=getUrlParameter('plotno');
			
			if(villcode && plotno){
			let village='';
			let divid=0;
			let range='';
			let distid=0;
			let tehsilid=0;
			let ric='';
			
			 $.ajax({
			        url: '/Utility/getRevByVillPlot',
			        async:false,
			        data: {
			            'villcode': villcode,
			            'plotno':plotno
			        },
			        contentType: "application/json; charset=utf-8",
			        type: 'GET',
			        dataType: "json",

			        success: function(result) {
			        	village=result.village;
			        	divid=result.divisionMaster.intId;
			        	range=result.rangeMaster.chrvRangeCd;
			        	distid=result.districtMaster.intId;
			        	tehsilid=result.tehsilMaster.intId;
			        	ric=result.ric;
			        },
			        error: function(errormessage) {
			            alert(errormessage.responseText);
			        }
			    });
			
		    setTimeout(function() {
		    	
		    	$('#drpDivision').val(divid);
		    	$('#drpDivision').trigger("change");
		    	
		    	$('#drpTehList').val(tehsilid);
		    	$('#drpTehList').trigger("change");
		    	
		    	
		    	$("#drpRic option:contains(" + ric + ")").attr('selected', 'selected');
		    	$('#drpRic').trigger( "change");
		    	
		    	$('#drpVill').val(villcode);
		    	$('#drpVill').trigger( "change");
		    	 
		    	 $('#chkRFFinal').trigger('click');
		    	 $('#btnShow').trigger('click');
		    	 
		    	 selectedPlot(villcode,plotno,village);
		    	
		    }, 1000);
		}	
		}
		
		function selectedPlot(villcode,plotno,village){ 
			setTimeout(function() {
			revMapView(plotno,villcode);
			$('input[type="search"]').val(village+' '+plotno).trigger('keyup');
			}, 5000);
		}
		
</script>


<script type="text/javascript">
var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return typeof sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
    return false;
};


</script>

<script type="text/javascript">
function onLoad(loading, loaded) {
    if(document.readyState === 'complete'){
        return loaded();
    }
    loading();
    if (window.addEventListener) {
        window.addEventListener('load', loaded, false);
    }
    else if (window.attachEvent) {
        window.attachEvent('onload', loaded);
    }
};

onLoad(function(){
   //console.log('loading..');
},
function(){
	loadByQueryStringByFbid();
	loadByQueryStringByVillPlot();
});

</script>
