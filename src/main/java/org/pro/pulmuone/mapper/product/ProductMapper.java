package org.pro.pulmuone.mapper.product;

import java.util.List;

import org.pro.pulmuone.domain.product.ProductsDTO;

public interface ProductMapper {
	List<ProductsDTO> search(ProductsDTO dto);
	List<ProductsDTO> best(ProductsDTO dto);
		
}
