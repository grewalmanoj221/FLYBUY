package com.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import com.entity.EmailSubscriber;
import com.helper.Mailer;

public class MailDao {
	private SessionFactory factory;

	public MailDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean addSubscriber(EmailSubscriber subscriber) {
		boolean flag = false;
		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			session.saveOrUpdate(subscriber);

			tx.commit();
			session.close();
			flag = true;

		} //
		catch (Exception e) {
			e.printStackTrace();
			flag = false;
		} //

		return flag;
	}//

	public EmailSubscriber getSubscriber(String email) {
		EmailSubscriber subscriber = null;
		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			Query query = session.createQuery("from EmailSubscriber where email= :email");
			query.setParameter("email", email);

			subscriber = (EmailSubscriber) query.uniqueResult();

			tx.commit();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return subscriber;

	}//

	public Set<String> allSubscribers() {
		Session session = this.factory.openSession();
		session.beginTransaction();

		String hql = "FROM EmailSubscriber";
		Query query = session.createQuery(hql);

		@SuppressWarnings("unchecked")
		List<EmailSubscriber> list = query.list();
		Set<String> set = new HashSet<>();

		for (EmailSubscriber emailSubscriber : list) {
			set.add(emailSubscriber.getEmail());
		} //

		session.getTransaction().commit();
		session.close();

		return set;
	}//

	public boolean confirmationMail(String email, String fullName) {
		Mailer mailer = new Mailer();
		String message = "Hi " + fullName + "\n"
				+ "Greetings of the day. You have subscribed to the news letter of FLY BUY. We believe in providing best deals to our customers.\n\n"
				+ "Thanks for joining the 'FLY BUY CLUB'.\n\n" + "Thank You\n" + "Team FLY BUY.\n\n\n"
				+ "**do-not reply to this mail**";
		if (mailer.send("grewalmanoj221@gmail.com", "hnxvijpufbsmesae", email, "Subscription for Newsletter by FLY BUY",
				message)) {
			return true;
		} //
		else {
			return false;
		} //
	}//
	
	
	public boolean bigMail() {
		
		
		
		return true;
		
	}

}//
