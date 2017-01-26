import { Component, OnInit, Input } from '@angular/core'

@Component({
  selector:    'ao-player',
  templateUrl: './player.component.html',
  styleUrls:   [ './player.component.css' ]
})
export class PlayerComponent {
  @Input() player: any
  @Input() scores: number[]

  formatScores() {
    return this.scores.join(" ")
  }
}
