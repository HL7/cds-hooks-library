{: #changes}

This page describes the changes made in each version of the CDS Hooks Library, organized by the impact of the change. Each change identifies the tracker (an HL7 JIRA issue, or the GitHub pull request where no JIRA issue exists), a short summary of the change, and links to where the change was applied in the specification.

In this ballot, new and modified content is highlighted throughout the specification relative to the [STU 1 publication](https://cds-hooks.hl7.org/hooks/STU1). Highlighting is on by default and can be turned off or on with the **Highlight text changes?** checkbox at the top of each page. Content that was removed cannot be highlighted; removals are described below.

### STU 2 Ballot (version 2.0.0-ballot)

#### Non-compatible Changes

There are no non-compatible changes in this release.

#### Compatible, Substantive Changes

* [FHIR-49967](https://jira.hl7.org/browse/FHIR-49967): Added the new `medication-verify` hook (maturity level 1 - Submitted), invoked when a pharmacist is ready to verify a signed, active medication order (applied [here](medication-verify.html) and [here](index.html#hooks))
* [FHIR-50322](https://jira.hl7.org/browse/FHIR-50322): Added the CDS Hook Codes code system, defining a code for each hook in the Library (including status and maturity-level properties) so hooks can be referenced through HL7 binding machinery such as CapabilityStatements (applied [here](CodeSystem-HookCodes.html) and [here](index.html#code-system))
* [FHIR-53576](https://jira.hl7.org/browse/FHIR-53576): Updated the `order-sign` hook to version 1.1.0 and revised the `draftOrders` context description to allow orders that are being re-signed after revision (i.e. not in draft status), consistent with the order-revision workflow (applied [here](order-sign.html) and [here](order-sign.html#context))
* [FHIR-42138](https://jira.hl7.org/browse/FHIR-42138): Added guidance for `order-select` on limiting interruption of the ordering workflow: the hook fires on initial selection only, CDS Services should only return actionable cards with an accurate `indicator`, and detail-dependent guidance may be better suited to `order-sign` (applied [here](order-select.html#workflow))
* [PR #31](https://github.com/HL7/cds-hooks-library/pull/31): Added logical models defining the hook-specific context for `appointment-book`, `encounter-discharge`, `encounter-start`, `order-dispatch`, `order-select`, `order-sign` and `patient-view`, so hook contexts can be validated with the FHIR Validator, including the `ord-1` invariant requiring user, performer and selection references to be in the form `[ResourceType]/[id]`, and added a Schemas menu entry (applied [here](artifacts.html), [here](StructureDefinition-CDSHookAppointmentBookContext.html), [here](StructureDefinition-CDSHookEncounterDischargeContext.html), [here](StructureDefinition-CDSHookEncounterStartContext.html), [here](StructureDefinition-CDSHookOrderDispatchContext.html), [here](StructureDefinition-CDSHookOrderSelectContext.html), [here](StructureDefinition-CDSHookOrderSignContext.html) and [here](StructureDefinition-CDSHookPatientViewContext.html))

#### Non-substantive Changes

* [FHIR-51509](https://jira.hl7.org/browse/FHIR-51509): Added an encounter workflow diagram to `appointment-book`, `encounter-start` and `encounter-discharge` and a medication refill workflow diagram to `medication-refill`, and consolidated per-page requests for workflow feedback into a single Workflow Feedback section on the overview page (applied [here](appointment-book.html#workflow), [here](encounter-start.html#workflow), [here](encounter-discharge.html#workflow), [here](medication-refill.html#workflow) and [here](index.html#workflow-feedback))
* [FHIR-50078](https://jira.hl7.org/browse/FHIR-50078): Removed links to version-specific FHIR resource pages from hook context tables and added a note that the referenced FHIR resources are those of the FHIR version used by the CDS Service (applied [here](allergyintolerance-create.html#context), [here](appointment-book.html#context), [here](encounter-discharge.html#context), [here](encounter-start.html#context), [here](medication-prescribe.html#context), [here](medication-verify.html#context), [here](order-dispatch.html#workflow), [here](order-review.html#context), [here](order-select.html#context), [here](order-sign.html#context), [here](patient-view.html#context) and [here](problem-list-item-create.html#context))
* [FHIR-50076](https://jira.hl7.org/browse/FHIR-50076): Constrained the ordering workflow diagrams to the page width (applied [here](order-select.html#workflow) and [here](order-sign.html#workflow))
* [FHIR-52111](https://jira.hl7.org/browse/FHIR-52111): Added the missing Bundle `type` to the `draftOrders` Bundles in the `order-select` and `order-sign` examples (applied [here](order-select.html#examples) and [here](order-sign.html#examples))
* [FHIR-45282](https://jira.hl7.org/browse/FHIR-45282): Corrected the `appointment-book` examples so that `appointments` is a FHIR Bundle of Appointment resources, as required by the context definition (applied [here](appointment-book.html#examples))
* [FHIR-42139](https://jira.hl7.org/browse/FHIR-42139): Changed `appointment-book` to describe CDS Services as aiding, rather than intervening in, scheduling decisions (applied [here](appointment-book.html#workflow))
* [FHIR-42420](https://jira.hl7.org/browse/FHIR-42420): Linked the CDS Hooks Availability page from the description of hook maturity and encouraged implementers to record their implementations there (applied [here](index.html#introduction))
* [FHIR-25763](https://jira.hl7.org/browse/FHIR-25763): Added a request for implementer feedback on whether a grouping-level identifier such as `episodeOfCareId` would be useful context for `encounter-start` (applied [here](encounter-start.html))
* [PR #23](https://github.com/HL7/cds-hooks-library/pull/23): Corrected the `order-dispatch` example and the `fulfillmentTasks` description to use the context field name `dispatchedOrders` rather than `dispatched-orders` (applied [here](order-dispatch.html#context) and [here](order-dispatch.html#examples))
* [PR #26](https://github.com/HL7/cds-hooks-library/pull/26): Declared the standards status of each page in the Implementation Guide (`draft` for `medication-refill` and `problem-list-item-create`, `trial-use` otherwise) and removed the hard-coded status statements from the `appointment-book`, `encounter-discharge`, `encounter-start`, `medication-refill`, `medication-verify`, `order-select`, `order-sign`, `patient-view` and template pages
* [PR #29](https://github.com/HL7/cds-hooks-library/pull/29): Added guidance to the hook documentation template recommending a workflow diagram for new hooks (applied [here](template.html#workflow))
* Technical correction: Changed the link for the deprecation process in the `order-review` deprecation notice from a GitHub issue to [FHIR-59798](https://jira.hl7.org/browse/FHIR-59798) (applied [here](order-review.html#deprecation-notice))
* Technical correction ([PR #33](https://github.com/HL7/cds-hooks-library/pull/33), [PR #34](https://github.com/HL7/cds-hooks-library/pull/34)): Corrected typographical errors and formatting, including in the template page markup (applied [here](allergyintolerance-create.html#workflow), [here](encounter-discharge.html#context), [here](encounter-start.html#workflow), [here](medication-refill.html#workflow), [here](order-dispatch.html#workflow), [here](order-select.html#a-note-concerning-fhir-versions), [here](order-sign.html#workflow), [here](order-sign.html#change-log) and [here](template.html))
* Technical correction: Updated the Implementation Guide to version 2.0.0-ballot, declared FHIR Maturity Model level 3, and set the dependency on the CDS Hooks base specification to its most recent published version

### STU 1 Errata Publication (version 1.0.1)

* Moved the specification from the bespoke CDS Hooks publishing process to the HL7 FHIR Implementation Guide publishing process ([published version](https://cds-hooks.hl7.org/hooks/STU1))

### STU 1 Publication (version 1.0.0)

* Published the `patient-view`, `order-sign`, `order-select`, `order-dispatch`, `encounter-start`, `encounter-discharge` and `appointment-book` hooks as individual Standards for Trial Use

### STU 1 Ballot (version 1.0.0-ballot)

* Updated hook maturity per the CDS Hooks Maturity Model ([ballot version](https://cds-hooks.hl7.org/ballots/2023Sep/))
