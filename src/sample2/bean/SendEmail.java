package sample2.bean;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class SendEmail {
	public static void sendEmail(String email) {

		String host = "smtp.naver.com";
		final String user = "sztpdnzs@naver.com";
		final String password = "thstpdn12@";

		String to = email;

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Subject
			message.setSubject("[Subject] Java Mail Test");

			// Text
			message.setText("Simple mail test..");

			// send the message
			Transport.send(message);
			System.out.println("message sent successfully...");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		sendEmail("tpdn333@gmail.com");
	}
}
