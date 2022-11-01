package models

import "time"

type Comment struct {
	ID        uint64 `gorm:"primaryKey"`
	PostId    uint64
	Body      string `gorm:"size:255"`
	CreatedAt time.Time
	UpdatedAt time.Time `gorm:"index"`
}
