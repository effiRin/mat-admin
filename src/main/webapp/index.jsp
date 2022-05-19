<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<section class="content">
  <div class="container-fluid">
    
    <div class="row">
      <div class="col-lg-3 col-6">
        
        <div class="small-box bg-info">
          <div class="inner">
            <h3>150</h3>
            <p>New Orders</p>
          </div>
          <div class="icon">
            <i class="ion ion-bag"></i>
          </div>
          <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
      </div>
      
      <div class="col-lg-3 col-6">
        
        <div class="small-box bg-success">
          <div class="inner">
            <h3>53<sup style="font-size: 20px">%</sup></h3>
            <p>Bounce Rate</p>
          </div>
          <div class="icon">
            <i class="ion ion-stats-bars"></i>
          </div>
          <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
      </div>
      
      <div class="col-lg-3 col-6">
        
        <div class="small-box bg-warning">
          <div class="inner">
            <h3>44</h3>
            <p>User Registrations</p>
          </div>
          <div class="icon">
            <i class="ion ion-person-add"></i>
          </div>
          <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
      </div>
      
      <div class="col-lg-3 col-6">
        
        <div class="small-box bg-danger">
          <div class="inner">
            <h3>65</h3>
            <p>Unique Visitors</p>
          </div>
          <div class="icon">
            <i class="ion ion-pie-graph"></i>
          </div>
          <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
      </div>
    
    </div>
    
    
    <div class="row">
      
      <section class="col-lg-7 connectedSortable">
        
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">
              <i class="fas fa-chart-pie mr-1"></i>
              Sales
            </h3>
          </div>
          <div class="card-body">
            <div class="tab-content p-0">
              <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;">
                <div class="bar-chart-allergy">
                  <canvas id="myChart" width="400" height="400"></canvas>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        
       
        
        
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">
              <i class="ion ion-clipboard mr-1"></i>
              To Do List
            </h3>
            <div class="card-tools">
              <ul class="pagination pagination-sm">
                <li class="page-item"><a href="#" class="page-link">&laquo;</a></li>
                <li class="page-item"><a href="#" class="page-link">1</a></li>
                <li class="page-item"><a href="#" class="page-link">2</a></li>
                <li class="page-item"><a href="#" class="page-link">3</a></li>
                <li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
              </ul>
            </div>
          </div>
          
          <div class="card-body">
            <ul class="todo-list" data-widget="todo-list">
              <li>

<span class="handle">
<i class="fas fa-ellipsis-v"></i>
<i class="fas fa-ellipsis-v"></i>
</span>
                
                <div class="icheck-primary d-inline ml-2">
                  <input type="checkbox" value="" name="todo1" id="todoCheck1">
                  <label for="todoCheck1"></label>
                </div>
                
                <span class="text">Design a nice theme</span>
                
                <small class="badge badge-danger"><i class="far fa-clock"></i> 2 mins</small>
                
                <div class="tools">
                  <i class="fas fa-edit"></i>
                  <i class="fas fa-trash-o"></i>
                </div>
              </li>
              <li>
<span class="handle">
<i class="fas fa-ellipsis-v"></i>
<i class="fas fa-ellipsis-v"></i>
</span>
                <div class="icheck-primary d-inline ml-2">
                  <input type="checkbox" value="" name="todo2" id="todoCheck2" checked>
                  <label for="todoCheck2"></label>
                </div>
                <span class="text">Make the theme responsive</span>
                <small class="badge badge-info"><i class="far fa-clock"></i> 4 hours</small>
                <div class="tools">
                  <i class="fas fa-edit"></i>
                  <i class="fas fa-trash-o"></i>
                </div>
              </li>
              <li>
<span class="handle">
<i class="fas fa-ellipsis-v"></i>
<i class="fas fa-ellipsis-v"></i>
</span>
                <div class="icheck-primary d-inline ml-2">
                  <input type="checkbox" value="" name="todo3" id="todoCheck3">
                  <label for="todoCheck3"></label>
                </div>
                <span class="text">Let theme shine like a star</span>
                <small class="badge badge-warning"><i class="far fa-clock"></i> 1 day</small>
                <div class="tools">
                  <i class="fas fa-edit"></i>
                  <i class="fas fa-trash-o"></i>
                </div>
              </li>
              <li>
              <span class="handle">
              <i class="fas fa-ellipsis-v"></i>
              <i class="fas fa-ellipsis-v"></i>
              </span>
                <div class="icheck-primary d-inline ml-2">
                  <input type="checkbox" value="" name="todo4" id="todoCheck4">
                  <label for="todoCheck4"></label>
                </div>
                <span class="text">Let theme shine like a star</span>
                <small class="badge badge-success"><i class="far fa-clock"></i> 3 days</small>
                <div class="tools">
                  <i class="fas fa-edit"></i>
                  <i class="fas fa-trash-o"></i>
                </div>
              </li>
              <li>
              <span class="handle">
              <i class="fas fa-ellipsis-v"></i>
              <i class="fas fa-ellipsis-v"></i>
              </span>
                <div class="icheck-primary d-inline ml-2">
                  <input type="checkbox" value="" name="todo5" id="todoCheck5">
                  <label for="todoCheck5"></label>
                </div>
                <span class="text">Check your messages and notifications</span>
                <small class="badge badge-primary"><i class="far fa-clock"></i> 1 week</small>
                <div class="tools">
                  <i class="fas fa-edit"></i>
                  <i class="fas fa-trash-o"></i>
                </div>
              </li>
              <li>
              <span class="handle">
              <i class="fas fa-ellipsis-v"></i>
              <i class="fas fa-ellipsis-v"></i>
              </span>
                <div class="icheck-primary d-inline ml-2">
                  <input type="checkbox" value="" name="todo6" id="todoCheck6">
                  <label for="todoCheck6"></label>
                </div>
                <span class="text">Let theme shine like a star</span>
                <small class="badge badge-secondary"><i class="far fa-clock"></i> 1 month</small>
                <div class="tools">
                  <i class="fas fa-edit"></i>
                  <i class="fas fa-trash-o"></i>
                </div>
              </li>
            </ul>
          </div>
          
          <div class="card-footer clearfix">
            <button type="button" class="btn btn-primary float-right"><i class="fas fa-plus"></i> Add item</button>
          </div>
        </div>
      
      </section>
      
      
      <section class="col-lg-5 connectedSortable">
        
        <div class="card bg-gradient-primary">
          <div class="card-header border-0">
            <h3 class="card-title">
              월간 회원가입자수
            </h3>
          </div>
          <div class="card-body">
            <svg width="300"  height="200"></svg>
          </div>
        </div>
        
        
        <div class="card bg-gradient-info">
          <div class="card-header border-0">
            <h3 class="card-title">
              <i class="fas fa-th mr-1"></i>
              Sales Graph
            </h3>
            <div class="card-tools">
              <button type="button" class="btn bg-info btn-sm" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
              </button>
              <button type="button" class="btn bg-info btn-sm" data-card-widget="remove">
                <i class="fas fa-times"></i>
              </button>
            </div>
          </div>
          <div class="card-body">
            <canvas class="chart" id="line-chart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
          </div>
          
          <div class="card-footer bg-transparent">
            <div class="row">
              <div class="col-4 text-center">
                <input type="text" class="knob" data-readonly="true" value="20" data-width="60" data-height="60" data-fgColor="#39CCCC">
                <div class="text-white">Mail-Orders</div>
              </div>
              
              <div class="col-4 text-center">
                <input type="text" class="knob" data-readonly="true" value="50" data-width="60" data-height="60" data-fgColor="#39CCCC">
                <div class="text-white">Online</div>
              </div>
              
              <div class="col-4 text-center">
                <input type="text" class="knob" data-readonly="true" value="30" data-width="60" data-height="60" data-fgColor="#39CCCC">
                <div class="text-white">In-Store</div>
              </div>
            </div>
          </div>
        </div>
        
        
        <div class="card bg-gradient-light">
          
  
          <div id="my-chart">
<%--           <svg width="300"  height="200"></svg>--%>
          </div>
          
        </div>
       
      </section>
    </div>
  </div>
</section>
<%--<script src="http://106.241.252.54:8085/d3/dist/d3.min.js"></script>--%>
<%--<script type="text/javascript"  src="/resources/js/barChart.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<script>
  const ctx = document.getElementById('myChart').getContext('2d');
  const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
      datasets: [{
        label: '# of Votes',
        data: [12, 19, 3, 5, 2, 3],
        backgroundColor: [
          'rgba(255, 99, 132, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)'
        ],
        borderColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
  
  
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>