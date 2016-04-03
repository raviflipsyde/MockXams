package myTest.entities;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    private static final SessionFactory sessionFactory = buildSessionFactory();
    
    
    private static SessionFactory buildSessionFactory() {
        try {
            // Create the SessionFactory from hibernate.cfg.xml
//            return new Configuration().configure("\\WebContent\\WEB_INF\\hibernate.cfg.xml").buildSessionFactory();
            return new Configuration().configure().buildSessionFactory();
        }
        catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static boolean save(Object object){
    	Session session = sessionFactory.openSession();
    	Transaction tx = session.beginTransaction();
    	try{
    		session.save(object); 
    		tx.commit();
    		return true;
    	}
    	catch(Exception e){
    		e.printStackTrace();
    		tx.rollback();
    		return false;
    	}
    	finally{
    		session.close();
    	}
		
    	
    }
}
