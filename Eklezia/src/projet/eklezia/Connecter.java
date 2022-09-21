package projet.eklezia;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
    
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author karma03
 */
public class Connecter {
    Connection con;
    public Connecter(){
        try{
        Class.forName("com.mysql.jdbc.Driver");
        }
        catch(ClassNotFoundException e){
        System.err.println(e);
        }
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost/saintpotache","root","");;
        }
        catch(SQLException e){System.err.println(e);
        }
    }
    Connection obtenirconnexion(){return con;}
}
