package org.pro.pulmuone.domain.order.box;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoxOrderDTO {
	
	private int box_order_no;
	private int member_no;
	private int box_order_status;
	private Date box_order_date;
	
}
