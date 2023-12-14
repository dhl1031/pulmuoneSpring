package org.pro.pulmuone.domain.cart;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
@Builder
public class CartVO {

	private int program_no;         		// 프로그램번호
	private int img_no;	     	 			// 작성자
	
	private String member_id;
	private String products_no;      		// 상품번호
	private String products_name;      	// 상품명
	private String program_content;    	// 프로그램 내용
	private String products_type;      // 상품타입
	private String System_name;
	private int price;
	private int event_price;      // 이벤트가격
	private String delivery_type;         // 배송방식
	private int products_tag;
	private String products_size;
	private String img_path;
	private String dayweek;	
	private String wish_status; // 찜 상태
	private int cart_no;  
	private int amount;  
	private int member_no;  
	private int mon_cnt;  
	private int tue_cnt;    
	private int wed_cnt;   
	private int thu_cnt;    
	private int fir_cnt;   
	private String reg_date;
	public String[] getpnoArr() {
	   return products_no == null ? new String[] {} : this.products_no.split(",");
  }
}

