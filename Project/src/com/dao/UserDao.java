package com.dao;

import com.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class UserDao {
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}

	// get user by email and password
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;

		try {

			String query = "from User where userEmail =:e and userPassword=:p";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			user = (User) q.uniqueResult();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public boolean updateUser(User user, String newPassword) {
		boolean flag = false;
		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			user.setUserPassword(newPassword);
			session.update(user);

			tx.commit();
			session.close();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}

		return flag;
	}

}
