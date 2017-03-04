# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  map = $ "#gmap"
  location_field = $ "#flood_location"
  address = $ "#flood_address"
  lat_field = $ "#flood_latitude"
  long_field = $ "#flood_longitude"
  address = address
  geo = new google.maps.Geocoder

  postInitMap = (map)->
    $('#mapwrap').height('400px').width 'auto'

  setLatLng = (lat, lng) ->
    lat_field.val lat
    long_field.val lng
  
  reverseGeocode = (latlng, addressField)->
    geo.geocode 'location': latlng, (results, status) ->
      if status == 'OK' && results[0]
        addressField.val results[0].formatted_address

  $.geolocation.get(enableHighAccuracy: true).done (position)->
    latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
    setLatLng latlng.lat(), latlng.lng()

    address.geocomplete map: "#gmap", location: latlng
    postInitMap()
    reverseGeocode latlng, address

  address.on 'focus', ->
    address.geocomplete map: "#gmap"

  address.on "geocode:result", (event, result)->
    setLatLng result.geometry.location.lat(), result.geometry.location.lng()
    console.log 'Result:', result
    postInitMap()