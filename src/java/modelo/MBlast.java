/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author bruno
 */
public abstract class MBlast {
    private int pk_blast;
    private int pk_query;   
    private int alignmentLength;
    private int q_start;
    private int q_end;
    private int s_start;
    private int s_end;
    private float identities_pctm;
    private int identities;    
    private float q_cobertura;
    private float s_cobertura;
    private double score;
    private boolean best_hit;

    

    public int getPk_blast() {
        return pk_blast;
    }

    public void setPk_blast(int pk_blast) {
        this.pk_blast = pk_blast;
    }

    public int getPk_query() {
        return pk_query;
    }

    public void setPk_query(int pk_query) {
        this.pk_query = pk_query;
    }    

    public int getAlignmentLength() {
        return alignmentLength;
    }

    public void setAlignmentLength(int alignmentLength) {
        this.alignmentLength = alignmentLength;
    }

    public int getQ_start() {
        return q_start;
    }

    public void setQ_start(int q_start) {
        this.q_start = q_start;
    }

    public int getQ_end() {
        return q_end;
    }

    public void setQ_end(int q_end) {
        this.q_end = q_end;
    }

    public int getS_start() {
        return s_start;
    }

    public void setS_start(int s_start) {
        this.s_start = s_start;
    }

    public int getS_end() {
        return s_end;
    }

    public void setS_end(int s_end) {
        this.s_end = s_end;
    }

    public float getIdentities_pctm() {
        return identities_pctm;
    }

    public void setIdentities_pctm(float identities_pctm) {
        this.identities_pctm = identities_pctm;
    }
    
    public int getIdentities() {
        return identities;
    }

    public void setIdentities(int identities) {
        this.identities = identities;
    }

    public float getQ_cobertura() {
        return q_cobertura;
    }

    public void setQ_cobertura(float q_cobertura) {
        this.q_cobertura = q_cobertura;
    }

    public float getS_cobertura() {
        return s_cobertura;
    }

    public void setS_cobertura(float s_cobertura) {
        this.s_cobertura = s_cobertura;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
    
    public boolean isBest_hit() {
        return best_hit;
    }

    public void setBest_hit(boolean best_hit) {
        this.best_hit = best_hit;
    }
    
}
