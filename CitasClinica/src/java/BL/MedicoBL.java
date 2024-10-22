/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BL;

import BE.MedicoBE;
import DA.MedicoDA;
import java.util.List;

/**
 *
 * @author George
 */
public class MedicoBL implements IBaseBL<MedicoBE>{
    
    private final MedicoDA _MedicoDA;

    public MedicoBL() {
        _MedicoDA = new MedicoDA();
    }
    
    @Override
    public List<MedicoBE> ReadAll() {
        return _MedicoDA.ReadAll();
    }

    @Override
    public MedicoBE GetById(String c) {
        return _MedicoDA.GetById(c);
    }

    @Override
    public boolean Delete(String c) {
        return _MedicoDA.Delete(c);
    }

    @Override
    public boolean Update(MedicoBE item) {
        return _MedicoDA.Update(item);
    }

    @Override
    public boolean Insert(MedicoBE item) {
        return _MedicoDA.Insert(item);
    }
    
}
