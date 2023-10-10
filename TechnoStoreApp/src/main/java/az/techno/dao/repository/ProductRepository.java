package az.techno.dao.repository;

import az.techno.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product,Integer> {
    public List<Product> findProductByNameAndPrice(String name,Double price);
}
