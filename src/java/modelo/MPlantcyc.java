/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author bruno
 */
public class MPlantcyc extends MSequencias{
    
    private String plantcyc;
    private String funcao;
    private String gene;
    private int pk_dataset_plantcyc;
    private String plantcyc_dataset;

    public String getPlantcyc() {
        return plantcyc;
    }

    public void setPlantcyc(String plantcyc) {
        this.plantcyc = plantcyc;
    }

    public String getFuncao() {
        return funcao;
    }

    public void setFuncao(String funcao) {
        this.funcao = funcao;
    }

    public String getGene() {
        return gene;
    }

    public void setGene(String gene) {
        this.gene = gene;
    }

    public int getPk_dataset_plantcyc() {
        return pk_dataset_plantcyc;
    }

    public void setPk_dataset_plantcyc(int pk_dataset_plantcyc) {
        this.pk_dataset_plantcyc = pk_dataset_plantcyc;
    }

    public String getPlantcyc_dataset() {
        return plantcyc_dataset;
    }

    public void setPlantcyc_dataset(String plantcyc_dataset) {
        this.plantcyc_dataset = plantcyc_dataset;
    }

    
}
