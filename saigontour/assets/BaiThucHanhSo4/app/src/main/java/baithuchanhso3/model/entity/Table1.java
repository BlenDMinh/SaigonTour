package baithuchanhso3.model.entity;

import baithuchanhso3.model.utils.Entity;
import baithuchanhso3.model.utils.Primary;

@Entity
public class Table1 {
    @Primary
    private Integer Id;
    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    private String Name;
    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    private String Address;
    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    private Double Total;

    public Double getTotal() {
        return Total;
    }

    public void setTotal(Double total) {
        Total = total;
    }

    public Table1() {}

    public Table1(Integer id, String name, String address, Double total) {
        this.Id = id;
        this.Name = name;
        this.Address = address;
        this.Total = total;
    }
}
