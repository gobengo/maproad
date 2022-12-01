
# Class: Roadmap




URI: [https://bengo.is/ns/planning/Roadmap](https://bengo.is/ns/planning/Roadmap)


[![img](https://yuml.me/diagram/nofunky;dir:TB/class/[Project]<projects%200..*-++[Roadmap&#124;id:string;uuid:string;name:string],[Project]++-%20roadmaps%200..*>[Roadmap],[Project])](https://yuml.me/diagram/nofunky;dir:TB/class/[Project]<projects%200..*-++[Roadmap&#124;id:string;uuid:string;name:string],[Project]++-%20roadmaps%200..*>[Roadmap],[Project])

## Referenced by Class

 *  **None** *[➞roadmaps](project__roadmaps.md)*  <sub>0..\*</sub>  **[Roadmap](Roadmap.md)**

## Attributes


### Own

 * [id](id.md)  <sub>1..1</sub>
     * Description: unique id
     * Range: [String](types/String.md)
 * [uuid](uuid.md)  <sub>1..1</sub>
     * Description: uuid
     * Range: [String](types/String.md)
 * [name](name.md)  <sub>1..1</sub>
     * Description: a human-readable name of the object
     * Range: [String](types/String.md)
 * [➞projects](roadmap__projects.md)  <sub>0..\*</sub>
     * Range: [Project](Project.md)
