/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DA;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

/**
 *
 * @author George
 */
public class ConexionMySql {

    private String sConxMySQL = "jdbc:mysql://localhost:3306/bd_citashospital_41932"; // todo: revisar utf8 en conexión
    private String sUserName = "root";
    private String sUserPwd = "";
    private Connection oConnection;

    public ConexionMySql() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            oConnection = DriverManager.getConnection(sConxMySQL, sUserName, sUserPwd);

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public Connection getCn() {
        return oConnection;
    }
}
