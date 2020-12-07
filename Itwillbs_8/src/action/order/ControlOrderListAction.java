package action.order;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.order.ControlOrderListService;
import vo.ActionForward;
import vo.DetailOrderBean;
import vo.OrderBean;

public class ControlOrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		ControlOrderListService controlOrderListService = new ControlOrderListService();

		ArrayList<OrderBean> mainorderList = new ArrayList<OrderBean>();
		HashMap<String, ArrayList<DetailOrderBean>> detailorderList = new HashMap<String, ArrayList<DetailOrderBean>>();

		mainorderList = controlOrderListService.getMainorderList();
				
		for (int i = 0; i < mainorderList.size(); i++) {
			OrderBean mainorder = new OrderBean();
			mainorder = mainorderList.get(i);

			String mainorder_code = mainorder.getCode();
			
			ArrayList<DetailOrderBean> detailorderSubList = new ArrayList<DetailOrderBean>();
			detailorderSubList = controlOrderListService.getDetailorderList(mainorder_code);
			detailorderList.put(mainorder_code, detailorderSubList);

		}

		request.setAttribute("mainorderList", mainorderList);
		request.setAttribute("detailorderList", detailorderList);

		forward = new ActionForward();
		forward.setPath("/order/control_order.jsp");

		return forward;
	}

}
