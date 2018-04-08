<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SmartDesign</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/stylee.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css">
	<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
	 <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.1.117/styles/kendo.common-material.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.1.117/styles/kendo.material.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2018.1.117/styles/kendo.material.mobile.min.css" />
    <script src="https://kendo.cdn.telerik.com/2018.1.117/js/jquery.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2018.1.117/js/kendo.all.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style>
</style>
</head>
<body>

  <div id="example" >
		
		    <div    style="margin-top: 12%;margin-left: 10%;border:1px solid #000">					
			<form name="Form" onsubmit="return validation()" action="/Serve" method="post" enctype="multipart/form-data" >
			<label>Source Language </label>
			
			 <select name="t">
	  <option value="Arabic">  Arabic</option>
      <option value="English">  English</option>
	  <option value="French"> French</option> 
	  <option value="German"> German</option> 
	  <option value="Chinese"> Chinese</option> 
	  <option value="Urdu"> Urdu</option> 
	  <option value="Tamil"> Tamil </option> 
	  <option value="Indian"> Indian  </option> 
  </select>
  
  
  		<label>Target Language </label>
		 <select name="s">
	  <option value="Arabic">  Arabic</option>
      <option value="English">  English</option>
	  <option value="French"> French</option> 
	  <option value="German"> German</option> 
	  <option value="Chinese"> Chinese</option> 
	  <option value="Urdu"> Urdu</option> 
	  <option value="Tamil"> Tamil </option> 
	  <option value="Indian"> Indian  </option> 
	  
		<input id="datepicker"  style="margin-left:30px;width:30%;" name="date" required="required"/>   
		<label>Due Date </label>
		 
		<br>	 <br><br>
		 
  <input type='file' name="file"  required="required">
                       <br>
			
			<input  placeholder="Full Name" id="name"name="name" required="required" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
<input    placeholder="Company Name"  id="company"name="company" type="text" required="required"/>
<br><br>

<input    placeholder="Phone" id="phone" name="phone" type="number" required="required"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input   placeholder="E-Mail" name="mail"  id="mail"type="mail" required="required"/>
<br><br>
<textarea  name="notes" rows="6" cols="60" id="erea" required="required"> </textarea>
<br><br>
			<button style="margin-left:20%;width:60%" class="btn-primary btn"> Submit </button>
			</form>		
		</div>

<script>
function validation()
{
    var text=/^[A-Za-z]+$/;
    // UserName Validation //
    if(document.Form.name.value.length >30) {
        alert("User Name Is InValid Too Long .");
        return false;
    }  
    
	
if( document.Form.name.value.match(text)) {  
    }else{
        alert("Name Not A Text ");
        return false;
    }
	
if( document.Form.company.value.match(text)) {
    }
	else{
        alert("Company Not A Text ");
        return false;
    }
        // Phone  Validation //
    if (document.Form.phone.value.length != 11 ) {
        alert("Not A Phone Number .");
        return false;
    }
    
	if (isNaN(document.Form.phone.value) ) {
        alert("Not A Phone Number .");
        return false;
    }
    
 else {
        return true;
    }
}
</script>		

            <script>
                function isInArray(date, dates) {
                    for(var idx = 0, length = dates.length; idx < length; idx++) {
                        var d = dates[idx];
                        if (date.getFullYear() == d.getFullYear() &&
                            date.getMonth() == d.getMonth() &&
                            date.getDate() == d.getDate()) {
                            return true;
                        }
                    }

                    return false;
                }

                $(document).ready(function() {
                    var today = new Date(),
                        birthdays = [
                           new Date(today.getFullYear(), today.getMonth(), 11),
                           new Date(today.getFullYear(), today.getMonth() + 1, 6),
                           new Date(today.getFullYear(), today.getMonth() + 1, 27),
                           new Date(today.getFullYear(), today.getMonth() - 1, 3),
                           new Date(today.getFullYear(), today.getMonth() - 2, 22)
                        ];

                    $("#datepicker").kendoDatePicker({
                        value: today,
                        dates: birthdays,
                        weekNumber: true,
                        month: {
                            // template for dates in month view
                            content: '# if (isInArray(data.date, data.dates)) { #' +
                                         '<div class="birthday"></div>' +
                                     '# } #' +
                                     '#= data.value #',
                            weekNumber:  '<a class="italic">#= data.weekNumber #</a>'
                        },
                        footer: "Today - #=kendo.toString(data, 'd') #",
                        open: function () {
                            var dateViewCalendar = this.dateView.calendar;
                            if (dateViewCalendar) {
                                dateViewCalendar.element.width(300);
                            }
                        }
                    });
                });
            </script>
		</div>
		
		




  
</body>
</html>