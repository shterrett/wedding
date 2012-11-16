// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function dynamicAddRemove(invitation, invitations, attendee, attendees) {
  $('a.' + attendee + '-add').live('click', function() {
    var invitationId = $(this).closest('.' + attendees).attr('id').replace(invitation + '-', '');
    indexData = ''
    // check to see if there is a invitation div; this will be the case if we're doing a
    // grandattendee (or deeper) insert
    if ($(this).closest('div.' + invitation).size() > 0) {
      var matcher = new RegExp (invitations + '_attributes\\]\\[(\\d*)\\]');
      var invitationIndex = $(this).closest('div.' + invitation).find(':input').attr('name').match(matcher)[1];
      indexData = 'index=' + invitationIndex;
    }
    $.get('/' + invitations + '/' + invitationId + '/' + attendees + '/new', indexData, function(data) {
      $(data).hide().appendTo($('div.' + attendees + '#' + invitation + '-' + invitationId + ' div#new-' + attendees)).fadeIn('slow');
    });
    return false;
  });

  $('a.' + attendee + '-remove').live('click', function() {
    var attendeeId = $(this).closest('.' + attendee).attr('id');
    var invitationId = $(this).closest('.' + attendees).attr('id').replace(invitation + '-', '');
    $.post('/' + invitations + '/' + invitationId + '/' + attendees + '/' + attendeeId, { _method: 'delete' }, function(data, textStatus) {
      var response = JSON.parse(data);
      if (response.success) {
        $('div.' + attendee + '#' + attendeeId).fadeOut('slow', function() {
          $(this).remove();
        });
      } else {
        alert('The ' + attendee + ' could not be removed because ' + response.msg);
      }
    });
    return false;
  });
}
