package com.dgv.web.admin.common;

import lombok.Data;

@Data
public class S3KeyVO {

	private String access_key;
	private String secret_accessKey;
	private String decoding_key;
	private String decoding_iv;
	
	
}
