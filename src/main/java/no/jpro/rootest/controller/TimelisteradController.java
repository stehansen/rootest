package no.jpro.rootest.controller;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import no.jpro.rootest.domain.Timelisterad;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "timelisterads", formBackingObject = Timelisterad.class)
@RequestMapping("/timelisterads")
@Controller
public class TimelisteradController {
}
