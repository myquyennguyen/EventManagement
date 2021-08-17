package com.eventmanagement.controller.admin;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.eventmanagement.dto.JSONFileUpload;
import com.eventmanagement.helper.UploadFileHelper;

@Controller
public class EventController implements ServletContextAware{
	
	private ServletContext servletContext;
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	@RequestMapping(value="/upload_ckeditor", method = RequestMethod.POST, produces = {MimeTypeUtils.APPLICATION_JSON_VALUE})
	public ResponseEntity<JSONFileUpload> uploadCKeditor(@RequestParam("upload") MultipartFile upload){
		try {
			String fileName = UploadFileHelper.upload(servletContext, upload);
			ResponseEntity<JSONFileUpload> result = new ResponseEntity<JSONFileUpload>(new JSONFileUpload("/template/web/picture/"+fileName), HttpStatus.OK);
			return result;
		}	
		catch(Exception e) {
			System.out.print(e);
			return new ResponseEntity<JSONFileUpload>(HttpStatus.BAD_REQUEST);
		}
	}

}
