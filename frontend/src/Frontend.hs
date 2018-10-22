{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
module Frontend where

import qualified Data.Text as T
import Obelisk.Frontend
import Obelisk.Route
import Reflex.Dom.Core
import           Reflex.Dom.ACE                    as ACE

import Common.Api
import Common.Route
import Obelisk.Generated.Static


frontend :: Frontend (R FrontendRoute)
frontend = Frontend
  { _frontend_head = do
      el "title" $ text "Obelisk Minimal Example"
      elAttr "script" ("type" =: "text/javascript" <> "src" =: "https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.1/ace.js" <> "charset" =: "utf-8") blank
      el "style" $ text ".ace-wrapper > * { position: absolute; top:70vh; right:0px; left:0px; bottom: 0px; }"
  , _frontend_body = prerender (text "Loading ...") $ do
      text "Welcome to Obelisk!"
      el "p" $ text $ T.pack commonStuff
      elAttr "img" ("src" =: static @"obelisk.jpg") blank
      elClass "div" "ace-wrapper" $ do
        ace <- aceWidgetStatic def (AceDynConfig Nothing) ""
        pure ()
      pure ()
  }
