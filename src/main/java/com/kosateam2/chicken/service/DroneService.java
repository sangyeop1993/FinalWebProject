package com.kosateam2.chicken.service;


import java.util.ArrayList;

import javax.annotation.PreDestroy;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosateam2.chicken.dao.DroneDao;
import com.kosateam2.chicken.dto.DroneMission;

@Service
public class DroneService {
	private static final Logger logger = LoggerFactory.getLogger(DroneService.class);
	
	@Autowired
	private DroneDao droneDao;

	public String mqttBrokerConnStr = "tcp://localhost:1882";
	//public String mqttBrokerConnStr = "tcp://106.253.56.124:1882";
    public String pubTopic = "/drone/fc/pub";
    public String subTopic = "/drone/fc/sub"; 
    public MqttClient mqttClient;
    
    public DroneService() {
    	 mqttConnect();
    }
 
    
    public void mqttConnect() {
        try {
        	logger.debug("###############################연결됐다########################");
            if(mqttClient != null && mqttClient.isConnected()) {
                mqttClient.disconnect();
                mqttClient.close();
            }
            mqttClient = new MqttClient(mqttBrokerConnStr, MqttClient.generateClientId(), null);
            mqttClient.connect();
            mqttReceiveFromMissionUpload();
        } catch (Exception e) {
        	e.printStackTrace();
        }
    }
    
    public void mqttReceiveFromMissionUpload() {
    	mqttClient.setCallback(new MqttCallback() {
			@Override
			public void connectionLost(Throwable arg0) {}

			@Override
			public void deliveryComplete(IMqttDeliveryToken arg0) {}

			@Override
			public void messageArrived(String s, MqttMessage message) throws Exception {
				byte[] byte_mission = message.getPayload();
				String json = new String(byte_mission);
				JSONObject obj = new JSONObject(json);
				
				if(obj.getString("msgid").equals("MISSION_UPLOAD")) {
					int missionId = droneDao.getMissionId();
					JSONArray points = obj.getJSONArray("items");
					ArrayList<DroneMission> droneMissionList = new ArrayList<>();
					
					for(int i=0;i<points.length();i+=1) {
						DroneMission mission = new DroneMission();
						JSONObject obj_points = points.getJSONObject(i);
						mission.setMissionid(missionId);
						mission.setSeq(String.valueOf(obj_points.getInt("seq")));
						mission.setCommand(String.valueOf(obj_points.getInt("command")));
						mission.setParam1(String.valueOf(obj_points.getInt("param1")));
						mission.setParam2(String.valueOf(obj_points.getInt("param2")));
						mission.setParam3(String.valueOf(obj_points.getInt("param3")));
						mission.setParam4(String.valueOf(obj_points.getInt("param4")));
						mission.setX(String.valueOf(obj_points.getDouble("x")));
						mission.setY(String.valueOf(obj_points.getDouble("y")));
						mission.setZ(String.valueOf(obj_points.getDouble("z")));
						droneMissionList.add(mission);
					}
					droneDao.insert(droneMissionList);
				}
			}
    	});
    	
    	try {
			mqttClient.subscribe(subTopic);
		} catch (MqttException e) {
			e.printStackTrace();
		}
    }
    
    
    public void mqttDisconnect() {
        try {
            mqttClient.disconnectForcibly();
            mqttClient.close(true);
        } catch (Exception e) {
        	e.printStackTrace();
        }
    }    
    
    @PreDestroy
    public void destroy() {
        mqttDisconnect();
    }
    
}
