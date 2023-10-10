package az.techno.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "name")
    private String name;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "price")
    private Double price;
    @Column(name = "quantity")
    private Integer quantity;
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    @ManyToOne
    private Category category;
    @JoinColumn(name = "store_id", referencedColumnName = "id")
    @ManyToOne
    private Store store;
}
