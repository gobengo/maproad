

CREATE TABLE "Project" (
	uuid TEXT NOT NULL, 
	name TEXT NOT NULL, 
	url TEXT NOT NULL, 
	content TEXT, 
	"startTime" DATETIME, 
	"endTime" DATETIME, 
	email TEXT, 
	PRIMARY KEY (url)
);

CREATE TABLE "Roadmap" (
	uuid TEXT NOT NULL, 
	type TEXT, 
	projects TEXT, 
	PRIMARY KEY (uuid, type, projects)
);

CREATE TABLE "Project_type" (
	backref_id TEXT, 
	type TEXT, 
	PRIMARY KEY (backref_id, type), 
	FOREIGN KEY(backref_id) REFERENCES "Project" (url)
);
