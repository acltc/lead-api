$(document).on('ready', function() {
  new Vue({
    el: '#settings-show',
    data: {
      settings: []
    },
    mounted: function() {
      var that = this;
      $.ajax({
        url: '/api/v1/settings/1.json',
        success: function(response) {
          that.settings = response;
        }
      })
    },
    methods: {
      toggleTextForwarding: function() {
        var that = this;
        $.ajax({
          method: 'PUT',
          headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
          },
          data: {
            settings: that.settings
          },
          url: '/api/v1/settings/update_text/1.json',
          success: function(response) {
            that.settings = response
          }
        })
      },
      toggleEmailForwarding: function() {
        var that = this;
        $.ajax({
          method: 'PUT',
          headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
          },
          data: {
            settings: that.settings
          },
          url: '/api/v1/settings/update_email/1.json',
          success: function(response) {
            that.settings = response
          }
        })
      }
    }
  })
})
