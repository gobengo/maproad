
# Class: Roadmap




URI: [https://bengo.is/ns/planning/Roadmap](https://bengo.is/ns/planning/Roadmap)


[![img](https://yuml.me/diagram/nofunky;dir:TB/class/[Project]<projects%200..*-++[Roadmap&#124;uuid:string;type:string%20*],[Project])](https://yuml.me/diagram/nofunky;dir:TB/class/[Project]<projects%200..*-++[Roadmap&#124;uuid:string;type:string%20*],[Project])

## Attributes


### Own

 * [uuid](uuid.md)  <sub>1..1</sub>
     * Description: uuid
     * Range: [String](types/String.md)
 * [type](type.md)  <sub>0..\*</sub>
     * Range: [String](types/String.md)
 * [➞projects](roadmap__projects.md)  <sub>0..\*</sub>
     * Range: [Project](Project.md)
