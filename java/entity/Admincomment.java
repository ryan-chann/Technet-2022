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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author NG XUAN CHENG
 */
@Entity
@Table(name = "ADMINCOMMENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Admincomment.findAll", query = "SELECT a FROM Admincomment a"),
    @NamedQuery(name = "Admincomment.findByCommentid", query = "SELECT a FROM Admincomment a WHERE a.commentid = :commentid"),
    @NamedQuery(name = "Admincomment.findByComment", query = "SELECT a FROM Admincomment a WHERE a.comment = :comment")})
public class Admincomment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 4)
    @Column(name = "COMMENTID")
    private String commentid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 300)
    @Column(name = "COMMENT")
    private String comment;
    @JoinColumn(name = "TECHNETID", referencedColumnName = "TECHNETID")
    @ManyToOne(optional = false)
    private Technetuser technetid;

    public Admincomment() {
    }

    public Admincomment(String commentid) {
        this.commentid = commentid;
    }

    public Admincomment(String commentid, String comment) {
        this.commentid = commentid;
        this.comment = comment;
    }

    public String getCommentid() {
        return commentid;
    }

    public void setCommentid(String commentid) {
        this.commentid = commentid;
    }

    public String getComment() {
        return comment;
    }

    public Admincomment(String commentid, String comment, Technetuser technetid) {
        this.commentid = commentid;
        this.comment = comment;
        this.technetid = technetid;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Technetuser getTechnetid() {
        return technetid;
    }

    public void setTechnetid(Technetuser technetid) {
        this.technetid = technetid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (commentid != null ? commentid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Admincomment)) {
            return false;
        }
        Admincomment other = (Admincomment) object;
        if ((this.commentid == null && other.commentid != null) || (this.commentid != null && !this.commentid.equals(other.commentid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Admincomment[ commentid=" + commentid + " ]";
    }
    
}
