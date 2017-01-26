import { Component, Input } from '@angular/core'

@Component({
  selector:    'ao-draw',
  templateUrl: './draw.component.html',
  styleUrls:   [ './draw.component.css' ]
})
export class DrawComponent {
  @Input() draw :any

  classForRound() {
    switch(this.draw.round)  {
      case "QF" : return "qf"
      case "SF" : return "sf"
      case "F"  : return "f"
    }
  }

  humanRound() {
    switch(this.draw.round)  {
      case "QF" : return "Quarterfinals"
      case "SF" : return "Semifinals"
      case "F"  : return "Final"
    }
  }
}
