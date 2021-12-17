package com.yandex.practicum.devops.repository;

import com.yandex.practicum.devops.model.Order;
import org.springframework.data.repository.CrudRepository;

public interface OrderRepository extends CrudRepository<Order, Long> {
}
