package com.phoebus.abfragen.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
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

import com.phoebus.abfragen.domain.ResultObject;

public class ExcelReportView extends AbstractXlsView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {

		ResultObject resultObject = (ResultObject) model.get("resultObject");
		List<String> columns = new ArrayList<String> (Arrays.asList(resultObject.getColumns().split(",")));
		List<String> rows    = new ArrayList<String> (Arrays.asList(resultObject.getRows().split(";")));
		
		Sheet sheet = workbook.createSheet("Auswertung");
		//sheet.setDefaultColumnWidth(30);
		
		//header style
		CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setFontName("Arial");
        style.setAlignment(CellStyle.ALIGN_CENTER);
        style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);//FINE_DOTS);
        style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        style.setBorderBottom(CellStyle.BORDER_THIN);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //font.setColor(HSSFColor.WHITE.index);
        style.setFont(font);
        style.setWrapText(true);
        
        //header row
        Row header = sheet.createRow(0);
        header.setHeight((short) 500);
        int colIndex = 0;
        for(String col : columns) {
        	header.createCell(colIndex).setCellValue(col);
        	header.getCell(colIndex).setCellStyle(style);
        	sheet.setColumnWidth(colIndex, 20*256); // width is measured in units of 1/256th of a character width
        	colIndex++;
        }
        
        // create data rows
        int rowCount = 1;
        for(String row : rows) {
        	Row newRow = sheet.createRow(rowCount++);
        	List<String> records = Arrays.asList(row.split("#"));
        	int recordCount = 0;
        	for(String record : records) {
        		newRow.createCell(recordCount++).setCellValue(record);
        	}
        }
        
        // set file name
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-YYYY");
        String fileName = "Auswertung__" + (String) model.get("queryTitle") + "__" + sdf.format(Calendar.getInstance().getTime()) + ".xls";
        response.setHeader("Content-Disposition",  "inline; filename=" + fileName);
	}

}
