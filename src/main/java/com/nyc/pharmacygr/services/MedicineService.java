package com.nyc.pharmacygr.services;

import com.nyc.pharmacygr.repos.MedicineRepository;
import com.nyc.pharmacygr.model.Medicine;
import com.nyc.pharmacygr.repos.MedicineRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MedicineService {
    private final MedicineRepository medicineRepo;

    public MedicineService(MedicineRepository medicineRepo) {
        this.medicineRepo = medicineRepo;
    }

    public List<Medicine> getAllMedicine() {
        return medicineRepo.findAll()
                .stream().filter(m -> m.isDisabledMed() == false).collect(Collectors.toList());
    }

    public Medicine getMedicineById(int id) {
        return medicineRepo.findById(id).get();
    }

    public void insertMedicine(Medicine medicine) {
        medicineRepo.save(medicine);
    }

    public void updateMedicine(Medicine medicine) {
        medicineRepo.save(medicine);
    }

    public void disableMedicineById(Integer medicineid) {
        Medicine m = medicineRepo.getReferenceById(medicineid);
        m.setDisabledMed(true);
        medicineRepo.save(m);
    }
}
