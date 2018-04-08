package com.arch.SendMail;
import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import javax.activation.*;  


public class Test {
	
	 public void man(String Umail,String name,String company,String phone,String date,String s,String t,String notes,
	    		String path
	    		){  
	  
	  String to="raslan.shabaan@gmail.com";//change accordingly  
	  final String user="nicuegypt303@gmail.com";//change accordingly  
	  final String password="00000000RESO";//change accordingly  
	   
	  String host = "smtp.gmail.com";

      // Get system properties
      Properties properties = System.getProperties();
      // Setup mail server
      properties.put("mail.smtp.starttls.enable", "true");
      properties.put("mail.smtp.host", host);
      properties.put("mail.smtp.user", user);
      properties.put("mail.smtp.password", password);
      properties.put("mail.smtp.port", "587");
      properties.put("mail.smtp.auth", "true");

      // Get the default Session object.

	  Session session = Session.getDefaultInstance(properties,  
	   new javax.mail.Authenticator() {  
	   protected PasswordAuthentication getPasswordAuthentication() {  
	   return new PasswordAuthentication(user,password);  
	   }  
	  });  
	     
	  //2) compose message     
	  try{  
	    MimeMessage message = new MimeMessage(session);  
	    message.setFrom(new InternetAddress(user));  
	    message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	    
	    /////////////////////////////////////////////////////////////
	    message.setSubject("New User Request Aleart");  
	      
	    //3) create MimeBodyPart object and set your message text     
	    BodyPart messageBodyPart1 = new MimeBodyPart();  
	    
	    ////////////////////////////////////////////////////
	    messageBodyPart1.setText("Hi Air Translation Services New Message From Mr: " +name+ 
	    " ,User phone is "+phone+",User Mail Is "+Umail+",User company name is "+company+", User notes is "+notes+
        "  Source Lang Is "+s+" ,Target Lang Is "+t+" , Due Date Is "+date
         );
        
	    
	    //4) create new MimeBodyPart object and set DataHandler object to this object      
	    MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
	    String filename = "Attachment.docx";//change accordingly  
	      
	    
	    DataSource source = new FileDataSource(path);  
	    messageBodyPart2.setDataHandler(new DataHandler(source));  
	    messageBodyPart2.setFileName(filename);     
	     
	    //5) create Multipart object and add MimeBodyPart objects to this object      
	    Multipart multipart = new MimeMultipart();  
	    multipart.addBodyPart(messageBodyPart1);  
	    multipart.addBodyPart(messageBodyPart2);  
	  
	    //6) set the multiplart object to the message object  
	    message.setContent(multipart );  
	     
	    //7) send message  
	    Transport.send(message);  
	   
	   System.out.println("message sent....");  
	   }catch (MessagingException ex) {ex.printStackTrace();}  
	 }  
}

