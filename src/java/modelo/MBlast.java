/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author bruno
 */
public class MBlast {
    private String sbj_name;
    private String sbj_dataset;
    private String sbj_length;
    private int identity;
    private int score;
    private String strand_qry;
    private String strand_sbj;
    private int seq;

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getSbj_name() {
        return sbj_name;
    }

    public void setSbj_name(String sbj_name) {
        this.sbj_name = sbj_name;
    }

    public String getSbj_dataset() {
        return sbj_dataset;
    }

    public void setSbj_dataset(String sbj_dataset) {
        this.sbj_dataset = sbj_dataset;
    }

    public String getSbj_length() {
        return sbj_length;
    }

    public void setSbj_length(String sbj_length) {
        this.sbj_length = sbj_length;
    }

    public int getIdentity() {
        return identity;
    }

    public void setIdentity(int identity) {
        this.identity = identity;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getStrand_qry() {
        return strand_qry;
    }

    public void setStrand_qry(String strand_qry) {
        this.strand_qry = strand_qry;
    }

    public String getStrand_sbj() {
        return strand_sbj;
    }

    public void setStrand_sbj(String strand_sbj) {
        this.strand_sbj = strand_sbj;
    }
}
