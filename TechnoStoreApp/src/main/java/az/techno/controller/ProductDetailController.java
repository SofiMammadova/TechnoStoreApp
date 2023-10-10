package az.techno.controller;

import az.techno.dao.service.ProductService;
import az.techno.model.Product;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequiredArgsConstructor
@RequestMapping("/productdetail")
public class ProductDetailController {

    private final ProductService pdao;
    private final ErrorController errorController;

    @GetMapping("/{id})")
    public String detailGet(@PathVariable("id") Integer id, Model model){
        try {

            Product p = pdao.getProductById(id);

            if (p == null) {
                throw new IllegalArgumentException("bu id de product yoxdur");
            }
            model.addAttribute("product", p);
            return "productDetail";
        } catch (Exception ex) {
            model.addAttribute("exception", ex);
            return errorController.showErrorPage(model,ex.getMessage());
        }
    }
}
