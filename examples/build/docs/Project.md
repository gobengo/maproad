
# Class: Project




URI: [https://bengo.is/ns/planning/Project](https://bengo.is/ns/planning/Project)


[![img](https://yuml.me/diagram/nofunky;dir:TB/class/[Roadmap]++-%20projects%200..*>[Project&#124;uuid:string;type:string%20*;name:string;url:string;content:string%20%3F;startTime:datetime%20%3F;endTime:datetime%20%3F;email:string%20%3F],[Roadmap])](https://yuml.me/diagram/nofunky;dir:TB/class/[Roadmap]++-%20projects%200..*>[Project&#124;uuid:string;type:string%20*;name:string;url:string;content:string%20%3F;startTime:datetime%20%3F;endTime:datetime%20%3F;email:string%20%3F],[Roadmap])

## Referenced by Class

 *  **None** *[➞projects](roadmap__projects.md)*  <sub>0..\*</sub>  **[Project](Project.md)**

## Attributes


### Own

 * [uuid](uuid.md)  <sub>1..1</sub>
     * Description: uuid
     * Range: [String](types/String.md)
 * [type](type.md)  <sub>0..\*</sub>
     * Range: [String](types/String.md)
 * [➞name](project__name.md)  <sub>1..1</sub>
     * Description: a human-readable name of the object
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
