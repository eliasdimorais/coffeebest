/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.logica;

import java.io.File;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bruno
 */
public class DownloadBlast implements Logica {

    @Override
    public void executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        File file = (File) request.getServletContext().getAttribute("arquivo");
        System.out.println("Arquivo" + file.getAbsolutePath());
        HttpSession sessao = request.getSession();
        response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
        String relativo = "arquivos/"+ sessao.getId() + "/blast/" + file.getName();
        System.out.println("Relativo" + relativo);
        RequestDispatcher rd = request.getRequestDispatcher(relativo);
        rd.forward(request, response);
    }
}
