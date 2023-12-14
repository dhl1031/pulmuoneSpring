package org.pro.pulmuone.service.mypage.personal.refund;

import java.util.List;

import org.pro.pulmuone.domain.mypage.personal.refund.RefundDTO;
import org.pro.pulmuone.domain.mypage.personal.refund.RefundInsttDTO;

public interface RefundService {

	public RefundDTO getRefundAcct(int memberNo);
	
	public boolean writeRefundAcct(RefundDTO dto);
	
	public boolean modifyRefundAcct(RefundDTO dto) ;

	public boolean deleteRefundAcct(int memberNo);

	public List<RefundInsttDTO> getAllRefundInstt();
			

}
