package com.phoebus.abfragen.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.phoebus.abfragen.model.Query;

public class ExcelReportView extends AbstractXlsView {

	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		List<Query> queryList = (List<Query>) model.get("queryList");
		
		Sheet sheet = workbook.createSheet("Auswertung");
		sheet.setDefaultColumnWidth(30);
		
		//header style
		CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setFontName("Arial");
        style.setFillForegroundColor(HSSFColor.BLUE.index);
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setColor(HSSFColor.WHITE.index);
        style.setFont(font);
        
        //header row
        Row header = sheet.createRow(0);
        
        header.createCell(0).setCellValue("Awid");
        header.getCell(0).setCellStyle(style);
         
        header.createCell(1).setCellValue("Text");
        header.getCell(1).setCellStyle(style);
         
        header.createCell(2).setCellValue("Art");
        header.getCell(2).setCellStyle(style);
         
        header.createCell(3).setCellValue("Benutzer");
        header.getCell(3).setCellStyle(style);
         
        header.createCell(4).setCellValue("Erstellt");
        header.getCell(4).setCellStyle(style);
        
        header.createCell(5).setCellValue("Bereich");
        header.getCell(5).setCellStyle(style);
        
        // create data rows
        int rowCount = 1;
         
        for (Query query : queryList) {
            Row aRow = sheet.createRow(rowCount++);
            aRow.createCell(0).setCellValue(query.getAwid());
            aRow.createCell(1).setCellValue(query.getText());
            aRow.createCell(2).setCellValue(query.getArt());
            aRow.createCell(3).setCellValue(query.getBenutzer());
            aRow.createCell(4).setCellValue(query.getErstellt());
            aRow.createCell(5).setCellValue(query.getBereich());
        }
	}

}
