package com.cubic.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.cubic.UserBean.EmployeeBean;

public class EmployeeDAO {

	public static void register(EmployeeBean eb) {
		try {
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session s=factory.openSession();
		Transaction tx=s.beginTransaction();
		System.out.println("Testing DAO");
		s.persist(eb);
		tx.commit();
		eb.setIsvalid(true);
		}
		catch (Exception e) {
			eb.setIsvalid(false);
		}
	}

	/*public static void update(EmployeeBean eb) {
		try {
			Configuration cfg=new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory factory=cfg.buildSessionFactory();
			Session s=factory.openSession();
			Transaction tx=s.beginTransaction();
			System.out.println("Testing DAO");
			int eid=eb.getEid();
			EmployeeBean eb1=(EmployeeBean)s.get(EmployeeBean.class, eid);
			eb1.set
			tx.commit();
			eb.setIsvalid(true);
			}
			catch (Exception e) {
				eb.setIsvalid(false);
			}
		}*/
		
}
