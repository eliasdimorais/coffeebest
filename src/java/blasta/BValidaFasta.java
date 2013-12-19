/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package blasta;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author bruno
 */
public class BValidaFasta {

    public static boolean validaFasta(File file) throws FileNotFoundException {
        
        try {
            FileReader arq = new FileReader(file);
            BufferedReader lerArq = new BufferedReader(arq);

            String linha;
            String texto = "";

            while ((linha = lerArq.readLine()) != null) {
                
                texto += linha;
            }
            arq.close();

            Pattern pattern = Pattern.compile("\n");
            Matcher matcher = pattern.matcher(texto);

            if (matcher.find()) {
                System.out.println("Find! \n Encontrou");
            } else {
                System.out.println("Not found  \n Não encontrou");
            }

            return false;
        } catch (IOException e) {
            System.err.printf("Erro na abertura do arquivo: %s.\n",
                    e.getMessage());
        }

        System.out.println();
        return false;
    }
    
    public static void main(String[] args) throws FileNotFoundException {
        File file = new File("/home/servidorp206/REMODELAGEM-COFFEEBEST/ecoli.fasta");
        validaFasta(file);
    }
}
