module Web.Controller.Posts where

import           Web.Controller.Prelude
import           Web.View.Posts.Edit
import           Web.View.Posts.Index
import           Web.View.Posts.New
import           Web.View.Posts.Show

import qualified Text.MMark             as MMark

-- `instance` of the `Controller` type-class
instance Controller PostsController where
    action PostsAction = do
        posts <- query @Post
            |> orderByDesc #createdAt
            |> fetch
        render IndexView { .. }

    action NewPostAction = do
        -- `newRecord` creates an empty `Post` model
        let post = newRecord
        render NewView { .. }

    action ShowPostAction { postId } = do
        post <- fetch postId
            >>= pure . modify #comments (orderByDesc #createdAt)
            >>= fetchRelated #comments
        render ShowView { .. }

    action EditPostAction { postId } = do
        post <- fetch postId
        render EditView { .. }

    action UpdatePostAction { postId } = do
        post <- fetch postId
        post
            |> buildPost
            |> ifValid \case
                Left post -> render EditView { .. }
                Right post -> do
                    post |> updateRecord
                    setSuccessMessage "Post updated"
                    redirectTo EditPostAction { .. }

    action CreatePostAction = do
        let post = newRecord @Post
        post
            |> buildPost
            |> ifValid \case
                Left post -> render NewView { .. }
                Right post -> do
                    -- `createRecord` saves the record to the database
                    post |> createRecord
                    setSuccessMessage "Post created"
                    redirectTo PostsAction

    action DeletePostAction { postId } = do
        post <- fetch postId
        -- `deleteRecord` deletes post from database
        deleteRecord post
        setSuccessMessage "Post deleted"
        redirectTo PostsAction

-- `buildPost` is also responsible for validation
buildPost post = post
    -- `fill` fills `title` and `body` from browser request into `post`
    |> fill @["title","body"]
    |> validateField #title nonEmpty
    |> validateField #body nonEmpty
    |> validateField #body isMarkdown

isMarkdown :: Text -> ValidatorResult
isMarkdown text =
    case MMark.parse "" text of
        Left _  -> Failure "Please provide valid Markdown"
        Right _ -> Success
