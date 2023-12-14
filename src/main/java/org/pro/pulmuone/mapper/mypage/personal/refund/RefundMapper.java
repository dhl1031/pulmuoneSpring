package org.pro.pulmuone.mapper.mypage.personal.refund;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.pro.pulmuone.domain.mypage.personal.refund.RefundDTO;
import org.pro.pulmuone.domain.mypage.personal.refund.RefundInsttDTO;

public interface RefundMapper {

	public RefundDTO selectRefundAcct(int memberNo);

	public int insert(@Param("dto") RefundDTO dto);

	public int update(@Param("dto") RefundDTO dto);

	public int delete(@Param("memberNo") int memberNo);

	public List<RefundInsttDTO> selectAllRefundInstt();
	
}
