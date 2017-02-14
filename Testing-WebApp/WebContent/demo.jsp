<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>

     <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     <sql:setDataSource dataSource="jdbc/SampleDB" />
     
     <c:set var="name_m" value="${param.name_m}" />
        <c:set var="release_m" value="${param.release_m}" />
            
     <c:if test="${param.action == 'Submit'}">
          <c:choose>
         <c:when test="${not empty name_m}">
            <sql:update>
		    INSERT INTO movies.dvd(name_m, release_m, lead_actor) VALUES(?, ?)
	            <sql:param value="${name_m}"/>
		    <sql:param value="${release_m}"/>
		    <sql:param value="${lead_actor}"/>
	       </sql:update>
            <c:set var="msg" value="Thank you for your contribution." />
	       <c:set var="name_m" value="" />
	       <c:set var="release_m" value="" />		
            </c:when>
            <c:otherwise>
            <c:set var="msg" value="Please add some movies" />
            </c:otherwise>
          </c:choose>
        </c:if>

        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
        <html>
        <head>
        <title>MOVIES DATABASE</title>
        </head>
        <body>

        <h1>Movies Database</h1>
 
        <table border='1'>
          <tr><th>DVD ID</th><th>Title</th><th>Release Year</th><th>Lead Actor</th><th>IMDB Rating</th><th>User Rating</th>

       <sql:query var="qryPosts" >
                  SELECT dvd_id, name_m, release_m, lead_actor, imdb_rating, user_rating FROM movies.dvd
          </sql:query>

       <c:forEach var="row" items="${qryPosts.rows}">
	        <tr>
               <td><c:out value="${row.dvd_id}" /></td>
                  <td><c:out value="${row.name_m}" /></td>
                  <td><c:out value="${row.release_m}" /></td>
                  <td><c:out value="${row.lead_actor}" /></td>
                  <td><c:out value="${row.imdb_rating}" /></td>
                  <td><c:out value="${row.user_rating}" /></td>
	        </tr>
          </c:forEach>
        </table>
        
        <sql:query var="qryPosts2" >
                  SELECT movie_name, movie_release FROM movies.template
          </sql:query>
        
         <form action="demo.jsp" method="post">
          <table>
            <tr>
              <td>Title:</td>
           		<td><select name="name_m">
   				 <c:forEach var="row" items="${qryPosts2.rows}">
        			<option value="${row.movie_name}"></option>
    			</c:forEach>
				</select>
            </tr>
            <tr>
              <td>Release Year:</td>
           		<td><select name="release_m">
   				 <c:forEach var="row" items="${qryPosts2.rows}">
        			<option value="${row.movie_release}"></option>
    			</c:forEach>
				</select>
            </tr>  
            <tr>
              <td>Lead Actor:</td>
           <td><input type='text' name='lead_actor' value="${lead_actor}"></td>
            </tr>  
            <tr>
              <td></td>
           <td><input type='submit' name='action' value='Submit'>
            </tr>
           </table>
        <h3>${msg}</h3>
        </form>

        </body>
        </html>