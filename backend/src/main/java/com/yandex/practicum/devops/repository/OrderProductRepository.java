package com.yandex.practicum.devops.repository;

import com.yandex.practicum.devops.model.OrderProduct;
import com.yandex.practicum.devops.model.OrderProductPK;
import org.springframework.data.repository.CrudRepository;

public interface OrderProductRepository extends CrudRepository<OrderProduct, OrderProductPK> {
}
