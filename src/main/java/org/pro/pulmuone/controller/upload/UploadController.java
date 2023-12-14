package org.pro.pulmuone.controller.upload;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.pro.pulmuone.domain.notice.ImgVO;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/upload/*")
@Log4j
public class UploadController {
	// forum 에서 사용되는 업로드 컨트롤러 
	// 업로드
	@PostMapping(value = "{val}", produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public ImgVO inquiryUpload(
			@RequestParam("upload") CommonsMultipartFile multipartFile
			, @PathVariable("val") String val
			, HttpServletRequest request
			, HttpServletResponse response) throws IllegalStateException, IOException {
		log.info("> " +val+ "....");

		String saveDirectory = null;
		String filesystemName = null;
		String realpath = "/upload/" + val + "/";
		
		ImgVO imgVo = new ImgVO();

		if( multipartFile != null ) {
			saveDirectory = request.getServletContext().getRealPath(realpath);

			File f = new File(saveDirectory);
			if( !f.exists() ) f.mkdirs();
			System.out.println(">>> saveDirectory : " + saveDirectory);

			String OriginalFilename = multipartFile.getOriginalFilename();
			filesystemName = getFileNameCheck(saveDirectory, OriginalFilename);

			File dest = new File(saveDirectory, filesystemName);
			multipartFile.transferTo(dest);

			imgVo.setUploaded(true);
			imgVo.setUrl(realpath + filesystemName);

			return imgVo;
		}
		imgVo.setUploaded(false);
		return imgVo;
	}

	private String getFileNameCheck(String uploadRealPath, String originalFilename) {
		int index = 1;      
		while( true ) {         
			File f = new File(uploadRealPath, originalFilename);         
			if( !f.exists() ) return originalFilename;         
			// upload 폴더에 originalFilename 파일이 존재한다는 의미         a.txt (4자리)
			String fileName = originalFilename.substring(0, originalFilename.length() - 4 );  //   a
			String ext =  originalFilename.substring(originalFilename.length() - 4 );  // .txt
			// asdfasf-3.txt
			originalFilename = fileName+"-"+(index)+ext;

			index++;
		} // while 
	}
}
