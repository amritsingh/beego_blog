package main

import (
	"beego_blog/models"
	_ "beego_blog/routers"

	"github.com/astaxie/beego"
)

func main() {
	models.ConnectDatabase()
	models.DBMigrate()
	beego.Run()
}
