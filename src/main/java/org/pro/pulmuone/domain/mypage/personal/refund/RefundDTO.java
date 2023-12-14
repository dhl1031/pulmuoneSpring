package org.pro.pulmuone.domain.mypage.personal.refund;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RefundDTO {

	private int memberNo;
	private String insttCode;
	private String acctOwner;
	private String acctNum;
	private String insttName;
	
}
