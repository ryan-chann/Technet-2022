/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ryan
 */
@Entity
@Table(name = "PAYMENTCARD")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Paymentcard.findAll", query = "SELECT p FROM Paymentcard p"),
    @NamedQuery(name = "Paymentcard.findByCardnumber", query = "SELECT p FROM Paymentcard p WHERE p.cardnumber = :cardnumber"),
    @NamedQuery(name = "Paymentcard.findByBalance", query = "SELECT p FROM Paymentcard p WHERE p.balance = :balance")})
public class Paymentcard implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "CARDNUMBER")
    private String cardnumber;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "BALANCE")
    private BigDecimal balance;

    public Paymentcard() {
    }

    public Paymentcard(String cardnumber) {
        this.cardnumber = cardnumber;
    }

    public String getCardnumber() {
        return cardnumber;
    }

    public void setCardnumber(String cardnumber) {
        this.cardnumber = cardnumber;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cardnumber != null ? cardnumber.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Paymentcard)) {
            return false;
        }
        Paymentcard other = (Paymentcard) object;
        if ((this.cardnumber == null && other.cardnumber != null) || (this.cardnumber != null && !this.cardnumber.equals(other.cardnumber))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Paymentcard[ cardnumber=" + cardnumber + " ]";
    }
    
}
