package com.nyc.pharmacygr.services;

import com.nyc.pharmacygr.model.AppUser;
import com.nyc.pharmacygr.model.Pharmacy;
import com.nyc.pharmacygr.model.dto.PharmacyDTO;
import com.nyc.pharmacygr.repos.OrderRepository;
import com.nyc.pharmacygr.repos.PharmacyRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PharmacyService {

    private final PharmacyRepository pharmacyRepo;
    private final OrderRepository orderRepo;


    public PharmacyService(PharmacyRepository pharmacyRepo, OrderRepository orderRepo) {
        this.pharmacyRepo = pharmacyRepo;
        this.orderRepo = orderRepo;
    }

    public Integer create(final PharmacyDTO pharmacyDTO) {
        Pharmacy pharmacy = mapToEntity(pharmacyDTO);
        return pharmacyRepo.save(pharmacy).getPharmacyId();
    }

    public List<PharmacyDTO> getAllPharmacies() {
        return pharmacyRepo.findAll().stream().map(pharmacy -> mapToDTO(pharmacy)).toList();

    }

    public Pharmacy getPharmacyFromUser(AppUser user) {
        return pharmacyRepo.findByAppuser(user);
    }

    public PharmacyDTO mapToDTO(Pharmacy pharmacy) {
        PharmacyDTO pharmacyDTO = new PharmacyDTO();
        pharmacyDTO.setPharmacyAddress(pharmacy.getPharmacyaddress());
        pharmacyDTO.setPharmacyName(pharmacy.getPharmacyname());
        pharmacyDTO.setPharmacyCity(pharmacy.getPharmacycity());
        pharmacyDTO.setLat(pharmacy.getLat());
        pharmacyDTO.setLng(pharmacy.getLng());
        System.out.println(pharmacyDTO);
        return pharmacyDTO;
    }

    public Pharmacy mapToEntity(PharmacyDTO pharmacyDTO) {
        Pharmacy pharmacy = new Pharmacy();
        pharmacy.setPharmacyaddress(pharmacyDTO.getPharmacyAddress());
        pharmacy.setPharmacyname(pharmacyDTO.getPharmacyName());
        pharmacy.setPharmacycity(pharmacyDTO.getPharmacyCity());
        pharmacy.setLat(pharmacyDTO.getLat());
        pharmacy.setLng(pharmacyDTO.getLng());
        return pharmacy;
    }

//    public OrderItem createOrder(OrderItem orderItem){
//return orderRepo.save(orderItem);
//    }
}
