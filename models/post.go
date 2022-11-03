package models

import (
	"time"

	"gorm.io/gorm"
)

type Post struct {
	ID        uint64 `gorm:"primaryKey"`
	Title     string `gorm:"size:255"`
	Content   string `gorm:"type:text"`
	CreatedAt time.Time
	UpdatedAt time.Time      `gorm:"index"`
	DeletedAt gorm.DeletedAt `gorm:"index"`
}

func (Post) GetAll() *[]Post {
	var posts []Post
	DB.Where("deleted_at is NULL").Order("updated_at desc").Find(&posts)
	if len(posts) > 0 {
		return &posts
	} else {
		return nil
	}
}

func (Post) Create(title string, content string) *Post {
	entry := Post{Title: title, Content: content}
	DB.Create(&entry)
	return &entry
}

func (Post) Find(id uint64) *Post {
	var post Post
	DB.Where("id = ?", id).First(&post)
	return &post
}

func (post *Post) Update(title string, content string) {
	post.Title = title
	post.Content = content
	DB.Save(post)
}

func (post *Post) MarkDelete() {
	DB.Where("id = ?", post.ID).Delete(&Post{})
}
