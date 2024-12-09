package com.nyc.pharmacygr.repos;

import com.nyc.pharmacygr.model.Inventory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InventoryRepository extends JpaRepository<Inventory, Long> {
}