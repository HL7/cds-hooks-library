### `patient-view`

<blockquote >
    This page defines a workflow <a href="{{site.data.related.cdshooks.link}}/index.html#hooks">hook</a> for the purpose of providing clinical decision support using CDS Hooks. This is a <b>release</b> at the level of <a href="http://hl7.org/fhir/versions.html#std-processs">Trial Use</a>.
</blockquote>

| Metadata | Value |
| ---- | ---- |
| specificationVersion | 1.0 |
| hookVersion | 1.0 |
| hookMaturity | [5 - Mature]({{site.data.related.cdshooks.link}}/index.html#hook-maturity-model) |
{:.grid}

#### Workflow

The user has just opened a patient's record; typically called only once at the beginning of a user's interaction with a specific patient's record.

#### Context

The patient whose record was opened, including their encounter, if applicable.

Field | Optionality | Prefetch Token | Type | Description
----- | -------- | ---- | ---- | ----
`userId` | REQUIRED | Yes | *string* | The id of the current user.  Must be in the format `[ResourceType]/[id]`.<br />For this hook, the user is expected to be of type [Practitioner](https://www.hl7.org/fhir/practitioner.html), [PractitionerRole](https://www.hl7.org/fhir/practitionerrole.html), [Patient](https://www.hl7.org/fhir/patient.html), or [RelatedPerson](https://www.hl7.org/fhir/relatedperson.html).<br /> Patient or RelatedPerson are appropriate when a patient or their proxy are viewing the record.<br />For example, Practitioner/abc or Patient/123.
`patientId` | REQUIRED | Yes | *string* | The FHIR `Patient.id` of the current patient in context
`encounterId` | OPTIONAL | Yes | *string* | The FHIR `Encounter.id` of the current encounter in context
{:.grid}

#### Examples

```json
"context":{
  "userId" : "PractitionerRole/123",
  "patientId" : "1288992"
}
```

```json
"context":{
  "userId" : "Practitioner/abc",
  "patientId" : "1288992",
  "encounterId" : "456"
}
```

#### Change Log

Version | Description
---- | ----
1.0 | Initial Release
{:.grid}
