$(function(){
    $(document).on('change','#limit',function(){
        $('#limit_form, .limit_form').submit();
    });

    var search_initialize;
    search_initialize = function() {
        var autocomplete, input, options;
        options = {
            language: 'en-Us',
            types: ['(cities)'],

        };
        input = $('#city');
        autocomplete = new google.maps.places.Autocomplete(input[0], options);
        google.maps.event.addListener(autocomplete, 'place_changed', function() {
            var place = autocomplete.getPlace();
            if (!place.geometry) {
                return;
            }
            input.val(place.name);
            console.log(place);
            console.log(place.name);
        });
    };

    google.maps.event.addDomListener(window, 'load', search_initialize);

});



