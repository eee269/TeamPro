package dao.product;


import static db.JdbcUtil.*;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import vo.MemberBean;
import vo.ProdReviewBean;
import vo.ProductBean;
import vo.ProductLikeBean;
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
				pb.setDate(rs.getTimestamp("date"));
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
			String sql = "select * from product where xcode=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, xcode);
//			ps.setInt(2, startRow);
//			ps.setInt(3, limit);
			rs = ps.executeQuery();
			
			
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setBasicCode(rs.getString("basicCode"));
				pb.setXcode(rs.getString("xcode"));
				pb.setNcode(rs.getString("ncode"));
				pb.setDate(rs.getTimestamp("date"));
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
			String sql = "select * from product where ncode=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ncode);
//			ps.setInt(2, startRow);
//			ps.setInt(3, limit);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setBasicCode(rs.getString("basicCode"));
				pb.setXcode(rs.getString("xcode"));
				pb.setNcode(rs.getString("ncode"));
				pb.setDate(rs.getTimestamp("date"));
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
				pb.setDate(rs.getTimestamp("date"));
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
					+ "product(basicCode, name, xcode, ncode, main_img, sub_img, price, likey, date) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?,now())";
			ps = con.prepareStatement(sql);
			ps.setString(1, productBean.getBasicCode());
			ps.setString(2, productBean.getName());
			ps.setString(3, productBean.getXcode());
			ps.setString(4, productBean.getNcode());
			ps.setString(5, productBean.getMain_img());
			ps.setString(6, productBean.getSub_img());
			ps.setInt(7, productBean.getPrice());
			ps.setInt(8, productBean.getLikey());

			
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
				productBean.setPrice(rs.getInt("price"));
				productBean.setLikey(rs.getInt("likey"));
				productBean.setDate(rs.getTimestamp("date"));
				
				
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

	public ArrayList<ProductOptionBean> selectOptionList(String basicCode) {
	
		ArrayList<ProductOptionBean> optionList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 
		try {
			String sql = "select * from opt where basicCode=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, basicCode);
			rs = pstmt.executeQuery();
			
			optionList = new ArrayList<ProductOptionBean>();
			while(rs.next()) {
				ProductOptionBean option = new ProductOptionBean();
				
				option.setBasicCode(basicCode);
				option.setProductCode(rs.getString("productCode"));
				option.setColor(rs.getString("color"));
				option.setSize(rs.getString("size"));
				option.setStock(rs.getInt("stock"));
				
				optionList.add(option);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return optionList;
	}

	// 옵션 삭제 + 옵션 없을때 상품도 같이 삭제
	public int deleteOption(String productCode) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "delete from opt where productCode=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productCode);
			count = pstmt.executeUpdate();
			if(count > 0) {
				sql = "select count(*) from opt where basicCode=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, productCode.substring(0, 4));
				rs = pstmt.executeQuery();
				
				
				if(rs.next()) {
					if(rs.getInt(1) == 0) {
						count = deleteProduct(productCode.substring(0, 4));
					} else {
						return count;
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return count;
	}
	
	// 상품 삭제
	public int deleteProduct(String basicCode) {
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select main_img, sub_img from product where basicCode=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, basicCode);
			rs = pstmt.executeQuery();
			
			sql = "delete from product where basicCode=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, basicCode);
			count = pstmt.executeUpdate();
			
			// 저장된 이미지도 같이 삭제하기
			if(rs.next()) {
				String[] main = rs.getString(1).split("/");
				String[] sub = rs.getString(2).split("/");
				String path = "../upload/productUploadImg/";
				File f = new File(path+main[0]);
				
				if(main.length == 0) {
					f = new File(path+rs.getString(1));
					if(f.exists()) 		f.delete();
				} else {
					for(String s: main) {
						f = new File(path+s);
						if(f.exists()) 	f.delete();
					}
				}
				if(sub.length == 0) {
					f = new File(path+rs.getString(1));
					if(f.exists()) 		f.delete();
				} else {
					for(String s: main) {
						f = new File(path+s);
						if(f.exists()) 	f.delete();
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return count;
	}

	
	public ArrayList<ProductOptionBean> selectColorList(String basicCode) {
		ArrayList<ProductOptionBean> colorList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 
		try {
			String sql = "select distinct color from opt where basicCode=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, basicCode);
			rs = pstmt.executeQuery();
			
			colorList = new ArrayList<ProductOptionBean>();
			while(rs.next()) {
				ProductOptionBean option = new ProductOptionBean();
				

				option.setColor(rs.getString("color"));

				colorList.add(option);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return colorList;
	}
	
	public ArrayList<ProductOptionBean> selectSizeList(String basicCode) {
		ArrayList<ProductOptionBean> sizeList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 
		try {
			String sql = "select distinct size from opt where basicCode=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, basicCode);
			rs = pstmt.executeQuery();
			
			sizeList = new ArrayList<ProductOptionBean>();
			while(rs.next()) {
				ProductOptionBean option = new ProductOptionBean();

				option.setSize(rs.getString("size"));

				
				sizeList.add(option);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return sizeList;
	}
	public boolean isLike(String id,String basicCode) {
		boolean isLike = false;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product_like where member_id=? and product_basicCode=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, basicCode);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				isLike = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);

		}
		System.out.println("맞나요?"+isLike);
		
		return isLike;
	}
	public int isInsert(String id,String basicCode) {
		int isInsert = 0;
		int num =0;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select MAX(num) from product_like";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getInt("MAX(num)")+1;
			}
			
			
			sql = "insert into product_like(num,selected,member_id,product_basicCode) values(?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setInt(2, 35);
			ps.setString(3, id);
			ps.setString(4, basicCode);
			isInsert = ps.executeUpdate();
			System.out.println(num+" "+0+" "+" "+id+" "+basicCode);

			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);

		}
		System.out.println("됬나요?"+isInsert);
		
		return isInsert;
	}
	public int isDelete(String id,String basicCode) {
		int isDelete = 0;
		int num =0;
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			String sql = "delete from product_like where member_id=? and product_basicCode=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, basicCode);
			isDelete = ps.executeUpdate();
//			System.out.println(num+" "+0+" "+" "+id+" "+basicCode);

			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);

		}
		System.out.println("삭제됬나요?"+isDelete);
		
		return isDelete;
	}
	public int isLikey(String basicCode) {
		int isLikey = 0;
		
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
		
			
			String sql = "update product set likey= likey+1 where basicCode=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, basicCode);
			isLikey = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);

		}
		System.out.println("막?"+isLikey);
		
		return isLikey;
	}

	public int isUnLikey(String basicCode) {
		int isUnLikey = 0;
		
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			String sql = "update product set likey= likey-1 where basicCode=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, basicCode);
			isUnLikey = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);

		}
		System.out.println("막?"+isUnLikey);
		
		return isUnLikey;
	}

	// --------------------마이페이지 > 내가 찜한 상품 > 좋아요 리스트----------------------------
	public ArrayList<String> selectMylikeList(String member_id) {
		ArrayList<String> list = new ArrayList<String>();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select product_basicCode from product_like where member_id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, member_id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		
		
		return list;
	}
	// --------------------마이페이지 > 내가 찜한 상품 > 좋아요된 상품 리스트----------------------------
	public ArrayList<ProductBean> selectProductList(ArrayList<String> mylikeList) {
		
		ArrayList<ProductBean> productDetailList = new ArrayList<ProductBean>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			for(String basicCode: mylikeList) {
				String sql = "select * from product where basicCode=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, basicCode);
				System.out.println("ProductDAO - " + basicCode);
				rs = ps.executeQuery();
				
				while(rs.next()) {
					ProductBean pb = new ProductBean();
					pb.setBasicCode(rs.getString("basicCode"));
					pb.setXcode(rs.getString("xcode"));
					pb.setNcode(rs.getString("ncode"));
					pb.setDate(rs.getTimestamp("date"));
					pb.setMain_img(rs.getString("main_img"));
					pb.setSub_img(rs.getString("sub_img"));
	//				pb.setStock(rs.getInt("stock"));
					pb.setPrice(rs.getInt("price"));
					pb.setLikey(rs.getInt("likey"));
					pb.setName(rs.getString("name"));
					
					productDetailList.add(pb);
				}
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

	public ArrayList<String> selectLikeBasicCodeList(String id) {
		ArrayList<String> likeBasicCodeList = new ArrayList<String>();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product_like where member_id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				likeBasicCodeList.add(rs.getString("product_basicCode"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(rs);
		}
		
		return likeBasicCodeList;
	}

}
