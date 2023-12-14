package org.pro.pulmuone.domain.franchiseSearch;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddressDTO {
	private String address_name;
	private Double x;	// 경도
	private Double y;	// 위도
}
