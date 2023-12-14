package org.pro.pulmuone.controller.franchiseSearch;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.pro.pulmuone.domain.franchiseSearch.AddressDTO;
import org.pro.pulmuone.domain.franchiseSearch.FranchiseDTO;
import org.pro.pulmuone.service.franchiseSearch.FranchiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/forum/franchise/*")
@Log4j
public class FranchiseController {
	// 해당 요청 외에 키 사용 금지
	final private String AUTHORIZATION = "KakaoAK 4e3d4720c5bff7fed4972483c92f49fd";
	
	@Autowired
	private FranchiseService franchiseService;
	
	@GetMapping("search")
	public String franchisePage() {
		log.info("> franchisePage...");
		return "forum/franchiseSearch/search.tiles";
	}
	
	@GetMapping(value = "searching", produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public ResponseEntity<Map<String,ArrayList<FranchiseDTO>>> franchiseSearching(@RequestParam("query") String query) throws Exception {
		// "{\"documents\":[{\"address\":{\"address_name\":\"서울 영등포구 당산동 121-22\",\"b_code\":\"1156011700\",\"h_code\":\"1156056000\",\"main_address_no\":\"121\",\"mountain_yn\":\"N\",\"region_1depth_name\":\"서울\",\"region_2depth_name\":\"영등포구\",\"region_3depth_h_name\":\"당산2동\",\"region_3depth_name\":\"당산동\",\"sub_address_no\":\"22\",\"x\":\"126.907703382657\",\"y\":\"37.5270069102324\"},\"address_name\":\"서울 영등포구 국회대로53길 20\",\"address_type\":\"ROAD_ADDR\",\"road_address\":{\"address_name\":\"서울 영등포구 국회대로53길 20\",\"building_name\":\"영동초등학교\",\"main_building_no\":\"20\",\"region_1depth_name\":\"서울\",\"region_2depth_name\":\"영등포구\",\"region_3depth_name\":\"당산동\",\"road_name\":\"국회대로53길\",\"sub_building_no\":\"\",\"underground_yn\":\"N\",\"x\":\"126.907703382657\",\"y\":\"37.5270069102324\",\"zone_no\":\"07229\"},\"x\":\"126.907703382657\",\"y\":\"37.5270069102324\"}],\"meta\":{\"is_end\":true,\"pageable_count\":1,\"total_count\":1}}";
		//ArrayList<FranchiseDTO>
		log.info("> franchiseSearching...");
		System.out.println(query);
		
		URL url;
		HttpURLConnection conn = null;
		query = URLEncoder.encode(query);
		
		System.out.println(">> franchise searching...");
		System.out.println(">>>>..." + query);
		
		String api = "https://dapi.kakao.com/v2/local/search/address"; 
		api += "?query=" + query;
		url = new URL(api); 
		conn = (HttpURLConnection) url.openConnection(); 
		conn.setRequestProperty("Authorization",AUTHORIZATION); 
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setConnectTimeout(5000);
		conn.setDoOutput(true); int responseCode = conn.getResponseCode();
		System.out.println("### getAccessToken responseCode : " + responseCode);
		
		
		BufferedReader br = null; 
		if( responseCode == 200 ) { 
			br = new BufferedReader(new InputStreamReader(conn.getInputStream())); 
		}else { 
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream())); 
		}

		String line; 
		StringBuffer res = new StringBuffer();
		while ( (line = br.readLine() ) != null ) { 
			res.append(line); 
		}
		System.out.println(res);
		
		Map<String, ArrayList<FranchiseDTO>> map = new HashMap<>();
		ArrayList<FranchiseDTO> list = null;
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(res.toString());
		JSONObject jsonObj = (JSONObject) obj;
		JSONArray documents = (JSONArray) jsonObj.get("documents");
		
		System.out.println(">>-- document  " + documents);
		if( documents.size() == 0 ) {
			map.put("result", list);
			System.out.println(">> 검색결과 없음");
			return new ResponseEntity<>(map, HttpStatus.OK);
		}
		JSONObject info = (JSONObject) documents.get(0);
		
		// 주소
		String address_name = query;
		// 경도
		Double fc_lng = Double.parseDouble( (String) info.get("x") );
		// 위도
		Double fc_lat = Double.parseDouble((String) info.get("y") );

		AddressDTO vo = new AddressDTO(address_name, fc_lng, fc_lat);

		
		list = franchiseService.search(vo);
		map.put("result", list);
		System.out.println(map);
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
}
