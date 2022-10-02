document.addEventListener('turbolinks:load', () => {
  // viewファイルからmapに必要な情報を取得
  const info = document.getElementById('map-info');
  const mapInfo = JSON.parse(info.dataset.mapInfo);

  function initMap() {
    // mapの位置を設定
    const position = { lat: mapInfo.latitude, lng: mapInfo.longitude };
    const map = new google.maps.Map(document.getElementById('map'), {
      zoom: 15,
      center: position,
    });
    // ピンの設定
    const contentString = `場所：${mapInfo.address}`;
    const infoWindow = new google.maps.InfoWindow({
      content: contentString,
    });
    const marker = new google.maps.Marker({
      position: position,
      map: map,
      title: contentString,
    });
    marker.addListener('click', function () {
      infoWindow.open(map, marker);
    });
  }

  window.initMap = initMap;
});
