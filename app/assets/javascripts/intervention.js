$(function() {

    $("select#Building").hide()
    $("select#Battery").hide()
    $("select#Column").hide()
    $("select#Elevator").hide()
    console.log("building from customer")
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
         $("select#Building").show()
        });
       }
      });
     }
    });//for battery
    if ($("select#Building").val() == "") {
     $("select#Battery option").remove();
     var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
     $(row).appendTo("select#Battery");
    }
    $("select#Building").change(function() {
     console.log("Building is changing")   
     var id_value_string = $(this).val();
     if (id_value_string == "") {
      $("select#Battery option").remove();
      var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
      $(row).appendTo("select#Battery");
     } else {
      // Send the request and update Battery dropdown
      $.ajax({
       dataType: "json",
       cache: false,
       url: '/get_battery_by_building/' + id_value_string,
       timeout: 5000,
       error: function(XMLHttpRequest, errorTextStatus, error) {
        alert("Failed to submit : " + errorTextStatus + " ;" + error);
       },
       success: function(data) {
        // Clear all options from Battery select
        $("select#Battery option").remove();
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
        $(row).appendTo("select#Battery");
        // Fill Battery select
        $.each(data, function(i, j) {
         row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
         $(row).appendTo("select#Battery");
         $("select#Battery").show()
        });
       }
      });
     }
    });//for column
    if ($("select#Battery").val() == "") {
        $("select#Column option").remove();
        var row = "<option value=\"" + "" + "\">" + "Column" + "</option>";
        $(row).appendTo("select#Column");
       }
       $("select#Battery").change(function() {
        console.log("Battery is changing")   
        var id_value_string = $(this).val();
        console.log(id_value_string);
        if (id_value_string == "") {
         $("select#Column option").remove();
         var row = "<option value=\"" + "" + "\">" + "Column" + "</option>";
         $(row).appendTo("select#Column");                                              //--------
        } else {
         // Send the request and update Column dropdown
         $.ajax({
          dataType: "json",
          cache: false,
          url: '/get_column_by_battery/' + id_value_string,
          timeout: 5000,
          error: function(XMLHttpRequest, errorTextStatus, error) {
           alert("Failed to submit : " + errorTextStatus + " ;" + error);
          },
          success: function(data) {
           // Clear all options from Column select
           $("select#Column option").remove();
           //put in a empty default line
           var row = "<option value=\"" + "" + "\">" + "Column" + "</option>";
           $(row).appendTo("select#Column");
           // Fill Column select
           $.each(data, function(i, j) {
            row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
            $(row).appendTo("select#Column");
            $("select#Column").show()
           });
          }
         });
        }
       });
       console.log("battery function is finished")//for elevator
       if ($("select#Column").val() == "") {
           $("select#Elevator option").remove();
           var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
           $(row).appendTo("select#Elevator");
          }
          $("select#Column").change(function() {
           console.log("Column is changing")   
           var id_value_string = $(this).val();
           if (id_value_string == "") {
            $("select#Elevator option").remove();
            var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
            $(row).appendTo("select#Elevator");                                              //--------
           } else {
            // Send the request and update Elevator dropdown
            $.ajax({
             dataType: "json",
             cache: false,
             url: '/get_elevator_by_column/' + id_value_string,
             timeout: 5000,
             error: function(XMLHttpRequest, errorTextStatus, error) {
              alert("Failed to submit : " + errorTextStatus + " ;" + error);
             },
             success: function(data) {
              // Clear all options from Elevator select
              $("select#Elevator option").remove();
              //put in a empty default line
              var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
              $(row).appendTo("select#Elevator");
              // Fill Elevator select
              $.each(data, function(i, j) {
               row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
               $(row).appendTo("select#Elevator");
               $("select#Elevator").show()
              });
             }
            });
           }
          });

});