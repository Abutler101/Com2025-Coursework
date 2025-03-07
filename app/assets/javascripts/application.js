// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.validate
//= require activestorage
//= require turbolinks
//= require h5bp
//= require bootstrap-sprockets
//= require_tree .

//Use jquery validate to validate the 2 public facing forms that are used to create objects and take any real time to
//populate.
function  ValidateUserForm() {
    $('#SignupForm').validate({
        rules: {
            'user[firstName]': {required: true},
            'user[lastName]': {required: true},
            'user[email]': {required: true, email: true,}
        },
        messages: {
            'user[firstName]': {required: "You must enter Your Name",},
            'user[lastName]': {required: "You must enter Your Name",},
            'user[email]': {
                required: "Your email is a required field",
                email: "You must enter a valid email",
            }
        }
    });
}
function  ValidateContactForm() {
    $('#ContactForm').validate({
        rules: {
            'name': {required: true},
            'email': {required: true, email: true},
            'telephone': {required: true, number: true},
        },
        messages: {
            'name': {required: "You must enter Your Name",},
            'email': {required: "You must enter Your email", email: "You must enter a valid email"},
            'telephone': {required: "Your phone Number is a required field"}
        }
    });
}

//Only run jquery when the DOM is fully setup
$(document).ready(function() {
    //Run validations if the target forms are in the loaded DOM
    if(document.getElementById('SignupForm')) {ValidateUserForm();}
    if(document.getElementById('ContactForm')) {ValidateContactForm();}
});

