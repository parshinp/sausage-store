package com.yandex.practicum.devops.repository;

import com.yandex.practicum.devops.model.Report;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ReportRepository extends MongoRepository<Report,String> {
}
