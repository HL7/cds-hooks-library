### `encounter-start`

<blockquote >
    This page defines a workflow <a href="{{site.data.related.cdshooks.link}}/index.html#hooks">hook</a> for the purpose of providing clinical decision support using CDS Hooks. This is a <b>release</b> at the level of <a href="http://hl7.org/fhir/versions.html#std-processs">Trial Use</a>.
</blockquote>

<blockquote style="background-color: rgba(255, 213, 128, 0.5);">
    <b>Looking for Feedback:</b>
    Hey implementers, we want to hear from you!
  <ul>
    <li>What's the greatest opportunity for delivering remote CDS at the start of an encounter?</li>
    <li>For which users should this hook fire?</li>
    <li>When in a hospitalization workflow, an ambulatory workflow, does an encounter start?</li>
    <li>How many and what types of encounters are there in a single hospitalization, a single ambulatory visit?</li>
    <li>Is there value in an encounter start hook pairing with an (typically inpatient) encounter discharge hook?</li>
    <li>Please explain your encounter workflow.</li>
  </ul>
</blockquote>

| Metadata | Value |
| ---- | ---- |
| specificationVersion | 1.0 |
| hookVersion | 1.0 |
| hookMaturity | [1 - Submitted]({{site.data.related.cdshooks.link}}/index.html#hook-maturity-model) |
{:.grid}

#### Workflow

This hook is invoked when the user is initiating a new encounter.  In an inpatient setting, this would be the time of admission.  In an outpatient/community environment, this would be the time of patient-check-in for a face-to-face or equivalent for a virtual/telephone encounter.  The Encounter should either be in one of the following states: `planned` | `arrived` | `triaged` | `in-progress`.  Note that there can be multiple 'starts' for the same encounter as each user becomes engaged.  For example, when a scheduled encounter is presented at the beginning of the day for planning purposes, when the patient arrives, when the patient first encounters a clinician, etc.  Hooks may present different information depending on user role and Encounter.status.

Note: This is distinct from the `patient-view` hook which occurs any time the patient's record is looked at - which might be done outside the context of any encounter and will often occur during workflows that are not linked to the initiation of an encounter.

The intention is that the cards from any invoked CDS Services are available at the time when decisions are being made about what actions are going to occur during this encounter.  For example, identifying that the patient is due for certain diagnostic tests or interventions, identifying additional information that should be collected to comply with protocols associated with clinical studies the patient is enrolled in, identifying any documentation or other requirements associated with patient insurance, etc.

#### Context

Field | Optionality | Prefetch Token | Type | Description
----- | -------- | ---- | ---- | ----
`userId` | REQUIRED | Yes | *string* | The id of the current user.<br />For this hook, the user is expected to be of type [Practitioner](https://www.hl7.org/fhir/practitioner.html) or [PractitionerRole](https://www.hl7.org/fhir/practitionerrole.html).<br />For example, `PractitionerRole/123`
`patientId` | REQUIRED | Yes | *string* | The FHIR `Patient.id` of the Patient the Encounter is for
`encounterId` | REQUIRED | Yes | *string* | The FHIR `Encounter.id` of the Encounter being started
{:.grid}

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
