import { Component, Input } from '@angular/core'

@Component({
  selector:    'ao-match',
  templateUrl: './match.component.html',
  styleUrls:   [ './match.component.css' ]
})
export class MatchComponent {
  @Input() match: any

  scoresFor(index: number) {
    var scores = []
    for(var i=0; i < this.match.score.length; i++) {
      if( i % 2 == index) {
        scores.push(this.match.score[i])
      }
    }
    return scores
  }
}
