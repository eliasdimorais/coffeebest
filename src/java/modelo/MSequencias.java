/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author bruno
 */
public class MSequencias {
    private String pk_sequencia;
    private String header;
    private String sequencia;
    private String length;
    private String fk_dataset;
    private String dataset;

    public String getPk_sequencia() {
        return pk_sequencia;
    }

    public void setPk_sequencia(String pk_sequencia) {
        this.pk_sequencia = pk_sequencia;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getSequencia() {
        return sequencia;
    }

    public void setSequencia(String sequencia) {
        this.sequencia = sequencia;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public String getFk_dataset() {
        return fk_dataset;
    }

    public void setFk_dataset(String fk_dataset) {
        this.fk_dataset = fk_dataset;
    }

    public String getDataset() {
        return dataset;
    }

    public void setDataset(String dataset) {
        this.dataset = dataset;
    }

   
}
