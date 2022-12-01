export type ProjectId = string
export type RoadmapId = string

export interface Project  {
    /**
     * unique id
     */id?: string,
    /**
     * a human-readable name of the object
     */name?: string,
    /**
     * uuid
     */uuid?: string,
    url?: string,
    content?: string,
    startTime?: string,
    endTime?: string,
    email?: string,
    roadmaps?: RoadmapId[],
}

export interface Roadmap  {
    /**
     * unique id
     */id?: string,
    /**
     * uuid
     */uuid?: string,
    /**
     * a human-readable name of the object
     */name?: string,
    projects?: ProjectId[],
}

