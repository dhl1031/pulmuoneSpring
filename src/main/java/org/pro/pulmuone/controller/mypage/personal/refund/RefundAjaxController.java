package org.pro.pulmuone.controller.mypage.personal.refund;

import org.pro.pulmuone.domain.mypage.personal.refund.RefundDTO;
import org.pro.pulmuone.security.domain.CurrentUser;
import org.pro.pulmuone.service.mypage.personal.refund.RefundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/ajax/mypage/personal/*")
@Log4j
public class RefundAjaxController {

	@Autowired
	private RefundService refundService;
	
	// 환불계좌 등록 처리
	@PostMapping(value = "/refund/{memberNo}", consumes = "application/json", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE } )
	public ResponseEntity<Boolean> write(Authentication authentication, @RequestBody RefundDTO dto) {
		log.warn("> RefundAjaxController write()...");
		
        CurrentUser user = (CurrentUser) authentication.getPrincipal();
		int memberNo = user.getMember().getMemberNo();
		
		dto.setMemberNo(memberNo);
		
		boolean writeResult = this.refundService.writeRefundAcct(dto);
		
		return writeResult ? new ResponseEntity<Boolean>(writeResult, HttpStatus.OK)
							: new ResponseEntity<Boolean>(writeResult, HttpStatus.INTERNAL_SERVER_ERROR);
	}	
	
	// 환불계좌 수정 처리
	@PutMapping(value = "/refund/{memberNo}", consumes = "application/json", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Boolean> modify(Authentication authentication, @RequestBody RefundDTO dto) {
		log.warn("> RefundAjaxController modify()...");
		
        CurrentUser user = (CurrentUser) authentication.getPrincipal();
		int memberNo = user.getMember().getMemberNo();
		
		dto.setMemberNo(memberNo);

		boolean modifyResult = this.refundService.modifyRefundAcct(dto);
		
		return modifyResult ? new ResponseEntity<Boolean>(modifyResult, HttpStatus.OK)
							: new ResponseEntity<Boolean>(modifyResult, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 환불계좌 삭제 처리
	@DeleteMapping(value = "/refund/{memberNo}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Boolean> delete(Authentication authentication) {
		log.warn("> RefundAjaxController delete()...");
		
        CurrentUser user = (CurrentUser) authentication.getPrincipal();
		int memberNo = user.getMember().getMemberNo();
		
		boolean deleteResult = this.refundService.deleteRefundAcct(memberNo);
		
		return deleteResult ? new ResponseEntity<Boolean>(deleteResult, HttpStatus.OK)
							: new ResponseEntity<Boolean>(deleteResult, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}