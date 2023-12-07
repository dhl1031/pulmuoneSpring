package org.pro.pulmuone.domain.curation;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class KidsVO {

	private int kids_product_no;         // 키즈번호
	private int program_no;         		// 프로그램번호
	private int img_no;     	 				// 이미지 번호
	private String program_name;      	// 프로그램명 ok
	private String dayweek;      		   // 요일 ok
	private String products_no;      		// 상품번호
	private String products_name;      	// 상품명 ok
	private String program_content;    	// 프로그램 내용 ok

	private String system_name;
	private int price;
	private int products_tag;
	private String Products_size;
	private String Products_sub_name;
	private String origin_name;
}

