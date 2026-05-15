<%@ page import="java.util.List" %>
<%@ page import="com.sixcar.model.Brand" %>

<%
    List<Brand> brands = (List<Brand>) request.getAttribute("brands");
%>

<h1>Brands</h1>

<%
    if (brands != null) {
        for (Brand b : brands) {
%>

<p>
    <%= b.getName() %> - <%= b.getCountry() %>
</p>

<%
        }
    }
%>