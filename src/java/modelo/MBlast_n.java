/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author bruno
 */
public class MBlast_n extends MBlast {

    private String q_strand;
    private String s_strand;
    private MSequencias subject;

    public String getQ_strand() {
        return q_strand;
    }

    public void setQ_Sstrand(boolean q_strand) {
        if (q_strand) {
            this.q_strand = "Plus";
        } else {
            this.q_strand = "Minus";
        }

    }

    public String getS_strand() {
        return s_strand;
    }

    public void setS_strand(boolean s_strand) {
        if (s_strand) {
            this.s_strand = "Plus";
        } else {
            this.s_strand = "Minus";
        }
    }
    
    public MSequencias getSubject() {
        return subject;
    }

    public void setSubject(MSequencias subject) {
        this.subject = subject;
    }
}
