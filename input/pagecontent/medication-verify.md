# `medication-verify`

<blockquote>
    This page defines a workflow <a href="https://build.fhir.org/ig/HL7/cds-hooks/#hooks"><b>hook</b></a> for the purpose of providing clinical decision support using CDS Hooks. This is a <b>build</b> at the level of <a href="http://hl7.org/fhir/versions.html#std-processs"><b>Trial Use</b></a>.
</blockquote>

<blockquote style="background-color: rgba(255, 213, 128, 0.5);">
  <p>
    <b>Looking for Feedback:</b>
    Hey implementers, we want to hear from you!
    <ul>
      <li>Have you encountered any useful documentation, references or diagrams that help illustrate the use or workflow of this hook? Please share!</li>
    </ul>
  </p>
</blockquote>

| Metadata | Value |
| ---- | ---- |
| specificationVersion | 1.0 |
| hookVersion | 0.1.0 |
| hookMaturity | [1 - Submitted]({{site.data.related.cdshooks.link}}/index.html#hook-maturity-model) |
{:.grid}

## Workflow

The medication-verify hook fires when a pharmacist is ready to verify a medication order for a patient in either ambulatory or inpatient settings. This hook applies to already signed orders that are in an active status. Use this hook when your service needs to present in order context to a pharmacist. Pharmacist workflow varies geographically, such that this hook will not be relevant in some locales.

## Context

Field | Optionality | Prefetch Token | Type | Description
----- | -------- | ---- | ---- | ----
userId | REQUIRED | Yes | *string* | The id of the current user. *For this hook, the user is expected to be of type Practitioner or PractitionerRole. For example, PractitionerRole/123 or Practitioner/abc.*
patientId | REQUIRED | Yes | *string* | The FHIR Patient.id of the current patient in context
encounterId | OPTIONAL | Yes | *string* | The FHIR Encounter.id of the current encounter in context
medication | REQUIRED | No | object | A FHIR MedicationRequest resource (MedicationOrder in DSTU2) with active status, representing a single signed order which is about to be verified by a pharmacist.
{:.grid}

### Examples
#### Example (R4)

```json
{
  "context": {
    "userId": "PractitionerRole/123",
    "patientId": "1288992",
    "encounterId": "89284",
    "order": {
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "smart-MedicationRequest-103",
        "meta": {
          "lastUpdated": "2018-04-30T13:25:40.845-04:00"
        },
        "text": {
          "status": "generated",
          "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">Amoxicillin 120 MG/ML / clavulanate potassium 8.58 MG/ML Oral Suspension (rxnorm: 617993)</div>"
        },
        "status": "active",
        "intent": "order",
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "617993",
              "display": "Amoxicillin 120 MG/ML / clavulanate potassium 8.58 MG/ML Oral Suspension"
            }
          ],
          "text": "Amoxicillin 120 MG/ML / clavulanate potassium 8.58 MG/ML Oral Suspension"
        },
        "subject": {
          "reference": "Patient/1288992"
        },
        "dosageInstruction": [
          {
            "text": "5 mL bid x 10 days",
            "timing": {
              "repeat": {
                "boundsPeriod": {
                  "start": "2005-01-04"
                },
                "frequency": 2,
                "period": 1,
                "periodUnit": "d"
              }
            },
            "doseQuantity": {
              "value": 5,
              "unit": "mL",
              "system": "http://unitsofmeasure.org",
              "code": "mL"
            }
          }
        ],
        "dispenseRequest": {
          "numberOfRepeatsAllowed": 1,
          "quantity": {
            "value": 1,
            "unit": "mL",
            "system": "http://unitsofmeasure.org",
            "code": "mL"
          },
          "expectedSupplyDuration": {
            "value": 10,
            "unit": "days",
            "system": "http://unitsofmeasure.org",
            "code": "d"
          }
        }
      }
    }
  }
}
```
#### Example (STU3)

```json
{
  "context": {
    "userId": "PractitionerRole/123",
    "patientId": "1288992",
    "encounterId": "89284",
    "order": {
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "smart-MedicationRequest-103",
        "meta": {
          "lastUpdated": "2018-04-30T13:25:40.845-04:00"
        },
        "text": {
          "status": "generated",
          "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">Amoxicillin 120 MG/ML / clavulanate potassium 8.58 MG/ML Oral Suspension (rxnorm: 617993)</div>"
        },
        "status": "active",
        "intent": "order",
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "617993",
              "display": "Amoxicillin 120 MG/ML / clavulanate potassium 8.58 MG/ML Oral Suspension"
            }
          ],
          "text": "Amoxicillin 120 MG/ML / clavulanate potassium 8.58 MG/ML Oral Suspension"
        },
        "subject": {
          "reference": "Patient/1288992"
        },
        "dosageInstruction": [
          {
            "text": "5 mL bid x 10 days",
            "timing": {
              "repeat": {
                "boundsPeriod": {
                  "start": "2005-01-04"
                },
                "frequency": 2,
                "period": 1,
                "periodUnit": "d"
              }
            },
            "doseQuantity": {
              "value": 5,
              "unit": "mL",
              "system": "http://unitsofmeasure.org",
              "code": "mL"
            }
          }
        ],
        "dispenseRequest": {
          "numberOfRepeatsAllowed": 1,
          "quantity": {
            "value": 1,
            "unit": "mL",
            "system": "http://unitsofmeasure.org",
            "code": "mL"
          },
          "expectedSupplyDuration": {
            "value": 10,
            "unit": "days",
            "system": "http://unitsofmeasure.org",
            "code": "d"
          }
        }
      }
    }
  }
}
```
#### Example (DSTU2)

```json
{
  "context": {
    "userId": "PractitionerRole/123",
    "patientId": "1288992",
    "encounterId": "89284",
    "order": {
      "resource": {
        "resourceType": "MedicationOrder",
        "id": "smart-MedicationOrder-103",
        "status": "active",
        "patient":{
          "reference":"Patient/1288992"
        },
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "617993",
              "display": "Amoxicillin 120 MG/ML / clavulanate potassium 8.58 MG/ML Oral Suspension"
            }
          ],
          "text": "Amoxicillin 120 MG/ML / clavulanate potassium 8.58 MG/ML Oral Suspension"
        },
        "dosageInstruction": [
          {
            "text": "5 mL bid x 10 days",
            "timing": {
              "repeat": {
                "boundsPeriod": {
                  "start": "2005-01-04"
                },
                "frequency": 2,
                "period": 1,
                "periodUnit": "d"
              }
            },
            "doseQuantity": {
              "value": 5,
              "unit": "mL",
              "system": "http://unitsofmeasure.org",
              "code": "mL"
            }
          }
        ],
        "dispenseRequest": {
          "numberOfRepeatsAllowed": 1,
          "quantity": {
            "value": 1,
            "unit": "mL",
            "system": "http://unitsofmeasure.org",
            "code": "mL"
          },
          "expectedSupplyDuration": {
            "value": 10,
            "unit": "days",
            "system": "http://unitsofmeasure.org",
            "code": "d"
          }
        }
      }
    }
  }
}
```

## Change Log

Version | Description
---- | ----
1.0 | Initial Release
{:.grid}
