/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package exportacao;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;
import modelo.MSequencias;

/**
 *
 * @author bruno
 */
public class ExportaCsv implements Exportacao {

    @Override
    public File Exporta(List<MSequencias> sequencias, String diretorio) {
        Long filename = new Date().getTime();
        File file = new File(diretorio + filename + ".csv");
        FileOutputStream fos = null;
        try {
            // Gravando no arquivo  
            fos = new FileOutputStream(file);
            fos.write("ID;".getBytes());
            fos.write("name;".getBytes());
            fos.write("length;".getBytes());
            fos.write("dataset;".getBytes());
            fos.write("sequence\n".getBytes());
            for (MSequencias seq : sequencias) {
                fos.write(seq.getPk_sequencia().getBytes());
                fos.write(";".getBytes());
                fos.write(seq.getHeader().getBytes());
                fos.write(";".getBytes());
                fos.write(seq.getLength().getBytes());
                fos.write(";".getBytes());
                fos.write(seq.getDataset().getBytes());
                fos.write(";".getBytes());
                fos.write(seq.getSequencia().getBytes());
                fos.write("\n".getBytes());
            }
            fos.close();

            return file;
        } catch (Exception ee) {
            ee.printStackTrace();
        }
        return file;
    }
}
