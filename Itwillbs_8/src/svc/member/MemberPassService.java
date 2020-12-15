package svc.member;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.member.MemberDAO;




public class MemberPassService {
	public boolean passMember(String id, String pass) {
		boolean isPass = false;
				
				Connection con = getConnection();
				
				MemberDAO memberDAO = MemberDAO.getInstance();
				memberDAO.setConnection(con);
				
				int count = memberDAO.passMember(id, pass);
				
				if(count > 0) {
					commit(con);
					isPass = true;
				} else {
					rollback(con);
				}
				
				close(con);
				
				return isPass;
			}

		}

