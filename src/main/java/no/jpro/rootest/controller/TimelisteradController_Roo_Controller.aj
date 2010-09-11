// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package no.jpro.rootest.controller;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import no.jpro.rootest.domain.Timelisterad;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
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

privileged aspect TimelisteradController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String TimelisteradController.create(@Valid Timelisterad timelisterad, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("timelisterad", timelisterad);
            addDateTimeFormatPatterns(model);
            return "timelisterads/create";
        }
        timelisterad.persist();
        return "redirect:/timelisterads/" + timelisterad.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String TimelisteradController.createForm(Model model) {
        model.addAttribute("timelisterad", new Timelisterad());
        addDateTimeFormatPatterns(model);
        return "timelisterads/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String TimelisteradController.show(@PathVariable("id") Long id, Model model) {
        addDateTimeFormatPatterns(model);
        model.addAttribute("timelisterad", Timelisterad.findTimelisterad(id));
        model.addAttribute("itemId", id);
        return "timelisterads/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String TimelisteradController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("timelisterads", Timelisterad.findTimelisteradEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Timelisterad.countTimelisterads() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("timelisterads", Timelisterad.findAllTimelisterads());
        }
        addDateTimeFormatPatterns(model);
        return "timelisterads/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String TimelisteradController.update(@Valid Timelisterad timelisterad, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("timelisterad", timelisterad);
            addDateTimeFormatPatterns(model);
            return "timelisterads/update";
        }
        timelisterad.merge();
        return "redirect:/timelisterads/" + timelisterad.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String TimelisteradController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("timelisterad", Timelisterad.findTimelisterad(id));
        addDateTimeFormatPatterns(model);
        return "timelisterads/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String TimelisteradController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Timelisterad.findTimelisterad(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/timelisterads?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    Converter<Timelisterad, String> TimelisteradController.getTimelisteradConverter() {
        return new Converter<Timelisterad, String>() {
            public String convert(Timelisterad timelisterad) {
                return new StringBuilder().append(timelisterad.getDato()).toString();
            }
        };
    }
    
    @InitBinder
    void TimelisteradController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getTimelisteradConverter());
        }
    }
    
    void TimelisteradController.addDateTimeFormatPatterns(Model model) {
        model.addAttribute("timelisterad_dato_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public String TimelisteradController.showJson(@PathVariable("id") Long id) {
        return Timelisterad.findTimelisterad(id).toJson();
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> TimelisteradController.createFromJson(@RequestBody String json) {
        Timelisterad.fromJsonToTimelisterad(json).persist();
        return new ResponseEntity<String>("Timelisterad created", HttpStatus.CREATED);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public String TimelisteradController.listJson() {
        return Timelisterad.toJsonArray(Timelisterad.findAllTimelisterads());
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> TimelisteradController.createFromJsonArray(@RequestBody String json) {
        for (Timelisterad timelisterad: Timelisterad.fromJsonArrayToTimelisterads(json)) {
            timelisterad.persist();
        }
        return new ResponseEntity<String>("Timelisterad created", HttpStatus.CREATED);
    }
    
}
