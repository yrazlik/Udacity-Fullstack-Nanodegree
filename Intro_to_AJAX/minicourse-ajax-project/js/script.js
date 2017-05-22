
function loadData() {

    var $body = $('body');
    var $wikiElem = $('#wikipedia-links');
    var $nytHeaderElem = $('#nytimes-header');
    var $nytElem = $('#nytimes-articles');
    var $greeting = $('#greeting');

    // clear out old data before new request
    $wikiElem.text("");
    $nytElem.text("");

    var street = $('#street').val();
    var city = $('#city').val();
    var address = street + ", " + city;
    $greeting.text = "So, you want to live at " + address + "?";

    var streetViewUrl = "http://maps.googleapis.com/maps/api/streetview?size=600x400&location=" + address + "";
    $body.append('<img class="bgimg" src="' + streetViewUrl + '">');



    //RiotGames API Request
    var lolUrl = "https://global.api.riotgames.com/api/lol/static-data/NA/v1.2/champion?champData=all&api_key=2f29b61a-a187-49ab-a000-f5a4abc17f0";
    $.getJSON(lolUrl, function(data) {
        for(var key in data.data) {
            $body.append("<div>" + key + ", </div>")
        }
    })
    .fail(function(xhr, status, error) {
        alert("error");
    });

    return false;
};

$('#form-container').submit(loadData);
