/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BL;

import BE.EspecialidadBE;
import DA.EspecialidadDA;
import java.util.List;

/**
 *
 * @author George
 */
public class EspecialidadBL implements IBaseBL<EspecialidadBE> {

    private final EspecialidadDA _EspecialidadDA;
    
    public EspecialidadBL() {
        this._EspecialidadDA = new EspecialidadDA();
    }
    
    @Override
    public List<EspecialidadBE> ReadAll() {
        return _EspecialidadDA.ReadAll();
    }

    @Override
    public EspecialidadBE GetById(String c) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean Delete(String c) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean Update(EspecialidadBE item) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean Insert(EspecialidadBE item) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
