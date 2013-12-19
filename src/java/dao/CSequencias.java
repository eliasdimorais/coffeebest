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
 * @author 2 modifications: Elias
 */
public class CSequencias {

    Connection connection;

    public CSequencias() {
    }

    public List getByFilters(int filtro, String dataset, float cobertura, float identidade, String[] ordenacao) throws SQLException {
        connection = new conexaoBD.ConnectionFactory().getConnection();
        
        List<modelo.MSequencias> listSequencias = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        cobertura = 85;
        sb.append("SELECT sequence.id as id, header as query, "
                + "sequences, dataset, description FROM sequence\n"
                + "INNER JOIN repositories ON id_repositories_fk = repositories.id\n"
                + "INNER JOIN type ON sequence.type = type.id ");
        //----------------- FILTRO CC OU CA
        switch (filtro) {
            case 1:
                sb.append("INNER JOIN blast ON blast.id_query_fk = sequence.id");
                sb.append(" AND id_project_fk = 2 AND blast.identity >= ");
                sb.append(identidade);
                //sb.append("GROUP BY id_seq_fk, header, id_query_fk , description;");
                // sb.append(" );");
                break;
            case 2:
                sb.append("INNER JOIN blast ON blast.id_query_fk = sequence.id");
                sb.append(" AND id_project_fk = 1 AND blast.identity >= ");
                sb.append(identidade);
                // sb.append(" ORDER BY h.q_cobertura, h.identities_pctm, score ");
                // sb.append(" );");
                break;
        }
        //------------------BANCO POR WEEK, CC OU CA
        if (dataset.trim().equals("0")) {
            sb.append("WHERE sequence.id <= 82169");
        } else {
            if (dataset.trim().equals("1")) {
                sb.append("WHERE sequence.id >= 18008 AND sequence.id <= 18733");
            } else if (dataset.trim().equals("2")) {
                sb.append("WHERE sequence.id >= 18734 AND sequence.id <= 27846");
            } else if (dataset.trim().equals("3")) {
                sb.append("WHERE sequence.id >= 27847 AND sequence.id <= 37923");
            } else if (dataset.trim().equals("4")) {
                sb.append("WHERE sequence.id >= 37924 AND sequence.id <= 38132");
            } else if (dataset.trim().equals("5")) {
                sb.append("WHERE sequence.id >= 38133 AND sequence.id <= 47016");
            } else if (dataset.trim().equals("6")) {
                sb.append("WHERE sequence.id >= 1 AND sequence.id <= 18007");
            } else {
                sb.append("WHERE sequence.id >= 47017 AND sequence.id <= 82169");
            }
        }

        sb.append("ORDER BY sequence.id");
        
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(sb.toString());
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    modelo.MSequencias sequencias = new modelo.MSequencias();
                    sequencias.setId(rs.getString("id"));
                    sequencias.setQuery(rs.getString("query"));
                    sequencias.setSequences(rs.getString("sequences"));
                    sequencias.setDataset(rs.getString("dataset"));
                    sequencias.setDescription(rs.getString("description"));
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
    
     public MSequencias getByFiltersId(int id_sequencia) throws SQLException {
        connection = new conexaoBD.ConnectionFactory().getConnection();
        
        MSequencias listSequencias = new MSequencias();
        StringBuilder sb = new StringBuilder();
        int cobertura = 85;
        sb.append("SELECT sequence.id as id, header as query, "
                + " sequences FROM sequence\n"
                + " WHERE id = " + id_sequencia);
        //----------------- FILTRO CC OU CA
        //--------------NAO TEM FILTRO

        
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(sb.toString());
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    modelo.MSequencias sequencias = new modelo.MSequencias();
                    sequencias.setId(rs.getString("id"));
                    sequencias.setQuery(rs.getString("query"));
                    sequencias.setSequences(rs.getString("sequences"));
                    //sequencias.setDataset(rs.getString("dataset"));
                    //sequencias.setDescription(rs.getString("description"));
                    listSequencias = sequencias;

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
     
     public MSequencias consultaPlantcyc(int id_sequencia) throws SQLException {
        connection = new conexaoBD.ConnectionFactory().getConnection();
        
        MSequencias listSequencias = new MSequencias();
        StringBuilder sb = new StringBuilder();
        int cobertura = 85;
        sb.append("SELECT sequence.id as id, header as query, "
                + " sequences FROM sequence\n"
                + " WHERE id = " + id_sequencia);
        //----------------- FILTRO CC OU CA
        //--------------NAO TEM FILTRO

        
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(sb.toString());
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    modelo.MSequencias sequencias = new modelo.MSequencias();
                    sequencias.setId(rs.getString("id"));
                    sequencias.setQuery(rs.getString("query"));
                    sequencias.setSequences(rs.getString("sequences"));
                    //sequencias.setDataset(rs.getString("dataset"));
                    //sequencias.setDescription(rs.getString("description"));
                    listSequencias = sequencias;

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

    public MPlantcyc getPlantcycById(int id) throws SQLException {
        connection = new conexaoBD.ConnectionFactory().getConnection();
        PreparedStatement stmt = null;

        String query = "SELECT id, dp.dataset_plantcyc AS dataset_plantcyc, sequencia, length, "
                + " header, plantcyc, gene, funcao, dp.nome AS dataset_plantcyc, d.nome AS dataset, "
                + " d.dataset AS dataset FROM plantcyc p INNER JOIN sequence s ON s.id = p.fk_sequencia "
                + " INNER JOIN dataset_plantcyc dp ON dp.dataset_plantcyc = p.fk_dataset_plantcyc "
                + " INNER JOIN dataset d ON d.dataset = s.fk_dataset WHERE s.id = " + id + ";";

        MPlantcyc sequencia = new MPlantcyc();
        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                if (rs.next()) {
                    sequencia.setId(rs.getString("id"));
                    sequencia.setPk_dataset_plantcyc(Integer.parseInt(rs.getString("dataset_plantcyc")));
                    sequencia.setPlantcyc_dataset(rs.getString("dataset_plantcyc"));
                    sequencia.setSequences(rs.getString("sequencia"));
                    sequencia.setPlantcyc(rs.getString("plantcyc"));
                    sequencia.setFuncao(rs.getString("funcao"));
                    sequencia.setGene(rs.getString("gene"));
                    sequencia.setQuery(rs.getString("query"));
                    sequencia.setDataset(rs.getString("dataset"));
                    sequencia.setDataset(rs.getString("dataset"));

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

        String query = "SELECT sequence.id as id, header as query, sequences, "
                + "dataset, description FROM gosequence "
                + "INNER JOIN go ON go.id = goSequence.id_go_fk \n"
                + "INNER JOIN sequence ON sequence.id = goSequence.id_sequence_fk \n"
                + "INNER JOIN type ON sequence.type = type.id  \n"
                + "INNER JOIN repositories ON id_repositories_fk = repositories.id \n"
                + "WHERE (id_repositories_fk = 1 OR id_repositories_fk = 2)";

        if (termo.trim().isEmpty()) {
            if (!namespace.trim().equals("all")) {
                query += " AND namespace = \'" + namespace + "\'";
            } else {
                //query += " ) ;";
            }
        } else {
            if (namespace.trim().equals("all")) {
                query += " AND name LIKE \'%" + termo + "%\'";
            } else {
                query += " AND name LIKE \'%" + termo + "%\' AND namespace = \'" + namespace + "\'";
            }
        }
        System.out.println(query);
        query += " GROUP BY sequence.id, query, dataset, description";

        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    modelo.MSequencias sequencias = new modelo.MSequencias();
                    sequencias.setId(rs.getString("id"));
                    sequencias.setQuery(rs.getString("query"));
                    sequencias.setSequences(rs.getString("sequences"));
                    sequencias.setDataset(rs.getString("dataset"));
                    sequencias.setDescription(rs.getString("description"));
                    
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

    public List getByGenePlantcyc(String termo) throws SQLException { // qm bateu com plantcyc

        connection = new conexaoBD.ConnectionFactory().getConnection();
        List<modelo.MSequencias> listSequencias = new ArrayList<modelo.MSequencias>();
        PreparedStatement stmt = null;
        String query
                    = "SELECT id_seq_fk as id, header as query, project.name as dataset,"
                    + " score as description FROM blast"
                    + " INNER JOIN project ON project.id = id_project_fk"
                    + " INNER JOIN sequence ON sequence.id = blast.id_seq_fk"
                    + " WHERE (id_project_fk = 3 OR id_project_fk = 4)"
                    + " AND header like '%" + termo + "%'"
                    + " ORDER BY id_seq_fk";

        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    modelo.MSequencias sequencias = new modelo.MSequencias();
                    sequencias.setId(rs.getString("id"));
                    sequencias.setQuery(rs.getString("query"));
                    sequencias.setSequences(rs.getString("dataset"));
                    sequencias.setDataset(rs.getString("description"));

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
    
    //    public MSequencias getById(int id) throws SQLException {
//        connection = new conexaoBD.ConnectionFactory().getConnection();
//        PreparedStatement stmt = null;
//        String query = "SELECT id, header, sequencia, length, dataset, nome FROM sequencias s INNER JOIN dataset d ON d.dataset = s.fk_dataset"
//                + " WHERE id = " + id + " ;";
//        MSequencias sequencia = new MSequencias();
//        try {
//            stmt = connection.prepareStatement(query);
//            ResultSet rs = stmt.executeQuery();
//            if (rs != null) {
//                if (rs.next()) {
//                    sequencia.setId(rs.getString("id"));
//                    sequencia.setHeader(rs.getString("header"));
//                    sequencia.setSequences(rs.getString("sequencia"));
//                    sequencia.setLength(rs.getString("length"));
//                    sequencia.setDataset(rs.getString("dataset"));
//                }
//                return sequencia;
//            }
//        } catch (SQLException e) {
//            System.out.println("===========================================");
//            System.out.println("ERRO: " + e.getMessage());
//            System.out.println("catch");
//            System.out.println("===========================================");
//        } finally {
//            connection.close();
//            stmt.close();
//
//        }
//        return null;
//    }
}
