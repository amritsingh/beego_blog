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
            
            <script>
                function sendDelete(event, href){
                    var xhttp = new XMLHttpRequest();
                    event.preventDefault();
                    xhttp.onreadystatechange = function() {
                        // return if not ready state 4
                        if (this.readyState !== 4) {
                            return;
                        }

                        if (this.readyState === 4) {
                            // Redirect the page
                            window.location.replace(this.responseURL);
                        }
                    };
                    xhttp.open("DELETE", href, true);
                    xhttp.send();
                }
            </script>

            <p>
                <div class="btn-group" role="group">
                    <a class="btn btn-outline-primary" href="/posts/edit/{{ .post.ID }}" role="button">Edit</a>
                    <a class="btn btn-outline-danger" href="/posts/{{ .post.ID }}" onclick="sendDelete(event, this.href)">Delete</a>
                </div>
            </p>
        </div>

    {{ template "layouts/footer.tpl" . }}
{{ end }}