### `encounter-discharge`

| Metadata | Value |
| ---- | ---- |
| specificationVersion | 1.0 |
| hookVersion | 1.0 |
| hookMaturity | [1 - Submitted]({{site.data.related.cdshooks.link}}/index.html#hook-maturity-model) |
{:.grid}

#### Workflow

This hook is invoked when the user is performing the discharge process for an encounter where the notion of 'discharge' is relevant - typically an inpatient encounter.  It may be invoked at the start and end of the discharge process or any time between those two points.  It allows hook services to intervene in the decision of whether discharge is appropriate, to verify discharge medications, to check for continuity of care planning, to ensure necessary documentation is present for discharge processing, etc.

<div class="new-content" markdown="1">

![Encounter Workflow Diagram](encounterflow.svg){:style="max-width:100%; height:auto;"}

We are seeking implementer feedback on this workflow; see [Workflow Feedback](index.html#workflow-feedback).

</div>

#### Context

The patient who is being discharged and the encounter being ended.

Field | Optionality | Prefetch Token | Type | Description
----- | -------- | ---- | ---- | ----
`userId` | REQUIRED | Yes | *string* | <span class="modified-content">The id of the current user.<br />For this hook, the user is expected to be of type Practitioner or PractitionerRole.<br />For example, `Practitioner/123`</span>
`patientId` | REQUIRED | Yes | *string* | <span class="modified-content">The FHIR `Patient.id` of the patient being discharged</span>
`encounterId` | REQUIRED | Yes | *string* | The FHIR `Encounter.id` of the Encounter being ended
{:.grid}

{% include fhir-version-note.md %}

#### Examples

```json
"context":{
  "userId" : "PractitionerRole/A2340113",
  "patientId" : "1288992",
  "encounterId" : "456"
}
```

#### Change Log

Version | Description
---- | ----
1.0 | Initial Release
{:.grid}
