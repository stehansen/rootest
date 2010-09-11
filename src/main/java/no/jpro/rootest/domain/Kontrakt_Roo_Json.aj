// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package no.jpro.rootest.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import no.jpro.rootest.domain.Kontrakt;

privileged aspect Kontrakt_Roo_Json {
    
    public String Kontrakt.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Kontrakt Kontrakt.fromJsonToKontrakt(String json) {
        return new JSONDeserializer<Kontrakt>().use(null, Kontrakt.class).deserialize(json);
    }
    
    public static String Kontrakt.toJsonArray(Collection<Kontrakt> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Kontrakt> Kontrakt.fromJsonArrayToKontrakts(String json) {
        return new JSONDeserializer<List<Kontrakt>>().use(null, ArrayList.class).use("values", Kontrakt.class).deserialize(json);
    }
    
}
