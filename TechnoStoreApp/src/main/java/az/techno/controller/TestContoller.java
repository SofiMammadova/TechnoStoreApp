package az.techno.controller;

import az.techno.dao.service.ProductService;
import az.techno.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestContoller {
    @Autowired
    private ProductService productService;

    @GetMapping("test/{id}")
    public Product test(@PathVariable("id") Integer id){
        return productService.getProductById(id);
    }
}
