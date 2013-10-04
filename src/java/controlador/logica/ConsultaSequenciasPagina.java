/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.logica;

import java.awt.PageAttributes;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.MPagina;

/**
 *
 * @author bruno
 */
public class ConsultaSequenciasPagina implements Logica {

    @Override
    public void executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        modelo.MPagina paginacao = new MPagina();
        String teste = null;
        try {
            paginacao = (modelo.MPagina) request.getServletContext().getAttribute("paginacao");
            teste = (String) request.getAttribute("paginacao");
            
            paginacao.setPaginaAtual(Integer.parseInt(request.getParameter("paraPagina")));

            request.setAttribute("paginacao", paginacao);            
            RequestDispatcher rd = request.getRequestDispatcher("pagina.jsp");
            rd.forward(request, response);
            
        } catch (Exception e) {
            System.out.println("============<");
            System.out.println(teste);
            System.out.println(request.getParameter("paraPagina"));
            System.out.println(paginacao);
            System.out.println(e.toString());
            System.out.println(e.getCause());
            System.out.println("============>");
        }
    }
}
