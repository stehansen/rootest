package no.jpro.rootest.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import java.util.Calendar;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import no.jpro.rootest.domain.Kunde;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import java.util.Set;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Faktura {

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Calendar forfallsdato;

    @ManyToOne(targetEntity = Kunde.class)
    @JoinColumn
    private Kunde kunde;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<no.jpro.rootest.domain.Timeliste> timelister = new java.util.HashSet<no.jpro.rootest.domain.Timeliste>();

    private String periode;
}
