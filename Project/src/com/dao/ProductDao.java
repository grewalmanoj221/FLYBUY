package com.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Product;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveProduct(Product product) {
		boolean flag = false;
		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			session.saveOrUpdate(product);

			tx.commit();
			session.close();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}

		return flag;
	}// save product

	public boolean deleteProduct(int pid) {
		boolean flag = false;
		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			Product product = (Product) session.get(Product.class, pid);
			session.delete(product);

			tx.commit();
			session.close();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}

		return flag;
	}//

	// get all products
	public List<Product> getAllProducts() {
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Product");
		@SuppressWarnings("unchecked")
		List<Product> list = query.list();
		return list;
	}

	// get all products of given category
	public List<Product> getAllProductsById(int cid) {
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Product as p where p.category.categoryId =:id");
		query.setParameter("id", cid);
		@SuppressWarnings("unchecked")
		List<Product> list = query.list();
		return list;
	}

	public Product getProduct(int pid) {
		Product product = null;
		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			product = (Product) session.get(Product.class, pid);

			tx.commit();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return product;

	}//

	public List<Product> getAllProductsBySearch(String name) {
		Session s = this.factory.openSession();

		name = name.toUpperCase();
		Set<Product> set = new HashSet<>();

		Query query1 = s.createQuery("from Product where pName like :name");
		query1.setParameter("name", "%" + name + "%");

		@SuppressWarnings("unchecked")
		List<Product> list1 = query1.list();

		Query query2 = s.createQuery("from Product where pName like :name");
		query2.setParameter("name", "%" + name);

		@SuppressWarnings("unchecked")
		List<Product> list2 = query2.list();

		Query query3 = s.createQuery("from Product where pName like :name");
		query3.setParameter("name", name + "%");

		@SuppressWarnings("unchecked")
		List<Product> list3 = query3.list();

		List<Product> list = new ArrayList<>();

		set.addAll(list3);
		set.addAll(list2);
		set.addAll(list1);

		for (Product product : set) {
			list.add(product);
		}

		return list;
	}

	

}
