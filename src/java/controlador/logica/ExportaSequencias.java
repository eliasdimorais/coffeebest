/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador.logica;

import exportacao.ExportaCsv;
import exportacao.ExportaFasta;
import exportacao.ExportaXml;

import java.io.BufferedInputStream;

import java.io.File;

import java.util.Date;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.MPagina;

/**
 *
 * @author bruno
 */
public class ExportaSequencias implements Logica {

    @Override
    public void executa(HttpServletRequest request, HttpServletResponse response) throws Exception {



        int formato = Integer.parseInt(request.getParameter("formato"));
        String scopo = request.getParameter("scopo");
        MPagina paginacao = (modelo.MPagina) request.getServletContext().getAttribute("paginacao");
        String diretorio = request.getServletContext().getContext("/saest3").getRealPath("/");

        HttpSession sessao = request.getSession();
        String caminhorelativo = "/arquivos/" + sessao.getId() + "/download/";
        File dir = new File(diretorio + caminhorelativo);
        if (!dir.exists()) {
            dir.mkdirs();
        }




        Long filename = new Date().getTime();
        String diretorionome = dir.getAbsolutePath() + "/" + filename;
        File file = null;

        System.out.println("####################################3");
        System.out.println("####################################3");
        System.out.println(diretorio);
        System.out.println(diretorionome);
        System.out.println("####################################3");
        System.out.println("####################################3");

        switch (formato) {
            case 1://CSV
                if (scopo.equals("p")) {
                    file = new ExportaCsv().Exporta(paginacao.getPagina(), diretorionome);
                } else {
                    file = new ExportaCsv().Exporta(paginacao.getTodo(), diretorionome);
                }

                break;
            case 2://FASTA
                if (scopo.equals("p")) {
                    file = new ExportaFasta().Exporta(paginacao.getPagina(), diretorionome);
                } else {
                    file = new ExportaFasta().Exporta(paginacao.getTodo(), diretorionome);
                }

                break;
            case 3://XML
                if (scopo.equals("p")) {
                    file = new ExportaXml().Exporta(paginacao.getPagina(), diretorionome);
                } else {
                    file = new ExportaXml().Exporta(paginacao.getTodo(), diretorionome);
                }

                break;
        }

        System.out.println("-=-=--=-=-=-=-=-=-=-=-=--=-=-=" + dir.getPath() +" 000 " + dir.getName());
        response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());

        RequestDispatcher rd = request.getRequestDispatcher(caminhorelativo +  file.getName());
        rd.forward(request, response);

    }
}
