package org.pro.pulmuone.mapper.product;

import java.util.List;

import org.pro.pulmuone.domain.product.ProductsDTO;

public interface ProductMapper {
//	상품 리스트
	List<ProductsDTO> search(ProductsDTO dto);
	List<ProductsDTO> searchcount(ProductsDTO dto);
//	추천상품 리스트
	List<ProductsDTO> best(ProductsDTO dto);
//	상품 상세보기	
	List<ProductsDTO> view(ProductsDTO dto);
	
}
