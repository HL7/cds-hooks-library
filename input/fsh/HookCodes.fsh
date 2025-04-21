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
* #allergyintolerance-create "AllergyIntolerance create" "Invoked when when a clinician adds a new allergy or intolerance to a patient's list of allergies"
* #appointment-book          "Appointment book"          "Invoked when the user is scheduling one or more future encounters/visits for the patient"
* #encounter-discharge       "Encounter discharge"       "Invoked when the user is performing the discharge process for an encounter where the notion of 'discharge' is relevant - typically an inpatient encounter"
* #encounter-start           "Encounter start"           "Invoked when the user is initiating a new encounter"
* #medication-prescribe      "Medication prescribe"      "Deprecated in favor of the order-select and order-sign hooks"
  * ^property.code = #status
  * ^property.valueCode = #deprecated
* #medication-refill         "Medication refill"         "Invoked when a medication refill request for an existing prescription of a specific medication is received"
* #order-dispatch            "Order dispatch"            "Invoked when a practitioner is selecting a candidate performer for a pre-existing order or (set of orders) that was not assigned to a specific performer"
* #order-review              "Order review"              "Deprecated in favor of the order-sign hook"
  * ^property.code = #status
  * ^property.valueCode = #deprecated
* #order-select              "Order select"              "Invoked when a clinician initially selects one or more new orders from a list of potential orders for a specific patient"
* #order-sign                "Order sign"                "Invoked when a clinician is ready to sign one or more orders for a patient"
* #patient-view              "Patient view"              "Invoked when the user has just opened a patient's record"
* #problem-list-item-create  "Problem list item create"  "Invoked when a clinician has added one or more new problems to a patient's problem list"