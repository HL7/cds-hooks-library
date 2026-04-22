Logical: CDSHookOrderDispatchContext
Parent: CDSHookContext
Id: CDSHookOrderDispatchContext
Title: "CDS Hooks Specific Context for order-dispatch (Logical Definition)"
Description: "This structure is defined to allow the FHIR Validator to validate a CDSHooks order-dispatch context."
* ^status = #draft
* ^experimental = true
* . ^short = "The context for the order-dispatch hook"
* patientId 1..1 id "The FHIR Patient.id of the current patient in context" "The FHIR Patient.id of the current patient in context"
* dispatchedOrders 1..* string "Array of FHIR references" "Collection of the FHIR local references for the Request resource(s) for which fulfillment is sought E.g. `ServiceRequest/123`"
* dispatchedOrders ^extension.url = "http://hl7.org/fhir/tools/StructureDefinition/id-expectation"
* dispatchedOrders ^extension.valueCode = #optional
* performer 1..1 string "Who orders are dispatched to in form [ResourceType]/[ResourceId]" "The FHIR local reference for the Practitioner, PractitionerRole, Organization, CareTeam, etc. who is being asked to execute the order. E.g. `Practitioner/456`"
* performer obeys ord-1
* fulfillmentTasks 0..* string "Array of Task resources" "Collection of Task resources" 
* fulfillmentTasks ^extension.url = "http://hl7.org/fhir/tools/StructureDefinition/id-expectation"
* fulfillmentTasks ^extension.valueCode = #optional
