package org.pro.pulmuone.domain.order.box;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoxOrderProductsDTO {
	
	private int box_order_no;
	private String products_no;
	private int products_cnt;
	
	private List<BoxOrderProductsDTO> boxOrderProductsList;
	
}
