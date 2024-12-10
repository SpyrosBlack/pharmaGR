package com.nyc.pharmacygr.repos;

import com.nyc.pharmacygr.model.AppUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AppUserRepository extends JpaRepository<AppUser, String> {
    AppUser findByUsernameAndUserpassword(String username, String password);
}