package controllers

import (
	"beego_blog/models"
	"fmt"
	"net/http"
	"strconv"

	"github.com/astaxie/beego"
)

type PostsController struct {
	beego.Controller
}

func (c *PostsController) Get() {
	posts := models.Post{}.GetAll()
	c.Data["posts"] = posts
	c.TplName = "posts/index.tpl"
}

func (c *PostsController) Post() {
	title := c.GetString("title")
	content := c.GetString("content")

	models.Post{}.Create(title, content)
	c.Redirect("/posts", http.StatusMovedPermanently)
}

func (c *PostsController) PostsNewForm() {
	c.TplName = "posts/new.tpl"
}

func (c *PostsController) PostsShow() {
	idStr := c.Ctx.Input.Param(":id")
	id, err := strconv.ParseUint(idStr, 10, 64)
	if err != nil {
		fmt.Printf("Error: %v", err)
	}
	post := models.Post{}.Find(id)
	c.Data["post"] = post
	c.TplName = "posts/show.tpl"
}

func (c *PostsController) PostsEditForm() {
	idStr := c.Ctx.Input.Param(":id")
	id, err := strconv.ParseUint(idStr, 10, 64)
	if err != nil {
		fmt.Printf("Error: %v", err)
	}
	post := models.Post{}.Find(id)
	c.Data["post"] = post
	c.TplName = "posts/edit.tpl"
}

func (c *PostsController) PostsUpdate() {
	idStr := c.Ctx.Input.Param(":id")
	id, err := strconv.ParseUint(idStr, 10, 64)
	if err != nil {
		fmt.Printf("Error: %v", err)
	}
	title := c.GetString("title")
	content := c.GetString("content")
	post := models.Post{}.Find(id)
	post.Update(title, content)
	c.Redirect("/posts", http.StatusMovedPermanently)
}

func (c *PostsController) PostsDelete() {
	idStr := c.Ctx.Input.Param(":id")
	id, err := strconv.ParseUint(idStr, 10, 64)
	if err != nil {
		fmt.Printf("Error: %v", err)
	}
	note := models.Post{}.Find(id)
	note.MarkDelete()
	c.Redirect("/posts", http.StatusMovedPermanently)
}
