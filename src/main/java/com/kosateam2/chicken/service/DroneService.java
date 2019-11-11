package com.kosateam2.chicken.service;


import java.util.ArrayList;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
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
	
	public String mqttBrokerConnStr = "tcp://106.253.56.124:1882";
    public String pubTopic = "/drone/fc/pub";
    public String subTopic = "/drone/fc/sub"; 
    public MqttClient mqttClient;
    
    public void mqttConnect() {
        try {
            if(mqttClient != null && mqttClient.isConnected()) {
                mqttClient.disconnect();
                mqttClient.close();
            }
            mqttClient = new MqttClient(mqttBrokerConnStr, MqttClient.generateClientId(), null);
            MqttConnectOptions options = new MqttConnectOptions();
            options.setConnectionTimeout(5);
            options.setAutomaticReconnect(true);
            mqttClient.connect(options);
            mqttReceiveFromMissionUpload();
        } catch (Exception e) {}
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
					JSONArray points = obj.getJSONArray("items");
					ArrayList<DroneMission> droneMissionList = new ArrayList<>();
					for(int i=0;i<points.length();i+=1) {
						DroneMission mission = new DroneMission();
						JSONObject obj_points = points.getJSONObject(i);
						mission.setSeq(obj_points.getString("seq"));
						mission.setCommand(obj_points.getString("command"));
						mission.setParam1(obj_points.getString("param1"));
						mission.setParam2(obj_points.getString("param2"));
						mission.setParam3(obj_points.getString("param3"));
						mission.setParam4(obj_points.getString("param4"));
						mission.setX(obj_points.getString("x"));
						mission.setY(obj_points.getString("y"));
						mission.setZ(obj_points.getString("z"));
						droneMissionList.add(mission);
					}
					droneDao.insert(droneMissionList);
				}
			}
    		
    	});
    }
	
}
