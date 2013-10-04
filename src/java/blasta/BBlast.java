/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package blasta;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 *
 * @author bruno
 */
public class BBlast {

    public String efetuaBlast(String v, String b, String e, String d, String i, boolean f, String saida) throws IOException, InterruptedException {
        String comando = "blastall -p blastn ";
        if (f) {
            comando += " -FD ";
        }
        comando += " -e " + e;
        comando += " -v " + v;
        comando += " -b " + b;
        comando += " -d " + d;
        comando += " -i " + i;

        return comando;

    }
}
