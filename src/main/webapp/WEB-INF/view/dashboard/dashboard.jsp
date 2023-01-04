<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tl" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../shared/header.jsp"%>
<%@ include file="../shared/sidebar.jsp"%>



<style>
#containers {
	height: 400px;
}

.highcharts-figure, .highcharts-data-table table {
	/*min-width: 310px; 
  max-width: 800px;
  margin: 1em auto;*/
	
}L̥

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}
/* .highcharts-breadcrumbs-button, .highcharts-breadcrumbs-group{
	display: none;
} */
.bg-gray{
    background-color: #797979;
    border-color: #858585;
    color: #fff;
}
.dash-round{
	padding: 7px;
    border-radius: 15px;
}
/* Target CSS */
.buttons {
	min-width: 310px;
	text-align: center;
	margin-bottom: 1.5rem;
	font-size: 0;
}

.buttons button {
	cursor: pointer;
	border: 1px solid silver;
	border-right-width: 0;
	background-color: #f8f8f8;
	font-size: 1rem;
	padding: 0.5rem;
	outline: none;
	transition-duration: 0.3s;
	margin: 0;
}

.buttons button:first-child {
	border-top-left-radius: 0.3em;
	border-bottom-left-radius: 0.3em;
}

.buttons button:last-child {
	border-top-right-radius: 0.3em;
	border-bottom-right-radius: 0.3em;
	border-right-width: 1px;
}

.buttons button:hover {
	color: white;
	background-color: rgb(158, 159, 163);
	outline: none;
}

.buttons button.active {
	background-color: #0051B4;
	color: white;
}

.highcharts-label text {
	text-decoration: none !important;
}
</style>

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

						<div class="row">
							<div class="col-md-1">
								<label class="mt-2">Phase</label>
							</div>

							<div class="col-md-2">
								<select id="phasetype" multiple="multiple">
									<!-- 	<option value="0" selected="selected" id="all" >-- All Phase --</option> -->
									<option value="1">Phase 1</option>
									<option value="2">Phase 2</option>
									<option value="3">Phase 3</option>
									<option value="4">Phase 4</option>
								</select>
								<!-- <select class="form-control form-control-sm fav_clr"
										id="phasetype" name="phasetype" multiple="multiple">										
										<option value="0" selected="selected" id="all" >-- All Phase --</option>
										<option value="1" >Phase 1</option>
										<option value="2" >Phase 2</option>
										<option value="3" >Phase 3</option>
										<option value="4" >Phase 4</option>
									</select>  -->
								<!-- <div class="tree_main mt-2"  >
										<ul id="bs_main_1" class="main_ul">
											<li id="es_1">
												<span class="plus">&nbsp;</span>
												<i class="fa fa-folder text-warning"></i>
												<input type="checkbox" id="phasetype" name="phasetype"  value="0" selected="selected" />
												<label for="e_bs_1">-- All Phase --</label>
												<ul id="ef_l_1" style="display: none"
													class="inner_ul">
													<li id="io_1">
														<input type="checkbox" id="e_io_1" name="e_io_1" value="1" />
														<label for="e_io_1">Phase 1</label>																				
													</li>
													<li id="io_2">
														<input type="checkbox" id="e_io_2" name="e_io_2" value="2"/>
														<label for="e_io_2">Phase 2</label>																				
													</li>
													<li id="io_3">
														<input type="checkbox" id="e_io_3" name="e_io_3" value="3"/>
														<label for="e_io_3">Phase 3</label>																				
													</li>
													<li id="io_4">
														<input type="checkbox" id="e_io_4" name="e_io_4" value="4"/>
														<label for="e_io_4">Phase 4</label>																				
													</li>
												</ul>
											</li>
										</ul>
									</div> -->
								<!--  <script type="text/javascript">
	                                    $(document).ready(function() {
	                                        $('#phasetype').multiselect();
	                                        //$('#drpfltype').multiselect('select', 1);
	                                    });
	                                </script> -->

							</div>
							<div class="col-md-1">
								<button type="button" id="btnSearch"
									class="btn btn-success btn-sm mt-1">GO</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="layout-px-spacing mb-2">
		<div class="row layout-top-spacing">

			<div class="col">
				<div class="widget widget-card-four bg-success">
					<div class="widget-content">
						<div class="w-content">
							<div class="w-info">
								<div class="row">
									<div class="col-md-10 mb-2 mt-1">
										<h6 class="value text-white">Notified Forest Block</h6>
									</div>
									<div class="col-md-2">
										<div class="w-icon pull-right">
											<img src="../../assets/img/icon-notified-forest.png">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3 border-right">
										<p class="text-white">
											<b>Target</b><br>
											<small>No. of NFB:</small> <span id="trgNfbNo"></span> <br>
											<small>Area(Km<sup>2</sup>):
											</small> <span id="trgNfba"></span>
											<%-- <fmt:formatNumber value="${NFBArea}" pattern="#.##"></fmt:formatNumber> --%>
										</p>
									</div>
									<div class="col-md-9">
										<p class="text-white">
											<!-- <div class="text-center"><b>Achievement</b></div> -->
											<!-- <small>No. of NFB:</small> <span id="achvNfbNo"></span><br>
											<small>Area(Km<sup>2</sup>):
											</small> <span id="achvNfba"></span> -->											
										</p>
										<div class="row">
											<div class="col-md-12">
												<table class="small" width="100%">
													<thead>
														<tr>
															<th>Achievement</th>
															<th>No. of Blocks</th>
															<th>Area (ha.)</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>ORSAC Certification:</td>
															<td><span id="orscCert"></span></td>
															<td><span id="orscCertVal"></span></td>
														</tr>
														<tr>
															<td>FSO Certification:</td>
															<td><span id="fsoCert"></span></td>
															<td><span id="fsoCertVal"></span></td>
														</tr>
														<tr>
															<td>Re-notification:</td>
															<td><span id="reNotif"></span></td>
															<td><span id="reNotifVal"></span></td>
														</tr>
													</tbody>
												</table>
											</div>
											<!-- <div class="col-md-5">
												<p class="text-white">
													<b>Achievement</b><br>
													<span>ORSAC Certification:</span><br>
													<span>FSO Certification:</span><br>
													<span>Re-notification:</span>
												</p>
											</div>
											<div class="col-md-4">
												<p class="text-white">
													<b>No. of Blocks</b><br>
													<span id="orscCert"></span><br>
													<span id="fsoCert"></span><br>
													<span id="reNotif"></span>
												</p>
											</div>
											<div class="col-md-3">
												<p class="text-white">
													<b>Area (ha.)</b><br>
													<span id="orscCertVal"></span><br>
													<span id="fsoCertVal"></span><br>
													<span id="reNotifVal"></span>
												</p>
											</div> -->
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="col">
				<div class="widget widget-card-four bg-gray">
					<div class="widget-content">
						<div class="w-content">
							<div class="w-info">
								<div class="row">
									<div class="col-md-10 mb-2 mt-1">
										<h6 class="value text-white">
											 <small>DLC & Revenue Forest(as per ROR)</small>
										</h6>
									</div>
									<div class="col-md-2">
										<div class="w-icon pull-right">
											<img src="../../assets/img/icon-recorded-forest.png">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-4 border-right">
										<p class="text-white">
											<b>Target</b>
											<!-- <br><small>No. of Plots: </small> -->
											<br>Area(Km<sup>2</sup>): <span id="trgRfa"></span>
										</p>
										<!-- 21988.31 -->
									</div>
									<div class="col-md-4 border-right">
										<div class="bg-info dash-round">
											<p class="text-white">
												<b>Achievement<br>(DLC)
												</b><br>
												<small>No. of Plots: <span id="achvDLCPlots"></span>
													<br>Area(Km<sup>2</sup>):
												</small><span id="achvDLC"></span>
											</p>
										</div>
									</div>
									<div class="col-md-4">
										<div class="bg-warning dash-round">
											<p class="text-white">
												<b>Achievement<br>(Revenue Forest)
												</b><br>
												<small>No. of Plots: <span id="achvRfPlots"></span> <br>Area(Km<sup>2</sup>):
												</small><span id="achvRfa"></span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col">
				<div class="widget widget-card-four bg-orange">
					<div class="widget-content">
						<div class="w-content">
							<div class="w-info">
								<div class="row">
									<div class="col-md-10 mb-2 mt-1">
										<h6 class="value text-white">Other Deemed Forest</h6>
									</div>
									<div class="col-md-2">
										<div class="w-icon pull-right">
											<img src="../../assets/img/icon-deemed-forest.png">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 border-right">
										<p class="text-white">
											<b>Target</b><br>
											<small>Area(Km<sup>2</sup>): <span id="trgDeemed"></span></small><span
												id="trgDeemed"></span>
										</p>
										<!-- <p class="text-white"><b>Target</b><br>Nos: 0<br>Area (Km<sup>2</sup>): 7955.28</p> -->
									</div>
									<div class="col-md-6">
										<p class="text-white">
											<b>Achievement</b><br>No. of Patches: NA<br>Area
											(Km<sup>2</sup>): NA
										</p>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="col" style="display: none">
				<div class="widget widget-card-four bg-danger">
					<div class="widget-content">
						<div class="w-content">
							<div class="w-info">
								<div class="row">
									<div class="col-md-8 mb-2 mt-1">
										<h6 class="value text-white">Diverted Forest Land</h6>
									</div>
									<div class="col-md-4">
										<div class="w-icon pull-right">
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2"
												stroke-linecap="round" stroke-linejoin="round"
												class="feather feather-framer">
												<path d="M5 16V9h14V2H5l14 14h-7m-7 0l7 7v-7m-7 0h7"></path></svg>
										</div>
									</div>
								</div>

								<div class="row">
									<!-- <div class="col-md-6 border-right">
	                             		<p class="text-white"><b>Target</b><br>Nos: 0<br>Area (Km<sup>2</sup>): 0</p>
	                             	</div> -->
									<div class="col-md-6">
										<p class="text-white">
											<b>Achievement</b><br>Nos: NA<br>Area (Km<sup>2</sup>):
											NA
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col" style="display: none">
				<div class="widget widget-card-four bg-secondary">
					<div class="widget-content">
						<div class="w-content">
							<div class="w-info">
								<div class="row">
									<div class="col-md-8 mb-2 mt-1">
										<h6 class="value text-white">
											Compensatory Afforestation Land (Km<sup>2</sup>)
										</h6>
									</div>
									<div class="col-md-4">
										<div class="w-icon pull-right">
											<svg xmlns="http://www.w3.org/2000/svg" width="24"
												height="24" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2"
												stroke-linecap="round" stroke-linejoin="round"
												class="feather feather-layers">
												<polygon points="12 2 2 7 12 12 22 7 12 2"></polygon>
												<polyline points="2 17 12 22 22 17"></polyline>
												<polyline points="2 12 12 17 22 12"></polyline></svg>
										</div>
									</div>
								</div>

								<div class="row">
									<!-- <div class="col-md-6 border-right">
	                             		<p class="text-white"><b>Target</b><br>Nos:<br>Area (Km<sup>2</sup>): 0</p>
	                             	</div> -->
									<div class="col-md-6">
										<p class="text-white">
											<b>Achievement</b><br>Nos: NA<br>Area (Km<sup>2</sup>):NA
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="layout-px-spacing">
		<div class="row layout-top-spacing">
			<div class="col-md-12 mb-1">
				<div class="statbox widget box box-shadow">
					<div class="widget-header">
						<div class="row">
							<!-- <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                <h4>Target</h4>   
								 <figure class="highcharts-figure">
								 <div class='buttons'>
									  <button id='2000'>
									    2000
									  </button>
									  <button id='2004'>
									    2004
									  </button>
									  <button id='2008'>
									    2008
									  </button>
									  <button id='2012'>
									    2012
									  </button>
									  <button id='2016' class='active'>
									    2016
									  </button>
								  </div>
								  <div id="Targetcontainer"></div>								  
								 </figure>
                            </div> -->


							<div class="col-md-12">
								<div class="col-md-10"></div>
								<div class="col-md-2" style="margin-top: 20px;">
									<!-- <button class="btn btn-secondary" id="btnback" style="height: 35px;margin-left: 27px;display:none;"><i class="fa fa-arrow-left"></i>&nbsp;&nbsp;Back</button> -->
								</div>
							</div>
							<div class="col-xl-12 col-md-12 col-sm-12 col-12">
								<!-- <h4>Geo-referencing of Forest Land</h4>  -->
								<figure class="highcharts-figure">
									<div id="containers"></div>
								</figure>
							</div>
							<!-- <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                <h4>Geo-referencing of  Forest Land</h4>   
								 <figure class="highcharts-figure">
								  <div id="containerd" ></div>								  
								 </figure>
								 <figure class="highcharts-figure">
								  <div id="containerRng" ></div>								  
								 </figure>
                            </div> -->

							<!--  <div id="containerCompare" style="min-width: 75%; height: 400px; margin: 0 auto"></div> -->

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<%@ include file="../shared/footer.jsp"%>

<script type="text/javascript">
$("#btnSearch").click(function(){	
	getTargtAchv();
	getChart();  	
})
let count=0;
/* $("#btnback").click(function(){
	//getTargtAchv();
	getChart();
	document.getElementById('btnback').style.display = 'none';	
}) */
</script>

<script type="text/javascript">
getTargtAchv();
function getTargtAchv(){
	$(".apploader-base").css("display", "block");
	$("#trgNfbNo").text("");
	$("#trgNfba").text("");
	//$("#achvNfbNo").text("");
	//$("#achvNfba").text("");
	$("#trgRfa").text('');
  	$("#achvRfa").text('');
  	$("#achvRfPlots").text('');
  	$("#achvRfPlots").text('');
  	$("#trgDeemed").text('');
  	$("#achvDLCPlots").text('');
  	$("#achvDLC").text('');
  	  	
	var res;
	const parm=$("#phasetype").val();
	//alert(parm.length+'Length');
	if(parm[0]==0 && parm.length<=1){
		parm.push(1);
		parm.push(2);
		parm.push(3);
		parm.push(4);
	}else{
		parm.splice(0, parm.length);
		parm.push($("#phasetype").val());
	}
	$.ajax({
        async:true,
    	url: '/Dashboard/getTargetAchv',
        data: {'phase':parm.toString()},
        contentType: "application/json; charset=utf-8",
        type: 'GET',
        dataType: "json",
        success: function(result) {
        	//$(".apploader-base").css("display", "none");
        	console.log(result);
        	$("#trgNfbNo").text("");
        	$("#trgNfba").text("");
        	//$("#achvNfbNo").text("");
        	//$("#achvNfba").text("");
        	$("#trgRfa").text('');
          	$("#achvRfa").text('');
          	$("#achvRfPlots").text('');
          	$("#trgDeemed").text('');
          	$("#achvDLCPlots").text('');
          	$("#achvDLC").text('');
          	          	         	
          	$("#trgNfbNo").text(result.targetNfbNos);
          	$("#trgNfba").text(result.targetNfbA.toFixed(2));
          	//$("#achvNfbNo").text(result.achvNfbNos);
          	//$("#achvNfba").text(result.achvNfbA.toFixed(2));
          	
          	$("#achvRfPlots").text(result.achvRecordedFAPlots);
          	$("#trgRfa").text(result.targetRecordedFA.toFixed(2));
          	$("#achvRfa").text(result.achvRecordedFA.toFixed(2));
          	$("#trgDeemed").text(result.targetDeemedA.toFixed(2));
          	$("#achvDLCPlots").text(result.achvDLCPlots);
          	$("#achvDLC").text(result.achvDLCA.toFixed(2)); 
          	
          	$("#orscCert").text(result.orsacCertification);
          	$("#fsoCert").text(result.fsoCertification);
          	//$("#reNotif").text(result.reNotification);
          	$("#reNotif").text(0);
          	
          	
          	$("#orscCertVal").text(result.orsacCertificationVal.toFixed(2));
          	$("#fsoCertVal").text(result.fsoCertificationVal.toFixed(2));
          	//$("#reNotifVal").text(result.reNotificationVal.toFixed(2));
          	$("#reNotifVal").text(0.00);
        },
        error: function(errormessage) {
        	$(".apploader-base").css("display", "none");
            alert(errormessage.responseText);
        }
    });
	
}


function getParentChildChart(callback){
	$(".apploader-base").css("display", "block");
	var res;
	//var cirName="Koraput";
	const parm=$("#phasetype").val();
	//alert(parm);
	if(parm[0]==0 && parm.length<=1){
		parm.push(1);
		parm.push(2);
		parm.push(3);
		parm.push(4);
	}else{
		parm.splice(0, parm.length);
		parm.push($("#phasetype").val());
	}
	$.ajax({
        async:true,
    	url: '/Dashboard/getChart',
        data: {'phase':parm.toString()},
        contentType: "application/json; charset=utf-8",
        type: 'GET',
        dataType: "json",
        success: function(result) {
        	console.log(result);
        	$(".apploader-base").css("display", "none");
        	callback(result);	
        },
        error: function(errormessage) {
        	$(".apploader-base").css("display", "none");
            alert(errormessage.responseText);
        }
    });
	//return res;
}
</script>

<script>
var i=0;
	getChart(); 
  function getChart() {	  
	  i=0;
    // Create the chart
    $("#containers").empty();
    getParentChildChart(function(chartParent){
    	
    $("#containers").highcharts({
      chart: {
        type: "column",
        events:{
            drilldown: function(e){
            	var chart = this;
            	 //console.log(e.seriesOptions.id);
            	 //console.log(e.seriesOptions.data);
            	  //console.log(this.options.series[0].name);
            	  console.log(chart.series[0].options._levelNumber);
            	  console.log(e.point.drilldown);
            	  if(chart.series[0].options._levelNumber===0)
           		  {
           		  chart.setTitle({text: 'Achievement of Geo Referencing Forest Land(ORSAC Certification)'}, {text: ''});
           		  chart.setSubtitle({text: 'Division wise Forest Land Area'}, {text: ''});
                     chart.xAxis[0].setTitle({ text: 'Division' });
           		  }
            	  else if(chart.series[0].options._levelNumber===1)
           		  {
            	  chart.setTitle({text: 'Achievement of Geo Referencing Forest Land(ORSAC Certification)'}, {text: ''});
           		  chart.setSubtitle({text: 'Range wise Forest Land Area'}, {text: ''});
                    chart.xAxis[0].setTitle({ text: 'Range' });
           		  } 
            	 /*  if(e.point.drilldown==='AngulDLCDD')
           		  {
           		  chart.setTitle({text: 'Division wise Forest Land Area'}, {text: ''});
                     chart.xAxis[0].setTitle({ text: 'Division' });
           		  }
            	  else if(e.point.drilldown==='1_DLC_DIV')
           		  {
           		  chart.setTitle({text: 'Range wise Forest Land Area'}, {text: ''});
                    chart.xAxis[0].setTitle({ text: 'Range' });
           		  } */
               // var chart = this;
                /* setTimeout(function () 
               {
                //document.getElementById('btnback').style.display = 'block';
                //console.log(chart.series[0].options._levelNumber);
                chart.setTitle({text: 'Division wise Forest Land Area'}, {text: ''});
                chart.xAxis[0].setTitle({ text: 'Division' });
               
                var v=i++
               // console.log(v);
                
	                if(v>2)
	                {
	                	chart.setTitle({text: 'Range wise Forest Land Area'}, {text: ''});
	                    chart.xAxis[0].setTitle({ text: 'Range' });
	                }
                }, 25); */
            }  ,
            drillup: function(e){
                var chart = this;
                setTimeout(function () {
	               	if(chart.series[0].options._levelNumber == 1)
	             	{
	               		//console.log(chart.series[0].options._levelNumber);
	               		 //alert(e.seriesOptions.id);
	               		    chart.setTitle({text: 'Achievement of Geo Referencing Forest Land(ORSAC Certification)'}, {text: ''});
		               		chart.setSubtitle({text: ' Division wise Forest Land Area'}, {text: ''});
		                    chart.xAxis[0].setTitle({ text: 'Division' });
	               	}
	               	else if(chart.series[0].options._levelNumber==0)
	               	{
	               	        chart.setTitle({text: 'Achievement of Geo Referencing Forest Land(ORSAC Certification)'}, {text: ''});
		               		chart.setSubtitle({text: ' Circle wise Forest Land Area'}, {text: ''});
		                    chart.xAxis[0].setTitle({ text: 'Circle' });
	               	}
                }, 50);
            }    
        }
      },
      credits : {
          enabled : false
      },
     lang: {
			drillUpText: '< Back'
		}, 	 
		title: {
		    text: 'Achievement of Geo Referencing Forest Land(ORSAC Certification)'
		  },
	      subtitle: {
	        text: "Circle wise Forest Land Area"
	      },
		  xAxis: {
			  type: 'category',
		   //categories: test['circle'],
		  title: {
			    text: 'Circle'
			  },
		  },
		  
		  yAxis: {
		    min: 0,
		    title: {
		      text: 'Area(Km<sup>2</sup>)',
		      useHTML : true,
		    },
		     stackLabels: {
		      enabled: true,
		      format:'{point.stackTotal:.2f}',
		      style: {
		        fontWeight: 'normal',
		        textDecoration: 'none',
		        color: ( // theme
		          Highcharts.defaultOptions.title.style &&
		          Highcharts.defaultOptions.title.style.color
		        ) || 'gray'
		      }
		    } 
		  },
		   legend: {
		    align: 'right',
		    x: -30,
		    verticalAlign: 'top',
		    y: 25,
		    floating: true,
		    backgroundColor:
		      Highcharts.defaultOptions.legend.backgroundColor || 'white',
		    borderColor: '#CCC',
		    borderWidth: 1,
		    shadow: false
		  },
		  tooltip: {
		    //headerFormat: '<b>{point.x:.2f}</b><br/>',
		    pointFormat: '{series.name}: {point.y:.2f}<br/>Total: {point.stackTotal:.2f}'
		  },
		  plotOptions: {
		    column: {
		      stacking: 'normal',
		      dataLabels: {
		    	  inside: true,
		            enabled: true,
		        format: '<span style=color:#FFFFFF;font-weight:normal;>{point.y:.2f}<br/>{point.no_of_fbs}</span>',
		         style: {
					fontSize: '11px',
					fontWeight: 'normal',
					//color: 'White',
					textOutline: '0px'					
				} ,		     
		      },	   
		    }
		  },
      series:chartParent.parent,
      drilldown: {
        //allowPointDrilldown: false,
        series:chartParent.child
      },
      exporting: {
    	    buttons: {
    	        contextButton: {
    	            enabled: false
    	        }
    	    }
    	},
      function(chart) {
			var arr = chart.options.exporting.buttons.contextButton.menuItems;
		  var index = arr.indexOf("viewData");
		  if (index !== -1) arr.splice(index, 1);
		  
		}
    });
    });//end of call back function
  };


</script>

<script type="text/javascript">

$(document).ready(function(){
	 $(".header-title-lg").text("ODISHA FLI-DSS (Geo Referencing of Forest Land)");		
});
$(document).ready(function() {
	  $('#phasetype').multiselect({

	  });
	  
	    $('#phasetype').multiselect({
	        includeSelectAllOption: true
	    });

	    $("#phasetype").multiselect('selectAll', false);
	    $("#phasetype").multiselect('updateButtonText');

		setTimeout(function () {$("#btnSearch" ).trigger( "click");},4500);	  
	});
</script>

