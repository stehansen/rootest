// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package no.jpro.rootest.domain;

import java.lang.String;
import java.util.Calendar;
import java.util.Set;
import no.jpro.rootest.domain.Kunde;
import no.jpro.rootest.domain.Timeliste;

privileged aspect Faktura_Roo_JavaBean {
    
    public Calendar Faktura.getForfallsdato() {
        return this.forfallsdato;
    }
    
    public void Faktura.setForfallsdato(Calendar forfallsdato) {
        this.forfallsdato = forfallsdato;
    }
    
    public Kunde Faktura.getKunde() {
        return this.kunde;
    }
    
    public void Faktura.setKunde(Kunde kunde) {
        this.kunde = kunde;
    }
    
    public Set<Timeliste> Faktura.getTimelister() {
        return this.timelister;
    }
    
    public void Faktura.setTimelister(Set<Timeliste> timelister) {
        this.timelister = timelister;
    }
    
    public String Faktura.getPeriode() {
        return this.periode;
    }
    
    public void Faktura.setPeriode(String periode) {
        this.periode = periode;
    }
    
}
