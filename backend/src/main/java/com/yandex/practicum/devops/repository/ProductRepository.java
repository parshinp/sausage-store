package com.yandex.practicum.devops.repository;

import com.yandex.practicum.devops.model.Product;
import org.springframework.data.repository.CrudRepository;

public interface ProductRepository extends CrudRepository<Product, Long> {
}
