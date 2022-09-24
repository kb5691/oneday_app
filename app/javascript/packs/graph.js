document.addEventListener('turbolinks:load', () => {
  // おすすめ度のデータ
  const radarData = [
    gon.chart_data.access_point,
    gon.chart_data.casually_point,
    gon.chart_data.price_point,
    gon.chart_data.go_to_again_point,
    gon.chart_data.one_person_point,
  ];

  // グラフのデータ
  const radarChartDate = {
    // 各項目のラベル
    labels: ['アクセスしやすい', '気軽に行ける', 'お財布に優しい', 'また行きたい', '1人で行きやすい'],
    // データの設定
    datasets: [
      {
        label: 'おすすめ度',
        data: radarData,
        fill: true,
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgb(255, 99, 132)',
        pointBackgroundColor: 'rgb(255, 99, 132)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgb(255, 99, 132)',
      },
    ],
  };

  // グラフのオプション
  const radarChartOption = {
    elements: {
      line: {
        borderWidth: 3,
      },
    },
  };

  // グラフを表示
  const radarChartContext = document.getElementById('radar-chart').getContext('2d');
  new Chart(radarChartContext, {
    type: 'radar',
    data: radarChartDate,
    options: radarChartOption,
  });
});
