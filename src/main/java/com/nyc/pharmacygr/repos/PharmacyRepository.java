package com.nyc.pharmacygr.repos;

import com.nyc.pharmacygr.model.AppUser;
import com.nyc.pharmacygr.model.Pharmacy;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PharmacyRepository extends JpaRepository<Pharmacy, Integer> {

    public Pharmacy findByAppuser(AppUser user);
}