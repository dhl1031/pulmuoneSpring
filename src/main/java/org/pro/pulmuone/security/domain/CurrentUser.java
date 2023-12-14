package org.pro.pulmuone.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.pro.pulmuone.domain.member.MemberDTO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CurrentUser extends User {

	private MemberDTO member;
	
	// MemberVO 객체를 UserDetails에 삽입하기 위함

	public CurrentUser(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		// TODO Auto-generated constructor stub
	}
	
	
	public CurrentUser(MemberDTO vo) {
		super(vo.getMemberId(), vo.getPwd(), vo.getAuthList().stream().map( auth -> new SimpleGrantedAuthority( auth.getAuthority() ) ).collect( Collectors.toList() ));
		 // List<AuthVO>  -> 
	    //                    Collection<? extends GrantedAuthority> authorities
	
		this.member = vo;
	}
	
	
	

}
