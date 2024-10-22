package DA;

import BE.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author George
 */
public class MedicoDA extends ConexionMySql implements IBaseDA<MedicoBE> {

    public MedicoDA() {

    }

    @Override
    public List<MedicoBE> ReadAll() {
        List<MedicoBE> lista = new ArrayList<>();

        try {

            String sql = "select m.ID_Medico, m.Nombre, m.Apellido, m.CMP, e.Nombre_Especialidad from medico m "
                    + "inner join especialidad e on m.ID_Especialidad = e.ID_Especialidad";
            Statement stm = getCn().createStatement();
            ResultSet rs = stm.executeQuery(sql);

            while (rs.next()) {
                MedicoBE medico = new MedicoBE();

                medico.setID_Medico(rs.getString("ID_Medico"));
                medico.setNombre(rs.getString("Nombre"));
                medico.setApellido(rs.getString("Apellido"));
                medico.setCMP(rs.getString("CMP"));
                medico.setNombre_Especialidad(rs.getString("Nombre_Especialidad"));

                lista.add(medico);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return lista;
    }

    @Override
    public MedicoBE GetById(String c) {
        MedicoBE encontrado = new MedicoBE();

        try {

            String sql = "select * from medico m "
                    + "inner join especialidad e on m.ID_Especialidad = e.ID_Especialidad "
                    + "where ID_Medico = ?";
            PreparedStatement pst = getCn().prepareStatement(sql);
            pst.setString(1, c);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                encontrado.setID_Medico(rs.getString("ID_Medico"));
                encontrado.setNombre(rs.getString("Nombre"));
                encontrado.setApellido(rs.getString("Apellido"));
                encontrado.setCMP(rs.getString("CMP"));
                encontrado.setID_Especialidad(rs.getString("ID_Especialidad"));
                encontrado.setNombre_Especialidad(rs.getString("Nombre_Especialidad"));
                encontrado.setTeléfono(rs.getString("Teléfono"));
                encontrado.setEmail(rs.getString("Email"));
                encontrado.setHorario_Disponible(rs.getString("Horario_Disponible"));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return encontrado;
    }

    @Override
    public boolean Delete(String c) {
        boolean resultado = false;
        
        try {
            String sql = "delete from medico where ID_Medico = ?";
            PreparedStatement pst = getCn().prepareStatement(sql);
            pst.setString(1, c);

            resultado = pst.execute();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return resultado;
    }

    @Override
    public boolean Update(MedicoBE item) {
        
        boolean resultado = false;
        
        try {
            String sql = "CALL ActualizarMedico(?,?,?,?,?)";
            PreparedStatement pst = getCn().prepareStatement(sql);
            pst.setString(1, item.getID_Medico());
            pst.setString(2, item.getNombre());
            pst.setString(3, item.getApellido());
            pst.setString(4, item.getEmail());
            pst.setString(5, item.getTeléfono());

            resultado = pst.execute();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return resultado;
    }

    @Override
    public boolean Insert(MedicoBE item) {
        boolean resultado = false;
        
        try {
            String sql = "CALL InsertarMedico(?,?,?,?,?,?,?)";
            PreparedStatement pst = getCn().prepareStatement(sql);
            pst.setString(1, item.getNombre());
            pst.setString(2, item.getApellido());
            pst.setString(3, item.getCMP());
            pst.setString(4, item.getID_Especialidad());
            pst.setString(5, item.getTeléfono());
            pst.setString(6, item.getEmail());
            pst.setString(7, "");

            resultado = pst.execute();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return resultado;
    }

}
