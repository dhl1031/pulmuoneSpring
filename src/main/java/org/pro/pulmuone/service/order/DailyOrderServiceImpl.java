package org.pro.pulmuone.service.order;

import java.util.List;

import org.pro.pulmuone.domain.order.daily.DailyItemInfoDTO;
import org.pro.pulmuone.domain.order.daily.DailyOrderItemDTO;
import org.pro.pulmuone.domain.order.daily.DrkOrderDTO;
import org.pro.pulmuone.mapper.order.DailyOrderMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class DailyOrderServiceImpl implements DailyOrderService {

	private DailyOrderMapper dailyOrderMapper;
	
	@Override
	public List<DailyItemInfoDTO> selectItems(List<DailyOrderItemDTO> items) {
		log.info("> DailyOrderServiceImpl.selectItems...");
		return this.dailyOrderMapper.selectItems(items);
	}

	@Override
	public int drkOrderInsert(DrkOrderDTO drkOrderDTO) {
		log.info("> DailyOrderServiceImpl.drkOrderInsert...");
		return this.dailyOrderMapper.drkOrderInsert(drkOrderDTO);
	}

	@Override
	public String getOrderName(int member_no) {
		log.info("> DailyOrderServiceImpl.getOrderName...");
		return this.dailyOrderMapper.getOrderName(member_no);
	}
	
	

}
