# テーブル設計

## usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| email  | string | null: false, unique: true |
| encrypted_password  | string | null: false, |
| name  | string | null: false |
| profile  | text | null: false |
| occupation  | text | null: false |
| position  | text | null: false |

### Association
- has_many :prototypes
- has_many :comments

## prototypesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string | null: false |
| catch_copy  | text | null: false |
| concept  | text | null: false |
| user  | references | null: false, foreign_key:true |

### Association
- belongs_to :users
- has_many :comments

## commentsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| content  | text | null: false |
| prototype  | references | null: false, foreign_key:true |
| user  | references | null: false, foreign_key:true |

### Association
- belongs_to :users
- belongs_to :prototypes

# This migration comes from active_storage (originally 20170806125915)
class CreateActiveStorageTables < ActiveRecord::Migration[5.2]
  def change
    create_table :active_storage_blobs do |t|
      t.string   :key,        null: false
      t.string   :filename,   null: false
      t.string   :content_type
      t.text     :metadata
      t.bigint   :byte_size,  null: false
      t.string   :checksum,   null: false
      t.datetime :created_at, null: false

      t.index [ :key ], unique: true
    end

    create_table :active_storage_attachments do |t|
      t.string     :name,     null: false
      t.references :record,   null: false, polymorphic: true, index: false
      t.references :blob,     null: false

      t.datetime :created_at, null: false

      t.index [ :record_type, :record_id, :name, :blob_id ], name: "index_active_storage_attachments_uniqueness", unique: true
      t.foreign_key :active_storage_blobs, column: :blob_id
    end
  end
end