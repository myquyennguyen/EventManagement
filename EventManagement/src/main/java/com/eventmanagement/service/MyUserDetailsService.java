package com.eventmanagement.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.eventmanagement.DAO.impl.UserDAO;
import com.eventmanagement.dto.UserDTO;
import com.eventmanagement.entity.UserEntity;

public class MyUserDetailsService implements UserDetailsService{
	private UserDAO userdao = new UserDAO();
	
	@Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // đầu tiên mình query xuống database xem có user  đó không
		System.out.print("Tên đang nhap:"+username);
        UserEntity user = userdao.findUserByUsername(username);
        //Nếu không tìm thấy User thì mình thông báo lỗi
        if (user == null) {
            System.out.println("User not found! " + username);
            throw new UsernameNotFoundException("User " + username + " was not found in the database");
        }


        // Khi đã có user rồi thì mình query xem user đó có những quyền gì (Admin hay User)
        // [ROLE_USER, ROLE_ADMIN,..]
        String roleName = user.getRole().getRoleName();

        // Dựa vào list quyền trả về mình tạo đối tượng GrantedAuthority  của spring cho quyền đó
      /*  List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
        if (roleNames != null) {
            for (String role : roleNames) {
                // ROLE_USER, ROLE_ADMIN,..
                GrantedAuthority authority = new SimpleGrantedAuthority(role);
                grantList.add(authority);
            }
        } */
        GrantedAuthority authority = new SimpleGrantedAuthority(roleName);
        List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
        grantList.add(authority);
        //Cuối cùng mình tạo đối tượng UserDetails của Spring và mình cung cấp cá thông số như tên , password và quyền
        // Đối tượng userDetails sẽ chứa đựng các thông tin cần thiết về user từ đó giúp Spring Security quản lý được phân quyền như ta đã
        // cấu hình trong bước 4 method configure
        UserDetails userDetails = (UserDetails) new User(user.getUserName(),
                user.getPassword(), grantList);

        return userDetails;
    }

}
