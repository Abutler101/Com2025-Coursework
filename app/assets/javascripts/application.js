// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require h5bp
//= require bootstrap-sprockets
//= require_tree .

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
//= require jquery_ujs
//= require jquery.validate
//= require activestorage
//= require turbolinks
//= require_tree .

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

$(document).ready(function() {
    if(document.getElementById('SignupForm')) {ValidateUserForm();}
    if(document.getElementById('ContactForm')) {ValidateContactForm();}
});

