package mem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBM {
	static Connection conn;
	static PreparedStatement pstmt;
	static Statement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	//데이터베이스 연결
	public DBM() {
		try {
			Context context = new InitialContext();
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost?serverTimezone=UTC","root","admin1234");
			stmt=conn.createStatement();
			stmt.execute("use delivery");
			
			//ds = (DataSource)context.lookup("java:comp/env/jdbc_mysql");
			
			/*
			 * String dbURL = "jdbc:mysql://localhost?serverTimezone=UTC"; String dbID =
			 * "root"; String dbPassword = "admin1234";
			 * 
			 * Class.forName("com.mysql.cj.jdbc.Driver"); conn =
			 * DriverManager.getConnection(dbURL, dbID, dbPassword);
			 * 
			 * stmt = conn.createStatement(); stmt.execute("use delivery");
			 */
		} catch (Exception e) {
			System.out.println("connection err:" + e);
		}
	}
	
	//id 체크
	public boolean checkId(String id){
		boolean b = false;
		try {
			String sql = "select userID from Mem where userID like ?";
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			b=rs.next();
		} catch (Exception e) {
			System.out.println("checkId err : " + e);
		} /*
			 * finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
			 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
			 * exception } }
			 */
		return b;
	}
	
	//회원가입-일반
	public boolean insertData0(MemBean bean){
		boolean b = false;
		try {
			String sql = "insert into Mem values(?,?,?,?,null,null,null,false)";
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getUserID());
			pstmt.setString(2, bean.getUserPassword());
			pstmt.setString(3, bean.getUserName());
			pstmt.setString(4, bean.getUserEmail());
			if(pstmt.executeUpdate()>0)b=true;
			
		} catch (Exception e) {
			System.out.println("insertData err : " + e+"\n"+bean.getUserID()+"\n"+bean.getUserPassword()+"\n"+bean.getUserName()+"\n"+bean.getUserEmail());
		} /*
			 * finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
			 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
			 * exception } }
			 */
		return b;
	}
	
	//회원가입-택배사
		public boolean insertData1(MemBean bean){
			boolean b = false;
			try {
				String sql = "insert into Mem values(?,?,?,?,null,?,null,true)";
//				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bean.getUserID());
				pstmt.setString(2, bean.getUserPassword());
				pstmt.setString(3, bean.getUserName());
				pstmt.setString(4, bean.getUserEmail());
				pstmt.setString(5, bean.getCourier());
				if(pstmt.executeUpdate()>0)b=true;
				
			} catch (Exception e) {
				System.out.println("insertData err : " + e);
		} /*
			 * finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
			 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
			 * exception } }
			 */
			return b;
		}
	
	//로그인용 데이터 탐색
	public String Login(String id, String pass){
		String str="";
		try {
			String sql = "select userID, userName from Mem where userID=? and userPassword=?";
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass); 
			rs = pstmt.executeQuery();
			if(rs.next()) str=rs.getString("userName");

		} catch (Exception e) {
			System.out.println("login err : " + e);
		} /*
			 * finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
			 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
			 * exception } }
			 */
		return str;
	}
	
	public int login1(String userID, String userPassword) {
		String sql = "SELECT userPassword FROM MEM WHERE userID = ?";
		try {
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					if (userID.equals("admin")) {
						return 3;
					} else {
						return login2(userID);
					}
				} else
					return 0;
			}
			return -1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int login2(String userID) {
		String sql = "SELECT GmCm FROM MEM WHERE userID = ?";
		try {
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getBoolean(1) == false) {
					return 1;
				} else if (rs.getBoolean(1) == true) {
					return 2;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	//회원 수정 - 회원 정보 가저오기
	public MemDto getData(String id){
		MemDto dto = null;
		try {
			String sql = "select userName, userID, userPassword, userEmail, GmCm, Courier, waybillNumber, deliveryStatus from Mem where userID like ?";
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new MemDto();
				dto.setUserName(rs.getString("userName"));
				dto.setUserID(rs.getString("userID"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setGmcm(rs.getBoolean("gmcm"));
				dto.setCourier(rs.getString("courier"));
				dto.setWaybillNumber(rs.getString("waybillNumber"));
				dto.setDeliveryStatus(rs.getBoolean("deliveryStatus"));
			}
			
		} catch (Exception e) {
			System.out.println("getData err : " + e);
		} /*
			 * finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
			 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
			 * exception } }
			 */
		return dto;
	}
	
	//회원정보 수정 - 수정하기
	public boolean modifyData(MemBean bean){
		boolean b = false;
		try {
			String sql = "update Mem set userName=?, userPassword=?, userEmail=?, Courier=?, waybillNumber=?, deliveryStatus=? where userID=?";
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getUserName());
			pstmt.setString(2, bean.getUserPassword());
			pstmt.setString(3, bean.getUserEmail());
			pstmt.setString(4, bean.getCourier());
			pstmt.setString(5, bean.getWaybillNumber());
			pstmt.setBoolean(6, bean.isDeliveryStatus());
			pstmt.setString(7, bean.getUserID());
			if(pstmt.executeUpdate()>0) b=true;
		} catch (Exception e) {
			System.out.println("modifyData err : " + e);
		} /*
			 * finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
			 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
			 * exception } }
			 */
		return b;
	}
	
	//회원정보 수정 - 수정하기
		public boolean modifyData1(MemBean bean){
			boolean b = false;
			try {
				String sql = "update Mem set waybillNumber=?, deliveryStatus=? where userID=?";
//				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bean.getWaybillNumber());
				pstmt.setBoolean(2, bean.isDeliveryStatus());
				pstmt.setString(3, bean.getUserID());
				if(pstmt.executeUpdate()>0) b=true;
			} catch (Exception e) {
				System.out.println("modifyData err : " + e);
		} /*
			 * finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
			 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
			 * exception } }
			 */
			return b;
		}
		
		//회원정보 수정 - 수정하기
		public boolean modifyData2(MemBean bean){
			boolean b = false;
			try {
				String sql = "update Mem set userName=?, userPassword=?, userEmail=? where userID=?";
//				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bean.getUserName());
				pstmt.setString(2, bean.getUserPassword());
				pstmt.setString(3, bean.getUserEmail());
				pstmt.setString(4, bean.getUserID());
				if(pstmt.executeUpdate()>0) b=true;
			} catch (Exception e) {
				System.out.println("modifyData err : " + e);
			} /*
				 * finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
				 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
				 * exception } }
				 */
			return b;
		}
	
	//회원 탈퇴 - 비밀번호 확인
	public boolean deleteConfirm(String id, String passwd){
		boolean b = false;
		try {
			String sql = "select * from Mem where userID = ? and userPassword = ?";
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			if(rs.next()) b = true;
			
		} catch (Exception e) {
			System.out.println("deleteConfirm err : " + e);
		} /*
			 * finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
			 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
			 * exception } }
			 */
		return b;
	}
	
	//회원 탈퇴 - 탈퇴하기
	public boolean deleteData(String id){
		boolean b = false;
		try {
			String sql = "delete from Mem where userID = ?";
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int re = pstmt.executeUpdate();
			if(re>0) b = true;
			
		} catch (Exception e) {
			System.out.println("deleteData err : " + e);
		} /*
			 * finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
			 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
			 * exception } }
			 */
		return b;
	}
	
	public String search(String userID) {
		String SQL = "select waybillNumber from Mem where userID= ?";
		try {
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			} else
				return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int check1(String userID, String waybillNumber) {
		String SQL = "SELECT waybillNumber FROM MEM WHERE userID = ?";
		try {
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1) == null) {
					return -1;
				} else if (rs.getString(1).equals(waybillNumber)) {
					return check2(waybillNumber);
				} else
					return 0;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}

	int check2(String waybillNumber) {
		String SQL = "SELECT deliveryStatus FROM MEM WHERE waybillNumber = ?";
		try {
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, waybillNumber);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getBoolean(1) == false) {
					return 1;
				} else if (rs.getBoolean(1) == true) {
					return 2;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -2;
	}


	
	/********************** 관리자 *********************
	/*
	 * //관리자 로그인 public boolean admin_login(String admin_id,String admin_pass){
	 * boolean b = false; try { String sql =
	 * "select * from admin where admin_id = ? and admin_pass = ?"; conn =
	 * ds.getConnection(); pstmt = conn.prepareStatement(sql); pstmt.setString(1,
	 * admin_id); pstmt.setString(2, admin_pass); rs = pstmt.executeQuery();
	 * b=rs.next(); } catch (Exception e) { System.out.println("admin_login err : "
	 * + e); } finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
	 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
	 * exception } }
	 * 
	 * return b; }
	 */
	
	//관리자 - 회원목록 전체 출력
	public ArrayList<MemDto> getMemberAll(){
		ArrayList<MemDto> list = new ArrayList<MemDto>();
		try {
			String sql = "select * from Mem";
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemDto dto =  new MemDto();
				dto.setUserName(rs.getString("userName"));
				dto.setUserID(rs.getString("userID"));
				dto.setUserPassword(rs.getString("userPassword"));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setGmcm(rs.getBoolean("gmcm"));
				dto.setCourier(rs.getString("courier"));
				dto.setWaybillNumber(rs.getString("waybillNumber"));
				dto.setDeliveryStatus(rs.getBoolean("deliveryStatus"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getMemberAll err : ");
		} /*
			 * finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
			 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
			 * exception } }
			 */
		return list;
	}
	
	public ArrayList<MemDto> getGuestAll(){
		ArrayList<MemDto> list = new ArrayList<MemDto>();
		try {
			String sql = "select * from Mem where Gmcm=0";
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemDto dto =  new MemDto();
				dto.setUserName(rs.getString("userName"));
				dto.setUserID(rs.getString("userID"));
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setWaybillNumber(rs.getString("waybillNumber"));
				dto.setDeliveryStatus(rs.getBoolean("deliveryStatus"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getMemberAll err : ");
		} /*
			 * finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
			 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
			 * exception } }
			 */
		return list;
	}
	
	public ArrayList<MemDto> getGuest(String userID){
		ArrayList<MemDto> list = new ArrayList<MemDto>();
		try {
			String sql = "select * from Mem where userID=?";
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemDto dto =  new MemDto();
				dto.setUserName(rs.getString("userName"));
				dto.setUserID(rs.getString("userID"));
				dto.setUserPassword("userPassword");
				dto.setUserEmail(rs.getString("userEmail"));
				dto.setWaybillNumber(rs.getString("waybillNumber"));
				dto.setDeliveryStatus(rs.getBoolean("deliveryStatus"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getMemberAll err : ");
		} /*
			 * finally { try { if(rs!=null)rs.close(); if(pstmt!=null)pstmt.close();
			 * if(conn!=null)conn.close(); } catch (Exception e2) { // TODO: handle
			 * exception } }
			 */
		return list;
	}

}
