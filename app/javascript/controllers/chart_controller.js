document.addEventListener('click', () => {
  var ctx = document.getElementById('myChart').getContext('2d');
  data = document.getElementById("data").innerHTML.split(",");


  var myChart = new Chart(ctx, {
  type: 'radar',
  data: {
    labels: [
    'Eating',
    'Drinking',
    'Sleeping',
    'Designing',
    'Coding',
    'Cycling',
    'Running'
    ],

    datasets: [{
      label: 'Your alcoholic profile',
      data: data,
      fill: true,
      backgroundColor: 'rgba(255, 99, 132, 0.2)',
      borderColor: 'rgb(255, 99, 132)',
      pointBackgroundColor: 'rgb(255, 99, 132)',
      pointBorderColor: '#fff',
      pointHoverBackgroundColor: '#fff',
      pointHoverBorderColor: 'rgb(255, 99, 132)'
    },],
    options: {
    elements: {
      line: {
        borderWidth: 3
      }
    }
  },
  },
  });
})
