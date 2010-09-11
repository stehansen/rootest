package no.jpro.rootest.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Kunde {

    private String navn;

    private String adresse;

    private String postnr;

    private String poststed;

    private String epost;

    private String kontaktnavn;

    private String kontakttelefon;

    private String kontaktepost;
}
