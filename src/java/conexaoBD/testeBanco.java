/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package conexaoBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author bruno
 */
public class testeBanco {

    Connection conn;

    public testeBanco() {
        conn = new conexaoBD.ConnectionFactory().getConnection();
    }

    public void Fechar() throws SQLException {
        conn.close();
    }

    public ResultSet consulta() throws SQLException {
        String query = "SELECT sequence.id as id, header as query,(SELECT header FROM sequence WHERE id_seq_fk = sequence.id) AS subject ,\n"
                + "sequences, dataset, name, description FROM sequence\n"
                + "INNER JOIN blast ON blast.id_query_fk = sequence.id\n"
                + "INNER JOIN repositories ON id_repositories_fk = repositories.id\n"
                + "INNER JOIN condition ON id_condition_fk = condition.id\n"
                + "INNER JOIN type ON sequence.type = type.id";

        PreparedStatement stmt = conn.prepareStatement(query);

        return stmt.executeQuery();
    }
}
