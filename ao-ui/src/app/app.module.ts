import { BrowserModule }   from '@angular/platform-browser'
import { NgModule }        from '@angular/core'
import { FormsModule }     from '@angular/forms'
import { HttpModule }      from '@angular/http'

import { AppComponent }    from './app.component'
import { DrawComponent }   from './draw/draw.component'
import { MatchComponent }  from './match/match.component'
import { PlayerComponent } from './player/player.component'
import { LoaderComponent } from './shared/loader.component'

import { ApolloModule }    from 'angular2-apollo'
import { provideClient }   from './apollo';
import { EventComponent } from './event/event.component'

@NgModule({
  declarations: [
    LoaderComponent,
    AppComponent,
    DrawComponent,
    MatchComponent,
    PlayerComponent,
    EventComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    ApolloModule.withClient(provideClient)
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
