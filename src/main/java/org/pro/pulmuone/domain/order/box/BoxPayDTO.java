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
public class BoxPayDTO {
	
	private int box_pay_no;
	private int box_order_no;
	private Date box_pay_datetime;
	private int box_price;
	private int box_sale_price;
	private int box_discount_price;
	private int box_shipping_fee;
	private int box_final_price;
	private int box_pay_method;
	private int box_pay_status;
	
}
