package com.cubic.DAO;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.cubic.UserBean.AdminTable;

public class LoginDao {

	public static void login(AdminTable at) {
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session s=factory.openSession();
		Transaction t=s.beginTransaction();
		String name=at.getAdminname();
		String password=at.getAdminpassword();
		Query q=s.createQuery("From AdminTable where adminname=:name and adminpassword=:password");
		q.setString("name", name);
		q.setString("password", password);
		if(q.list().isEmpty()) {
			at.setValid(false);
		}
		else
			at.setValid(true);
		
	}

}
