package org.pro.pulmuone.service.franchiseSearch;

import java.sql.SQLException;
import java.util.ArrayList;

import org.pro.pulmuone.domain.franchiseSearch.AddressDTO;
import org.pro.pulmuone.domain.franchiseSearch.FranchiseDTO;
import org.pro.pulmuone.mapper.franchiseSearch.FranchiseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FranchiseServiceImpl implements FranchiseService{

	@Autowired
	private FranchiseMapper franchiseMapper;
	
	@Override
	public ArrayList<FranchiseDTO> search(AddressDTO vo) throws SQLException {
		return this.franchiseMapper.select(vo);
	}

}
