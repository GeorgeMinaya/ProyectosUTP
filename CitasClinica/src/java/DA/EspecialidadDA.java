/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DA;

import BE.EspecialidadBE;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author George
 */
public class EspecialidadDA extends ConexionMySql implements IBaseDA<EspecialidadBE>{

    @Override
    public List<EspecialidadBE> ReadAll() {
        List<EspecialidadBE> lista = new ArrayList<>();

        try {

            String sql = "select * from especialidad";
            Statement stm = getCn().createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                EspecialidadBE item = new EspecialidadBE();
                
                item.setID_Especialidad(rs.getString("ID_Especialidad"));
                item.setNombre_Especialidad(rs.getString("Nombre_Especialidad"));
                item.setDescripción(rs.getString("Descripción"));

                lista.add(item);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return lista;
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
