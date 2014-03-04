<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>..::KCPE::..</title>

    <!-- Bootstrap core CSS -->
    <link href="/staticfiles/css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS for the 'Heroic Features' Template -->
    <link href="/staticfiles/css/heroic-features.css" rel="stylesheet">
  </head>

  <body>

    <nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">KCPE analysis</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <!--<li><a href="#about">About</a></li> -->
            
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
    </nav>
    
    <div class="container">
	<div class='row'>	
            <div class="col-lg-4 ">
	      
		<form role="form" method="POST" action="/submitschool">
             <div class="form-group">
            <p class="help-block">Choose School:</p>
                    <select class="form-control" name="school">
                        %for school in schools:
                            <option name="school">{{school}}</option>
                        %end

                    </select>

                  </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
                <br>
                <p class="well">
                    <label>Total Students</label><br>
                    <label class="control-label">Public:{{publictotal}}</label><br>
                    <label class="control-label">Private:{{privatetotal}}</label>
                </p>
            </div>
        <div class="col-lg-8" id="chart" >

        </div>
        </div>
    
    <div class='row text-center'>
    </div>
    
          <hr>

      <footer>
        <div class="row">
          <div class="col-lg-12">
            <p>Copyright &copy; #</p>
          </div>
        </div>
      </footer>
      
    </div><!-- /.container -->

    <!-- JavaScript -->
    <script src="/staticfiles/js/jquery-1.10.2.js"></script>
    <script src="/staticfiles/js/bootstrap.js"></script>
    <script src="/staticfiles/js/Chart.js"></script>
    <script src="/staticfiles/js/exporting.js"></script>
    <script src="/staticfiles/js/highcharts.js"></script>
    <script>
        $(function () {
      $('#chart').highcharts({
          chart: {
              plotBackgroundColor: 'Gray',
              plotBorderWidth: 5,
              plotShadow: false
          },
          title: {
              text: 'Public to private school ratio  '
          },
          tooltip: {
              pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
          },
          plotOptions: {
              pie: {
                  allowPointSelect: true,
                  cursor: 'pointer',
                  dataLabels: {
                      enabled: true,
                      color: '#000000',
                      connectorColor: '#000000',
                      format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                  }
              }
          },
          series: [{
              type: 'pie',
              name: 'percentage',
               %if prvpercent or pubpercent:
                  data:[
                         ['Private',   {{prvpercent}}],
                         ['Public',     {{pubpercent}}]
                        ]
                %end

          }]
      });
  });
    </script>
  </body>

</html>