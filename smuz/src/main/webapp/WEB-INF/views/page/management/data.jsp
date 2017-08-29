<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>S:MUZ Admin</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="shortcut icon" href="${path}/resources/dist/img/icon.png">
<link rel="stylesheet" href="${path}/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="${path}/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet" href="${path}/resources/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="${path}/resources/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="${path}/resources/plugins/morris/morris.css">
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
          <li class="treeview">
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
          <li class="treeview active">
            <a href="#">
              <i class="fa fa-laptop"></i>
              <span>회원 관리</span>
              <i class="fa fa-angle-left pull-right"></i>
            </a>
            <ul class="treeview-menu">
              <li class="active"><a href="${path}/sub2-1.do"><i class="fa fa-circle-o"></i> 이용자 관리</a></li>
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
          회원 관리
          <small>이용자 총 ${memberCount} 명</small>
        </h1>
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-xs-12">
            <div class="box">
              <div class="box-header">
                <h3 class="box-title">회원 정보 관리</h3>
              </div>
              <!-- /.box-header -->
              <div class="box-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                      <th>Token</th>
                      <th>ID</th>
                      <th>Authority</th>
                      <th>Color(R,G,B)</th>
                      <th>Date</th>
                      <th>Modify</th>
                      <th>Withdrawal</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="user" items="${member}">
                    <tr>
                      <td>user${user.sm_seq}</td>
                      <td>${user.sm_id}</td>
                      <td id="auth">${user.auth}</td>
                      <td>
                        <span class="label" style="background:rgb(${user.sm_user_r},${user.sm_user_g},${user.sm_user_b}); font-size:10.5pt;">${user.sm_user_r},${user.sm_user_g},${user.sm_user_b}</span>
                      </td>
                      <td>${user.sm_date}</td>
                      <td>
                      <a href="${path}/member/auth.do?uid=${user.sm_seq}&auth=${user.sm_rating}">권한 부여</a> | 
                      <a href="${path}/member/authd.do?uid=${user.sm_seq}&auth=${user.sm_rating}">권한 삭제</a>
                      </td>
                      <td>
                      <a href="${path}/member/remove.do?uid=${user.sm_seq}">회원 삭제</a>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                  <tfoot>
                    <tr>
                      <th>Token</th>
                      <th>ID</th>
                      <th>Authority</th>
                      <th>Color(R,G,B)</th>
                      <th>Date</th>
                      <th>Modify</th>
                      <th>Withdrawal</th>
                    </tr>
                  </tfoot>
                </table>
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
  <script>
    $(function() {
      $("#example1").DataTable();
    });
  </script>
</body>
</html>