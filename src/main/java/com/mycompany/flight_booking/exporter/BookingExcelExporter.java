/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.exporter;

import com.mycompany.flight_booking.entities.BookingEntity;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author TIEN
 */
public class BookingExcelExporter {

    private XSSFWorkbook workbook;
    private XSSFSheet sheet;
    private List<BookingEntity> listBookings;

    public BookingExcelExporter(List<BookingEntity> listBookings) {
        this.listBookings = listBookings;
        workbook = new XSSFWorkbook();
    }

    private void writeHeaderLine() {
        sheet = workbook.createSheet("Bookings");

        Row row = sheet.createRow(0);

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontHeight(16);
        style.setFont(font);

        createCell(row, 0, "Booking ID", style);
        createCell(row, 1, "Booking Date", style);
        createCell(row, 2, "Booking Number", style);
        createCell(row, 3, "Status", style);
        createCell(row, 4, "Full Name", style);
        createCell(row, 5, "Gender", style);
        createCell(row, 6, "Birthday", style);
        createCell(row, 7, "Phone Number", style);
        createCell(row, 8, "Address", style);        
    }

    private void createCell(Row row, int columnCount, Object value, CellStyle style) {
        sheet.autoSizeColumn(columnCount);
        Cell cell = row.createCell(columnCount);
        if (value instanceof Integer) {
            cell.setCellValue((Integer) value);
        } else if (value instanceof Boolean) {
            cell.setCellValue((Boolean) value);
        } else {
            cell.setCellValue((String) value);
        }
        cell.setCellStyle(style);
    }

    private void writeDataLines() {
        int rowCount = 1;

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setFontHeight(14);
        style.setFont(font);

        for (BookingEntity booking : listBookings) {
            Row row = sheet.createRow(rowCount++);
            int columnCount = 0;

            createCell(row, columnCount++, booking.getId(), style);
            createCell(row, columnCount++, booking.getBookingDate().toString(), style);
            createCell(row, columnCount++, booking.getBookingNumber(), style);
            createCell(row, columnCount++, booking.getStatus().toString(), style);
            createCell(row, columnCount++, booking.getFullName(), style);
            createCell(row, columnCount++, booking.getGender().toString(), style);
            createCell(row, columnCount++, booking.getBirthday().toString(), style);
            createCell(row, columnCount++, booking.getPhoneNumber(), style);
            createCell(row, columnCount++, booking.getAddress(), style);
        }
    }
    
    public void export(HttpServletResponse response) throws IOException {
            writeHeaderLine();
            writeDataLines();
            
            ServletOutputStream outputStream = response.getOutputStream();
            workbook.write(outputStream);
            workbook.close();
            
            outputStream.close();
    }

}
