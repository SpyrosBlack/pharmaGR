package com.nyc.pharmacygr.controllers;

import com.nyc.pharmacygr.model.dto.PharmacyDTO;
import com.nyc.pharmacygr.services.AppUserService;
import com.nyc.pharmacygr.services.MedicineService;
import com.nyc.pharmacygr.services.PharmacyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PharmacyController {

    private final PharmacyService pharmacyService;

    private final AppUserService appUserService;


    public PharmacyController(PharmacyService pharmacyService, AppUserService appUserService, MedicineService medicineService) {
        this.pharmacyService = pharmacyService;
        this.appUserService = appUserService;
    }

    // Show insert pharmacy form
    @GetMapping("/insertpharm")
    public String pharmpage(ModelMap modelMap) {
        modelMap.addAttribute("pharmacyDTO", new PharmacyDTO());
        return "pharmacyadd.html";
    }

    // Insert the pharmacy to db
    @PostMapping("/doinsertpharm")
    public String insetrPharm(@ModelAttribute("pharmacyDTO") PharmacyDTO pharmacyDTO) {
        System.out.println(pharmacyDTO);
        //TODO implement this. Only for admins
        pharmacyService.create(pharmacyDTO);
        return "redirect:/allpharm";
    }

    @GetMapping("/allpharm")
    public String allpharm(ModelMap modelMap) {
        modelMap.addAttribute("pharmacyDTOList", pharmacyService.getAllPharmacies());

        return "allpharmacytable";
    }


}
