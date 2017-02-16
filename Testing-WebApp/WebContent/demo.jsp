<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>

     <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     <sql:setDataSource dataSource="jdbc/SampleDB" />
     
     <c:set var="name" value="${param.name}" />
     <c:set var="release" value="${param.release}" />
            
     <!-- 'Submit' action -->
          
     <c:if test="${param.action == 'Submit'}">
          <c:choose>
         <c:when test="${not empty name && release}">
            <sql:update>
		    INSERT INTO movies.movie_collection(name_m, release_m) VALUES(?, ?)
	            <sql:param value="${name_m}"/>
		    	<sql:param value="${release_m}"/>
	       </sql:update>
            	<c:set var="msg" value="Movie(s) added" />
	       		<c:set var="name" value="" />
	       		<c:set var="release" value="" />		
          	</c:when>
            <c:otherwise>
            	<c:set var="msg" value="Something went wrong" />
            </c:otherwise>
          </c:choose>
        </c:if>
        
     <!-- 'Delete' action -->
        
     <c:if test="${param.action == 'Delete'}">
     		<c:choose>
         <c:when test="${not empty name && release}">
     		<sql:update>
     	DELETE movies.movie_collection(name_m, release_m) VALUES(?,?)
     			<sql:param value="${name}"/>
		    	<sql:param value="${release}"/>
		    </sql:update>
            	<c:set var="msg" value="Movie(s) deleted" />
	       		<c:set var="name" value="" />
	       		<c:set var="release" value="" />
	       	</c:when>
            <c:otherwise>
            	<c:set var="msg" value="Something went wrong" />
            </c:otherwise>
          </c:choose>	
     	</c:if>
     	
     	<!-- Main -->

        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
        <html>
        <head>
        <title>MOVIES DATABASE</title>
         	<link rel="stylesheet" href="css/kube.min.css" />
    		<link rel="stylesheet" href="css/font-awesome.min.css" />
    		<link rel="stylesheet" href="css/custom.min.css" />
        </head>
        <body>

		<div class="container">
        <h1>Movies Database</h1>
         </div>
 
        <table border='1'>
          <tr><th>Collection ID</th><th>Title</th><th>Release Year</th>

       <sql:query var="qryPosts" >
                  SELECT movie_id, movie_name, movie_release FROM movies.movie_collection
          </sql:query>

       <c:forEach var="row" items="${qryPosts.rows}">
	        <tr>
               <td><c:out value="${row.movie_id}" /></td>
                  <td><c:out value="${row.movie_name}" /></td>
                  <td><c:out value="${row.movie_release}" /></td>
                  <td><input type='button' name='action' value='Delete'></td>
	        </tr>
          </c:forEach>
        </table>
       
        
        <!-- Drop-down list -->
        
         <form class="group top-nav" action="demo.jsp" method="post">
         <sql:query var="qryPosts2" >
                  SELECT name_m, release_m FROM movies.movie_database
          </sql:query>
          <table>
            <tr>
              <td>Title:</td>
              <td><select name="name">
   				 <c:forEach var="name" items="${qryPosts2.rows}">
        			<option>${name.name_m}</option>
    			</c:forEach>
    			</select>
            </tr>
            <tr>
              <td>Release Year:</td>
           		<td><select name="release">
   				 <c:forEach var="release" items="${qryPosts2.rows}">
        			<option>${release.release_m}</option>
    			</c:forEach>
				</select>
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