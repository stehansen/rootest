package no.jpro.rootest.controller;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import no.jpro.rootest.domain.Kunde;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "kundes", formBackingObject = Kunde.class)
@RequestMapping("/kundes")
@Controller
public class KundeController {
}
