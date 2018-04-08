package com.arch.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.arch.SendMail.Test;


@Controller
public class WelcomeController {

	@Autowired
	ServletContext c;
	
	Path path;
	String  pic;
	@RequestMapping(value = "/")
	public ModelAndView Home(){
	
		ModelAndView modelAndView =new ModelAndView ("Index"); 
		return modelAndView;
		}
	
	@RequestMapping(value = "/Try")
	public ModelAndView Try(){
	
		ModelAndView modelAndView =new ModelAndView ("Services"); 
		return modelAndView;
		}
	
	@RequestMapping(value = "/Serve")
	public ModelAndView Serve(@RequestParam("name") String name,@RequestParam("mail") String mail,
			@RequestParam("notes") String notes,@RequestParam("company") String company
		,@RequestParam("phone") String phone,	@RequestParam("date") String date
		,@RequestParam("s") String s,	@RequestParam("t") String t
		,@RequestParam("file") MultipartFile file			
			){		
		ModelAndView modelAndView =new ModelAndView ("Index"); 
	String	UPLOAD_FOLDEdR ="" ;
		
		try {
			byte[] bytes = file.getBytes();
			  UPLOAD_FOLDEdR=c.getRealPath("/images");	 
			 path = Paths.get(UPLOAD_FOLDEdR +"/"+ file.getOriginalFilename());
			Files.write(path, bytes);
              System.out.println(path   +"*************");
		//	String Pic_Name =file.getOriginalFilename() ;
		
			//		System.out.println(file.getOriginalFilename() +"-----------");
			 pic=file.getOriginalFilename() ;	
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	    String fileName =path.toString();
        Test te =new Test ();
        te.man(mail, name, company, phone, date, s, t, notes, fileName);
		return modelAndView;

}}