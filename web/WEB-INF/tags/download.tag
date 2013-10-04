<%-- 
    Document   : download
    Created on : 22/04/2013, 08:01:16
    Author     : bruno
--%>

<%@tag description="taglib download" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>


<%-- any content can be specified here e.g.: --%>
<br/>
<table>
    <tr>
        <td style="padding-right: 10px"><b>Download All: </b></td>
        <td style="padding-right: 15px">
            <form action="controlador" method="POST" target="_blank">
                <input type="text" value="ExportaSequencias" style="display: none" name="logica">
                <input type="text" value="1" style="display: none" name="formato">
                <input type="text" value="t" style="display: none" name="scopo">
                <input type="submit" value="CSV" style="background: none; color: #1c94c4; font-size: medium">
            </form>
        </td>
        <td style="padding-right: 15px">
            <form action="controlador" method="POST" target="_blank">
                <input type="text" value="ExportaSequencias" style="display: none" name="logica">
                <input type="text" value="2" style="display: none" name="formato">
                <input type="text" value="t" style="display: none" name="scopo">
                <input type="submit" value="FASTA" style="background: none; color: #1c94c4; font-size: medium">
            </form>
        </td>
        <td style="padding-right: 15px">
            <form action="controlador" method="POST" target="_blank">
                <input type="text" value="ExportaSequencias" style="display: none" name="logica">
                <input type="text" value="3" style="display: none" name="formato">
                <input type="text" value="t" style="display: none" name="scopo">
                <input type="submit" value="XML" style="background: none; color: #1c94c4; font-size: medium">
            </form>
        </td>

    </tr>
    
       <tr>
           <td style="padding-right: 10px">
              <b> Download Page: </b>
           </td>
        <td style="padding-right: 15px">
            <form action="controlador" method="POST" target="_blank">
                <input type="text" value="ExportaSequencias" style="display: none" name="logica">
                <input type="text" value="1" style="display: none" name="formato">
                <input type="text" value="p" style="display: none" name="scopo">
                <input type="submit" value="CSV" style="background: none; color: #1c94c4; font-size: medium">
            </form>
        </td>
        <td style="padding-right: 15px">
            <form action="controlador" method="POST" target="_blank">
                <input type="text" value="ExportaSequencias" style="display: none" name="logica">
                <input type="text" value="2" style="display: none" name="formato">
                <input type="text" value="p" style="display: none" name="scopo">
                <input type="submit" value="FASTA" style="background: none; color: #1c94c4; font-size: medium">
            </form>
        </td>
        <td style="padding-right: 15px">
            <form action="controlador" method="POST" target="_blank">
                <input type="text" value="ExportaSequencias" style="display: none" name="logica">
                <input type="text" value="3" style="display: none" name="formato">
                <input type="text" value="p" style="display: none" name="scopo">
                <input type="submit" value="XML" style="background: none; color: #1c94c4; font-size: medium">
            </form>
        </td>

    </tr>
</table>