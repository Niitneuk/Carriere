package web;

import java.awt.Graphics2D;
import java.awt.print.PageFormat;

import com.qoppa.pdfWriter.*;

public class pdfWriter {
	
	public static void printPDF(){
	{
        try
        {
            // Create a document and a page in default Locale format
            PDFDocument pdfDoc = new PDFDocument();
            PDFPage newPage = pdfDoc.createPage(new PageFormat());
            
            // Draw to the page
            Graphics2D g2d = newPage.createGraphics();
            g2d.setFont (PDFGraphics.HELVETICA.deriveFont(24f));
            g2d.drawString("Hello World", 100, 100);
            
            // Add the page to the document and save it
            pdfDoc.addPage(newPage);
            pdfDoc.saveDocument("output.pdf");
        }
        catch (Throwable t)
        {
            t.printStackTrace();
        }
    }
	
}
}