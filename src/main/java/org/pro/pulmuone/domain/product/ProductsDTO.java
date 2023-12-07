package org.pro.pulmuone.domain.product;

import java.util.Date;

import lombok.Data;

@Data
public class ProductsDTO {
	
	   private String products_no;         // 상품번호
	   private String category_no;      // 카테고리번호 , 카테고리 파라미터
	   private String products_name;      // 상품명
	   private String products_sub_name;      // 상품서브명
	   private String products_type;      // 상품타입
	   private String content;      // 내용
	   private int price;      // 가격
	   private int event_price;      // 이벤트가격
	   private String products_size;         // 용량
	   private String delivery_type;         // 배송방식
	   private int tag_no1;         // 태그1
	   private int tag_no2;         // 태그2
	   private int tag_no3;         // 태그3
	   private int tag_no4;         // 태그4
	   private int tag_no5;         // 태그5
	   private String tags;            // 태그파라미터
	   private int products_tag;         // 상품태그
	   private Date reg_date;         // 등록날
	   private String event_tag;         // 상품이벤트태그
	   private String event_tag2;         // 상품이벤트태그
	   private int idx;         // 찜하기 삭제
	   private String wish_status; // 찜 상태
	   
	   private String system_name;         // 이미지
	   private String origin_name;         // 이미지
	   
	   
	   public String[] gettagArr() {
		   return tags == null ? new String[] {} : this.tags.split(",");
	   }
	   
}