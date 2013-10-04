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
import modelo.MBlast_n;
import modelo.MBlast_x;
import modelo.MGo;
import modelo.MReads;
import modelo.MSequencias;

/**
 *
 * @author bruno
 */
public class CDetalhes {

    private Connection connection;

    public CDetalhes() {
    }

    public MSequencias consultaSequencias(int pk_sequencia) throws SQLException {
        return new CSequencias().getById(pk_sequencia);
    }

    public List consultaBlast_n(int pk_sequencia) throws SQLException {
        this.connection = new conexaoBD.ConnectionFactory().getConnection();
        List<MBlast_n> listaBlast = new ArrayList<MBlast_n>();
        String query = "SELECT q.fk_blast AS blast, q.pk_query AS pk_query, q.fk_sequencia AS query, "
                + " q.fk_blast AS blast, h.fk_sequencia AS subject, alignment_length, q_start, q_end, "
                + " s_start, s_end, score, identities_pctm, s_cobertura, q_cobertura, identities, evalue, "
                + " gap, score, best_hit, s_strand, q_strand  FROM query q "
                + " INNER JOIN hit h ON q.pk_query = h.fk_query INNER JOIN hitn hn ON h.pk_hit = hn.fk_hit "
                + " WHERE q.fk_sequencia = " + pk_sequencia + ";";

        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    MBlast_n blast = new MBlast_n();

                    blast.setPk_blast(Integer.parseInt(rs.getString("blast")));
                    blast.setPk_query(Integer.parseInt(rs.getString("pk_query")));

                    blast.setSubject(new CSequencias().getById(Integer.parseInt(rs.getString("subject"))));

                    blast.setQ_end(Integer.parseInt(rs.getString("q_start")));
                    blast.setQ_start(Integer.parseInt(rs.getString("q_end")));
                    blast.setS_start(Integer.parseInt(rs.getString("s_start")));
                    blast.setS_end(Integer.parseInt(rs.getString("s_end")));


                    blast.setAlignmentLength(Integer.parseInt(rs.getString("alignment_length")));
                    blast.setIdentities(Integer.parseInt(rs.getString("identities")));
                    blast.setIdentities_pctm(Float.parseFloat(rs.getString("identities_pctm")));
                    blast.setScore(Double.parseDouble(rs.getString("score")));
                    blast.setQ_cobertura(Float.parseFloat(rs.getString("q_cobertura")));
                    blast.setS_cobertura(Float.parseFloat(rs.getString("s_cobertura")));

                    blast.setS_strand(Boolean.parseBoolean(rs.getString("s_strand")));
                    blast.setQ_Sstrand(Boolean.parseBoolean(rs.getString("q_strand")));
                    blast.setBest_hit(Boolean.parseBoolean(rs.getString("best_hit")));

                    listaBlast.add(blast);
                }
                return listaBlast;
            }
        } catch (SQLException e) {
            System.out.println("===========================================");
            System.out.println("ERRO: " + e.getMessage());
            System.out.println(query);
            System.out.println("===========================================");
        } finally {
            connection.close();
            stmt.close();
        }
        return null;
    }

   public List consultaBlast_x(int pk_sequencia) throws SQLException {
        this.connection = new conexaoBD.ConnectionFactory().getConnection();

        List<MBlast_x> listaBlast = new ArrayList<MBlast_x>();
        String query = "SELECT q.fk_blast AS blast, q.pk_query AS pk_query, q.fk_sequencia As query, "
                + " q.fk_blast AS blast, h.fk_sequencia AS subject, alignment_length, q_start, q_end, "
                + " s_start, s_end, score, identities_pctm, s_cobertura, q_cobertura, identities, evalue, "
                + " gap, score, frame, positives,best_hit FROM query q INNER JOIN hit h ON q.pk_query = h.fk_query "
                + " INNER JOIN hitx hx ON h.pk_hit = hx.fk_hit WHERE q.fk_sequencia = " + pk_sequencia + ";";
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    MBlast_x blast = new MBlast_x();

                    blast.setPk_blast(Integer.parseInt(rs.getString("blast")));
                    blast.setPk_query(Integer.parseInt(rs.getString("pk_query")));

                    blast.setSubject(new CSequencias().getPlantcycById(Integer.parseInt(rs.getString("subject"))));

                    blast.setQ_end(Integer.parseInt(rs.getString("q_start")));
                    blast.setQ_start(Integer.parseInt(rs.getString("q_end")));
                    blast.setS_start(Integer.parseInt(rs.getString("s_start")));
                    blast.setS_end(Integer.parseInt(rs.getString("s_end")));


                    blast.setAlignmentLength(Integer.parseInt(rs.getString("alignment_length")));
                    blast.setIdentities(Integer.parseInt(rs.getString("identities")));
                    blast.setIdentities_pctm(Float.parseFloat(rs.getString("identities_pctm")));
                    blast.setScore(Double.parseDouble(rs.getString("score")));
                    blast.setQ_cobertura(Float.parseFloat(rs.getString("q_cobertura")));
                    blast.setS_cobertura(Float.parseFloat(rs.getString("s_cobertura")));

                    blast.setFrames(Integer.parseInt(rs.getString("frame")));
                    blast.setPositives(Integer.parseInt(rs.getString("positives")));
                    blast.setBest_hit(Boolean.parseBoolean(rs.getString("best_hit")));

                    listaBlast.add(blast);
                    System.out.println("----->>>>" + blast.getPk_query());
                }
                return listaBlast;
            }
        } catch (SQLException e) {
            System.out.println("===========================================");
            System.out.println("ERRO: " + e.getMessage());
            System.out.println(query);
            System.out.println("===========================================");
        } finally {
            connection.close();
            stmt.close();
        }
        return null;
    }

    public List consultaGo(int pk_sequencia) throws SQLException {
        this.connection = new conexaoBD.ConnectionFactory().getConnection();
        List<MGo> listaGo = new ArrayList<MGo>();
        String query = "SELECT pk_gontology, name, namespace, fk_sequencia FROM gontology "
                + "INNER JOIN anotacao ON pk_gontology = fk_gontology WHERE fk_sequencia = " + pk_sequencia + " ORDER BY namespace;";
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    MGo go = new MGo();
                    go.setName(rs.getString("name"));
                    go.setPk_gontology(Integer.parseInt(rs.getString("pk_gontology")));
                    go.setNamespace(rs.getString("namespace"));
                    listaGo.add(go);

                }
                return listaGo;
            }
        } catch (SQLException e) {
            System.out.println("===========================================");
            System.out.println("ERRO: " + e.getMessage());
            System.out.println(query);
            System.out.println("===========================================");
        } finally {
            connection.close();
            stmt.close();
        }
        return null;
    }

   public List consultaReads(int pk_sequencia) throws SQLException {
        this.connection = new conexaoBD.ConnectionFactory().getConnection();
        List<MReads> listaReads = new ArrayList<MReads>();
        String query = "SELECT pk_read, fk_sequencia, r.identificacao AS r_identificacao, sequencia, pk_dataset_read, "
                + " d.identificacao AS d_identificacao, nome FROM reads r INNER JOIN dataset_read d "
                + " ON pk_dataset_read = fk_dataset_read WHERE fk_sequencia = " + pk_sequencia + ";";
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    MReads reads = new MReads();
                    reads.setDataset_identificacao(rs.getString("d_identificacao"));
                    reads.setDataset_nome(rs.getString("nome"));
                    reads.setFk_sequencia(rs.getInt("fk_sequencia"));
                    reads.setIdentificacao(rs.getString("r_identificacao"));
                    reads.setPk_dataset_read(rs.getInt("pk_dataset_read"));
                    reads.setPk_read(rs.getInt("pk_read"));
                    reads.setSeqeuncia(rs.getString("sequencia"));

                    listaReads.add(reads);

                }
                return listaReads;
            }
        } catch (SQLException e) {
            System.out.println("===========================================");
            System.out.println("ERRO: " + e.getMessage());
            System.out.println(query);
            System.out.println("===========================================");
        } finally {
            connection.close();
            stmt.close();
        }
        return null;
    }
}
