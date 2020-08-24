package com.connection;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import com.dao.CategoryDao;
import com.entity.Category;

@SuppressWarnings("deprecation")
public class HibernateUtil {

	private static final SessionFactory sessionFactory;

	static {
		try {
			sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();

		} catch (Throwable ex) {
			System.err.println("Session Factory could not be created." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public static void main(String[] args) {
		CategoryDao categorydao = new CategoryDao(HibernateUtil.getSessionFactory());
		List<Category> categorylist = categorydao.getCategories();

		for (Category category : categorylist) {
			System.out.println(category);
		}
	}

}