/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package exportacao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import modelo.MSequencias;

/**
 *
 * @author bruno
 */
public interface Exportacao {
    public File Exporta(List<MSequencias> sequencias, String diretorio);
   //public File ExportaPagina(List<MSequencias> sequencias, String diretorio);
    
}
