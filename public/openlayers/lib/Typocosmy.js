function includeJavaScript(jsFile)
{
  document.write('<script type="text/javascript" src="'
    + jsFile + '"></script>'); 
}

includeJavaScript('/openlayers/lib/Typocosmy/Control/PanZoom.js');
includeJavaScript('/openlayers/lib/Typocosmy/Control/PanZoomBar.js');
includeJavaScript('/openlayers/lib/Typocosmy/Control/DragPan.js');
includeJavaScript('/openlayers/lib/Typocosmy/Control/ZoomBox.js');
includeJavaScript('/openlayers/lib/Typocosmy/Control/Navigation.js');

