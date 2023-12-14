package org.pro.pulmuone.domain.franchiseSearch;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FranchiseDTO {
	private String fc_name;
	private String fc_addr;
	private String fc_phone;
	private String fc_tel;
	private int fc_type;
	private int gift_avail;
	
}
