package com.nyc.pharmacygr.controllers;

import com.nyc.pharmacygr.AppScopeBean;
import com.nyc.pharmacygr.model.dto.AppUserDto;
import com.nyc.pharmacygr.model.dto.DashBoardDto;
import com.nyc.pharmacygr.services.AppUserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {

    @Autowired
    AppUserService appUserService;

    @Autowired
    private AppScopeBean applicationScopeBean;

    private record LoginDto(String username, String userpass) {
    }

    @GetMapping("/")
    public String showMainPage(ModelMap mm) {
        mm.addAttribute("loginDTO",
                new LoginDto("", ""));
        return "login";
    }

    @PostMapping("/dologin")
    public String doLogin(@ModelAttribute("loginDTO") LoginDto dto,
                          ModelMap mm,
                          HttpSession session) {

        AppUserDto loggedinuser = appUserService.dologin(dto.username, dto.userpass);
        if (loggedinuser == null) {
            mm.addAttribute("message", "Wrong user name or password");
            return "login.html";
        } else {
            //System.out.println("------------------"+applicationScopeBean.getNumberofusers());
            applicationScopeBean.setNumberofusers(applicationScopeBean.getNumberofusers() + 1);
            session.setAttribute("loggedinuser", loggedinuser);
            return "redirect:/showdashboard";
        }
    }

    @GetMapping("/showdashboard")
    public String showDashboard(ModelMap mm, HttpSession session) {
        DashBoardDto ddto = new DashBoardDto();
        AppUserDto loggedinuser = (AppUserDto) session.getAttribute("loggedinuser");
        //ddto.setTotalorders(orderService.getAllOrderForPharmacy(loggedinuser.getPharmacy()).size());
       // if (loggedinuser.getRole() == "Pharmacist") {
       //     ddto.setTotalcostoforders(orderService.getOrdersCostTotalByPharmacy(loggedinuser.getPharmacy()));
       // }
        ddto.setTotalcostoforders(200f);
        ddto.setTotalorders(5);
       mm.addAttribute("dashboard", ddto);
        return "index";
    }

}
