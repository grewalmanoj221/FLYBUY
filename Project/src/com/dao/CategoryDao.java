package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.connection.HibernateUtil;
import com.entity.Category;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}

	// saves the category to db
	public int saveCategory(Category cat) {

		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();
		int catId = (int) session.save(cat);
		tx.commit();
		session.close();
		return catId;
	}

	public List<Category> getCategories() {
		
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Category");
		@SuppressWarnings("unchecked")
		List<Category> list = query.list();
		return list;
	}

	public Category getCategoryById(int cid) {
		Category cat = null;
		try {

			Session session = this.factory.openSession();
			cat = (Category) session.get(Category.class, cid);
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cat;
	}

	public static void main(String[] args) {

		CategoryDao categorydao = new CategoryDao(HibernateUtil.getSessionFactory());
		List<Category> categorylist = categorydao.getCategories();

		for (Category category : categorylist) {
			System.out.println(category);
		}
	}
}
