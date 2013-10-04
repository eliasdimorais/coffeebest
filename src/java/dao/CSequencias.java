/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.MPlantcyc;
import modelo.MSequencias;

/**
 *
 * @author bruno
 */
public class CSequencias {

    Connection connection;

    public CSequencias() {
    }

    public List getByFilters(int filtro, String dataset, float cobertura, float identidade, String[] ordenacao) throws SQLException {
        connection = new conexaoBD.ConnectionFactory().getConnection();

        List<modelo.MSequencias> listSequencias = new ArrayList<modelo.MSequencias>();
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT s.header AS q_header, s.length AS q_length, s.pk_sequencia AS pk_sequencia, s.sequencia AS q_sequencia, d.nome AS q_dataset, s.fk_dataset AS pk_dataset FROM sequencias s INNER JOIN dataset d ON pk_dataset = fk_dataset WHERE fk_dataset ");
        if (dataset.trim().equals("0")) {
            sb.append("<=7");
        } else {
            sb.append("=");
            sb.append(dataset);
        }


        switch (filtro) {
            case 1:
                sb.append("AND pk_sequencia IN (SELECT q.fk_sequencia FROM query q INNER JOIN hit h ON pk_query = fk_query WHERE h.identities_pctm >= ");
                sb.append(identidade);
                sb.append(" AND h.q_cobertura >= ");
                sb.append(cobertura);
                sb.append(" AND fk_blast = 1 ");
                sb.append(" ORDER BY h.q_cobertura, h.identities_pctm, score ");
                sb.append(" );");

                break;
            case 2:
                sb.append("AND pk_sequencia IN (SELECT q.fk_sequencia FROM query q INNER JOIN hit h ON pk_query = fk_query WHERE h.identities_pctm >= ");
                sb.append(identidade);
                sb.append(" AND h.q_cobertura >= ");
                sb.append(cobertura);
                sb.append(" AND fk_blast = 2 ");
                sb.append(" ORDER BY h.q_cobertura, h.identities_pctm, score ");
                sb.append(" );");
                break;
        }
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(sb.toString());
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    modelo.MSequencias sequencias = new modelo.MSequencias();
                    sequencias.setPk_sequencia(rs.getString("pk_sequencia"));
                    sequencias.setHeader(rs.getString("q_header"));
                    sequencias.setSequencia(rs.getString("q_sequencia"));
                    sequencias.setLength(rs.getString("q_length"));
                    sequencias.setFk_dataset(rs.getString("pk_dataset"));
                    sequencias.setDataset(rs.getString("q_dataset"));
                    listSequencias.add(sequencias);

                }
                return listSequencias;
            }
        } catch (SQLException e) {
            System.out.println("===========================================");
            System.out.println("ERRO: " + e.getMessage());
            System.out.println(sb.toString());
            System.out.println("===========================================");
        } finally {
            connection.close();
            stmt.close();

        }
        return null;
    }

    public MSequencias getById(int pk_sequencia) throws SQLException {
        connection = new conexaoBD.ConnectionFactory().getConnection();
        PreparedStatement stmt = null;
        String query = "SELECT pk_sequencia, header, sequencia, length, pk_dataset, nome FROM sequencias s INNER JOIN dataset d ON d.pk_dataset = s.fk_dataset"
                + " WHERE pk_sequencia = " + pk_sequencia + " ;";
        MSequencias sequencia = new MSequencias();
        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                if (rs.next()) {
                    sequencia.setPk_sequencia(rs.getString("pk_sequencia"));
                    sequencia.setHeader(rs.getString("header"));
                    sequencia.setSequencia(rs.getString("sequencia"));
                    sequencia.setLength(rs.getString("length"));
                    sequencia.setFk_dataset(rs.getString("pk_dataset"));
                    sequencia.setDataset(rs.getString("nome"));
                }
                return sequencia;
            }
        } catch (SQLException e) {
            System.out.println("===========================================");
            System.out.println("ERRO: " + e.getMessage());
            System.out.println("catch");
            System.out.println("===========================================");
        } finally {
            connection.close();
            stmt.close();

        }
        return null;
    }

    public MPlantcyc getPlantcycById(int pk_sequencia) throws SQLException {
        connection = new conexaoBD.ConnectionFactory().getConnection();
        PreparedStatement stmt = null;

        String query = "SELECT pk_sequencia, dp.pk_dataset_plantcyc AS pk_dataset_plantcyc, sequencia, length, "
                + " header, plantcyc, gene, funcao, dp.nome AS dataset_plantcyc, d.nome AS dataset, "
                + " d.pk_dataset AS pk_dataset FROM plantcyc p INNER JOIN sequencias s ON s.pk_sequencia = p.fk_sequencia "
                + " INNER JOIN dataset_plantcyc dp ON dp.pk_dataset_plantcyc = p.fk_dataset_plantcyc "
                + " INNER JOIN dataset d ON d.pk_dataset = s.fk_dataset WHERE s.pk_sequencia = " + pk_sequencia + ";";


        MPlantcyc sequencia = new MPlantcyc();
        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                if (rs.next()) {
                    sequencia.setPk_sequencia(rs.getString("pk_sequencia"));
                    sequencia.setLength(rs.getString("length"));
                    sequencia.setPk_dataset_plantcyc(Integer.parseInt(rs.getString("pk_dataset_plantcyc")));
                    sequencia.setPlantcyc_dataset(rs.getString("dataset_plantcyc"));
                    sequencia.setSequencia(rs.getString("sequencia"));
                    sequencia.setPlantcyc(rs.getString("plantcyc"));
                    sequencia.setFuncao(rs.getString("funcao"));
                    sequencia.setGene(rs.getString("gene"));
                    sequencia.setHeader(rs.getString("header"));
                    sequencia.setDataset(rs.getString("dataset"));
                    sequencia.setFk_dataset(rs.getString("pk_dataset"));


                }
                return sequencia;
            }
        } catch (SQLException e) {
            System.out.println("===========================================");
            System.out.println("ERRO: " + e.getMessage());
            System.out.println("catch");
            System.out.println("===========================================");
        } finally {
            connection.close();
            stmt.close();

        }
        return null;
    }

    public List getByGo(String termo, String namespace) throws SQLException {
        connection = new conexaoBD.ConnectionFactory().getConnection();
        List<modelo.MSequencias> listSequencias = new ArrayList<modelo.MSequencias>();
        PreparedStatement stmt = null;        

        
        String query = "SELECT pk_sequencia, fk_dataset, header, sequencia, length, nome, pk_dataset "
                + " FROM sequencias INNER JOIN dataset ON pk_dataset = fk_dataset "
                + " WHERE pk_sequencia IN ( SELECT fk_sequencia FROM anotacao  "
                + " INNER JOIN gontology ON pk_gontology = fk_gontology ";

        if (termo.trim().isEmpty()) {
            if (!namespace.trim().equals("all")) {
                query += " WHERE namespace = \'" + namespace + "\' );";
            } else {
                query += " ) ;";
            }
        } else {
            if (namespace.trim().equals("all")) {
                query += " WHERE name LIKE \'%" + termo + "%\' ) ;";
            } else {
                query += " WHERE name LIKE \'%" + termo + "%\' AND namespace = \'" + namespace + "\' ) ;";
            }
        }
        System.out.println(query);
        
        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while(rs.next()) {
                    modelo.MSequencias sequencias = new modelo.MSequencias();
                    sequencias.setPk_sequencia(rs.getString("pk_sequencia"));
                    sequencias.setHeader(rs.getString("header"));
                    sequencias.setSequencia(rs.getString("sequencia"));
                    sequencias.setLength(rs.getString("length"));
                    sequencias.setFk_dataset(rs.getString("pk_dataset"));
                    sequencias.setDataset(rs.getString("nome"));
                    listSequencias.add(sequencias);
                }
                return listSequencias;
            }
        } catch (SQLException e) {
            System.out.println("===========================================");
            System.out.println("ERRO: " + e.getMessage());
            System.out.println("catch");
            System.out.println("===========================================");
        } finally {
            connection.close();
            stmt.close();
        }
        return null;
    }

    public List getByGenePlantcyc(String termo) throws SQLException {
        
        connection = new conexaoBD.ConnectionFactory().getConnection();
        List<modelo.MSequencias> listSequencias = new ArrayList<modelo.MSequencias>();
        PreparedStatement stmt = null;        
        String query;
        
        if (termo.trim().isEmpty()) {
            query =
                    "SELECT pk_sequencia, fk_dataset, header, sequencia, length, nome, pk_dataset "
                    + " FROM sequencias INNER JOIN dataset ON pk_dataset = fk_dataset WHERE pk_sequencia "
                    + " IN ( SELECT q.fk_sequencia FROM query q INNER JOIN hit h ON h.fk_query = q.pk_query "
                    + " INNER JOIN sequencias ss ON ss.pk_sequencia = h.fk_sequencia "
                    + " INNER JOIN plantcyc p ON p.fk_sequencia = ss.pk_sequencia WHERE q.fk_blast = 3 "
                    + " );";
        } else {
            query =
                    "SELECT pk_sequencia, fk_dataset, header, sequencia, length, nome, pk_dataset "
                    + " FROM sequencias INNER JOIN dataset ON pk_dataset = fk_dataset WHERE pk_sequencia "
                    + " IN ( SELECT q.fk_sequencia FROM query q INNER JOIN hit h ON h.fk_query = q.pk_query "
                    + " INNER JOIN sequencias ss ON ss.pk_sequencia = h.fk_sequencia "
                    + " INNER JOIN plantcyc p ON p.fk_sequencia = ss.pk_sequencia WHERE q.fk_blast = 3 "
                    + " AND plantcyc LIKE \'%" + termo + "%\' OR funcao LIKE \'%" + termo + "%\' OR gene like \'%" + termo + "%\' );";
        }





        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while(rs.next()) {
                    modelo.MSequencias sequencias = new modelo.MSequencias();
                    sequencias.setPk_sequencia(rs.getString("pk_sequencia"));
                    sequencias.setHeader(rs.getString("header"));
                    sequencias.setSequencia(rs.getString("sequencia"));
                    sequencias.setLength(rs.getString("length"));
                    sequencias.setFk_dataset(rs.getString("pk_dataset"));
                    sequencias.setDataset(rs.getString("nome"));
                    
                    listSequencias.add(sequencias);
                }
                return listSequencias;
            }
        } catch (SQLException e) {
            System.out.println("===========================================");
            System.out.println("ERRO: " + e.getMessage());
            System.out.println("catch");
            System.out.println("===========================================");
        } finally {
            connection.close();
            stmt.close();

        }
        return null;
    }
}
