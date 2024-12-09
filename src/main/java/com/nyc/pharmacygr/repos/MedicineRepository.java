package com.nyc.pharmacygr.repos;

import com.nyc.pharmacygr.model.Medicine;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MedicineRepository extends JpaRepository<Medicine, Integer> {
}