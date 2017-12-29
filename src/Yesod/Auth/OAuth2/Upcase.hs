{-# LANGUAGE OverloadedStrings #-}
module Yesod.Auth.OAuth2.Upcase
    ( oauth2Upcase
    ) where

import Yesod.Auth.OAuth2.Provider
import Yesod.Auth.OAuth2.UserId

oauth2Upcase :: ClientId -> ClientSecret -> Provider m UserId
oauth2Upcase cid cs = Provider
    { pName = "upcase"
    , pClientId = cid
    , pClientSecret = cs
    , pAuthorizeEndpoint = "http://upcase.com/oauth/authorize"
    , pAccessTokenEndpoint = "http://upcase.com/oauth/token"
    , pFetchUserProfile = authGetProfile "http://upcase.com/api/v1/me.json"
    , pParseUserProfile = eitherDecode
    , pUserProfileToIdent = userIdent
    }