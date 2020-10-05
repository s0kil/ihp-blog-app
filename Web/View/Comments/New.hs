module Web.View.Comments.New where
import Web.View.Prelude

data NewView = NewView
    { comment :: Comment
    , post :: Post
    }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CommentsAction}>Comments</a></li>
                <li class="breadcrumb-item active">New Comment</li>
            </ol>
        </nav>
        <h2>
            <small style="margin-right: 1rem;">New Comment For</small>
            <q>{get #title post}</q>
        </h2>
        {renderForm comment}
    |]

renderForm :: Comment -> Html
renderForm comment = formFor comment [hsx|
    {hiddenField #postId}
    {textField #author}
    {textareaField #body}
    {submitButton}
|]
