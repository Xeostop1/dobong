package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.MemberDTO;
import DAO.MemberDAO;


@WebServlet("/RegisterUpdateServlet")
public class RegisterUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id=request.getParameter("id");
		System.out.println("GET RegisterUpdateServlet: "+id);
				
		MemberDAO dao=MemberDAO.getInstance();
		MemberDTO dto=dao.getMember(id);

		request.setAttribute("register", dto);
		RequestDispatcher dis=request.getRequestDispatcher("memberUpdate.jsp");
		dis.forward(request, response);		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST RegisterUpdateServlet");
		request.setCharacterEncoding("UTF-8");
//		//jsp에서 수정한 값 가져오기
		String id=request.getParameter("id");
		String nickname=request.getParameter("nickname");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
//		String email=request.getParameter("email");
		String address=request.getParameter("address");
		
			
		MemberDTO dto=new MemberDTO();
		dto.setNickname(nickname);
		dto.setName(name);
		dto.setPassword(password);
		dto.setPhone(phone);
		dto.setId(id);
		dto.setAddress(address);
		
		MemberDAO updateDao=MemberDAO.getInstance();
		updateDao.updateRegister(dto);
		System.out.println("************"+dto+"\n");
//		request.setAttribute("register", dto);
//		RequestDispatcher dis=request.getRequestDispatcher("LoginServlet");
//		dis.forward(request, response);
		response.sendRedirect("LoginServlet");//공지사항페이지로 바로 이동
		
	}

}
