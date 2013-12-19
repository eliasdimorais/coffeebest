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
public class ExportaXml implements Exportacao{
    
    @Override
    public File Exporta(List<MSequencias> sequencias, String diretorio) {
        Long filename = new Date().getTime();
        File file = new File(diretorio + filename + ".xml");
        FileOutputStream fos = null;
        try {
            // Gravando no arquivo  
            fos = new FileOutputStream(file);
            fos.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>".getBytes());
            fos.write("\n<fasta_file>".getBytes());
            for (MSequencias seq : sequencias) {                
                fos.write("\n<sequence_data>".getBytes());
                fos.write("\n\t<id>".getBytes());
                fos.write(seq.getId().getBytes());
                fos.write("</id>".getBytes());
                
                fos.write("\n\t<name>".getBytes());
                fos.write(seq.getQuery().getBytes());
                fos.write("</name>".getBytes());
                
                fos.write("\n\t<dataset> ".getBytes());
                fos.write(seq.getDataset().getBytes());
                fos.write("</dataset>".getBytes());
                
                fos.write("\n\t<sequence>\n".getBytes());
                fos.write(seq.getSequences().getBytes());
                fos.write("\n\t</sequence>".getBytes());
           
                fos.write("\n</sequence_data>\n".getBytes());
            }
            fos.write("\n</fasta_file>".getBytes());
            fos.close();

            return file;
        } catch (Exception ee) {
            ee.printStackTrace();
        }
        return file;
    }
}
