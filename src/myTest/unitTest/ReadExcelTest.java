package myTest.unitTest;

import java.io.FileInputStream;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ReadExcelTest {

	private static HSSFWorkbook readFile(String filename) throws IOException {
		return new HSSFWorkbook(new FileInputStream(filename));
	}

	public static void main(String[] args) {

		try {
			
			String fileName = ".\\WebContent\\Uploads\\Excel\\newFile.xls";
			

			HSSFWorkbook wb = ReadExcelTest.readFile(fileName);

			HSSFSheet sheet = wb.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();

			System.out.println("Sheet " + 0 + " \"" + wb.getSheetName(0)
					+ "\" has " + rows + " row(s).");

			
			for (int r = 0; r <= rows; r++) {
				HSSFRow row = sheet.getRow(r);
				if (row == null) {
					continue;
				}

				int cells = row.getPhysicalNumberOfCells();
				System.out.println("\nROW " + row.getRowNum() + " has " + cells
						+ " cell(s).");
				for (int c = 0; c < cells; c++) {
					HSSFCell cell = row.getCell(c);
					String value = null;

					switch (cell.getCellType()) {

						case HSSFCell.CELL_TYPE_FORMULA:
							value = "FORMULA value=" + cell.getCellFormula();
							break;

						case HSSFCell.CELL_TYPE_NUMERIC:
							value = "NUMERIC value=" + cell.getNumericCellValue();
							break;

						case HSSFCell.CELL_TYPE_STRING:
							value = "STRING value=" + cell.getStringCellValue();
							break;

						default:
					}
					System.out.println("CELL col=" + cell.getColumnIndex() + " VALUE="
							+ value);
				}
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
