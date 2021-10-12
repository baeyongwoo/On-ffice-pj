package org.office.service;

import java.io.IOException;
import java.util.HashMap;

import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CrawlingServiceImpl implements CrawlingService {

	@Override
	public HashMap<String, Object> weather() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String url = "https://weather.naver.com/today";
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
			
		}catch(IOException e) {
		e.printStackTrace();
		}
		String temp = doc.select(".current").text();
		String weather = doc.select(".weather").text();
		map.put("temp", temp.toString());
		map.put("weather", weather.toString());
		
		return map;
	
	}

}
