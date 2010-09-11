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
import no.jpro.rootest.domain.Timelisterad;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Timelisterad_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Timelisterad.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Timelisterad.id;
    
    @Version
    @Column(name = "version")
    private Integer Timelisterad.version;
    
    public Long Timelisterad.getId() {
        return this.id;
    }
    
    public void Timelisterad.setId(Long id) {
        this.id = id;
    }
    
    public Integer Timelisterad.getVersion() {
        return this.version;
    }
    
    public void Timelisterad.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Timelisterad.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Timelisterad.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Timelisterad attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Timelisterad.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Timelisterad Timelisterad.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Timelisterad merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Timelisterad.entityManager() {
        EntityManager em = new Timelisterad().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Timelisterad.countTimelisterads() {
        return ((Number) entityManager().createQuery("select count(o) from Timelisterad o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<Timelisterad> Timelisterad.findAllTimelisterads() {
        return entityManager().createQuery("select o from Timelisterad o").getResultList();
    }
    
    public static Timelisterad Timelisterad.findTimelisterad(Long id) {
        if (id == null) return null;
        return entityManager().find(Timelisterad.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<Timelisterad> Timelisterad.findTimelisteradEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Timelisterad o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}