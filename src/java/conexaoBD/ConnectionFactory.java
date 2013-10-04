/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package conexaoBD;

import java.sql.Connection;
import java.sql.DriverManager;


/**
 *
 * @author bruno
 */
public class ConnectionFactory {

    public Connection getConnection()  {
        try {
            String usuario = "postgres";
            String senha = "postgres";
            String urlconexao = "jdbc:postgresql://localhost:5432/iapar";

            Class.forName("org.postgresql.Driver");
            DriverManager.getConnection(urlconexao, usuario, senha);
            return DriverManager.getConnection(urlconexao, usuario, senha);

        } catch (Exception ex) {
            System.out.println("==========================================================");
            System.out.println("Não Foi possível conectar ao servidor - " + ex.getMessage());
            System.out.println("ERRO - " + ex.getLocalizedMessage());
            System.out.println("ERRO - " + ex.toString());
            System.out.println("==========================================================");
            throw new RuntimeException(ex);
            
        }

    }
   
}
