package com.dgv.web.admin.common;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

public class PDFView extends AbstractPdfView {

	//첫번째 매개변수가 Controller가 넘겨준 데이터 
	//두번째 매개변수는 출력할 문서
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer, HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		List<String> list = (List<String>)model.get("list");
		XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
		//테이블을 생성
		//1열 list.size()+1 행으로 생성
		Table table = new Table(1,list.size()+1);
		//여백 설정
		table.setPadding(5);
		
		// CSS
		CSSResolver cssResolver = new StyleAttrCSSResolver();
	//	CssFile cssFile = helper.getCSS(new FileInputStream());
	//	cssResolver.addCss(cssFile);
		
		// 기본 폰트 설정 - 폰트에 따라 한글 출력 여부가 결정된다.
	//	BaseFont bfKorea = BaseFont.createFont("C:\\Windows\\Fonts\\batang.ttc,0",BaseFont.IDENTITY_H,BaseFont.EMBEDDED);
		String path =request.getSession().getServletContext().getRealPath("/");
		BaseFont baseFont= BaseFont.createFont(path +"/resources/template/font/HoonJunglebook.ttf".replace('/', File.separatorChar), BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		Font font = new Font(baseFont);
		
		Cell cell = new Cell(new Paragraph("결제 영수증",font));
		cell.setHeader(true);
		table.addCell(cell);
		table.endHeaders();
		
		//데이터를 테이블의 셀에 출력
		for(String language : list){
			Cell imsi = new Cell(new Paragraph(language,font));
			table.addCell(imsi);
		}
		//문서에 테이블 추가
		doc.add(table);

	}

}