/*package com.example.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.parser.JSONParser;


public class Json {
	public String json;
	   String address;
	   public Json(String address) throws Exception{
	      
	      
	      this.address = address;
	      BufferedReader br;
	      URL url;
	      HttpURLConnection conn;
	      String protocol = "GET";

	      url = new URL(address);
	      conn = (HttpURLConnection)url.openConnection();
	      conn.setRequestMethod(protocol);
	      br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
	      	
	      json = br.readLine();
	      //System.out.println(json);
	   }
}
*/