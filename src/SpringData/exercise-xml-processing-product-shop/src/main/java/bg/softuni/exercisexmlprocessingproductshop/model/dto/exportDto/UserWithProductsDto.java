package bg.softuni.exercisexmlprocessingproductshop.model.dto.exportDto;

import jakarta.xml.bind.annotation.*;

import java.util.List;

@XmlRootElement(name = "user")
@XmlAccessorType(XmlAccessType.FIELD)
public class UserWithProductsDto {

    @XmlAttribute(name = "first-name")
     private String firstName;

    @XmlAttribute(name = "last-name")
     private String lastName;

    @XmlElementWrapper(name = "sold-products")
    @XmlElement(name = "product")
    private List<ProductWithBuyerDto> products;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public List<ProductWithBuyerDto> getProducts() {
        return products;
    }

    public void setProducts(List<ProductWithBuyerDto> products) {
        this.products = products;
    }
}
