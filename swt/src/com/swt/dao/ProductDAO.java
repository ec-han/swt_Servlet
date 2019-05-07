package com.swt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.swt.dao.ProductDAO;
import com.swt.dto.ProductDTO;
import com.swt.mybatis.SqlMapConfig;

public class ProductDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	SqlSession sqlSession;

	private ProductDAO() {} 
	
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	}
	
	
	int result = 0;
	
	public List<ProductDTO> bestList() {
		List<ProductDTO> list = null;
		
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			list = sqlSession.selectList("bestList");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return list;
		
	}
}
