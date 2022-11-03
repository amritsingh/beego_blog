{{ define "posts/index.tpl"}}

    {{ template "layouts/header.tpl" .}}

    <div class="container-xl">

        <h1>Posts</h1>

        <div class="row">
            {{ with .posts }}
                {{ range . }}
                    <div class="col">
                        <div class="card border-secondary h-200" style="width: 100%;">
                            <div class="card-header">
                                <h5 class="card-title">{{ .Title }}</h5>
                            </div>
                            <div class="card-body">
                                <div class="card-text text-truncate">
                                    {{ .Content }}
                                </div>
                                <a class="btn btn-outline-primary" href="/posts/{{ .ID }}" role="button">Show</a>
                            </div>
                            
                        </div>
                        <br/>
                    </div>
                {{ end }}
            {{ end }}
        </div>

        <br/>

        <p>
            <a class="btn btn-outline-primary" href="/posts/new" role="button">Create</a>
        </p>

    </div>

    {{ template "layouts/footer.tpl" .}}
{{ end }}
