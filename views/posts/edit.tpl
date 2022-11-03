{{ define "posts/edit.tpl" }}
    {{ template "layouts/header.tpl" }}
        <div class="container-xl">
            <form class="row g-3" action="/posts/{{.post.ID}}" method="POST">
                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" aria-describedby="titleHelp" name="title" value="{{.post.Title}}">
                    <div id="titleHelp" class="form-text">Title of the post</div>
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label">Content</label>
                    <textarea class="form-control" id="content" rows="5" name="content">{{.post.Content}}</textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    {{ template "layouts/footer.tpl" .}}
{{ end }}