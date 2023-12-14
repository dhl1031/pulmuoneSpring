package org.pro.pulmuone.domain.order.box;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoxShipDTO {
	
	private int box_order_no;
	private String box_receiver;
	private String box_tel;
	private String box_zip_code;
	private String box_addr;
	private String box_addr_detail;
	private String box_memo;
	private String tracking_no;
	
}
