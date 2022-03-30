package com.dgv.web.admin.common;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TimeCalc {
	

	public static final int SEC = 60;
	public static final int MIN = 60;
	public static final int HOUR = 24;
	public static final int ZERO = 0;
	
	
	public static long timeMillis(String time) {
		String[] timeList = time.split(":");
		long hour = Integer.parseInt(timeList[0]) *3600000;
		long minute = Integer.parseInt(timeList[1])*60000;
		long sec = (long) (Float.valueOf(timeList[2])*1000);
		long totalMillis = hour+minute+sec;
	
		return totalMillis;
	}
	
	public static String compareTime(long millisTime, long currentMillis ,String date) {
	//	long currentMillis = System.currentTimeMillis();
		long resultTime = (currentMillis-millisTime)/1000; //초를 구하고
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE;
		String formatted = now.format(formatter);
		
		
		String msg = "";
		
		if(resultTime < ZERO && !date.equals(formatted)){
			msg = "null";
		}else if( resultTime < SEC && date.equals(formatted)) {
			msg = resultTime + "초전";			
		}else if((resultTime /= SEC) < MIN && date.equals(formatted)) {
			msg = resultTime + "분전";
		}else if((resultTime /= MIN) < HOUR && date.equals(formatted)) {
			msg = resultTime + "시간전";
		}else {
			msg ="null";
		}
		return msg;
	}

	
}
