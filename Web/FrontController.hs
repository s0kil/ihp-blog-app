module Web.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Web.Types

-- Controller Imports
import Web.Controller.Comments
import Web.Controller.Posts
import IHP.Welcome.Controller

instance FrontController WebApplication where
    controllers = 
        [ startPage PostsAction
        -- Generator Marker
        , parseRoute @CommentsController
        , parseRoute @PostsController
        ]

instance InitControllerContext WebApplication
