<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<header class="bg-dark dk header navbar navbar-fixed-top-xs">
      <div class="navbar-header aside-md">
        <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
          <i class="fa fa-bars"></i>
        </a>
        <a href="#" class="navbar-brand" data-toggle="fullscreen"><img src="/static/theme/images/logo.png" class="m-r-sm">EliteInvoice</a>
        <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".nav-user">
          <i class="fa fa-cog"></i>
        </a>
      </div>
      <%-- <form method="POST" action="/setSessionLanguageCode">
		<input type="hidden" name="redirectUrl" value="${requestScope['javax.servlet.forward.request_uri']}"/>
		<select name="sessionLanguageCode" id="sessionLanguageCode" onchange="this.form.submit();">
			<option value="en_GB" ${cookie['PLASTOCARTADMIN_LANGUAGECODE'].value == 'en_GB' ? 'selected=selected' : ''}>English</option>
			<option value="hi_IN" ${cookie['PLASTOCARTADMIN_LANGUAGECODE'].value == 'hi_IN' ? 'selected=selected' : ''}>हिन्दी</option>
		</select>
	  </form> --%>
      <ul class="nav navbar-nav hidden-xs">
        <li class="dropdown">
          <section class="dropdown-menu aside-xl on animated fadeInLeft no-borders lt">
            <div class="wrapper lter m-t-n-xs">
              <a href="#" class="thumb pull-left m-r">
                <img src="/static/theme/images/avatar.jpg" class="img-circle">
              </a>
              <div class="clear">
                <a href="#"><span class="text-white font-bold">@Mike Mcalidek</a></span>
                <small class="block">Art Director</small>
                <a href="#" class="btn btn-xs btn-success m-t-xs">Upgrade</a>
              </div>
            </div>
            <div class="row m-l-none m-r-none m-b-n-xs text-center">
              <div class="col-xs-4">
                <div class="padder-v">
                  <span class="m-b-xs h4 block text-white">245</span>
                  <small class="text-muted">Followers</small>
                </div>
              </div>
              <div class="col-xs-4 dk">
                <div class="padder-v">
                  <span class="m-b-xs h4 block text-white">55</span>
                  <small class="text-muted">Likes</small>
                </div>
              </div>
              <div class="col-xs-4">
                <div class="padder-v">
                  <span class="m-b-xs h4 block text-white">2,035</span>
                  <small class="text-muted">Photos</small>
                </div>
              </div>
            </div>
          </section>
        </li>
      </ul>      
      <ul class="nav navbar-nav navbar-right m-n hidden-xs nav-user">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="thumb-sm avatar pull-left">
              <img src="/static/theme/images/avatar.jpg">
            </span>
            ${sessionScope.username}<b class="caret"></b>
          </a>
          <ul class="dropdown-menu animated fadeInRight">            
            <li>             
              <a href="/logout" data-toggle="ajaxModal"><spring:message code="header.logout"/></a>
            </li>
          </ul>
        </li>
      </ul>
</header>