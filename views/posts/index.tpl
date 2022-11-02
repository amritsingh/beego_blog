{{ define "posts/index.tpl"}}

    {{ template "layouts/header.tpl" .}}

    <div class="container-xl">

        <h1>Posts</h1>

        <div class="row row-cols-1 row-cols-md-6 g-4">
            {{ with .posts }}
                {{ range . }}
                    <div class="col">
                        <div class="card border-secondary h-200">
                            <div class="card-header">
                                <h5 class="card-title">{{ .Title }}</h5>
                            </div>
                            <div class="card-body" style="max-height: 100px;">
                                <p class="card-text">{{ .Content }}</p>
                            </div>
                        </div>
                    </div>
                {{ end }}
            {{ end }}
        </div>

    </div>

    {{ template "layouts/footer.tpl" .}}
{{ end }}
