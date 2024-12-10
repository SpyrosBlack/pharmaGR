package com.nyc.pharmacygr.services;

import com.nyc.pharmacygr.model.AppUser;
import com.nyc.pharmacygr.model.dto.AppUserDto;
import com.nyc.pharmacygr.repos.AppUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AppUserService {
    @Autowired
    private AppUserRepository appUserRepo;

  public AppUserDto dologin(String username, String password){
      AppUser u = appUserRepo.findByUsernameAndUserpassword(username, password);
      if (u != null) {
          return mapToDto(u);
      } else // wrong username - pass
          return null;

  }

    public AppUserDto mapToDto(AppUser entity) {
        AppUserDto dto = new AppUserDto();
        dto.setUsername(entity.getUsername());
        dto.setFirstname(entity.getFirstname());
        dto.setLastname(entity.getLastname());
        dto.setRole(entity.getRole().name());
        dto.setPharmacy(entity.getPharmacy());
        return dto;
    }

    public AppUser mapToEntity(AppUserDto dto) {
        return appUserRepo.findById(dto.getUsername()).get();
    }
}
