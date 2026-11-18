Logical: CDSHookReportAssistContext
Parent: CDSHookContext
Id: CDSHookReportAssistContext
Title: "CDS Hook Specific Context for report-assist (Logical Definition)"
Description: "This structure is defined to allow the FHIR Validator to validate a CDSHooks Report-Assist context."
* ^status = #draft
* ^experimental = true
* . ^short = "The context for the report-assist hook"
* userId 1..1 string "The id of the current user. Must be in the format [ResourceType]/[id]." "For this hook, the user is expected to be of type Practitioner or PractitionerRole. For example, Practitioner/123 or PractitionerRole/abc."
* userId obeys ord-1
* patientId 1..1 id "The FHIR Patient.id of the current patient in context" "The FHIR Patient.id of the current patient in context"
* encounterId 0..1 id "The FHIR Encounter.id of the current encounter in context" "The FHIR Encounter.id of the current encounter in context"
* reportId 0..1 id "The FHIR DiagnosticReport.id of the current report" "The FHIR DiagnosticReport.id of the current report"
* category 1..* CodeableConcept "The FHIR DiagnosticReport.category of the study" "The FHIR DiagnosticReport.category of the study. For example, radiology would have the category RAD, pathology PAT, and laboratory LAB."
* status 0..1 string "The FHIR DiagnosticReport.status of the report" "The FHIR DiagnosticReport.status of the report. For the category of radiology, the status codes preliminary and partial are preferred."
* procedure 0..* CodeableConcept "The FHIR DiagnosticReport.code of this study, which refers to the procedure name" "The FHIR DiagnosticReport.code of this study, which refers to the procedure name. For example, the procedure code, or set of procedure codes, that correspond to an imaging study are reported as LOINC codes."
