CodeSystem: HookCodes
Id: HookCodes
Title: "CDS Hook Codes"
Description: "A code system defining codes for all 'standard' hooks"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^property[0].code = #status
* ^property[0].uri = "http://hl7.org/fhir/concept-properties#status"
* ^property[0].type = #code
* ^property[1].code = #maturity-level
* ^property[1].description = "Hook maturity level per the CDS Hooks Maturity Model"
* ^property[1].type = #integer
* #allergyintolerance-create "AllergyIntolerance create" "Invoked when when a clinician adds a new allergy or intolerance to a patient's list of allergies"
  * ^property[0].code = #maturity-level
  * ^property[0].valueInteger = 1
* #appointment-book          "Appointment book"          "Invoked when the user is scheduling one or more future encounters/visits for the patient"
  * ^property[0].code = #maturity-level
  * ^property[0].valueInteger = 1
* #encounter-discharge       "Encounter discharge"       "Invoked when the user is performing the discharge process for an encounter where the notion of 'discharge' is relevant - typically an inpatient encounter"
  * ^property[0].code = #maturity-level
  * ^property[0].valueInteger = 1
* #encounter-start           "Encounter start"           "Invoked when the user is initiating a new encounter"
  * ^property[0].code = #maturity-level
  * ^property[0].valueInteger = 1
* #medication-prescribe      "Medication prescribe"      "Deprecated in favor of the order-select and order-sign hooks"
  * ^property[0].code = #status
  * ^property[0].valueCode = #deprecated
  * ^property[1].code = #maturity-level
  * ^property[1].valueInteger = 2
* #medication-refill         "Medication refill"         "Invoked when a medication refill request for an existing prescription of a specific medication is received"
  * ^property[0].code = #maturity-level
  * ^property[0].valueInteger = 1
* #medication-verify         "Medication verify"         "Invoked when a pharmacist is ready to verify a medication order for a patient"
  * ^property[0].code = #maturity-level
  * ^property[0].valueInteger = 1
* #order-dispatch            "Order dispatch"            "Invoked when a practitioner is selecting a candidate performer for a pre-existing order or (set of orders) that was not assigned to a specific performer"
  * ^property[0].code = #maturity-level
  * ^property[0].valueInteger = 0
* #order-review              "Order review"              "Deprecated in favor of the order-sign hook"
  * ^property[0].code = #status
  * ^property[0].valueCode = #deprecated
  * ^property[1].code = #maturity-level
  * ^property[1].valueInteger = 3
* #order-select              "Order select"              "Invoked when a clinician initially selects one or more new orders from a list of potential orders for a specific patient"
  * ^property[0].code = #maturity-level
  * ^property[0].valueInteger = 4
* #order-sign                "Order sign"                "Invoked when a clinician is ready to sign one or more orders for a patient"
  * ^property[0].code = #maturity-level
  * ^property[0].valueInteger = 6
* #patient-view              "Patient view"              "Invoked when the user has just opened a patient's record"
  * ^property[0].code = #maturity-level
  * ^property[0].valueInteger = 6
* #problem-list-item-create  "Problem list item create"  "Invoked when a clinician has added one or more new problems to a patient's problem list"
  * ^property[0].code = #maturity-level
  * ^property[0].valueInteger = 1