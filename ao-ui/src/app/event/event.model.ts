import { Injectable } from '@angular/core'
import gql            from 'graphql-tag'

const playerInfo = gql`
  fragment playerInfo on Player {
    id
    name
    country
    ranking { ... rankingInfo }
  }
`

const rankingInfo = gql`
  fragment rankingInfo on Ranking {
    id
    rank
  }
`

const eventInfo = gql`
  fragment eventInfo on Event {
    id
    name
    year
    draws {
      ... drawInfo
    }
  }
`

const drawInfo = gql`
  fragment drawInfo on Draw {
    id
    round
    matches {
      ... matchInfo
    }
  }
`

const matchInfo = gql`
  fragment matchInfo on Match {
    id
    court
    score
    p1 { ... playerInfo }
    p2 { ... playerInfo }
  }
`

export const draws = gql`
query GetDraws($name: String!, $year: Int!) {
  eventByName(name: $name, year: $year) {
    ... eventInfo
  }
}
${eventInfo}
${drawInfo}
${matchInfo}
${playerInfo}
${rankingInfo}
`