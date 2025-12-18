-- Migration: add hybrid memory summary fields
-- Run once against the shoe_store database

ALTER TABLE conversations
    ADD COLUMN summary TEXT NULL,
    ADD COLUMN last_summarized_count INT DEFAULT 0;
