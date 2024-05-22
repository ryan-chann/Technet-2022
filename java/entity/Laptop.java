/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

//Import libraries
import java.io.Serializable;
import java.math.*;
import java.util.List;
import javax.persistence.*;
import javax.validation.constraints.*;
import javax.xml.bind.annotation.*;


//Define Entity
@Entity

//Table name
@Table(name = "LAPTOP")

//Using xml for mapping
@XmlRootElement

//Named Queries for easier DB processing
@NamedQueries({
    @NamedQuery(name = "Laptop.findAll", query = "SELECT l FROM Laptop l"),
    @NamedQuery(name = "Laptop.findByLaptopid", query = "SELECT l FROM Laptop l WHERE l.laptopid = :laptopid"),
    @NamedQuery(name = "Laptop.findByLaptopimage", query = "SELECT l FROM Laptop l WHERE l.laptopimage = :laptopimage"),
    @NamedQuery(name = "Laptop.findByLaptopname", query = "SELECT l FROM Laptop l WHERE l.laptopname = :laptopname"),
    @NamedQuery(name = "Laptop.findByLaptopprice", query = "SELECT l FROM Laptop l WHERE l.laptopprice = :laptopprice"),
    @NamedQuery(name = "Laptop.findByLaptopcategory", query = "SELECT l FROM Laptop l WHERE l.laptopcategory = :laptopcategory"),
    @NamedQuery(name = "Laptop.findByCpu", query = "SELECT l FROM Laptop l WHERE l.cpu = :cpu"),
    @NamedQuery(name = "Laptop.findByRam", query = "SELECT l FROM Laptop l WHERE l.ram = :ram"),
    @NamedQuery(name = "Laptop.findByStorage", query = "SELECT l FROM Laptop l WHERE l.storage = :storage"),
    @NamedQuery(name = "Laptop.findByGraphiccard", query = "SELECT l FROM Laptop l WHERE l.graphiccard = :graphiccard")
})

//Class declaration
public class Laptop implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "laptopid")
    private List<Orders> ordersList;
    
    //SerialVersionUID used to versioning the class
    private static final long serialVersionUID = 1L;
    
    //Instances bind with sql conditions
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "LAPTOPID")
    private String laptopid;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1000)
    @Column(name = "LAPTOPIMAGE")
    private String laptopimage;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "LAPTOPNAME")
    private String laptopname;
    
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "LAPTOPPRICE")
    private BigDecimal laptopprice;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "LAPTOPCATEGORY")
    private String laptopcategory;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "CPU")
    private String cpu;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "RAM")
    private String ram;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "STORAGE")
    private String storage;
    
    @Size(max = 200)
    @Column(name = "GRAPHICCARD")
    private String graphiccard;
    
    
    //No-args constructor
    public Laptop() {
    }
    
    //laptopId constructor
    public Laptop(String laptopid) {
        this.laptopid = laptopid;
    }
    
    //Full instance args constructor
    public Laptop(String laptopid, String laptopimage, String laptopname, BigDecimal laptopprice, String laptopcategory, String cpu, String ram, String storage) {
        this.laptopid = laptopid;
        this.laptopimage = laptopimage;
        this.laptopname = laptopname;
        this.laptopprice = laptopprice;
        this.laptopcategory = laptopcategory;
        this.cpu = cpu;
        this.ram = ram;
        this.storage = storage;
    }
    
    //Getters & Setters
    public String getLaptopid() {
        return laptopid;
    }

    public void setLaptopid(String laptopid) {
        this.laptopid = laptopid;
    }

    public String getLaptopimage() {
        return laptopimage;
    }

    public void setLaptopimage(String laptopimage) {
        this.laptopimage = laptopimage;
    }

    public String getLaptopname() {
        return laptopname;
    }

    public void setLaptopname(String laptopname) {
        this.laptopname = laptopname;
    }

    public BigDecimal getLaptopprice() {
        return laptopprice;
    }

    public void setLaptopprice(BigDecimal laptopprice) {
        this.laptopprice = laptopprice;
    }

    public String getLaptopcategory() {
        return laptopcategory;
    }

    public void setLaptopcategory(String laptopcategory) {
        this.laptopcategory = laptopcategory;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }

    public String getGraphiccard() {
        return graphiccard;
    }

    public void setGraphiccard(String graphiccard) {
        this.graphiccard = graphiccard;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (laptopid != null ? laptopid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Laptop)) {
            return false;
        }
        Laptop other = (Laptop) object;
        if ((this.laptopid == null && other.laptopid != null) || (this.laptopid != null && !this.laptopid.equals(other.laptopid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Laptop[ laptopid=" + laptopid + " ]";
    }

    @XmlTransient
    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }
    
}
