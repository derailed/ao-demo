import { Component, OnInit } from '@angular/core'
import {Subscription}        from 'rxjs/Subscription'
import { Angular2Apollo }    from 'angular2-apollo'
import { draws }             from './event.model'

@Component({
  selector:    'ao-event',
  templateUrl: './event.component.html',
  styleUrls:   [ './event.component.css' ]
})
export class EventComponent implements OnInit {
  title    = "Event"
  event    :any
  loading  :boolean = true
  private sub: Subscription
  private eventName = "Australian Open"
  private eventYear = 2017

  constructor(private apollo: Angular2Apollo) { }

  ngOnInit() {
    this.sub = this.apollo.watchQuery(
      {
        query: draws,
        variables: {
          name: this.eventName,
          year: this.eventYear
        }
      }
    ).subscribe(({data, loading}) => {
      this.loading = loading
      this.event = data["eventByName"]
      this.title = `${this.event.name} - ${this.event.year}`
    })
  }

  public ngOnDestroy(): void {
    this.sub.unsubscribe();
  }
}
