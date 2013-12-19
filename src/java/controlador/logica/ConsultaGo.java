/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.logica;

import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.MPagina;

/**
 *
 * @author bruno
 */
public class ConsultaGo implements Logica {

    @Override
    public void executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String namespace = request.getParameter("namespace");
        String termo = request.getParameter("termo");

        dao.CSequencias pesquisa = new dao.CSequencias();
        List<modelo.MSequencias> listSequencia = pesquisa.getByGo(termo, namespace);

        modelo.MPagina paginacao = new MPagina(listSequencia, Integer.parseInt(request.getParameter("limitby")));

        request.setAttribute("paginacao", paginacao);

        RequestDispatcher rd = request.getRequestDispatcher("./pagina.jsp");
        //RequestDispatcher rd = request.getRequestDispatcher(response.encodeRedirectURL("./pagina.jsp"));
        //System.out.println("===================================================");
        //System.out.println(request.getRequestDispatcher("./pagina.jsp"));
        //System.out.println(session.getId());
        //System.out.println(response.encodeRedirectURL("./pagina.jsp"));
        //System.out.println("===================================================");
        rd.forward(request, response);
    }
}
