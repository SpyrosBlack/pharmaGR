package com.nyc.pharmacygr.repos;

import com.nyc.pharmacygr.model.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemRepository extends JpaRepository<OrderItem, Integer> {
}