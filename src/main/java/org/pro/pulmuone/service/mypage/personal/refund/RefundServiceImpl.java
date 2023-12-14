package org.pro.pulmuone.service.mypage.personal.refund;

import java.util.List;

import org.pro.pulmuone.domain.mypage.personal.refund.RefundDTO;
import org.pro.pulmuone.domain.mypage.personal.refund.RefundInsttDTO;
import org.pro.pulmuone.mapper.mypage.personal.refund.RefundMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RefundServiceImpl implements RefundService {

	@Autowired
	private RefundMapper refundMapper;
	
	@Override
	public RefundDTO getRefundAcct(int memberNo) {
		
		RefundDTO dto = this.refundMapper.selectRefundAcct(memberNo);
		
		return dto;
	}

	@Override
	public boolean writeRefundAcct(RefundDTO dto) {

		int insertResult = this.refundMapper.insert(dto);
		
		return insertResult == 1 ? true : false;
	}

	@Override
	public boolean modifyRefundAcct(RefundDTO dto) {
		int updateResult = this.refundMapper.update(dto);
		
		return updateResult == 1 ? true : false;	
	}

	@Override
	public boolean deleteRefundAcct(int memberNo) {
		
		int deleteResult = this.refundMapper.delete(memberNo);
		
		return deleteResult == 1 ? true : false;
	}

	@Override
	public List<RefundInsttDTO> getAllRefundInstt() {

		List<RefundInsttDTO> insttDtoList = this.refundMapper.selectAllRefundInstt();
		
		return insttDtoList;
	}



}
