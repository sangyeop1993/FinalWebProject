package com.kosateam2.chicken.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kosateam2.chicken.dto.DroneMission;

@Component
public class DroneDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insert(ArrayList<DroneMission> droneMissionList) {
		sqlSessionTemplate.delete("drone.delete");
		for(int i=0;i<droneMissionList.size();i+=1) {
			sqlSessionTemplate.insert("drone.insert", droneMissionList.get(i));
		}
	}

}
