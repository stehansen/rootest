// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package no.jpro.rootest.domain;

import java.lang.String;

privileged aspect Person_Roo_JavaBean {
    
    public String Person.getEtternavn() {
        return this.etternavn;
    }
    
    public void Person.setEtternavn(String etternavn) {
        this.etternavn = etternavn;
    }
    
    public String Person.getFornavn() {
        return this.fornavn;
    }
    
    public void Person.setFornavn(String fornavn) {
        this.fornavn = fornavn;
    }
    
    public String Person.getEpost() {
        return this.epost;
    }
    
    public void Person.setEpost(String epost) {
        this.epost = epost;
    }
    
}
