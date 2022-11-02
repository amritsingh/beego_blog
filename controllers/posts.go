package controllers

import (
	"beego_blog/models"

	"github.com/astaxie/beego"
)

type PostsController struct {
	beego.Controller
}

func (c *PostsController) Get() {
	posts := models.Post{}.GetAll
	c.Data["posts"] = posts
	c.TplName = "posts/index.tpl"
}
