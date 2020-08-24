package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Order;

public class OrderDao {
	private SessionFactory factory;

	public OrderDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveOrder(Order order) {
		boolean flag = false;
		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			session.saveOrUpdate(order);

			tx.commit();
			session.close();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}

		return flag;
	}// save product

	public List<Order> getOrders(int user_id) {
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Order as o where o.user.userId =:id");
		query.setParameter("id", user_id);
		@SuppressWarnings("unchecked")
		List<Order> list = query.list();
		return list;
	}

}
