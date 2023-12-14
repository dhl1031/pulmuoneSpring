package org.pro.pulmuone.mapper.modal;

import java.util.List;

import org.pro.pulmuone.domain.product.ProductsDTO;

public interface ModalMapper {
//	시음선물 모달 
	List<ProductsDTO> modalview(ProductsDTO dto);

	
}
