### `order-dispatch`

<blockquote >
    This page defines a workflow <a href="{{site.data.related.cdshooks.link}}/index.html#hooks">hook</a> for the purpose of providing clinical decision support using CDS Hooks. This is a <b>release</b> at the level of <a href="http://hl7.org/fhir/versions.html#std-processs">Trial Use</a>.
</blockquote>

| Metadata | Value |
| ---- | ---- |
| specificationVersion | 2.0 |
| hookVersion | 1.1 |
| hookMaturity | [0 - Draft]({{site.data.related.cdshooks.link}}/index.html#hook-maturity-model) |
{:.grid}

#### Workflow

The `order-dispatch` hook fires when a practitioner is selecting a candidate performer for a pre-existing order or (set of orders) that was not assigned to a specific performer.  For example, selecting an imaging center to satisfy a radiology order, selecting a cardiologist to satisfy a referral, etc.  This hook only occurs in situations where the order is agnostic as to who the performer should be and a separate process (which might be performed by back-office staff, a central dispatch service, or even the ordering clincian themselves at a later time) is used to select and seek action by a specific performer.  It is possible that the same order might be dispatched multiple times, either because initial selected targets refuse or are otherwise unable to satisfy the order, or because the performer is only asked to perform a 'portion' of what's authorized (the first monthly lab test of a year-long set, the first dispense of a 6 month order, etc.).  Note that the order isn't updated to include the performer in this situation, as the authorization of who could theoretically perform the order isn't changed by seeking fulfillment by a specific provider.

This "request for fulfillment" process is typically represented in FHIR using [Task](http://hl7.org/fhir/task.html).  This resource allows identifying the order to be acted upon, who is being asked to act on it, the time-period in which they're expected to act, and any limitations/qualifications to 'how much' of the order should be acted on.

Decision support that may be relevant for this hook might include information related to coverage, prior-authorization and/or in-network/out-of-network evaluations with respect to the chosen performer; determination of practitioner availability or qualification; enforcement/guidance with respect to patient performer preferences; etc.

#### Context

Field | Optionality | Prefetch Token | Type | Description
----- | -------- | ---- | ---- | ----
`patientId` | REQUIRED | Yes | *string* |  The FHIR `Patient.id` of the current patient in context
`dispatchedOrders` | REQUIRED | Yes | *array* |  Collection of the FHIR local references for the Request resource(s) for which fulfillment is sought  E.g. `ServiceRequest/123`
`performer` | REQUIRED | Yes | *string* |  The FHIR local reference for the Practitioner, PractitionerRole, Organization, CareTeam, etc. who is being asked to execute the order.  E.g. `Practitioner/456`
`fulfillmentTasks` | OPTIONAL | No | *array* | DSTU2/STU3/R4/R5 - Collection of the Task instances (as objects) that provides a full description of the fulfillment request - including the timing and any constraints on fulfillment.  If Tasks are provided, each will be for a separate order and SHALL reference one of the dispatchedOrders. 
{:.grid}

#### Examples
##### Example (R4)

```json
"context":{
  "patientId" : "1288992",
  "dispatchedOrders" : ["ServiceRequest/proc002"],
  "performer" : "Organization/some-performer",
  "fulfillment-tasks" : [{
    "resourceType" : "Task",
    "status" : "draft",
    "intent" : "order",
    "code" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/CodeSystem/task-code",
        "code" : "fulfill"
      }]
    },
    "focus" : {
      "reference" : "ServiceRequest/proc002"
    },
    "for" : {
      "reference" : "Patient/1288992"
    },
    "authoredOn" : "2016-03-10T22:39:32-04:00",
    "lastModified" : "2016-03-10T22:39:32-04:00",
    "requester": {
      "reference" : "Practitioner/456"
    },
    "owner" : {
      "reference" : "Organziation/some-performer"
    }
  }]
}
```

#### Change Log

Version | Description
---- | ----
1.0 | Initial Release
1.1 | Adjusted context names and cardinalities based on feedback
{:.grid}
