package com.sparc.flidss.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.sparc.flidss.viewmodel.SP_NFBViewModel;

public class ExcelExportService extends AbstractXlsxView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
response.addHeader("Content-Disposition", "attachment;filename=BRANDS.xlsx");
		
		@SuppressWarnings("unchecked")
		List<SP_NFBViewModel> list = (List<SP_NFBViewModel>) model.get("nfbList");
		
		Sheet sheet = workbook.createSheet("BRANDS DATA");
		
		createHeader(sheet);
		createBody(sheet,list);
	}
	private void createHeader(Sheet sheet) {
		int rowNum = 0;
		Row row = sheet.createRow(rowNum);
		row.createCell(0).setCellValue("Sl No");
		row.createCell(1).setCellValue("Forest Land Type");
		row.createCell(2).setCellValue("Range Name");
		row.createCell(3).setCellValue("NFB Name");
		row.createCell(4).setCellValue("NFB Type");
		row.createCell(5).setCellValue("Area in ha.");
		row.createCell(6).setCellValue("Area in Acre");
	}
	

	private void createBody(Sheet sheet, List<SP_NFBViewModel> list) {
		int rowNum = 1;
		for(SP_NFBViewModel model:list) {
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(rowNum++);
			
			/*
			 * row.createCell(0).setCellValue(brand.getId());
			 * row.createCell(1).setCellValue(brand.getName());
			 * row.createCell(2).setCellValue(brand.getCode());
			 * row.createCell(3).setCellValue(brand.getTagLine());
			 * row.createCell(4).setCellValue(brand.getNote());
			 */
		}
		
	}



}
