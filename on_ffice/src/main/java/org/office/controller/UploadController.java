package org.office.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.office.domain.AttachFileDTO;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;



@Log4j
@Controller
public class UploadController {
	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
					
			return contentType.startsWith("image");
			
		} catch (IOException e){
			e.printStackTrace();
			
		}
		return false;
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
	@ResponseBody
	@PostMapping("/uploadAjaxAction")
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		log.info("ajax post update!");
		
		String uploadFolder = "C:\\upload_data\\temp";
		
		// 폴더 생성
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload path: " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			//파일 이름, 폴더경로, UUID, 그림파일 여부를 모두
			// 이 반복문에서 처리하므로 제일 상단에 먼저 그림정보를 받는
			// AttachFileDTO를 생성
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			log.info("--------------------");
			log.info("Upload file name : " + multipartFile.getOriginalFilename());
			log.info("upload file size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			log.info("파일명 \\ 짜르기전 : " + uploadFileName);
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			log.info("last file name : "+ uploadFileName);
			
			// uploadFileName에 uuid가 포함되기 전에 세터에 넣어줘야 
			// 파일 이미지를 불러오는데 문제가 없음
			
			attachDTO.setFileName(uploadFileName);
			
			
			
			// UUID 발급하기
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			// 경로를 고정폴더인 uploadFolder에서 날짜별 가변폴더인 uploadPath로 변경
			// File saveFile = new File(uploadFolder, uploadFileName);
			
			
			try { 
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(getFolder());
				
				// 이 아래부터 썸네일 생성 로직
				if(checkImageType(saveFile)) {
					//클래스 생성 후 boolean타입은 자료입력을 하지 않으면
					// 자동으로 false로 간주됨 
					// 이미지인경우에는 true를 넣고, 이미지가 아니면 그냥 건들지 않습니다.
					attachDTO.setImage(true);
					
					FileOutputStream thumbnail = 
							new FileOutputStream(
									new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(
							multipartFile.getInputStream(), thumbnail, 100, 100);
						thumbnail.close();		
				}
				// 정상적으로 그림에 대한 정보가 입력되었다면 list에 쌓기
				list.add(attachDTO);
				
			} catch(Exception e) {
				log.error(e.getMessage());
			}
			
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("fileName : "+ fileName);
		
		File file = new File("c:\\upload_data\\temp\\" + fileName);
		
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
											header,
											HttpStatus.OK);
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
