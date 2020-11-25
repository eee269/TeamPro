package dao.product;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.MemberBean;
import vo.ProductBean;
import vo.ProductOptionBean;

public class ProductDAO {
	
	private ProductDAO() {
	}

	private static ProductDAO pd = new ProductDAO();

	public static ProductDAO getInstance() {
		return pd;
	}
	
	Connection con;// Connection 객체를 전달받아 저장할 멤버변수
	// 외부(Service 클래스)로 부터 Connection 객체를 전달받아
	// 멤버변수에 저장하는 setConnection()메서드 정의

	public void setConnection(Connection con) {
		this.con = con;
	}
	
	//------대분류및 해당하는 소분류 산출위한 메서드

	public ArrayList<ProductBean> selectNcodeList(String xcode) {
		
		ArrayList<ProductBean> ncodeList = new ArrayList<ProductBean>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			String sql = "select DISTINCT ncode from product where xcode=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, xcode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setNcode(rs.getString("ncode"));
				pb.setXcode(xcode);
				ncodeList.add(pb);
			}
		} catch (SQLException e) {
			System.out.println("selectNcodeList()의 오류" +e.getMessage());
			e.printStackTrace();
		}finally{
			close(ps);
			close(rs);
		}

		
		return ncodeList;
	}
	
	public ArrayList<ProductBean> selectBestList(String xcode) {
		
		ArrayList<ProductBean> bestList = new ArrayList<ProductBean>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product where xcode=? order by likey DESC LIMIT 4";
			ps = con.prepareStatement(sql);
			ps.setString(1, xcode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setBasicCode(rs.getString("basicCode"));
				pb.setXcode(rs.getString("xcode"));
				pb.setNcode(rs.getString("ncode"));
				pb.setDate(rs.getDate("date"));
				pb.setMain_img(rs.getString("main_img"));
				pb.setSub_img(rs.getString("sub_img"));
//				pb.setStock(rs.getInt("stock"));
				pb.setPrice(rs.getInt("price"));
				pb.setLikey(rs.getInt("likey"));
				pb.setName(rs.getString("name"));
								
				bestList.add(pb);
			}
		} catch (SQLException e) {
			System.out.println("selectBestList()의 오류" +e.getMessage());
			e.printStackTrace();
		}finally{
			close(ps);
			close(rs);
		}

		
		return bestList;
	}
	
	public ArrayList<ProductBean> selectProductListX(String xcode,int page, int limit) {
		
		ArrayList<ProductBean> productListX = new ArrayList<ProductBean>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int startRow = (page - 1) * limit;
		
		try {
			String sql = "select * from product where xcode=? limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setString(1, xcode);
			ps.setInt(2, startRow);
			ps.setInt(3, limit);
			rs = ps.executeQuery();
			
			
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setBasicCode(rs.getString("basicCode"));
				pb.setXcode(rs.getString("xcode"));
				pb.setNcode(rs.getString("ncode"));
				pb.setDate(rs.getDate("date"));
				pb.setMain_img(rs.getString("main_img"));
				pb.setSub_img(rs.getString("sub_img"));
//				pb.setStock(rs.getInt("stock"));
				pb.setPrice(rs.getInt("price"));
				pb.setLikey(rs.getInt("likey"));
				pb.setName(rs.getString("name"));
				
				productListX.add(pb);
			}
		} catch (SQLException e) {
			System.out.println("selectProductListX()의 오류" +e.getMessage());
			e.printStackTrace();
		}finally{
			close(ps);
			close(rs);
		}
		
		return productListX;
	}
	
	public ArrayList<ProductBean> selectProductListN(String ncode,int page, int limit) {
		
		ArrayList<ProductBean> productListN = new ArrayList<ProductBean>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int startRow = (page - 1) * limit;
		
		try {
			String sql = "select * from product where ncode=? limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ncode);
			ps.setInt(2, startRow);
			ps.setInt(3, limit);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setBasicCode(rs.getString("basicCode"));
				pb.setXcode(rs.getString("xcode"));
				pb.setNcode(rs.getString("ncode"));
				pb.setDate(rs.getDate("date"));
				pb.setMain_img(rs.getString("main_img"));
				pb.setSub_img(rs.getString("sub_img"));
//				pb.setStock(rs.getInt("stock"));
				pb.setPrice(rs.getInt("price"));
				pb.setLikey(rs.getInt("likey"));
				pb.setName(rs.getString("name"));
				
				productListN.add(pb);
			}
		} catch (SQLException e) {
			System.out.println("selectProductListN()의 오류" +e.getMessage());
			e.printStackTrace();
		}finally{
			close(ps);
			close(rs);
		}

		
		return productListN;
	}
	
public ArrayList<ProductBean> selectProductDetailList(String basicCode) {
		
		ArrayList<ProductBean> productDetailList = new ArrayList<ProductBean>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product where basicCode=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, basicCode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setBasicCode(rs.getString("basicCode"));
				pb.setXcode(rs.getString("xcode"));
				pb.setNcode(rs.getString("ncode"));
				pb.setDate(rs.getDate("date"));
				pb.setMain_img(rs.getString("main_img"));
				pb.setSub_img(rs.getString("sub_img"));
//				pb.setStock(rs.getInt("stock"));
				pb.setPrice(rs.getInt("price"));
				pb.setLikey(rs.getInt("likey"));
				pb.setName(rs.getString("name"));
				
				productDetailList.add(pb);
			}
		} catch (SQLException e) {
			System.out.println("selectProductDetailList()의 오류" +e.getMessage());
			e.printStackTrace();
		}finally{
			close(ps);
			close(rs);
		}

		
		return productDetailList;
	}
	
	
	
	public int selectProductCountN(String ncode) {
		
		int productCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product where ncode=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ncode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				productCount += 1;
			}
			
		} catch (SQLException e) {
			System.out.println("selectProductCount()의 오류" +e.getMessage());
			e.printStackTrace();
		}finally{
			close(ps);
			close(rs);
		}

		
		return productCount;
	}
	
	public int selectProductCountX(String xcode) {
		
		int productCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product where xcode=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, xcode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				productCount += 1;
			}
			
		} catch (SQLException e) {
			System.out.println("selectProductCount()의 오류" +e.getMessage());
			e.printStackTrace();
		}finally{
			close(ps);
			close(rs);
		}

		
		return productCount;
	}

	public int getBasicCode() {
		int max = 0;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select max(basicCode) from product";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				max = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("getBasicCode의 오류" +e.getMessage());
			e.printStackTrace();
		}finally{
			close(ps);
			close(rs);
		}
		
		return max;
	}

	public int insertProduct(ProductBean productBean) {
		int count = 0;
		

		PreparedStatement ps = null;
		
		try {
			String sql = "insert into "
					+ "product(basicCode, name, xcode, ncode, main_img, sub_img, price, date) "
					+ "values(?, ?, ?, ?, ?, ?, ?, now())";
			ps = con.prepareStatement(sql);
			ps.setString(1, productBean.getBasicCode());
			ps.setString(2, productBean.getName());
			ps.setString(3, productBean.getXcode());
			ps.setString(4, productBean.getNcode());
			ps.setString(5, productBean.getMain_img());
			ps.setString(6, productBean.getSub_img());
			ps.setInt(7, productBean.getPrice());
			
			count = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("InsertProduct()의 오류" +e.getMessage());
			e.printStackTrace();
		}finally{
			close(ps);
		}
				
		return count;
	}

	public int insertOption(ProductOptionBean optionBean) {
		int count = 0;
		
		PreparedStatement ps = null;
		
		try {
			String sql = "insert into "
					+ "opt(productcode, basicCode,color,size, stock) "
					+ "values(?, ?, ?, ?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, optionBean.getProductCode());
			ps.setString(2, optionBean.getBasicCode());
			ps.setString(3, optionBean.getColor());
			ps.setString(4, optionBean.getSize());
			ps.setInt(5, optionBean.getStock());
			
			count = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("InsertOption()의 오류" +e.getMessage());
			e.printStackTrace();
		}finally{
			close(ps);
		}
				
		return count;
	}

	public int getListCount() {
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from product";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("getListCount() 오류 "+e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return count;
	}

	public ArrayList<ProductBean> selectProductList(int page, int limit) {
		ArrayList<ProductBean> productList = null;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int startRow = (page - 1) * limit; // 조회를 시작할 레코드(행) 번호 계산
		
		try {
			String sql = "SELECT * FROM product ORDER BY date desc limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, limit);
			rs = ps.executeQuery();
			
			productList = new ArrayList<ProductBean>();
			
			while(rs.next()) {
				ProductBean productBean = new ProductBean();
				
				productBean.setBasicCode(rs.getString("basicCode"));
				productBean.setXcode(rs.getString("xcode"));
				productBean.setNcode(rs.getString("ncode"));
				productBean.setMain_img(rs.getString("main_img"));
				productBean.setSub_img(rs.getString("sub_img"));
				productBean.setName(rs.getString("name"));
//				productBean.setStock(rs.getInt("stock"));
				productBean.setPrice(rs.getInt("price"));
				productBean.setLikey(rs.getInt("likey"));
				
				productList.add(productBean);
			}
			
		} catch (SQLException e) {
			System.out.println("selectProductList() 오류 "+e.getMessage());
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		
		return productList;
	}
	public ArrayList<ProductBean> selectProductList() {
		ArrayList<ProductBean> productList = null;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
				
		try {
			String sql = "SELECT * FROM product ORDER BY date desc";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			productList = new ArrayList<ProductBean>();
			
			while(rs.next()) {
				ProductBean productBean = new ProductBean();
				
				productBean.setBasicCode(rs.getString("basicCode"));
				productBean.setXcode(rs.getString("xcode"));
				productBean.setNcode(rs.getString("ncode"));
				productBean.setMain_img(rs.getString("main_img"));
				productBean.setSub_img(rs.getString("sub_img"));
				productBean.setName(rs.getString("name"));
//				productBean.setStock(rs.getInt("stock"));
				productBean.setPrice(rs.getInt("price"));
				productBean.setLikey(rs.getInt("likey"));
				productBean.setDate(rs.getDate("date"));
				
				
				productList.add(productBean);
			}
			
		} catch (SQLException e) {
			System.out.println("selectProductList() 오류 "+e.getMessage());
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		
		return productList;
	}

	// 상품 삭제
	public int deleteProduct(String basicCode) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from product where basicCode=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, basicCode);
			
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return count;
	}

	public int countOption(String basicCode) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from opt where basicCode=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, basicCode);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return 0;
	}
}
