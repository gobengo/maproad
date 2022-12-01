

CREATE TABLE "Project" (
	id TEXT NOT NULL, 
	name TEXT NOT NULL, 
	uuid TEXT NOT NULL, 
	url TEXT NOT NULL, 
	content TEXT, 
	"startTime" DATETIME, 
	"endTime" DATETIME, 
	email TEXT, 
	"Roadmap_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Roadmap_id") REFERENCES "Roadmap" (id)
);

CREATE TABLE "Roadmap" (
	id TEXT NOT NULL, 
	uuid TEXT NOT NULL, 
	name TEXT NOT NULL, 
	"Project_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Project_id") REFERENCES "Project" (id)
);
