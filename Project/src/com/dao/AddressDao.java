package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Address;

public class AddressDao {
	private SessionFactory factory;

	public AddressDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveAdress(Address address) {
		boolean flag = false;
		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			session.saveOrUpdate(address);

			tx.commit();
			session.close();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}

		return flag;
	}// save product

	public Address getAddress(int aid) {
		Address address = null;
		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			address = (Address) session.get(Address.class, aid);

			tx.commit();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return address;
	}
}
