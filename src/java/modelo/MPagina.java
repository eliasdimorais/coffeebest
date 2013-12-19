/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;


import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bruno
 */
public class MPagina {

    private final int pantes = 4;
    private final int pdepois = 4;
    private ArrayList<Integer> numerosPagina;
    private int inicio;
    private int paginaAtual;
    private int fim;
    private int limitby;
    private List<MSequencias> todo;
    
    public MPagina(){}
        
    public MPagina(ArrayList<Integer> numerosPagina, int inicio, int paginaAtual, int fim, int limitby, List<MSequencias> todo) {
        this.numerosPagina = numerosPagina;
        this.inicio = inicio;
        this.paginaAtual = paginaAtual;
        this.fim = fim;
        this.limitby = limitby;
        this.todo = todo;
    }

    public MPagina(List<MSequencias> todo, int limitby) {
        this.numerosPagina = new ArrayList<Integer>();
        if (todo.size() > limitby) {
            int qtdPagina = (int) Math.ceil(todo.size() / (float)limitby);
            System.out.println("+++++++++++++++++++++++++++++++++++++++++");
            System.out.println("+++++++++++++++++++++++++++++++++++++++++");
            System.out.println(qtdPagina);
            System.out.println("+++++++++++++++++++++++++++++++++++++++++");
            System.out.println("+++++++++++++++++++++++++++++++++++++++++");
            for (int i = 0; i < qtdPagina; i++) {
                this.numerosPagina.add(i + 1);
            }
        } else {
            this.numerosPagina.add(1);
        }
        this.limitby = limitby;
        this.paginaAtual = 1;

        if ((paginaAtual + pdepois) > numerosPagina.size()) {
            this.fim = numerosPagina.size() - 1;
        } else {
            this.fim = paginaAtual + pdepois;
        }

        if ((paginaAtual - pantes) < 0) {
            this.inicio = 0;
        } else {
            this.inicio = paginaAtual - pantes;
        }

        this.todo = todo;
    }

    public ArrayList<Integer> getNumerosPagina() {
        return numerosPagina;
    }

    public void setNumerosPagina(ArrayList<Integer> numerosPagina) {
        this.numerosPagina = numerosPagina;
    }

    public int getInicio() {
        return inicio;
    }

    public int getPaginaAtual() {
        return paginaAtual;
    }

    public void setPaginaAtual(int paginaAtual) {
        this.paginaAtual = paginaAtual;

        if ((paginaAtual + pdepois) > numerosPagina.size()) {
            this.fim = numerosPagina.size() - 1;
        } else {
            this.fim = paginaAtual + pdepois;
        }

        if ((paginaAtual - pantes) < 0) {
            this.inicio = 0;
        } else {
            this.inicio = paginaAtual - pantes;
        }
    }

    public int getFim() {
        return fim;
    }

    public int getLimitby() {
        return limitby;
    }

    public void setLimitby(int limitby) {
        this.limitby = limitby;
    }

    public List<MSequencias> getTodo() {
        return todo;
    }

    public List<MSequencias> getPagina(int primeiro, int ultimo) {
        return todo.subList(primeiro, ultimo);
    }

    public List<MSequencias> getPagina() {
        int de = ((paginaAtual-1) * limitby);
        int ate;
        if((de + limitby) > todo.size()){
            ate = todo.size();
        }else{
            ate = (de + limitby);
        }        
        return todo.subList(de, ate);
    }
}
