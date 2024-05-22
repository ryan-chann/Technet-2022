/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
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
 * @author User
 */
@Entity
@Table(name = "TECHNETUSER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Technetuser.findAll", query = "SELECT t FROM Technetuser t"),
    @NamedQuery(name = "Technetuser.findByTechnetid", query = "SELECT t FROM Technetuser t WHERE t.technetid = :technetid"),
    @NamedQuery(name = "Technetuser.findByFirstname", query = "SELECT t FROM Technetuser t WHERE t.firstname = :firstname"),
    @NamedQuery(name = "Technetuser.findByLastname", query = "SELECT t FROM Technetuser t WHERE t.lastname = :lastname"),
    @NamedQuery(name = "Technetuser.findByTechnetpassword", query = "SELECT t FROM Technetuser t WHERE t.technetpassword = :technetpassword")})
public class Technetuser implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 4)
    @Column(name = "TECHNETID")
    private String technetid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "FIRSTNAME")
    private String firstname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "LASTNAME")
    private String lastname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "TECHNETPASSWORD")
    private String technetpassword;

    public Technetuser() {
    }

    public Technetuser(String technetid) {
        this.technetid = technetid;
    }

    public Technetuser(String technetid, String firstname, String lastname, String technetpassword) {
        this.technetid = technetid;
        this.firstname = firstname;
        this.lastname = lastname;
        this.technetpassword = technetpassword;
    }

    public String getTechnetid() {
        return technetid;
    }

    public void setTechnetid(String technetid) {
        this.technetid = technetid;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getTechnetpassword() {
        return technetpassword;
    }

    public void setTechnetpassword(String technetpassword) {
        this.technetpassword = technetpassword;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (technetid != null ? technetid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Technetuser)) {
            return false;
        }
        Technetuser other = (Technetuser) object;
        if ((this.technetid == null && other.technetid != null) || (this.technetid != null && !this.technetid.equals(other.technetid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Technetuser[ technetid=" + technetid + " ]";
    }
    
}
