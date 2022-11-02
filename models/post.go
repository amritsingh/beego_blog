package models

import "time"

type Post struct {
	ID        uint64 `gorm:"primaryKey"`
	Title     string `gorm:"size:255"`
	Content   string `gorm:"type:text"`
	CreatedAt time.Time
	UpdatedAt time.Time `gorm:"index"`
}

func (Post) GetAll() *[]Post {
	var posts []Post
	DB.Find(&posts)
	return &posts
}
