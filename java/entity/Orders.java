/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ryan
 */
@Entity
@Table(name = "ORDERS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o"),
    @NamedQuery(name = "Orders.findByOrderid", query = "SELECT o FROM Orders o WHERE o.orderid = :orderid"),
    @NamedQuery(name = "Orders.findByQuantity", query = "SELECT o FROM Orders o WHERE o.quantity = :quantity"),
    @NamedQuery(name = "Orders.findByStatus", query = "SELECT o FROM Orders o WHERE o.status = :status"),
    @NamedQuery(name = "Orders.findByOrderdate", query = "SELECT o FROM Orders o WHERE o.orderdate = :orderdate"),
    @NamedQuery(name = "Orders.findByAddress", query = "SELECT o FROM Orders o WHERE o.address = :address"),
    @NamedQuery(name = "Orders.findByPrice", query = "SELECT o FROM Orders o WHERE o.price = :price")})
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "ORDERID")
    private String orderid;
    @Column(name = "QUANTITY")
    private Integer quantity;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "STATUS")
    private String status;
    @Column(name = "ORDERDATE")
    @Temporal(TemporalType.DATE)
    private Date orderdate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "ADDRESS")
    private String address;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRICE")
    private BigDecimal price;
    @JoinColumn(name = "LAPTOPID", referencedColumnName = "LAPTOPID")
    @ManyToOne(optional = false)
    private Laptop laptopid;
    @JoinColumn(name = "EMAIL", referencedColumnName = "EMAIL")
    @ManyToOne(optional = false)
    private Users email;

    public Orders() {
    }

    public Orders(String orderid) {
        this.orderid = orderid;
    }

    public Orders(String orderid, String status, String address, BigDecimal price) {
        this.orderid = orderid;
        this.status = status;
        this.address = address;
        this.price = price;
    }

    public Orders(String orderid, Integer quantity, String status, Date orderdate, String address, BigDecimal price, Laptop laptopid, Users email) {
        this.orderid = orderid;
        this.quantity = quantity;
        this.status = status;
        this.orderdate = orderdate;
        this.address = address;
        this.price = price;
        this.laptopid = laptopid;
        this.email = email;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Laptop getLaptopid() {
        return laptopid;
    }

    public void setLaptopid(Laptop laptopid) {
        this.laptopid = laptopid;
    }

    public Users getEmail() {
        return email;
    }

    public void setEmail(Users email) {
        this.email = email;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderid != null ? orderid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Orders[ orderid=" + orderid + " ]";
    }
    
}
