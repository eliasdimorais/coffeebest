/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.logica;

import java.io.File;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileItem;

/**
 *
 * @author bruno
 */
public class UploadArquivos implements Logica {

    // Trata arquivos transferidos do cliente para o servidor
    @Override
    public void executa(HttpServletRequest request, HttpServletResponse response) throws Exception {

        final String SERVER_PATH = request.getServletContext().getRealPath("") + File.separator + "arquivos";
        System.out.println("=====================");
        System.out.println(SERVER_PATH);
        System.out.println("=====================");


        try {

            FileUpload fu = new FileUpload();

            fu.setSizeMax(100000000);
            List fileItems = fu.parseRequest(request);

            Iterator itr = fileItems.iterator();
            while (itr.hasNext()) {

                FileItem fi = (FileItem) itr.next();

                if (!fi.isFormField()) {

                    String nome = fi.getName();

                    File fNew = new File(SERVER_PATH, nome);
                    fi.write(fNew);
                }
            }


            RequestDispatcher rd = request.getRequestDispatcher("blast_result.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            System.out.println("=====================");
            System.out.println(SERVER_PATH);
            System.out.println("=====================");
            System.out.println(e.getMessage());
            e.printStackTrace();
        }

    }
}
