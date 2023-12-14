package org.pro.pulmuone.domain.order.daily;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DailyItemInfoDTO {
	
	private String products_no;
	// private int category_no;
	private String products_name;
	private List<Integer> products_cnt;
	// private String products_type;
	private String products_size;
	private int price;
	private int event_price;
	private String img_path;
	private String system_name;
	// private String tracking_no;
	// private String products_tag;
	private int total_count;
	
}
