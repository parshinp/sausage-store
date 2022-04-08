package com.yandex.practicum.devops.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Objects;


@Document
@JsonIgnoreProperties(ignoreUnknown = true)
public class Report {
    @Id
    public String productId;
    public String name;
    public String quantity;

    public Report() {
    }

    public Report(String productId, String name, String quantity) {
        this.productId = productId;
        this.name = name;
        this.quantity = quantity;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Report report = (Report) o;
        return Objects.equals(productId, report.productId) && Objects.equals(name, report.name) && Objects.equals(quantity, report.quantity);
    }

    @Override
    public int hashCode() {
        return Objects.hash(productId, name, quantity);
    }
}
