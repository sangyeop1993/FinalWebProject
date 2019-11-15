package com.kosateam2.chicken.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kosateam2.chicken.dto.ChickenMemberAndOrder;
import com.kosateam2.chicken.dto.ItemMenusAndMenus;
import com.kosateam2.chicken.dto.Order;


@Component
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ChickenMemberAndOrder> orderList() {
		List<ChickenMemberAndOrder> list=sqlSessionTemplate.selectList("admin.selectOrderList");
		return list;
	}

	public ChickenMemberAndOrder selectOneByOid(int oid) {
		ChickenMemberAndOrder chickenMemberAndOrder=sqlSessionTemplate.selectOne("admin.selectOneById",oid);
		return chickenMemberAndOrder;
	}

	public List<ItemMenusAndMenus> selectOrderItems(int oid) {
		List<ItemMenusAndMenus> list=sqlSessionTemplate.selectList("admin.selectOrderItemList",oid);
		return list;
	}

	public boolean updateOrderState(Order order) {
		int result=sqlSessionTemplate.update("admin.updateOrderState",order);
		if(result>0)
			return true;
		return false;
	}

	

}
