### `patient-view`

| Metadata | Value |
| ---- | ---- |
| specificationVersion | 1.0 |
| hookVersion | <span class="modified-content">1.0.1</span> |
| hookMaturity | [5 - Mature]({{site.data.related.cdshooks.link}}/index.html#hook-maturity-model) |
{:.grid}

#### Workflow

The user has just opened a patient's record; typically called only once at the beginning of a user's interaction with a specific patient's record.

#### Context

The patient whose record was opened, including their encounter, if applicable.

Field | Optionality | Prefetch Token | Type | Description
----- | -------- | ---- | ---- | ----
`userId` | REQUIRED | Yes | *string* | <span class="modified-content">The id of the current user.  Must be in the format `[ResourceType]/[id]`.<br />For this hook, the user is expected to be of type Practitioner, PractitionerRole, Patient, or RelatedPerson.<br /> Patient or RelatedPerson are appropriate when a patient or their proxy are viewing the record.<br />For example, Practitioner/abc or Patient/123.</span>
`patientId` | REQUIRED | Yes | *string* | The FHIR `Patient.id` of the current patient in context
`encounterId` | OPTIONAL | Yes | *string* | The FHIR `Encounter.id` of the current encounter in context
{:.grid}

{% include fhir-version-note.md %}

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
1.0.1 | <span class="new-content">Removed version-specific FHIR resource links and added a FHIR version note ([FHIR-50078](https://jira.hl7.org/browse/FHIR-50078))</span>
{:.grid}
