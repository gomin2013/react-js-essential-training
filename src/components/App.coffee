import React from 'react'
import {div} from 'react-dom-factories'
import CreateReactClass from 'create-react-class'
import {SkiDayList} from './SkiDayList.coffee'
import {SkiDayCount} from './SkiDayCount.coffee'

export App = CreateReactClass
  displayName: 'App'

  getInitialState: ->
    allSkiDays: [
      {
        resort: 'Squaw Valley'
        date: new Date('1/2/2016')
        powder: true
        backcountry: false
      }
      {
        resort: 'Kirkwood'
        date: new Date('3/28/2016')
        powder: false
        backcountry: false
      }
      {
        resort: 'Mt. Tallac'
        date: new Date('4/2/2016')
        powder: false
        backcountry: true
      }
    ]

  countDays: (filter) ->
    this.state.allSkiDays
      .filter((day) -> if filter then day[filter] else day).length

  render: ->
    div { className: 'app' },
      React.createElement(SkiDayList, { days: this.state.allSkiDays })
      React.createElement(SkiDayCount, {
        total: this.countDays()
        powder: this.countDays('powder')
        backcountry: this.countDays('backcountry')
      })
