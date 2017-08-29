<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" href="${path}/resources/dist/img/icon.png">
<title>S:MUZ Admin</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="${path}/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="${path}/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet" href="${path}/resources/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="${path}/resources/dist/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <header class="main-header">
      <a href="${path}/adminHome.do" class="logo">
        <span class="logo-mini"><b>S:</b>M</span>
        <span class="logo-lg"><b>S:MUZ</b> Admin</span>
      </a>
      <nav class="navbar navbar-static-top" role="navigation">
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
          <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
            <li class="dropdown user user-menu">
              <a href="${path}/" class="dropdown-toggle">
                <span class="hidden-xs">로그아웃</span>
              </a>
            </li>
            <li>
              &nbsp;&nbsp;&nbsp;&nbsp;
            </li>
          </ul>
        </div>
      </nav>
    </header>
    <aside class="main-sidebar">
      <section class="sidebar">
        <div class="user-panel">
          <div class="pull-left image">
            <img src="${path}/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
          </div>
          <div class="pull-left info">
            <p>Administrator</p>
            <p>S:MUZ Master</p>
          </div>
        </div>
        <ul class="sidebar-menu">
          <li class="header">S:MUZ 통계 메뉴</li>
          <li class="active treeview">
            <a href="${path}/">
              <i class="fa fa-dashboard"></i><span>관리자 통계</span>
            </a>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-pie-chart"></i>
              <span>세부 통계</span>
              <i class="fa fa-angle-left pull-right"></i>
            </a>
            <ul class="treeview-menu">
              <li><a href="${path}/sub1-1.do"><i class="fa fa-circle-o"></i> 이용자 통계</a></li>
              <li><a href="${path}/sub1-2.do"><i class="fa fa-circle-o"></i> 음악 통계</a></li>
            </ul>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-laptop"></i>
              <span>회원 관리</span>
              <i class="fa fa-angle-left pull-right"></i>
            </a>
            <ul class="treeview-menu">
              <li><a href="${path}/sub2-1.do"><i class="fa fa-circle-o"></i> 이용자 관리</a></li>
              <li><a href="${path}/sub2-2.do"><i class="fa fa-circle-o"></i> 아티스트 관리</a></li>
            </ul>
          </li>
          <li class="treeview">
            <a href="${path}/sub3.do">
              <i class="fa fa-edit"></i> <span>음악 관리</span>
            </a>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-edit"></i> <span>게시물 관리</span>
              <i class="fa fa-angle-left pull-right"></i>
            </a>
            <ul class="treeview-menu">
              <li><a href="${path}/sub4-1.do"><i class="fa fa-circle-o"></i> 리스트 게시물 관리</a></li>
              <li><a href="${path}/sub4-2.do"><i class="fa fa-circle-o"></i> 피드 게시물 관리</a></li>
            </ul>
          </li>
        </ul>
      </section>
    </aside>
    <div class="content-wrapper">
      <section class="content-header">
        <h1>
          S:MUZ 총괄통계
          <small>${date}</small>
        </h1>
      </section>
      <section class="content">
        <div class="row">
          <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
              <span class="info-box-icon bg-aqua"><i class="ion ion-ios-people-outline"></i></span>
              <div class="info-box-content">
                <span class="info-box-text">이용자 수</span>
                <span class="info-box-number">${memberCount}<small>명</small></span>
              </div>
            </div>
          </div>
          <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
              <span class="info-box-icon bg-red"><i class="ion-ios-musical-notes"></i></span>
              <div class="info-box-content">
                <span class="info-box-text">보유 음악</span>
                <span class="info-box-number">${musicCount}<small>곡</small></span>
              </div>
            </div>
          </div>
          <div class="clearfix visible-sm-block"></div>
          <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
              <span class="info-box-icon bg-green"><i class="ion-ios-chatboxes-outline"></i></span>
              <div class="info-box-content">
                <span class="info-box-text">게시글</span>
                <span class="info-box-number">${feed}<small>개</small></span>
              </div>
            </div>
          </div>
          <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
              <span class="info-box-icon bg-yellow"><i class="ion-ios-mic-outline"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">아티스트 수</span>
                <span class="info-box-number">${artist}<small>명</small></span>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="box box-danger">
              <div class="box-header with-border">
                <h3 class="box-title">보유 음악 리스트</h3>
                <div class="box-tools pull-right">
                  <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                  <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
              </div>
              <div class="box-body">
                <div class="table-responsive">
                  <table class="table no-margin">
                    <thead>
                      <tr>
                        <th>Music ID</th>
                        <th>Title</th>
                        <th>Artist</th>
                        <th>Genre</th>
                        <th>Music Color(R,G,B)</th>
                      </tr>
                    </thead>
                    <tbody>
	               <c:forEach var="mu" items="${music.mus}" varStatus="status">
                	 <tr>
                        <td>music${mu.ms_id}</td>
                        <td>${mu.ms_name}</td>
                        <td>${mu.ms_singer}</td>
                        <td>${music.genre[status.index]}</td>
                        <td>
                          <span class="label" style="background:rgb(${mu.ms_color_R},${mu.ms_color_G},${mu.ms_color_B}); font-size:10.5pt;">${mu.ms_color_R},${mu.ms_color_G},${mu.ms_color_B}</span>
                        </td>
                     </tr>
				</c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="box-footer clearfix">
                <a href="${path}/member/music.do" class="btn btn-sm btn-info btn-flat pull-left">View All Music</a>
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="box box-info">
              <div class="box-header with-border">
                <h3 class="box-title">이용자 리스트</h3>
                <div class="box-tools pull-right">
                  <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                  <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
              </div>
              <div class="box-body">
                <div class="table-responsive">
                  <table class="table no-margin">
                    <thead>
                      <tr>
                        <th>Token</th>
                        <th>ID</th>
                        <th>Nick</th>
                        <th>Authority</th>
                        <th>Color(R,G,B)</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="member" items="${member}">
                      <tr>
                        <td>user${member.sm_seq}</td>
                        <td>${member.sm_id}</td>
                        <td>${member.sm_name}</td>
						<td>${member.auth}</td>                        
                        <td>
                          <span class="label" style="background:rgb(${member.sm_user_r},${member.sm_user_g},${member.sm_user_b}); font-size:10.5pt;">${member.sm_user_r},${member.sm_user_g},${member.sm_user_b}</span>
                        </td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="box-footer clearfix">
                <a href="${path}/member/member.do" class="btn btn-sm btn-info btn-flat pull-left">View All List</a>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>

    <footer class="main-footer">
      <strong>Copyright &copy; 2017 S:MUSZ.</strong> All rights reserved.
    </footer>
  </div>
 <script src="${path}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
  <script src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>
  <script src="${path}/resources/plugins/datatables/jquery.dataTables.min.js"></script>
  <script src="${path}/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
  <script src="${path}/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
  <script src="${path}/resources/plugins/fastclick/fastclick.js"></script>
  <script src="${path}/resources/dist/js/app.min.js"></script>
  <script src="${path}/resources/dist/js/demo.js"></script>
</body>
</html>
