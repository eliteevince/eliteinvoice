<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en" class="bg-dark">
<head>
  <meta charset="utf-8" />
  <title>Eliteinvoice | Web Application</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 
  <jsp:include page="includes/common_css_js.jsp"/>  
</head>
<body>
  <section id="content" class="m-t-lg wrapper-md animated fadeInUp">    
    <div class="container aside-xxl">
      <a class="navbar-brand block" href="/">Eliteinvoice</a>
      <section class="panel panel-default bg-white m-t-lg">
        <header class="panel-heading text-center">
          <strong><spring:message code="login.title"/></strong>
        </header>
        <c:if test="${not empty param.error}">
			<div class="loginerror"><spring:message code="login.validation.invalid.username.or.password"/></div>
		</c:if>
        <form method="POST" action="<c:url value='j_spring_security_check'/>" class="panel-body wrapper-lg">
          <div class="form-group">
            <spring:message code="common.label.username" var="loginLabelUsername"/>
            <label class="control-label">${loginLabelUsername}</label>            
			<input type="text" id="username" name="username" class="form-control input-lg" placeholder="${loginLabelUsername}"/>
          </div>
          <div class="form-group">
            <spring:message code="common.label.password" var="loginLabelPassword"/>
            <label class="control-label">${loginLabelPassword}</label>
            <input type="password" id="password" name="password" class="form-control input-lg" placeholder="${loginLabelPassword}"/>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox"> Keep me logged in
            </label>
          </div>
          <a href="#" class="pull-right m-t-xs"><small>Forgot password?</small></a>
          <button type="submit" class="btn btn-primary">Sign in</button>          
        </form>
      </section>
    </div>
  </section>
  <!-- footer -->
  <footer id="footer">
    <div class="text-center padder">
      <p>
        <small>Eliteinvoice by EliteEvince Technology<br>&copy; 2015</small>
      </p>
    </div>
  </footer>
</body>
</html>