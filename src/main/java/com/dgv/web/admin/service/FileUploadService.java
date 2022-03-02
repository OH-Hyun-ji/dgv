package com.dgv.web.admin.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dgv.web.admin.common.AwsS3;
import com.dgv.web.admin.config.AWSConfiguration;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FileUploadService {

	private final AwsS3 awsS3;
	
	// 파일 업로드 메서드
	// 매개변수 : MultipartFile, Directory Path, Origin FileName
	
	public FileUploadResult fileUpload(final MultipartFile file, final String path, final String filename) {
		
		try(InputStream is = file.getInputStream()) {
			final String contentType = file.getContentType();
			final long contentLength = file.getSize();
			final String realPath = path + UUID.randomUUID() + filename;
			awsS3.upload(is, realPath, contentType, contentLength);
			return FileUploadResult.success(AWSConfiguration.S3_URL + realPath);
		} catch (IOException e) {
			e.printStackTrace();
			return FileUploadResult.fail();
		}
	}
	
	@AllArgsConstructor
	@Getter
	public static class FileUploadResult {
		private boolean isSuccess;
		private String url;
		
		public static FileUploadResult success(final String url) {
			return new FileUploadResult(true, url);
		}
		
		public static FileUploadResult fail() {
			return new FileUploadResult(false, null);
		}
	}
	
}
