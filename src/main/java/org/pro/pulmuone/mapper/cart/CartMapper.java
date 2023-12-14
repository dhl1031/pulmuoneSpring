package org.pro.pulmuone.mapper.cart;

import java.util.List;

import org.pro.pulmuone.domain.cart.CartVO;
import org.pro.pulmuone.domain.curation.CurationVO;

public interface CartMapper {

	// 매일배송 장바구니
//   public List<CartVO> dailycart ( CartVO vo ) ;
   // 데일리 장바구니 조회
   public List<CartVO> daily( CartVO vo ) ;
   
   // 택배배송 장바구니
   public List<CartVO> boxcart(CartVO vo);
   // 택배배송 장바구니 조회
   public List<CartVO> box(CartVO vo);
}
