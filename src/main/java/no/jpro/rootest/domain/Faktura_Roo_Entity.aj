// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package no.jpro.rootest.domain;

import java.lang.Integer;
import java.lang.Long;
import java.lang.SuppressWarnings;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import no.jpro.rootest.domain.Faktura;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Faktura_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Faktura.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Faktura.id;
    
    @Version
    @Column(name = "version")
    private Integer Faktura.version;
    
    public Long Faktura.getId() {
        return this.id;
    }
    
    public void Faktura.setId(Long id) {
        this.id = id;
    }
    
    public Integer Faktura.getVersion() {
        return this.version;
    }
    
    public void Faktura.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Faktura.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Faktura.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Faktura attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Faktura.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Faktura Faktura.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Faktura merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Faktura.entityManager() {
        EntityManager em = new Faktura().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Faktura.countFakturas() {
        return ((Number) entityManager().createQuery("select count(o) from Faktura o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<Faktura> Faktura.findAllFakturas() {
        return entityManager().createQuery("select o from Faktura o").getResultList();
    }
    
    public static Faktura Faktura.findFaktura(Long id) {
        if (id == null) return null;
        return entityManager().find(Faktura.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<Faktura> Faktura.findFakturaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Faktura o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
