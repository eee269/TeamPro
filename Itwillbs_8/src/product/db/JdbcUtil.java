package product.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

// 모든 메서드는 인스턴스 생성 없이 접근 가능하도록 static 메서드로 정의
public class JdbcUtil {
	
	// -------------------getConnection()-------------------
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			// JNDI 연결을 위한 설정
			Context initCtx = new InitialContext();
			
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			
			// context.xml 파일 내의 <Resource> 태그 내에서 JNDI 설정을 위한 이름 가져오기
			DataSource ds = (DataSource)envCtx.lookup("jdbc/MySQL");
			
			// DataSource 객체의 getConnetion() 메서드 호출
			con = ds.getConnection(); // => ds.getConnection(username, password) 형식으로도 사용 가능
			
			// JDBC 를 통한 DB 작업에 대한 Auto Commit 기능 해제
			con.setAutoCommit(false);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
		}
		
		// Connection 리턴
		return con;
	}
	// -------------------getConnection()-------------------
	
	// -----------Connection, PreparedStatement, ResultSet 객체 반환하는 close() 메서드
	public static void close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement ps) {
		try {
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// -----------Connection, PreparedStatement, ResultSet 객체 반환하는 close() 메서드
	// -----------트랜잭션 처리를 위한 commit(), rollback() 메서드 정의 ------------
	public static void commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// -----------트랜잭션 처리를 위한 commit(), rollback() 메서드 정의 ------------
}
