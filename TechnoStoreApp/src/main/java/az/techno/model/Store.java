package az.techno.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Store {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "store_name")
    private String storeName;
    @Column(name = "location")
    private String location;
    @Column(name = "phone")
    private String phone;}
