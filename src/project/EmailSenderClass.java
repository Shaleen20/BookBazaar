package project;
import com.email.durgesh.Email;
public class EmailSenderClass
{
	public static void emailChecker(String name,String receiver_email,String address,String pincode,String phone,String book,String cls)
	{
		try
		{
			 Email email=new Email("Your email id","Password");
	         email.setFrom("Your Email id","Book Bazaar");
	         email.setSubject("Confirmation mail");
	         email.setContent("<h1>This is a confirmation mail.<br>We are very thankful for your precious service.<br>"
	         		+ "Below are the details provided by you.Our person will come at your doorstep to collect the books within 2-3 days..<br>"
	         		+ "<strong>Name:</strong>"+name+"<br><strong>Phone:</strong>"+phone+"<br><strong>Address:</strong>"+address
	         		+ "<br><strong>Pincode:</strong>"+pincode+"<br><strong>Book:</strong>"+book+"<br><strong>Class:</strong>"+cls
	         		+ "<br><br>Have a good health and visit us again...</h1>","text/html");
	         email.addRecipient(receiver_email);
             email.send();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
