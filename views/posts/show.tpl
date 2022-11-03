{{ define "posts/show.tpl" }}
    {{ template "layouts/header.tpl" . }}
        <div class="container-xl">
            <br/>
            <div class="card h-200">
                <div class="card-header">
                    <h5 class="card-title">{{ .post.Title }}</h5>
                </div>
                <div class="card-body">
                    <div class="card-text">
                        {{ .post.Content }}
                    </div>
                </div>
            </div>

            <br/>
            
            <p>
                <a class="btn btn-outline-primary" href="/posts/edit/{{ .post.ID }}" role="button">Edit</a>    
            </p>
        </div>

    {{ template "layouts/footer.tpl" . }}
{{ end }}