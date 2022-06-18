<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0">Dashboard</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active">Dashboard v1</li>
        </ol>
      </div>
    </div>
  </div>
</div>
<section class="content">
  <div class="container-fluid">
    
    <div class="row">
      
      <section class="col-lg-6 connectedSortable">
        
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">
              회원알레르기 통계
            </h3>
          </div>
          <div class="card-body">
            <div class="tab-content p-0">
              <div class="chart tab-pane active" style="position: relative; height: 600px;">
                <div class="bar-chart-allergy all-doug">
                  <canvas id="doughnutChart" width="600" height="600"></canvas>
                
                </div>
              </div>
            </div>
          </div>
        </div>
        
        
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">
              월간 회원가입자수
            </h3>
          </div>
          <div class="card-body">
            <div class="tab-content p-0">
              <div class="chart tab-pane active" style="position: relative; height: 600px;">
                <div class="bar-chart-allergy">
                  <canvas id="lineChart" width="600" height="600"></canvas>
                
                </div>
              </div>
            </div>
          </div>
        </div>
      
      </section>
      
      
      <section class="col-lg-6 connectedSortable">
        
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">
              월간 활동 사용자
            </h3>
          </div>
          <div class="card-body">
            <div class="tab-content p-0">
              <div class="chart tab-pane active" style="position: relative; height: 600px;">
                <div class="bar-chart-allergy">
                  <canvas id="myChart" width="600" height="600"></canvas>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">
              미답변 문의글 갯수
            </h3>
          </div>
          <div class="card-body table-responsive p-0">
            <table class="table table-hover text-nowrap">
              <thead>
              <tr>
                <th>제목</th>
                <th>내용</th>
                <th>등록ID</th>
                <th>등록일</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${list}" var="inquiry">
                <tr>
                  <td><c:out value="${inquiry.title}"/></td>
                  <td><a href="/inquiry/read/${inquiry.inquirySeq}"><c:out value="${inquiry.content}"/></a></td>
                  <td><c:out value="${inquiry.id}"/></td>
                  <td><c:out value="${inquiry.inquiryDate}"/></td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      
      
      </section>
    </div>
  </div>
</section>
<%--<script src="http://106.241.252.54:8085/d3/dist/d3.min.js"></script>--%>
<script src="/resources/js/Utils.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<script>
  const month = months({count: 12});

  const doughut = document.getElementById("doughnutChart");
  const doughnutChart = new Chart(doughut, {
    type: 'doughnut',
    data: {
      labels: [ '우유','새우', '조개','갑각류','아황산' ,'땅콩'],
      datasets: [{
        data: [37, 5, 16, 16,3, 17],
        backgroundColor: [
          'rgb(255, 99, 132)',
          'rgb(255,051,051)',
          'rgb(54, 162, 235)',
          'rgb(255, 205, 86)',
          'rgb(204 ,153 ,255)',
          'rgb(153,102,000)'
        ],
        borderColor: [
          'rgb(255, 99, 132)',
          'rgb(255,051,051)',
          'rgb(54, 162, 235)',
          'rgb(255, 205, 86)',
          'rgb(204 ,153 ,255)',
          'rgb(153,102,000)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      responsive: true,

    }
  });


  const ctx = document.getElementById('myChart');
  const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: month,
      datasets: [{
        label: '월별 회원가입자 수',
        data: [  10, 3, 30, 23, 10, 50, 15, 20, 13, 5, 9, 12],
        borderColor: "rgba(255, 201, 14, 1)",
        backgroundColor: "rgba(255, 201, 14, 0.5)",
        fill: false,
      }]
    },
    options: {
      responsive: true,
    }
  });


  const line = document.getElementById('lineChart');
  const lineChart = new Chart(line, {
    type: 'line',
    data:{
      labels:month,
      datasets: [{
        label: '월간 활동 사용자',
        data: [65, 59, 80, 81, 56, 55, 40, 90, 100, 40,70,80],
        fill: false,
        borderColor: 'rgb(75, 192, 192)',
        tension: 0.1
      }]
    }
  });
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>