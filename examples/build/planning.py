# Auto generated from planning.model.yaml by pythongen.py version: 0.9.0
# Generation date: 2022-11-29T23:52:40
# Schema: activity
#
# id: https://bengo.is/ns/planning
# description:
# license: https://creativecommons.org/publicdomain/zero/1.0/

import dataclasses
import sys
import re
from jsonasobj2 import JsonObj, as_dict
from typing import Optional, List, Union, Dict, ClassVar, Any
from dataclasses import dataclass
from linkml_runtime.linkml_model.meta import EnumDefinition, PermissibleValue, PvFormulaOptions

from linkml_runtime.utils.slot import Slot
from linkml_runtime.utils.metamodelcore import empty_list, empty_dict, bnode
from linkml_runtime.utils.yamlutils import YAMLRoot, extended_str, extended_float, extended_int
from linkml_runtime.utils.dataclass_extensions_376 import dataclasses_init_fn_with_kwargs
from linkml_runtime.utils.formatutils import camelcase, underscore, sfx
from linkml_runtime.utils.enumerations import EnumDefinitionImpl
from rdflib import Namespace, URIRef
from linkml_runtime.utils.curienamespace import CurieNamespace
from linkml_runtime.linkml_model.types import Datetime, String
from linkml_runtime.utils.metamodelcore import XSDDateTime

metamodel_version = "1.7.0"
version = None

# Overwrite dataclasses _init_fn to add **kwargs in __init__
dataclasses._init_fn = dataclasses_init_fn_with_kwargs

# Namespaces
ACTIVITYSTREAMS = CurieNamespace('activitystreams', 'https://www.w3.org/ns/activitystreams#')
LINKML = CurieNamespace('linkml', 'https://w3id.org/linkml/')
ORG = CurieNamespace('org', 'https://www.w3.org/TR/vocab-org/#')
RDF = CurieNamespace('rdf', 'http://www.w3.org/1999/02/22-rdf-syntax-ns#')
RDFS = CurieNamespace('rdfs', 'http://www.w3.org/2000/01/rdf-schema#')
SCHEMAORG = CurieNamespace('schemaorg', 'https://schema.org/')
XSD = CurieNamespace('xsd', 'http://www.w3.org/2001/XMLSchema#')
DEFAULT_ = CurieNamespace('', 'https://bengo.is/ns/planning/')


# Types

# Class references
class ProjectUrl(extended_str):
    pass


@dataclass
class Project(YAMLRoot):
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = URIRef("https://bengo.is/ns/planning/Project")
    class_class_curie: ClassVar[str] = None
    class_name: ClassVar[str] = "Project"
    class_model_uri: ClassVar[URIRef] = URIRef("https://bengo.is/ns/planning/Project")

    url: Union[str, ProjectUrl] = None
    uuid: str = None
    name: str = None
    type: Optional[Union[str, List[str]]] = empty_list()
    content: Optional[str] = None
    startTime: Optional[Union[str, XSDDateTime]] = None
    endTime: Optional[Union[str, XSDDateTime]] = None
    email: Optional[str] = None

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.url):
            self.MissingRequiredField("url")
        if not isinstance(self.url, ProjectUrl):
            self.url = ProjectUrl(self.url)

        if self._is_empty(self.uuid):
            self.MissingRequiredField("uuid")
        if not isinstance(self.uuid, str):
            self.uuid = str(self.uuid)

        if self._is_empty(self.name):
            self.MissingRequiredField("name")
        if not isinstance(self.name, str):
            self.name = str(self.name)

        if not isinstance(self.type, list):
            self.type = [self.type] if self.type is not None else []
        self.type = [v if isinstance(v, str) else str(v) for v in self.type]

        if self.content is not None and not isinstance(self.content, str):
            self.content = str(self.content)

        if self.startTime is not None and not isinstance(self.startTime, XSDDateTime):
            self.startTime = XSDDateTime(self.startTime)

        if self.endTime is not None and not isinstance(self.endTime, XSDDateTime):
            self.endTime = XSDDateTime(self.endTime)

        if self.email is not None and not isinstance(self.email, str):
            self.email = str(self.email)

        super().__post_init__(**kwargs)


@dataclass
class Roadmap(YAMLRoot):
    _inherited_slots: ClassVar[List[str]] = []

    class_class_uri: ClassVar[URIRef] = URIRef("https://bengo.is/ns/planning/Roadmap")
    class_class_curie: ClassVar[str] = None
    class_name: ClassVar[str] = "Roadmap"
    class_model_uri: ClassVar[URIRef] = URIRef("https://bengo.is/ns/planning/Roadmap")

    uuid: str = None
    type: Optional[Union[str, List[str]]] = empty_list()
    projects: Optional[Union[Dict[Union[str, ProjectUrl], Union[dict, Project]], List[Union[dict, Project]]]] = empty_dict()

    def __post_init__(self, *_: List[str], **kwargs: Dict[str, Any]):
        if self._is_empty(self.uuid):
            self.MissingRequiredField("uuid")
        if not isinstance(self.uuid, str):
            self.uuid = str(self.uuid)

        if not isinstance(self.type, list):
            self.type = [self.type] if self.type is not None else []
        self.type = [v if isinstance(v, str) else str(v) for v in self.type]

        self._normalize_inlined_as_list(slot_name="projects", slot_type=Project, key_name="url", keyed=True)

        super().__post_init__(**kwargs)


# Enumerations


# Slots
class slots:
    pass

slots.id = Slot(uri=ACTIVITYSTREAMS.id, name="id", curie=ACTIVITYSTREAMS.curie('id'),
                   model_uri=DEFAULT_.id, domain=None, range=str)

slots.uuid = Slot(uri=DEFAULT_.uuid, name="uuid", curie=DEFAULT_.curie('uuid'),
                   model_uri=DEFAULT_.uuid, domain=None, range=str)

slots.type = Slot(uri=ACTIVITYSTREAMS.type, name="type", curie=ACTIVITYSTREAMS.curie('type'),
                   model_uri=DEFAULT_.type, domain=None, range=Optional[Union[str, List[str]]])

slots.project__name = Slot(uri=ACTIVITYSTREAMS.name, name="project__name", curie=ACTIVITYSTREAMS.curie('name'),
                   model_uri=DEFAULT_.project__name, domain=None, range=str)

slots.project__url = Slot(uri=ACTIVITYSTREAMS.url, name="project__url", curie=ACTIVITYSTREAMS.curie('url'),
                   model_uri=DEFAULT_.project__url, domain=None, range=URIRef)

slots.project__content = Slot(uri=ACTIVITYSTREAMS.content, name="project__content", curie=ACTIVITYSTREAMS.curie('content'),
                   model_uri=DEFAULT_.project__content, domain=None, range=Optional[str])

slots.project__startTime = Slot(uri=ACTIVITYSTREAMS.startTime, name="project__startTime", curie=ACTIVITYSTREAMS.curie('startTime'),
                   model_uri=DEFAULT_.project__startTime, domain=None, range=Optional[Union[str, XSDDateTime]])

slots.project__endTime = Slot(uri=ACTIVITYSTREAMS.endTime, name="project__endTime", curie=ACTIVITYSTREAMS.curie('endTime'),
                   model_uri=DEFAULT_.project__endTime, domain=None, range=Optional[Union[str, XSDDateTime]])

slots.project__email = Slot(uri=DEFAULT_.email, name="project__email", curie=DEFAULT_.curie('email'),
                   model_uri=DEFAULT_.project__email, domain=None, range=Optional[str])

slots.roadmap__projects = Slot(uri=DEFAULT_.projects, name="roadmap__projects", curie=DEFAULT_.curie('projects'),
                   model_uri=DEFAULT_.roadmap__projects, domain=None, range=Optional[Union[Dict[Union[str, ProjectUrl], Union[dict, Project]], List[Union[dict, Project]]]])
