/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package conexaoBD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author bruno
 */
public class testeBanco2 {
    public static void main(String[] args) throws SQLException {
        testeBanco vv = new testeBanco();
       vv.consulta();
        vv.Fexa();
    }
}
