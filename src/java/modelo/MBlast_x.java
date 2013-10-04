/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author bruno
 */
public class MBlast_x extends MBlast {

    private MPlantcyc subject;

    
    private int frames;
    private int positives;

    public int getFrames() {
        return frames;
    }

    public void setFrames(int frames) {
        this.frames = frames;
    }

    public int getPositives() {
        return positives;
    }

    public void setPositives(int positives) {
        this.positives = positives;
    }
    public MPlantcyc getSubject() {
        return subject;
    }

    public void setSubject(MPlantcyc subject) {
        this.subject = subject;
    }
    
}
