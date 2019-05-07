package com.swt.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.swt.action.ActionForward;
import com.swt.dao.ProductDAO;
import com.swt.dto.ProductDTO;

public class IndexAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "index.jsp";
		
		ProductDAO pDao = ProductDAO.getInstance();
		List<ProductDTO> bList = pDao.bestList();
		
		request.setAttribute("bestList", bList);
		for (ProductDTO productDTO : bList) {
			System.out.print(productDTO.getP_name());
			System.out.print(productDTO.getP_img());
			System.out.print(productDTO.getP_price());
			System.out.println();
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url); 
		forward.setRedirect(false);
		
		return forward; 
	}

}
