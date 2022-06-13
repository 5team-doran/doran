package semi.member.community.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.member.community.model.service.CommunityService;
import semi.member.community.model.vo.Community;

@WebServlet("/community/detail")
public class CommunityServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int communityNo = Integer.parseInt(req.getParameter("cn"));
			
			CommunityService service = new CommunityService();
			
			Community comm = service.selectCommunity(communityNo);
			
			req.setAttribute("comm", comm);
			
			String path = "/WEB-INF/views/community/communityDetail.jsp";
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
