
# Class: Project




URI: [https://bengo.is/ns/planning/Project](https://bengo.is/ns/planning/Project)


[![img](https://yuml.me/diagram/nofunky;dir:TB/class/[Roadmap],[Roadmap]<roadmaps%200..*-++[Project&#124;id:string;name:string;uuid:string;url:string;content:string%20%3F;startTime:datetime%20%3F;endTime:datetime%20%3F;email:string%20%3F],[Roadmap]++-%20projects%200..*>[Project])](https://yuml.me/diagram/nofunky;dir:TB/class/[Roadmap],[Roadmap]<roadmaps%200..*-++[Project&#124;id:string;name:string;uuid:string;url:string;content:string%20%3F;startTime:datetime%20%3F;endTime:datetime%20%3F;email:string%20%3F],[Roadmap]++-%20projects%200..*>[Project])

## Referenced by Class

 *  **None** *[➞projects](roadmap__projects.md)*  <sub>0..\*</sub>  **[Project](Project.md)**

## Attributes


### Own

 * [id](id.md)  <sub>1..1</sub>
     * Description: unique id
     * Range: [String](types/String.md)
 * [name](name.md)  <sub>1..1</sub>
     * Description: a human-readable name of the object
     * Range: [String](types/String.md)
 * [uuid](uuid.md)  <sub>1..1</sub>
     * Description: uuid
     * Range: [String](types/String.md)
 * [➞url](project__url.md)  <sub>1..1</sub>
     * Range: [String](types/String.md)
 * [➞content](project__content.md)  <sub>0..1</sub>
     * Range: [String](types/String.md)
 * [➞startTime](project__startTime.md)  <sub>0..1</sub>
     * Range: [Datetime](types/Datetime.md)
 * [➞endTime](project__endTime.md)  <sub>0..1</sub>
     * Range: [Datetime](types/Datetime.md)
 * [➞email](project__email.md)  <sub>0..1</sub>
     * Range: [String](types/String.md)
 * [➞roadmaps](project__roadmaps.md)  <sub>0..\*</sub>
     * Range: [Roadmap](Roadmap.md)
