/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package exportacao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import modelo.MSequencias;

/**
 *
 * @author bruno
 */
public class ExportaFasta implements Exportacao {

    @Override
    public File Exporta(List<MSequencias> sequencias, String diretorio) {

        Long filename = new Date().getTime();
        File file = new File(diretorio + filename + ".fasta");
        FileOutputStream fos = null;
        try {
            // Gravando no arquivo  
            fos = new FileOutputStream(file);
            for (MSequencias seq : sequencias) {
                fos.write(">".getBytes());
                fos.write(" ID: ".getBytes());
                fos.write(seq.getPk_sequencia().getBytes());
                fos.write(" | NAME: ".getBytes());
                fos.write(seq.getHeader().getBytes());
                fos.write("\n".getBytes());
                fos.write(seq.getSequencia().getBytes());
                fos.write("\n\n".getBytes());
            }
            fos.close();

            return file;
        } catch (Exception ee) {
            ee.printStackTrace();
        }
        return file;
    }

   
}
