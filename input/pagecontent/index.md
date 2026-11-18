<!-- ![CDS Hooks Overview](../images/logo.png) -->

<!--
<p style="padding: 5px; border-radius: 5px; border: 2px solid maroon; background: #ffffe6; max-width: 790px" markdown="1">
<b>Continuous Improvement Build</b>
<br>
This is the continuous integration, community release of the CDS Hooks specification. All stable releases are available at [https://cds-hooks.hl7.org](https://cds-hooks.hl7.org).
</p>
-->

<div class="note-to-balloters" markdown="1">

This is the 2.0.0 ballot of the CDS Hooks Library (Release 2), balloted as a mixed Normative/Trial-Use specification. The [`patient-view`](patient-view.html) and [`order-sign`](order-sign.html) hooks are balloted as **Normative**, and the other active hooks remain **Standard for Trial Use**. This ballot also applies implementer feedback received since the [STU 1 publication](https://cds-hooks.hl7.org/hooks/STU1).

**Summary of changes**

* `patient-view` and `order-sign` advance to maturity level 6 (Normative) and are balloted as normative content
* New `medication-verify` hook (maturity level 1, Submitted) for pharmacist verification of signed medication orders
* New [CDS Hook Codes](CodeSystem-HookCodes.html) code system defining a code, status and maturity level for each hook
* New [logical models](artifacts.html) for hook contexts, so hook context can be validated with the FHIR Validator
* `order-sign` (version 1.1.0) allows orders being re-signed after revision, and `order-select` adds guidance on limiting interruption of the ordering workflow
* Workflow diagrams for the encounter, ordering and medication refill workflows, FHIR-version-neutral context tables, corrected examples, and editorial fixes, each recorded as a patch version in the hook's change log

For the complete list of changes, with tracker references and links to where each change was applied, see the [Changes](changes.html) page. New and modified content is highlighted throughout the specification; use the **Highlight text changes?** checkbox at the top of each page to turn the highlighting on or off.

**Questions for balloters**

* **Normative readiness:** Are `patient-view` and `order-sign` stable and sufficiently implemented to be published as Normative?
* **Hook maturity:** Is the maturity level assigned to each hook (shown in the [Hooks](#hooks) list and on each hook page) accurate, based on known implementations? Please also record implementations on the [CDS Hooks Availability](https://github.com/cds-hooks/docs/wiki/CDS-Hooks-Availability) page.
* **Workflows:** Do the workflow diagrams accurately describe the encounter, ordering and medication refill workflows? See [Workflow Feedback](#workflow-feedback).
* **Hook-specific questions:** Please respond to the "Looking for Feedback" questions on the [`appointment-book`](appointment-book.html) and [`encounter-start`](encounter-start.html) pages, including whether `episodeOfCareId` would be useful context for `encounter-start`.

</div>

## CDS Hooks Library

### Introduction
The CDS Hooks Library contains specifications of industry standardized clinical workflow steps upon which remote clinical decision support can be requested. The Library is an HL7 publication with mixed [standards status](https://hl7.org/fhir/versions.html#std-process): the `patient-view` and `order-sign` hooks are Normative, and the remaining hooks are each published at the status shown on their page (Standard for Trial Use, Draft, or Deprecated). The names of the below hooks hyperlink to their individual specification and the number following their name indicates their specific maturity, according to the [CDS Hooks Maturity Model]({{site.data.related.cdshooks.link}}/index.html#hook-maturity-model). Because hook maturity is based on the extent of implementation, client and CDS Service implementations of each hook are tracked on the [CDS Hooks Availability](https://github.com/cds-hooks/docs/wiki/CDS-Hooks-Availability) page, and implementers are encouraged to add their own implementations there. All hooks are intended to be used by systems conforming to the [HL7 CDS Hooks Implementation Guide]({{site.data.related.cdshooks.link}}/index.html). 
{:.modified-content}

New hooks are proposed in a [prescribed format]({{site.data.related.cdshooks.link}}/index.html#hook-definition-format) using the [documentation template](template.html) by submitting a pull request for community feedback. Hooks are versioned, and mature according to the Hook Maturity Model.
Anyone may propose a new CDS Hooks hook. New hooks will continue to be specified and matured in the Library while changes to the base CDS Hooks Implementation Guide become infrequent and tightly constrained.

See [https://cds-hooks.org/](https://cds-hooks.org/) for additional information, resources and ways to get involved.

### Hooks
* [allergyintolerance-create](allergyintolerance-create.html) (1)
* [appointment-book](appointment-book.html) (1)
* [encounter-discharge](encounter-discharge.html) (1)
* [encounter-start](encounter-start.html) (1)
* [medication-refill](medication-refill.html) (1)
* {:.new-content} [medication-verify](medication-verify.html) (1)
* [order-dispatch](order-dispatch.html) (0)
* [order-select](order-select.html) (4)
* [order-sign](order-sign.html) (6)
* [patient-view](patient-view.html) (6)
* [problem-list-item-create](problem-list-item-create.html) (1)
* [report-create](report-create.html) (0)
* [medication-prescribe](medication-prescribe.html) (deprecated)
* [order-review](order-review.html) (deprecated)

<div class="new-content" markdown="1">

### Workflow Feedback {#workflow-feedback}

<blockquote style="background-color: rgba(255, 213, 128, 0.5);">
  <b>Looking for Feedback:</b>
  Several hooks are used together across a larger clinical workflow. We are seeking implementer feedback on these overall workflows, including the workflow diagrams on the linked hook pages:
  <ul>
    <li>Encounter start to finish: <a href="appointment-book.html">appointment-book</a>, <a href="encounter-start.html">encounter-start</a>, <a href="encounter-discharge.html">encounter-discharge</a></li>
    <li>Medication refill: <a href="order-sign.html">order-sign</a>, <a href="medication-refill.html">medication-refill</a></li>
    <li>Ordering: <a href="order-select.html">order-select</a>, <a href="order-sign.html">order-sign</a>, <a href="order-dispatch.html">order-dispatch</a></li>
    <li>The Da Vinci Coverage Requirements Discovery (CRD), Documentation Templates and Rules (DTR) and Prior Authorization Support (PAS) flow</li>
  </ul>
  Have you encountered any useful documentation, references or diagrams that help illustrate these workflows? Please share!
</blockquote>

### Code system
Implementers who need to refer to CDS Hook Definitions using HL7's binding machinery (e.g. in CapabilityStatements) may make use of the codes defined in the [Hook Codes CodeSystem](CodeSystem-HookCodes.html).

</div>

### Intellectual Property Statements

CDS Hooks is the copyright of HL7 International and Boston Children's Hospital. The CDS Hooks specification is licensed under a Creative Commons Attribution 4.0 International License. All source code for CDS Hooks is available at [https://github.com/cds-hooks](https://github.com/cds-hooks).

<!-- IGs that don't define resources can hide these in a div tag, see https://chat.fhir.org/#narrow/channel/179252-IG-creation/topic/Orphaned.20xhtml.20fragments.3F/near/370612006 -->

<div style="display:none">
{% lang-fragment ip-statements.xhtml %}

{% lang-fragment cross-version-analysis.xhtml %}

{% lang-fragment dependency-table.xhtml %}

{% lang-fragment globals-table.xhtml %}

</div>
