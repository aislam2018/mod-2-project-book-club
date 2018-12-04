# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

--------------------------------------------
MODELS
--------------------------------------------
1.	User
  a.	Log in
  b.	Name
  c.	Username
  d.	Password
    i.	A user needs new, show and edit
    ii.	CRUD
2.	Usergroup
  a.	User-Id
  b.	Group_id
    i.	CRD
3.	Group
  a.	Name
  b.	Book id
  c.	Discussion id
  d.	Creator
  e.	Guidelines for the discussions
    i.	Index, show, edit, new
    ii.	CRUD
4.	Discussion
  a.	Post ?? own model
  b.	Group id
    i.	CRUD
5.	Book
  a.	Title
  b.	Description
  c.	Genre
  d.	Pic
    i.	Show, index,  and new
    ii.	CRU

User --< usergroup >-- group >-- Book
Group discussion
