package com.kosateam2.chicken.service;

import javax.annotation.PreDestroy;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class WebSocketTest {
   private static final Logger logger= LoggerFactory.getLogger(WebSocketTest.class);
   
   private MqttClient client;
   
   public WebSocketTest() {
      mqttConnect();
   }
   
   private void mqttConnect() {
      try {
         client =new MqttClient("tcp://106.253.56.124:1882",MqttClient.generateClientId(),null);
         client.connect();
         receiveMessage();
         logger.info("Mqtt Broker 연결");
      } catch (MqttException e) {
         e.printStackTrace();
      }
   }
   
   private void mqttDisconnect() {
      try{
         client.disconnectForcibly(1);
         logger.info("Mqtt Broker 연결 해제");
         client.close(true);
      } catch (MqttException e) {
         e.printStackTrace();
      }
   }
   
   @PreDestroy
   public void destroy() {
      mqttDisconnect();
      logger.info("killed~~~~~~~~~~~~~~~");
   }
   
   private void receiveMessage() throws MqttException {
      client.setCallback(new MqttCallback() {

         @Override
         public void connectionLost(Throwable cause) {
            // TODO Auto-generated method stub
            
         }

         @Override
         public void messageArrived(String topic, MqttMessage message) throws Exception {
            // TODO Auto-generated method stub
            byte[] bytes=message.getPayload();
            String json= new String(bytes);
            System.out.println(json+"=============================================================");
            
            //subscribe 동안에는 publish를 할 수 없다.
            //client.publish(...) (x)
            //해결책: 새로운 스레드로 publish는 가능하다.
            /*
             * Thread thread = new Thread() {
               public void run() {
                  //client.publish(...)(o)
               }
            };
            thread.start();
             */
         }

         @Override
         public void deliveryComplete(IMqttDeliveryToken token) {
            // TODO Auto-generated method stub
            
         }
         
      });
      client.subscribe("/drone/chicken/delivery/request");
   }

   public void sendMessage(String topic, String message) {
      try {
         client.publish(topic, message.getBytes(),0,false);
      } catch(Exception e) {
         e.printStackTrace();
      }
   }

}