/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author bruno
 */
public class MReads {
    private int pk_read;
    private int fk_sequencia;
    private String identificacao;
    private String seqeuncia;
    private int pk_dataset_read;
    private String dataset_identificacao;
    private String dataset_nome;

    public int getPk_read() {
        return pk_read;
    }

    public void setPk_read(int pk_read) {
        this.pk_read = pk_read;
    }

    public int getFk_sequencia() {
        return fk_sequencia;
    }

    public void setFk_sequencia(int fk_sequencia) {
        this.fk_sequencia = fk_sequencia;
    }

    public String getIdentificacao() {
        return identificacao;
    }

    public void setIdentificacao(String identificacao) {
        this.identificacao = identificacao;
    }

    public String getSeqeuncia() {
        return seqeuncia;
    }

    public void setSeqeuncia(String seqeuncia) {
        this.seqeuncia = seqeuncia;
    }

    public int getPk_dataset_read() {
        return pk_dataset_read;
    }

    public void setPk_dataset_read(int pk_dataset_read) {
        this.pk_dataset_read = pk_dataset_read;
    }

    public String getDataset_identificacao() {
        return dataset_identificacao;
    }

    public void setDataset_identificacao(String dataset_identificacao) {
        this.dataset_identificacao = dataset_identificacao;
    }

    public String getDataset_nome() {
        return dataset_nome;
    }

    public void setDataset_nome(String dataset_nome) {
        this.dataset_nome = dataset_nome;
    }
    
}
