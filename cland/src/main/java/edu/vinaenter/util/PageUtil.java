package edu.vinaenter.util;

import edu.vinaenter.constant.GlobalConstant;

public class PageUtil {

	public static int getOffset(int page) {
		return (page - 1) * GlobalConstant.TOTAL_ROW;
	}
	
	public static int getTotalPage(int totalRow) {
		int page = totalRow / GlobalConstant.TOTAL_ROW;
		if (totalRow % GlobalConstant.TOTAL_ROW == 0) {
			return page;
		}
		return page + 1;
	}
	
	public static int getOffsetTest(int page) {
		return (page - 1) * GlobalConstant.TOTAL_ROW_TEST;
	}
	
	public static int getTotalPageTest(int totalRow) {
		int page = totalRow / GlobalConstant.TOTAL_ROW_TEST;
		if (totalRow % GlobalConstant.TOTAL_ROW_TEST == 0) {
			return page;
		}
		return page + 1;
	}
	
}
