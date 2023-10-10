package az.techno.dao.service;

import az.techno.dao.repository.ProductRepository;
import az.techno.model.Product;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class ProductService {
    public final ProductRepository productRepository;

    public List<Product> getAll(){
        return productRepository.findAll();
    }

   public List<Product> getAllProducts(String name, Double price){
    return productRepository.findProductByNameAndPrice(name,price);
   }

    public void insert(Product p) {
       productRepository.save(p);
    }

    public void update(Product p) {
        productRepository.save(p);
    }

    public Product getProductById(int id) {
        return productRepository.findById(id).orElseThrow();

    }

    public void delete(int id){
        Product p =productRepository.findById(id).orElseThrow();
        productRepository.delete(p);
    }

}
