// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package no.jpro.rootest.domain;

import java.lang.String;

privileged aspect Kunde_Roo_ToString {
    
    public String Kunde.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Version: ").append(getVersion()).append(", ");
        sb.append("Navn: ").append(getNavn()).append(", ");
        sb.append("Adresse: ").append(getAdresse()).append(", ");
        sb.append("Postnr: ").append(getPostnr()).append(", ");
        sb.append("Poststed: ").append(getPoststed()).append(", ");
        sb.append("Epost: ").append(getEpost()).append(", ");
        sb.append("Kontaktnavn: ").append(getKontaktnavn()).append(", ");
        sb.append("Kontakttelefon: ").append(getKontakttelefon()).append(", ");
        sb.append("Kontaktepost: ").append(getKontaktepost());
        return sb.toString();
    }
    
}