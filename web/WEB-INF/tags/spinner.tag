<%-- 
    Document   : Spinner
    Created on : 25/03/2013, 09:34:11
    Author     : bruno
--%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@ attribute name="id" required="true" %>
        
<%-- any content can be specified here e.g.: --%>

olá:
<input type="text" id="${id}" name="${id}" />
<script type="text/javascript">
    $("#${id}").spinner({min: 0, max: 99, numberFormat: "", step: 0.1});
</script>


