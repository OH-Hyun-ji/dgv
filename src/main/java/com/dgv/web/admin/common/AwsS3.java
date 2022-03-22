package com.dgv.web.admin.common;

import java.io.File;
import java.io.InputStream;

import javax.annotation.PostConstruct;

import org.apache.ibatis.annotations.Delete;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Component
public class AwsS3 {

	//db쪽 값 받아오기
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//aws sdk
	private AmazonS3 amazonS3;
	private String access_key;
	private String secret_accessKey;
	private Regions regions = Regions.AP_NORTHEAST_2;
	private String bucket = "dgvworld";
	
	public AwsS3() {
	}
	
	@PostConstruct
	private void init() {
		createS3();
	}
	
	public AwsS3(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate =sqlSessionTemplate;
		createS3();
	}
	
	
	
	private void createS3() {
		//db에서 암호화된 s3값받아오고 
		S3KeyVO s3KeyVO = sqlSessionTemplate.selectOne("S3DAO.s3Key");
		access_key = s3KeyVO.getAccess_key();
		secret_accessKey = s3KeyVO.getSecret_accessKey();
		AWSCredentials credentials = new BasicAWSCredentials(access_key, secret_accessKey);
		this.amazonS3 = AmazonS3ClientBuilder.standard().withCredentials(
				new AWSStaticCredentialsProvider(credentials)).withRegion(regions).build();
					
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	//file upload
	public void upload(File file, String key) {
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}
	
	public void upload(InputStream is, String key, String contentType, long contentLength) {
		ObjectMetadata metadata = new ObjectMetadata();
		metadata.setContentType(contentType);
		metadata.setContentLength(contentLength);
		
		uploadToS3(new PutObjectRequest(this.bucket, key, is, metadata));
	}
	
	private void uploadToS3(PutObjectRequest request) {
		try {
			this.amazonS3.putObject(request);
			System.out.println(String.format("[%s] upload " , request.getKey()));
		}catch(AmazonServiceException e) {
			e.printStackTrace();
		}catch(SdkClientException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String key) {
		try {
			DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);
			
			this.amazonS3.deleteObject(deleteObjectRequest);
			System.out.println(String.format("[%s] delete " , key));
		}catch(AmazonServiceException e) {
			e.printStackTrace();
		}catch(SdkClientException e) {
			e.printStackTrace();
		}
	}
	
}
