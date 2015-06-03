
<head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <script src = "JS/map.js"></script>

</head>

<body>

<div class="mapContainer mainWrap">
    <div id="map-canvas">

    </div>

    <input id="locationInput" class="controls" type="text" placeholder="Search Box">
    <div id="popupNoSearchResults">
        <p>There are no such locations near you!</p>
        <input type="button" class="popupCloseButton" value="Close" onclick="closePopupWindow()">
    </div>
</div>



</body>


