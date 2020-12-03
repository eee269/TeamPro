package action.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.order.MyorderDetailService;
import vo.ActionForward;
import vo.DetailOrderBean;
import vo.OrderBean;

public class MyorderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		String mainorder_code = request.getParameter("code");
		
		MyorderDetailService service = new MyorderDetailService();
		OrderBean mainorder = service.selectMainorder(mainorder_code);
		ArrayList<DetailOrderBean> detailorderList = service.getDetailorderList(mainorder_code);
		
		request.setAttribute("detailorderList", detailorderList);
		request.setAttribute("mainorder", mainorder);
		
		forward = new ActionForward();
		forward.setPath("/order/orderDetail.jsp");
		
		return forward;
	}

}
