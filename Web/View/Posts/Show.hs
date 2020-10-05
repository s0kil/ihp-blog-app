module Web.View.Posts.Show where
import Web.View.Prelude

import qualified Text.MMark as MMark

data ShowView = ShowView { post :: Include "comments" Post }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PostsAction}>Posts</a></li>
                <li class="breadcrumb-item active">Show Post</li>
            </ol>
        </nav>
        <h1>{get #title post}</h1>
        <span>{get #createdAt post |> timeAgo}</span>
        <hr>
        <div>{get #body post |> renderMarkdown}</div>

        <h4>Comments:</h4>
        <div>{forEach (get #comments post) renderComment}</div>
        <a href={NewCommentAction (get #id post)}>Add Comment</a>
    |]

renderMarkdown text =
    case text |> MMark.parse "" of
        Left error -> "Something Went Wrong."
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml

renderComment comment = [hsx|
        <div class="mt-t">
            <h5>{get #author comment}</h5>
            <p>{get #body comment}</p>
        </div>
    |]
