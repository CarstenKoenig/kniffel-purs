module Main where

import Prelude
import Pux.Html as H
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Pux (CoreEffects, renderToDOM, fromSimple, start)
import Pux.Html (Html)


type AppEffects = (console :: CONSOLE)

data Action
    = NoAction

type State = Int

update :: Action -> State -> State
update NoAction state = state


scoresView :: Html Action
scoresView =
  H.table
    []
    [ H.thead []
        [
          H.th []
          [
            H.td [] [H.text "Categories"]
          ]
        ]
    , H.tbody []
      [ H.tr [] [ H.td [] [ H.text "Aces"] ]
      , H.tr [] [ H.td [] [ H.text "Twos"] ]
      , H.tr [] [ H.td [] [ H.text "Threes"] ]
      , H.tr [] [ H.td [] [ H.text "Fours"] ]
      , H.tr [] [ H.td [] [ H.text "Fives"] ]
      , H.tr [] [ H.td [] [ H.text "Sixes"] ]
      , H.tr [] [ H.td [] [ H.text "Bonus"] ]
      ]
    , H.tbody []
      [ H.tr [] [ H.td [] [ H.text "Three of a kind"] ]
      , H.tr [] [ H.td [] [ H.text "Four of a kind"] ]
      , H.tr [] [ H.td [] [ H.text "Full house"] ]
      , H.tr [] [ H.td [] [ H.text "Small straight"] ]
      , H.tr [] [ H.td [] [ H.text "Large straight"] ]
      , H.tr [] [ H.td [] [ H.text "Kniffel"] ]
      , H.tr [] [ H.td [] [ H.text "Chance"] ]
      ]
    , H.tfoot []
      [ H.tr [] [ H.td [] [ H.text "Total upper"] ]
      , H.tr [] [ H.td [] [ H.text "Total lower"] ]
      , H.tr [] [ H.td [] [ H.text "Total"] ]
      ]
    ]

view :: State -> Html Action
view state =
  H.div
    []
    [ H.h2 [] [ H.text "Kniffel" ]
    , scoresView
    ]


main :: Eff (CoreEffects AppEffects) Unit
main = do
  app <- start
    { initialState: 1
    , update: fromSimple update
    , view: view
    , inputs: []
    }

  renderToDOM "#app" app.html

