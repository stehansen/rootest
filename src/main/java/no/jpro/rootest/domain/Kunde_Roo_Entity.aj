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
import no.jpro.rootest.domain.Kunde;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Kunde_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Kunde.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Kunde.id;
    
    @Version
    @Column(name = "version")
    private Integer Kunde.version;
    
    public Long Kunde.getId() {
        return this.id;
    }
    
    public void Kunde.setId(Long id) {
        this.id = id;
    }
    
    public Integer Kunde.getVersion() {
        return this.version;
    }
    
    public void Kunde.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Kunde.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Kunde.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Kunde attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Kunde.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Kunde Kunde.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Kunde merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Kunde.entityManager() {
        EntityManager em = new Kunde().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Kunde.countKundes() {
        return ((Number) entityManager().createQuery("select count(o) from Kunde o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<Kunde> Kunde.findAllKundes() {
        return entityManager().createQuery("select o from Kunde o").getResultList();
    }
    
    public static Kunde Kunde.findKunde(Long id) {
        if (id == null) return null;
        return entityManager().find(Kunde.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<Kunde> Kunde.findKundeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Kunde o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
