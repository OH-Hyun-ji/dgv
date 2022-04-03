package com.dgv.web.admin.common;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


public class SMSMessage {
	public void sendMessage(String toNumber,String title) {
		String apiKey="NCSIGXZPTDLXMH7U";// = "";
		String apiSecret="KMYXCPJ4EV64INJS9NII8PNADPF2FMCE";// = "";
		String fromNumber="01066252872";// = "";
		Message coolsms = new Message(apiKey, apiSecret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", toNumber);
		params.put("from", fromNumber);
		params.put("type", "SMS");
		params.put("text", "[알림!] DGV ["+ title  +"] 예매완료 되었습니다.");
		params.put("app_version", "test app 1.2"); // application name and version
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
}
