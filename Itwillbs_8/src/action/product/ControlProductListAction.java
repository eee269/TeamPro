package action.product;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.member.ControlMemberListService;
import svc.product.ControlProductListService;
import vo.ActionForward;
import vo.MemberBean;
import vo.PageInfo;
import vo.ProductBean;
import vo.ProductOptionBean;

public class ControlProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		ControlProductListService controlProductListService = new ControlProductListService();

		ArrayList<ProductBean> productList = new ArrayList<ProductBean>();
		HashMap<String, ArrayList<ProductOptionBean>> optionList = new HashMap<String, ArrayList<ProductOptionBean>>();
		ArrayList<ProductOptionBean> subOptionList = null;

		productList = controlProductListService.getProductList();
		for (int i = 0; i < productList.size(); i++) {
			ProductBean product = new ProductBean();
			product = productList.get(i);

			String basicCode = product.getBasicCode();

			subOptionList = new ArrayList<ProductOptionBean>();
			subOptionList = controlProductListService.getOptionList(basicCode);
			optionList.put(basicCode, subOptionList);
		}

		request.setAttribute("productList", productList);
		request.setAttribute("optionList", optionList);
		
		forward = new ActionForward();
		forward.setPath("/product/control_product.jsp");
		return forward;
	}

}
