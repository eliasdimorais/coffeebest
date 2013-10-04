/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import blasta.BBlast;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;

/**
 *
 * @author bruno
 */
public class Upload extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String diretorio = request.getServletContext().getContext("/saest3").getRealPath("/");


        HttpSession sessao = request.getSession();
        String caminho = "arquivos/" + sessao.getId();
        String caminhorelativo = caminho + "/upload/";
        String caminhorelativo2 = caminho + "/blast/";
        File dir = new File(diretorio + caminhorelativo);
        File dir2 = new File(diretorio + caminhorelativo2);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        if (!dir2.exists()) {
            dir2.mkdirs();
        }
        String filename = String.valueOf(new Date().getTime());

        try {

            DiskFileUpload fu = new DiskFileUpload();

            fu.setSizeMax(100000000);
            List fileItems = fu.parseRequest(request);

            String sequencia = "";
            String dataset = diretorio + "dataset/";
            //boolean f; //filtro dust
            String v = "";
            String e = "";
            String b = "";

            Iterator itr = fileItems.iterator();
            File fNew = new File(dir, filename);
            while (itr.hasNext()) {
                FileItem fi = (FileItem) itr.next();
                if (!fi.isFormField()) {
                    if (!fi.getName().isEmpty()) {
                        fi.write(fNew);
                    }
                } else {

                    if (fi.getFieldName().equals("v")) {
                        v = fi.getString();
                    }
                    if (fi.getFieldName().equals("e")) {
                        e = fi.getString();
                    }
                    if (fi.getFieldName().equals("b")) {
                        b = fi.getString();
                    }
                    if (fi.getFieldName().equals("dataset")) {
                        dataset += fi.getString();
                    }
                    if (fi.getFieldName().equals("seq_txt")) {
                        sequencia = fi.getString();
                    }
                }
            }
            FileOutputStream fos = null;

            // Gravando no arquivo  
            fos = new FileOutputStream(fNew, true);
            fos.write("\n\n".getBytes());
            fos.write(sequencia.getBytes());

            if (true) {//arquivo fasta confere


                String saida = String.valueOf(new Date().getTime() + ".txt");
                BBlast blast = new BBlast();

                // blast.efetuaBlast(v, b, e, dataset, fNew.getAbsolutePath() , true, dir2.getAbsolutePath() + "/"+ saida + ".txt");

                request.getServletContext().setAttribute("comando", blast.efetuaBlast(v, b, e, dataset, fNew.getAbsolutePath(), true, dir2.getAbsolutePath() + "/" + saida + ".txt"));
                String arquivo = dir2.getAbsolutePath() +"/" + saida;
                request.getServletContext().setAttribute("saida",  arquivo);

                System.out.println(saida);
            }


            RequestDispatcher rd = request.getRequestDispatcher("./blast_result.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            System.out.println("=====================<><>");
            System.out.println(diretorio);
            System.out.println("=====================");
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
