<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- .aside -->
<aside class="bg-dark lter aside-md hidden-print" id="nav">          
  <section class="vbox">
    <header class="header bg-primary lter text-center clearfix">
      <div class="btn-group">
        <button type="button" class="btn btn-sm btn-dark btn-icon" title="New project"><i class="fa fa-plus"></i></button>
        <div class="btn-group hidden-nav-xs">
          <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown">
            Switch Project
            <span class="caret"></span>
          </button>
          <ul class="dropdown-menu text-left">
            <li><a href="#">Project</a></li>
            <li><a href="#">Another Project</a></li>
            <li><a href="#">More Projects</a></li>
          </ul>
        </div>
      </div>
    </header>
    <section class="w-f scrollable">
      <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="5px" data-color="#333333">
        
        <!-- nav -->
        <nav class="nav-primary hidden-xs">
          <ul class="nav">
          	<!-- nareshbhai -->
            <li <c:if test="${param.selected == 'dashboard'}">class="active"</c:if>>
              <a href="/dashboard" class="active">
                <i class="fa fa-dashboard icon">
                  <b class="bg-primary"></b>
                </i>
                <span>Dashboard</span>
              </a>
            </li>            
            <li <c:if test="${param.selected == 'customers'}">class="active"</c:if>>
              <a href="/customers">
                <i class="fa fa-file-text icon">
                  <b class="bg-primary"></b>
                </i>
                <span><spring:message code="navtabs.customers"/></span>
              </a>
            </li>
            <li <c:if test="${param.selected == 'taxrate'}">class="active"</c:if>>
              <a href="/taxrate">
                <i class="fa fa-file-text icon">
                  <b class="bg-primary"></b>
                </i>
                <span><spring:message code="navtabs.taxrate"/></span>
              </a>
            </li>
            <li <c:if test="${param.selected == 'products'}">class="active"</c:if>>
              <a href="/products">
                <i class="fa fa-file-text icon">
                  <b class="bg-primary"></b>
                </i>
                <span><spring:message code="navtabs.products"/></span>
              </a>
            </li>
            <li <c:if test="${param.selected == 'companies'}">class="active"</c:if>>
              <a href="/companies">
                <i class="fa fa-file-text icon">
                  <b class="bg-primary"></b>
                </i>
                <span><spring:message code="navtabs.companies"/></span>
              </a>
            </li>
            <li <c:if test="${param.selected == 'invoice'}">class="active"</c:if>>
              <a href="/invoice">
                <i class="fa fa-file-text icon">
                  <b class="bg-primary"></b>
                </i>
                <span><spring:message code="navtabs.invoice"/></span>
              </a>
            </li>
            <li <c:if test="${param.selected == 'users'}">class="active"</c:if>>
              <a href="/users">
                <i class="fa fa-file-text icon">
                  <b class="bg-primary"></b>
                </i>
                <span><spring:message code="navtabs.users"/></span>
              </a>
            </li>
          </ul>
        </nav>
        <!-- / nav -->
      </div>
    </section>
    
    <footer class="footer lt hidden-xs b-t b-dark">
      <div id="chat" class="dropup">
        <section class="dropdown-menu on aside-md m-l-n">
          <section class="panel bg-white">
            <header class="panel-heading b-b b-light">Active chats</header>
            <div class="panel-body animated fadeInRight">
              <p class="text-sm">No active chats.</p>
              <p><a href="#" class="btn btn-sm btn-default">Start a chat</a></p>
            </div>
          </section>
        </section>
      </div>
      <div id="invite" class="dropup">                
        <section class="dropdown-menu on aside-md m-l-n">
          <section class="panel bg-white">
            <header class="panel-heading b-b b-light">
              John <i class="fa fa-circle text-success"></i>
            </header>
            <div class="panel-body animated fadeInRight">
              <p class="text-sm">No contacts in your lists.</p>
              <p><a href="#" class="btn btn-sm btn-facebook"><i class="fa fa-fw fa-facebook"></i> Invite from Facebook</a></p>
            </div>
          </section>
        </section>
      </div>
      <a href="#nav" data-toggle="class:nav-xs" class="pull-right btn btn-sm btn-dark btn-icon">
        <i class="fa fa-angle-left text"></i>
        <i class="fa fa-angle-right text-active"></i>
      </a>
      <div class="btn-group hidden-nav-xs">
        <button type="button" title="Chats" class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown" data-target="#chat"><i class="fa fa-comment-o"></i></button>
        <button type="button" title="Contacts" class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown" data-target="#invite"><i class="fa fa-facebook"></i></button>
      </div>
    </footer>
  </section>
</aside>
<!-- /.aside -->