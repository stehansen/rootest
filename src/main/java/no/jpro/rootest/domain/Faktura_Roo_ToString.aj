// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package no.jpro.rootest.domain;

import java.lang.String;

privileged aspect Faktura_Roo_ToString {
    
    public String Faktura.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Forfallsdato: ").append(getForfallsdato() == null ? "null" : getForfallsdato().getTime()).append(", ");
        sb.append("Kunde: ").append(getKunde()).append(", ");
        sb.append("Timelister: ").append(getTimelister() == null ? "null" : getTimelister().size()).append(", ");
        sb.append("Periode: ").append(getPeriode());
        return sb.toString();
    }
    
}
