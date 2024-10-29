### `problem-list-item-create`

{% capture maturity_link %}
  {% include maturitylink.html %}
{% endcapture %}
{% assign maturity_link = maturity_link | strip_newlines %}

<blockquote >
    This page defines a workflow <a href="{{site.data.fhir.cdshooks}}#hooks">hook</a> for the purpose of providing clinical decision support using CDS Hooks. This is a <b>snapshot</b> at the level of <a href="http://hl7.org/fhir/versions.html#std-processs">Draft</a>.
</blockquote>

| Metadata | Value |
| ---- | ---- |
| specificationVersion | 1.0 |
| hookVersion | 0.1.0 |
| hookMaturity | <a href="{{ maturity_link }}">1 - Submitted</a> |
{:.grid}

#### Workflow

The `problem-list-item-create` hook fires once a clinician has added one or more new problems to a patient's problem list. 
This hook may fire with one or more newly added conditions of category `problem-list-item` that are newly finalized. 
The context of the hook includes these new conditions. Note that this hook occurs once the new problem(s) is finalized; thereby enabling the CDS Service to recommend actions related to the problem in lieu of suggesting modifications to the newly created problem. 

#### Context

Field | Optionality | Prefetch Token | Type | Description
----- | -------- | ---- | ---- | ----
`userId` | REQUIRED | Yes | *string* | The id of the current user.<br />For this hook, the user is expected to be of type [Practitioner](https://www.hl7.org/fhir/practitioner.html) or [PractitionerRole](https://www.hl7.org/fhir/practitioner.html).<br />For example, PractitionerRole/123 or Practitioner/abc.
`patientId` | REQUIRED | Yes | *string* |  The FHIR `Patient.id` of the current patient in context
`encounterId` | OPTIONAL | Yes | *string* |  The FHIR `Encounter.id` of the current encounter in context
`conditions` | REQUIRED | No | *object* | DSTU2 - FHIR Bundle of Conditions where `category` is `problem-list-item`<br/> STU3 - FHIR Bundle of Conditions where `category` is `problem-list-item`<br/> R4 - FHIR Bundle of Conditions where `category` is `problem-list-item`
{:.grid}

#### Examples

##### Example (R4)

```json
{
  "context": {
    "userId": "Practitioner/123",
    "patientId": "1288992",
    "encounterId": "89284",
    "conditions": {
      "resourceType": "Bundle",
      "entry": [
        {
          "resource": {
            "resourceType": "Condition",
            "id": "3a14127f",
            "category": "problem-list-item",
            "clinicalStatus": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/condition-clinical",
                  "code": "active"
                }
              ]
            },
            "verificationStatus": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/condition-ver-status",
                  "code": "confirmed"
                }
              ]
            },
            "code": {
              "coding": [
                {
                  "system": "http://snomed.info/sct",
                  "code": "16114001",
                  "display": "Fracture of ankle"
                }
              ],
              "text": "Fracture of ankle"
            },
            "subject": {
              "reference": "Patient/1288992"
            },
            "onsetDateTime": "2018-10-15T04:13:17-04:00",
            "assertedDate": "2018-11-15"
          }
        }
      ]
    }
  }
}
```

##### Example (STU3)

```json
{
   "context":{
      "userId":"Practitioner/123",
      "patientId":"1288992",
      "encounterId":"89284",
      "conditions":{
         "resourceType":"Bundle",
         "entry":[
            {
               "resource":{
                  "resourceType":"Condition",
                  "id":"3a14127f",
                  "category":"problem-list-item",                 
                  "clinicalStatus":"active",
                  "verificationStatus":"confirmed",
                  "code":{
                     "coding":[
                        {
                           "system":"http://snomed.info/sct",
                           "code":"16114001",
                           "display":"Fracture of ankle"
                        }
                     ],
                     "text":"Fracture of ankle"
                  },
                  "subject":{
                     "reference":"Patient/1288992"
                  },
                  "onsetDateTime":"2018-10-15T04:13:17-04:00",
                  "assertedDate":"2018-11-15"
               }
            }
         ]
      }
   }
}
```

##### Example (DSTU2)

```json
{
  "context": {
    "userId": "Practitioner/123",
    "patientId": "1288992",
    "encounterId": "89284",
    "conditions": {
      "resourceType": "Bundle",
      "entry": [
        {
          "resource": {
            "resourceType": "Condition",
            "id": "smart-Condition-548",
            "category": {
              "text": "Problem",
              "coding": [
                {
                  "system": "http://argonautwiki.hl7.org/extension-codes",
                  "code": "problem",
                  "display": "Problem"
                }
              ]
            },
            "text": {
              "status": "generated",
              "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">Vitamin D deficiency</div>"
            },
            "patient": {
              "reference": "Patient/1288992"
            },
            "code": {
              "coding": [
                {
                  "system": "http://snomed.info/sct",
                  "code": "34713006",
                  "display": "Vitamin D deficiency"
                }
              ],
              "text": "Vitamin D deficiency"
            },
            "clinicalStatus": "active",
            "verificationStatus": "confirmed",
            "onsetDateTime": "2018-11-15"
          }
        }
      ]
    }
  }
}
```

#### Change Log

Version | Description
---- | ----
0.1.0 | Initial Release
{:.grid}
