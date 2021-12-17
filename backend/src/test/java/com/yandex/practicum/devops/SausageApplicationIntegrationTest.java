package com.yandex.practicum.devops;

import com.yandex.practicum.devops.controller.OrderController;
import com.yandex.practicum.devops.controller.ProductController;
import com.yandex.practicum.devops.dto.OrderProductDto;
import com.yandex.practicum.devops.model.Order;
import com.yandex.practicum.devops.model.Product;
import org.assertj.core.api.Assertions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Collections;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.hasProperty;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = { SausageApplication.class }, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class SausageApplicationIntegrationTest {

    @Autowired private TestRestTemplate restTemplate;

    @LocalServerPort private int port;

    @Autowired private ProductController productController;

    @Autowired private OrderController orderController;

    @Test
    public void contextLoads() {
        Assertions
          .assertThat(productController)
          .isNotNull();
        Assertions
          .assertThat(orderController)
          .isNotNull();
    }

    @Test
    public void givenGetProductsApiCall_whenProductListRetrieved_thenSizeMatchAndListContainsProductNames() {
        ResponseEntity<Iterable<Product>> responseEntity = restTemplate.exchange("http://localhost:" + port + "/api/products", HttpMethod.GET, null, new ParameterizedTypeReference<Iterable<Product>>() {
        });
        Iterable<Product> products = responseEntity.getBody();
        Assertions
          .assertThat(products)
          .hasSize(6);

        assertThat(products, hasItem(hasProperty("name", is("Сливочная"))));
        assertThat(products, hasItem(hasProperty("name", is("Особая"))));
        assertThat(products, hasItem(hasProperty("name", is("Молочная"))));
        assertThat(products, hasItem(hasProperty("name", is("Нюренбергская"))));
        assertThat(products, hasItem(hasProperty("name", is("Мюнхенская"))));
        assertThat(products, hasItem(hasProperty("name", is("Русская"))));
    }

    @Test
    public void givenGetOrdersApiCall_whenProductListRetrieved_thenSizeMatchAndListContainsProductNames() {
        ResponseEntity<Iterable<Order>> responseEntity = restTemplate.exchange("http://localhost:" + port + "/api/orders", HttpMethod.GET, null, new ParameterizedTypeReference<Iterable<Order>>() {
        });

        Iterable<Order> orders = responseEntity.getBody();
        Assertions
          .assertThat(orders)
          .hasSize(0);
    }

    @Test
    public void givenPostOrder_whenBodyRequestMatcherJson_thenResponseContainsEqualObjectProperties() {
        final ResponseEntity<Order> postResponse = restTemplate.postForEntity("http://localhost:" + port + "/api/orders", prepareOrderForm(), Order.class);
        Order order = postResponse.getBody();
        Assertions
          .assertThat(postResponse.getStatusCode())
          .isEqualByComparingTo(HttpStatus.CREATED);

        assertThat(order, hasProperty("status", is("PAID")));
        assertThat(order.getOrderProducts(), hasItem(hasProperty("quantity", is(2))));
    }

    private OrderController.OrderForm prepareOrderForm() {
        OrderController.OrderForm orderForm = new OrderController.OrderForm();
        OrderProductDto productDto = new OrderProductDto();
        productDto.setProduct(new Product(1L, "Русская", 300.00, "http://placehold.it/200x100"));
        productDto.setQuantity(2);
        orderForm.setProductOrders(Collections.singletonList(productDto));

        return orderForm;
    }
}
