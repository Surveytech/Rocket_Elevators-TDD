$(function() {

    console.log("I'm working from JS")
    if ($("select#Customer").val() == "") {
     $("select#Building option").remove();
     var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
     $(row).appendTo("select#Building");
    }
    $("select#Customer").change(function() {
     console.log("Customer is changing")   
     var id_value_string = $(this).val();
     if (id_value_string == "") {
      $("select#Building option").remove();
      var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
      $(row).appendTo("select#Building");
     } else {
      // Send the request and update Building dropdown
      $.ajax({
       dataType: "json",
       cache: false,
       url: '/get_building_by_customer/' + id_value_string,
       timeout: 5000,
       error: function(XMLHttpRequest, errorTextStatus, error) {
        alert("Failed to submit : " + errorTextStatus + " ;" + error);
       },
       success: function(data) {
        // Clear all options from Building select
        $("select#Building option").remove();
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
        $(row).appendTo("select#Building");
        // Fill Building select
        $.each(data, function(i, j) {
         row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
         $(row).appendTo("select#Building");
        });
       }
      });
     }
    });
 
   });