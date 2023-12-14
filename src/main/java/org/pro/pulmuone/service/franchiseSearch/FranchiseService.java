package org.pro.pulmuone.service.franchiseSearch;

import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.franchiseSearch.AddressDTO;
import org.pro.pulmuone.domain.franchiseSearch.FranchiseDTO;

public interface FranchiseService {
	// 가맹점 조회 
	ArrayList<FranchiseDTO> search(AddressDTO vo) throws SQLException;
}
