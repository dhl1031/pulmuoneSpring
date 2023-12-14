package org.pro.pulmuone.domain.order;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HaveCouponDTO {
	
	private int coupon_no;
	private int member_no;
	private Date issue_date;
	private Date expiry_date;
	private int used;
	private int box_pay_no;
	private int drk_pay_no;
	
	private List<HaveCouponDTO> haveCouponList;
	
}
