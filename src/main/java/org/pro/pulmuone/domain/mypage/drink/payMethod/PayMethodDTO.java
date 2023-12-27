package org.pro.pulmuone.domain.mypage.drink.payMethod;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayMethodDTO {

	private int	memberNo; 
	private long drkOrderNo;
	private String drkOrderName;
	private int drkStatus;
	private int fcNo;
	private String fcName;
	private String fcTel; 
	private String fcPhone; 
	private int drkPayMethod;
	private int drkPayStatus;
	private int payInfoNo; 
	
	// card
	private String cardNum;
	private String expiryDate;
	private Date BirthDate;
	private String cardBirthDate;
	
	// bank
	private String acntHolder;
	private int bankNo;
	private String acntNum; 
	private String bankName;
}
