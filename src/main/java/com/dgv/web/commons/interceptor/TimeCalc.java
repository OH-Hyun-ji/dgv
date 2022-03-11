package com.dgv.web.commons.interceptor;

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
	
	public static String compareTime(long millisTime, long currentMillis ) {
	//	long currentMillis = System.currentTimeMillis();
		long resultTime = (currentMillis-millisTime)/1000; //초를 구하고
		
		String msg = "";
		
		if(resultTime < ZERO){
			msg = "null";
		}else if( resultTime < SEC) {
			msg = resultTime + "초전";			
		}else if((resultTime /= SEC) < MIN) {
			msg = resultTime + "분전";
		}else if((resultTime /= MIN) < HOUR) {
			msg = resultTime + "시간전";
		}else {
			msg ="null";
		}
		return msg;
	}

	
}
