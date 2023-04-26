package baithuchanhso3.model.entity;

import java.util.Date;
import baithuchanhso3.model.utils.Entity;
import baithuchanhso3.model.utils.Primary;

@Entity
public class Student {
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
    private Date Date;
    public Date getDate() {
        return Date;
    }
    public void setDate(Date date) {
        Date = date;
    }
    private String Address;
    public String getAddress() {
        return Address;
    }
    public void setAddress(String address) {
        Address = address;
    }
    private String Gender;
    public Student() {
    }
    public Student(Integer id, String name, java.util.Date date, String address, String gender) {
        Id = id;
        Name = name;
        Date = date;
        Address = address;
        Gender = gender;
    }
    public String getGender() {
        return Gender;
    }
    public void setGender(String gender) {
        Gender = gender;
    }

}
