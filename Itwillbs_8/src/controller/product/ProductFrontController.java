package controller.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.product.ControlProductListAction;
import action.product.OptionDeleteAction;
import action.product.ProductDeleteAction;
import action.product.ProductDetailAction;
import action.product.ProductLikeAction;
import action.product.ProductMylikeListAction;
import action.product.ProductSelectAction;
import action.product.ProductUnLikeAction;
import action.product.ProductUploadProAction;
import action.product.qna.ProdQnaDeleteAction;
import action.product.qna.ProdQnaModifyFormAction;
import action.product.qna.ProdQnaModifyProAction;
import action.product.qna.ProdQnaReplyFormAction;
import action.product.qna.ProdQnaReplyProAction;
import action.product.qna.ProdQnaWriteFormAction;
import action.product.qna.ProdQnaWriteProAction;
import action.product.qna.ProductMyqnaListAction;
import action.product.review.ProdReviewDeleteAction;
import action.product.review.ProdReviewListAction;
import action.product.review.ProdReviewModifyAction;
import action.product.review.ProdReviewReplyAction;
import action.product.review.ProdReviewWriteAction;
import action.product.review.ProductMyreviewListAction;
import vo.ActionForward;

@WebServlet("*.po")
public class ProductFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		ActionForward forward = null;
		Action action = null;
		String command = request.getServletPath();

		if (command.equals("/ProductShop.po")) {
			action = new ProductSelectAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {

				e.printStackTrace();
			}
		} else if (command.equals("/ProductDetail.po")) {
			action = new ProductDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/ProductSearch.po")) {
//			action = new ProductDetailAction();
			forward = new ActionForward();
			forward.setPath("/product/shopSearch.jsp");
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
		}else if (command.equals("/ProductLike.po")) {
			action = new ProductLikeAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ProductUnLike.po")) {
			action = new ProductUnLikeAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 상품 업로드
		else if (command.equals("/ProductUpload.po")) {
			forward = new ActionForward();
			forward.setPath("/product/product_upload.jsp");
		} else if (command.equals("/ProductUploadPro.po")) {
//			forward = new ActionForward();
			action = new ProductUploadProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// -------------전체 상품 리스트 보기----------------
		else if (command.equals("/ControlProductList.po")) {
			forward = new ActionForward();

			action = new ControlProductListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// -------------상품 삭제----------------
		else if (command.equals("/ProductDelete.po")) {
			forward = new ActionForward();

			action = new ProductDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// -------------옵션 삭제----------------
		else if (command.equals("/OptionDelete.po")) {
			forward = new ActionForward();

			action = new OptionDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// --------------------상품 리뷰 쓰기--------------------
		else if (command.equals("/ProdReviewWrite.po")) {
			System.out.println("ProdReviewWrite.po 포워딩");
			action = new ProdReviewWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// --------------------리뷰 목록 호출--------------------
		else if (command.equals("/ProdReviewList.po")) {
			System.out.println("ProdReviewList.po 포워딩");
			action = new ProdReviewListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// --------------------상품 리뷰 삭제--------------------
		else if (command.equals("/ProdReviewDelete.po")) {
			System.out.println("ProdReviewDelete.po 포워딩");
			action = new ProdReviewDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// --------------------상품 리뷰 수정--------------------
		else if (command.equals("/ProdReviewModify.po")) {
			System.out.println("ProdReviewModify.po 포워딩");
			action = new ProdReviewModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// --------------------상품 리뷰 답글--------------------
		else if(command.equals("/ProdReviewReply.po")) {
			System.out.println("ProdReviewReply.po 포워딩");
			action = new ProdReviewReplyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// --------------------상품 qna 쓰기--------------------
		else if (command.equals("/ProdQnaWriteForm.po")) {
			System.out.println("ProdQnaWriteForm.po 포워딩");
			action = new ProdQnaWriteFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/ProdQnaWritePro.po")) {
			System.out.println("ProdQnaWritePro.po");
			action = new ProdQnaWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// --------------------상품 qna 삭제--------------------
		else if (command.equals("/ProdQnaDelete.po")) {
			System.out.println("ProdQnaDelete.po 포워딩");
			action = new ProdQnaDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// --------------------상품 qna 수정--------------------
		else if (command.equals("/ProdQnaModifyForm.po")) {
			System.out.println("ProdQnaModifyForm.po 포워딩");
			action = new ProdQnaModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ProdQnaModifyPro.po")) {
			System.out.println("ProdQnaModifyPro.po 포워딩");
			action = new ProdQnaModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// --------------------상품 qna 답글--------------------
		else if (command.equals("/ProdQnaReplyForm.po")) {
			System.out.println("ProdQnaReplyForm.po 포워딩");
			action = new ProdQnaReplyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ProdQnaReplyPro.po")) {
			System.out.println("ProdQnaReplyPro.po 포워딩");
			action = new ProdQnaReplyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// -------------------마이페이지 > 내가 찜한 상품 보기-------------
		else if (command.equals("/ProductMylikeList.po")) {
			System.out.println("ProductMylikeList.po 포워딩");
			action = new ProductMylikeListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// -------------------마이페이지 > 내 상품 리뷰 보기-------------
		else if (command.equals("/ProductMyreviewList.po")) {
			System.out.println("ProductMyreviewList.po 포워딩");
			action = new ProductMyreviewListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// -------------------마이페이지 > 내 상품 qna 보기-------------
		else if (command.equals("/ProductMyqnaList.po")) {
			System.out.println("ProductMyqnaList.po 포워딩");
			action = new ProductMyqnaListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// ------------공통적으로 수행할 포워딩 작업----------------
		if (forward != null) {
			// 2.ActionForward 객체 내의 포워딩 방식에 따라 각각의 포워딩 수행
			// =>Redirect 방식: isRedirect() == true,
//			    Dispatcher 방식: isRedirec() == false.
			if (forward.isRedirect()) {// Redirect 방식일 경우
				// 3.Redirect 방식일 경우
				// response 객체의 sendRedirect() 메서드를 호출하여 포워딩
				// =>파라미터: 포워딩 할 URL
				response.sendRedirect(forward.getPath());

			} else {// Dispatcher 방식일 경우
					// 1.request 객체의 getRequestDispatcher() 메서드를 호출하여
					// RequestDispatcher 객체를 리턴받기
					// =>파라미터 : 포워딩 할 URL
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				// 2.RequestDispatcher 객체의 forward() 메서드를 호출하여
				// 포워딩 수행(파라미터: request, response 객체)
				dispatcher.forward(request, response);
			}
		}
		// ------------공통적으로 수행할 포워딩 작업----------------
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
