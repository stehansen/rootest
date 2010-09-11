// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package no.jpro.rootest.controller;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import no.jpro.rootest.domain.Kunde;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect KundeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String KundeController.create(@Valid Kunde kunde, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("kunde", kunde);
            return "kundes/create";
        }
        kunde.persist();
        return "redirect:/kundes/" + kunde.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String KundeController.createForm(Model model) {
        model.addAttribute("kunde", new Kunde());
        return "kundes/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String KundeController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("kunde", Kunde.findKunde(id));
        model.addAttribute("itemId", id);
        return "kundes/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String KundeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("kundes", Kunde.findKundeEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Kunde.countKundes() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("kundes", Kunde.findAllKundes());
        }
        return "kundes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String KundeController.update(@Valid Kunde kunde, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("kunde", kunde);
            return "kundes/update";
        }
        kunde.merge();
        return "redirect:/kundes/" + kunde.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String KundeController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("kunde", Kunde.findKunde(id));
        return "kundes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String KundeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Kunde.findKunde(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/kundes?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    Converter<Kunde, String> KundeController.getKundeConverter() {
        return new Converter<Kunde, String>() {
            public String convert(Kunde kunde) {
                return new StringBuilder().append(kunde.getNavn()).append(" ").append(kunde.getAdresse()).append(" ").append(kunde.getPostnr()).toString();
            }
        };
    }
    
    @InitBinder
    void KundeController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getKundeConverter());
        }
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public String KundeController.showJson(@PathVariable("id") Long id) {
        return Kunde.findKunde(id).toJson();
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> KundeController.createFromJson(@RequestBody String json) {
        Kunde.fromJsonToKunde(json).persist();
        return new ResponseEntity<String>("Kunde created", HttpStatus.CREATED);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public String KundeController.listJson() {
        return Kunde.toJsonArray(Kunde.findAllKundes());
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> KundeController.createFromJsonArray(@RequestBody String json) {
        for (Kunde kunde: Kunde.fromJsonArrayToKundes(json)) {
            kunde.persist();
        }
        return new ResponseEntity<String>("Kunde created", HttpStatus.CREATED);
    }
    
}
