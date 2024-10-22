/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BE;

/**
 *
 * @author George
 */
public class MedicoBE {

    /**
     * @return the ID_Especialidad
     */
    public String getID_Especialidad() {
        return ID_Especialidad;
    }

    /**
     * @param ID_Especialidad the ID_Especialidad to set
     */
    public void setID_Especialidad(String ID_Especialidad) {
        this.ID_Especialidad = ID_Especialidad;
    }

    /**
     * @return the ID_Medico
     */
    public String getID_Medico() {
        return ID_Medico;
    }

    /**
     * @param ID_Medico the ID_Medico to set
     */
    public void setID_Medico(String ID_Medico) {
        this.ID_Medico = ID_Medico;
    }

    /**
     * @return the Nombre
     */
    public String getNombre() {
        return Nombre;
    }

    /**
     * @param Nombre the Nombre to set
     */
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    /**
     * @return the Apellido
     */
    public String getApellido() {
        return Apellido;
    }

    /**
     * @param Apellido the Apellido to set
     */
    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    /**
     * @return the CMP
     */
    public String getCMP() {
        return CMP;
    }

    /**
     * @param CMP the CMP to set
     */
    public void setCMP(String CMP) {
        this.CMP = CMP;
    }

    /**
     * @return the Nombre_Especialidad
     */
    public String getNombre_Especialidad() {
        return Nombre_Especialidad;
    }

    /**
     * @param Nombre_Especialidad the Nombre_Especialidad to set
     */
    public void setNombre_Especialidad(String Nombre_Especialidad) {
        this.Nombre_Especialidad = Nombre_Especialidad;
    }

    /**
     * @return the Teléfono
     */
    public String getTeléfono() {
        return Teléfono;
    }

    /**
     * @param Teléfono the Teléfono to set
     */
    public void setTeléfono(String Teléfono) {
        this.Teléfono = Teléfono;
    }

    /**
     * @return the Email
     */
    public String getEmail() {
        return Email;
    }

    /**
     * @param Email the Email to set
     */
    public void setEmail(String Email) {
        this.Email = Email;
    }

    /**
     * @return the Horario_Disponible
     */
    public String getHorario_Disponible() {
        return Horario_Disponible;
    }

    /**
     * @param Horario_Disponible the Horario_Disponible to set
     */
    public void setHorario_Disponible(String Horario_Disponible) {
        this.Horario_Disponible = Horario_Disponible;
    }

    public MedicoBE() {

    }

    private String ID_Medico;
    private String Nombre;
    private String Apellido;
    private String CMP;
    private String Nombre_Especialidad;
    private String Teléfono;
    private String Email;
    private String Horario_Disponible;
    private String ID_Especialidad;
}
