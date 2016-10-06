package com.example.repo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.User;

@Repository
public class UserrepoImpl implements Userrepo {

	@Autowired
	SqlSessionTemplate template;

	private final String NAME_SPACE = "com.example.UserMapper.";

	@Override
	public int insert(User user) {
		String stmt = NAME_SPACE + "insert";
		return template.update(stmt, user);
	}
/*	
	public User getUserIdpass(String userId){
		String stmt = NAME_SPACE + "selectidpass";
		return template.select(stmt, userId);
	}
	
	public List<String> getAllUserId(){
		String sql = "select user_id from tuser";
		return template.queryForList(sql, String.class);
	}
	
	class UserMapper implements RowMapper<User>{

		@Override
		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			User user = new User();
			user.setUserId(rs.getString("user_id"));
			user.setPass(rs.getString("pass"));
			return user;
		}
		
	}*/
	

}
