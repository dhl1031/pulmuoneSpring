package org.pro.pulmuone.mapper.franchiseSearch;

import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.franchiseSearch.AddressDTO;
import org.pro.pulmuone.domain.franchiseSearch.FranchiseDTO;

public interface FranchiseMapper {
	// 가맹점 조회 
	ArrayList<FranchiseDTO> select(AddressDTO vo) throws SQLException;
}
