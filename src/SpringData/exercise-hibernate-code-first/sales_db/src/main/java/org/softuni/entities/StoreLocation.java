package org.softuni.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "store_location")
public class StoreLocation extends BaseEntity {

    @Column(name = "location_name")
    private String locationName;

    @OneToMany
    private Set<Sale> sales;
}
