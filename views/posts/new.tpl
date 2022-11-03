{{ define "posts/new.tpl"}}

{{ template "layouts/header.tpl" .}}

<div class="container-xl">

<form class="g-3" action="/posts" method="POST">
    <div class="mb-3">
        <label for="title" class="form-label">Title</label>
        <input type="text" class="form-control" id="title" aria-describedby="titleHelp" name="title">
        <div id="titleHelp" class="form-text">Title of the blog post</div>
    </div>
    <div class="mb-3">
        <label for="content" class="form-label">Content</label>
        <textarea class="form-control" id="content" rows="20" name="content"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Create</button>
</form>

</div>
{{ template "layouts/footer.tpl" .}}

{{ end }}
