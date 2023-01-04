package com.sparc.flidss.Exportcontroller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sparc.flidss.model.common.VectorMasterData;
import com.sparc.flidss.service.ForestLandDetailsService;
import com.sparc.flidss.service.impl.ExcelExportService;
import com.sparc.flidss.viewmodel.SP_NFBViewModel;

@Controller
public class ExcelExport {
	@Autowired
	ForestLandDetailsService frlservice;

	@GetMapping("/excelbuttonUrl")
	public ModelAndView exportToExcel(@RequestParam(required = false) Integer type,
			@RequestParam(required = false) String landType, @RequestParam(required = false) Integer distid,
			@RequestParam(required = false) Integer divid, @RequestParam(required = false) String rangeCode,
			@RequestParam(required = false) Integer tahasil_id, @RequestParam(required = false) String ric,
			@RequestParam(required = false) String vill_code, @RequestParam(required = false) String condn,
			@RequestParam(required = false) String operator, @RequestParam(required = false) Double opvalue) 
	{
		List<SP_NFBViewModel> nfbList = new ArrayList<>();

		/*
		 * if (landType.equals("1")) { nfbList = frlservice.getNFBLayers("nfb", distid,
		 * divid, rangeCode); }
		 */
		
		String layerList = "";
		// for(int i=0;i<landType.length;i++) {
		if (landType.equals("1")) {
			// List<SP_NFBViewModel> nfbList=new ArrayList<SP_NFBViewModel>();
			switch (condn) {
			case "jvHa":
				if (operator.equals("<=") && opvalue != null) {
					nfbList = frlservice.getNFBLayers("nfb", distid, divid, rangeCode).stream()
							.filter(f -> f.getSurveytype().equals("JV")
									&& (f.getArea_ha() != null ? f.getArea_ha(): 0) <= opvalue)
							.collect(Collectors.toList());
				} else if (operator.equals(">=")) {
					nfbList = frlservice.getNFBLayers("nfb", distid, divid, rangeCode).stream()
							.filter(f -> f.getSurveytype().equals("JV")
									&& (f.getArea_ha() != null ? f.getArea_ha() : 0) >= opvalue)
							.collect(Collectors.toList());
				} else if (operator.equals("==")) {
					nfbList = frlservice.getNFBLayers("nfb", distid, divid, rangeCode).stream()
							.filter(f -> f.getSurveytype().equals("JV")
									&& (f.getArea_ha() != null ? f.getArea_ha()  : 0) == opvalue)
							.collect(Collectors.toList());
				}
				break;

			case "dgpsdHa":
				if (operator.equals("<=")) {
					nfbList = frlservice.getNFBLayers("nfb", distid, divid, rangeCode).stream()
							.filter(f -> f.getSurveytype().equals("DGPS Final") ||  f.getSurveytype().equals("DGPS Draft")
									&& (f.getArea_ha() != null ? f.getArea_ha() : 0) <= opvalue)
							.collect(Collectors.toList());
				} else if (operator.equals(">=")) {
					nfbList = frlservice.getNFBLayers("nfb", distid, divid, rangeCode).stream()
							.filter(f -> f.getSurveytype().equals("DGPS Final") ||  f.getSurveytype().equals("DGPS Draft")
									&& (f.getArea_ha() != null ? f.getArea_ha() : 0) >= opvalue)
							.collect(Collectors.toList());
				} else if (operator.equals("==")) {
					nfbList = frlservice.getNFBLayers("nfb", distid, divid, rangeCode).stream()
							.filter(f -> f.getSurveytype().equals("DGPS Final") ||  f.getSurveytype().equals("DGPS Draft")
									&& (f.getArea_ha() != null ? f.getArea_ha() : 0) == opvalue)
							.collect(Collectors.toList());
				}
				break;

			case "cmvHa":
				if (operator.equals("<=")) {
					nfbList = frlservice.getNFBLayers("nfb", distid, divid, rangeCode).stream()
							.filter(f -> f.getSurveytype().equals("CMV")
									&& (f.getArea_ha() != null ? f.getArea_ha()  : 0) <= opvalue)
							.collect(Collectors.toList());
				} else if (operator.equals(">=")) {
					nfbList = frlservice.getNFBLayers("nfb", distid, divid, rangeCode).stream()
							.filter(f -> f.getSurveytype().equals("CMV")
									&& (f.getArea_ha() != null ? f.getArea_ha()  : 0) >= opvalue)
							.collect(Collectors.toList());
				} else if (operator.equals("==")) {
					nfbList = frlservice.getNFBLayers("nfb", distid, divid, rangeCode).stream()
							.filter(f -> f.getSurveytype().equals("CMV")
									&& (f.getArea_ha() != null ? f.getArea_ha() : 0) == opvalue)
							.collect(Collectors.toList());
				}
				break;
			
			case "nareaHa":
				if (operator.equals("<=")) {
					nfbList = frlservice.getNFBLayers("nfb", distid, divid, rangeCode).stream()
							.filter(f ->(f.getNfa_ha() != null ? f.getNfa_ha()  : 0) <= opvalue)
							.collect(Collectors.toList());
				} else if (operator.equals(">=")) {
					nfbList = frlservice.getNFBLayers("nfb", distid, divid, rangeCode).stream()
							.filter(f->(f.getNfa_ha() != null ? f.getNfa_ha()  : 0) >= opvalue)
							.collect(Collectors.toList());
				} else if (operator.equals("==")) {
					nfbList = frlservice.getNFBLayers("nfb", distid, divid, rangeCode).stream()
							.filter(f->(f.getNfa_ha() != null ? f.getNfa_ha() : 0) == opvalue)
							.collect(Collectors.toList());
				}
				break;
			default:
				break;

			}
			ObjectMapper mapper = new ObjectMapper();
			//layerList = mapper.writeValueAsString(nfbList);
			// model.addAttribute("layer", mapper.writeValueAsString(objList));
		} else {
			List<VectorMasterData> objList = frlservice.getDIvisionwiseVectorLayerList(distid, divid, type);
			// .stream().filter(f->f.getTehsilMaster().getIntId()==(tahasil_id!=0?tahasil_id:f.getTehsilMaster().getIntId())).collect(Collectors.toList());
			ObjectMapper mapper = new ObjectMapper();
			// model.addAttribute("layer",(objList!=null?
			// mapper.writeValueAsString(objList):null));
			//layerList = mapper.writeValueAsString(objList);
			// model.addAttribute("layer",(objList!=null?
			// mapper.writeValueAsString(objList):null));
			// model.addAttribute("village_code", village_code);
		}

		ModelAndView m = new ModelAndView();
		m.setView(new ExcelExportService());
		m.addObject("nfbList", nfbList);
		return m;

	}

}
