/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.logica;


import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.MPagina;

/**
 *
 * @author bruno
 */
public class ConsultaSequencias implements Logica {

    @Override
    public void executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
        


        int filtro;
        String dataset;
        float cobertura = (float) 85.0;
        float identidade = (float) 85.0;
        String[] ordenacao = new String[]{};



        filtro = Integer.parseInt(request.getParameter("filtro"));
        dataset = request.getParameter("dataset");

        switch (filtro) {
            case 1:
                cobertura = Float.parseFloat(request.getParameter("cobertura_f1"));
                identidade = Float.parseFloat(request.getParameter("identidade_f1"));
                break;
            case 2:
                cobertura = Float.parseFloat(request.getParameter("cobertura_f2"));
                identidade = Float.parseFloat(request.getParameter("identidade_f2"));
                break;
            default:
        }

        dao.CSequencias pesquisa = new dao.CSequencias();
        List<modelo.MSequencias> listSequencia = pesquisa.getByFilters(filtro, dataset, cobertura, identidade, ordenacao);

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
