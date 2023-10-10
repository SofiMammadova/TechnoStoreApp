package az.techno.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
    public class ErrorController {

        @GetMapping("/error")
        public String showErrorPage(Model model, @RequestParam("msg") String errorMessage) {
            model.addAttribute("errorMessage", errorMessage);
            return "error";
        }


    @GetMapping("/throwException")
    public ModelAndView yourMethod(@RequestParam("exception") Exception ex) {

            String errorMessage = ex.getMessage();
            return new ModelAndView("redirect:/error?msg=" + errorMessage);
        }
    }


