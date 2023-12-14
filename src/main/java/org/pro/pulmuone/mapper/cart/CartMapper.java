package org.pro.pulmuone.mapper.cart;

import java.util.List;

import org.pro.pulmuone.domain.cart.CartVO;

public interface CartMapper {

  // 매일배송 장바구니
  public int dailycart(CartVO vo);

  // 데일리 장바구니 조회
  public List<CartVO> daily(CartVO vo);

  // 매일배송 장바구니 삭제
  public int dailycartdelete(CartVO vo);

  // 매일배송 장바구니 수량
  public int dailycartupdate(CartVO vo);  
  
  // 택배배송 장바구니
  public int boxcart(CartVO vo);

  // 택배배송 장바구니 조회
  public List<CartVO> box(CartVO vo);

  // 택배배송 장바구니 삭제
  public int boxcartdelete(CartVO vo);
}
