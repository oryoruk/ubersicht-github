# Replace with your username here.
uname = "oryoruk"
username: uname

command: "curl -s https://github.com/users/#{uname}/contributions"

refreshFrequency: 3600000 # 1 hour

style: """
position: absolute
top: 20px
left: 30px
.container
  opacity:0.8
  font: 13px/1.4 Helvetica, arial, freesans, clean, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol"
h3
  color: #fff
  margin:0px
.calendar-graph
  box-sizing: border-box
  color: rgb(102, 102, 102)
  display: block
  font-size: 10px
  font-style: normal
  font-variant: normal
  font-weight: normal
  line-height: 18.2000007629395px
  .js-calendar-graph-svg
    .month, .wday
      fill: #fff
"""

render: (output) -> """
<div class="container">
  <!--<h3>github contributions for #{this.username}</h3>-->
  <div class="calendar-graph"></div>
</div>
"""

update: (output, domEl) ->
  calendar = $($.parseHTML(output))
  $(domEl)
    .find('.calendar-graph')
    .html(calendar)

  $('.js-calendar-graph-svg .day[data-count=0]').remove()
