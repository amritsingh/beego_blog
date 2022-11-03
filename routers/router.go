package routers

import (
	"beego_blog/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/posts", &controllers.PostsController{})
	beego.Router("/posts/new", &controllers.PostsController{}, "get:PostsNewForm")
	beego.Router("/posts/:id([0-9]+)", &controllers.PostsController{}, "get:PostsShow")
	beego.Router("/posts/edit/:id([0-9]+)", &controllers.PostsController{}, "get:PostsEditForm")
	beego.Router("/posts/:id([0-9]+)", &controllers.PostsController{}, "post:PostsUpdate")
}
