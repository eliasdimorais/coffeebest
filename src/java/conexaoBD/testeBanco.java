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

    public void Fexa() throws SQLException {
        conn.close();
    }

    public ResultSet consulta() throws SQLException {
        String query = "SELECT sq.header AS q_header, sq.length AS q_legth, d.nome AS q_dataset, "
                + " sq.pk_sequencia AS pk_sequencia, sq.fk_dataset AS pk_dataset, sq.sequencia AS q_sequencia "
                + " FROM query q INNER JOIN hit h ON q.pk_query = h.fk_query"
                + " INNER JOIN hitn hn ON h.pk_hit = hn.fk_hit "
                + " INNER JOIN sequencias sq ON sq.pk_sequencia = q.fk_sequencia "
                + " INNER JOIN sequencias ss ON ss.pk_sequencia = h.fk_sequencia "
                + " INNER JOIN blast b ON b.pk_blast = q.fk_blast "
                + " INNER JOIN dataset d ON d.pk_dataset = sq.fk_dataset "
                + " WHERE sq.fk_dataset " + "=1" + " AND b.pk_blast = 1"
                + " AND h.q_cobertura >= 45"
                + " AND h.identities_pctm >= 12;";

        PreparedStatement stmt = conn.prepareStatement(query);


        return stmt.executeQuery();
    }
}
