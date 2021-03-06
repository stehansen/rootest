// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package no.jpro.rootest.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import no.jpro.rootest.domain.Faktura;

privileged aspect Faktura_Roo_Json {
    
    public String Faktura.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Faktura Faktura.fromJsonToFaktura(String json) {
        return new JSONDeserializer<Faktura>().use(null, Faktura.class).deserialize(json);
    }
    
    public static String Faktura.toJsonArray(Collection<Faktura> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Faktura> Faktura.fromJsonArrayToFakturas(String json) {
        return new JSONDeserializer<List<Faktura>>().use(null, ArrayList.class).use("values", Faktura.class).deserialize(json);
    }
    
}
