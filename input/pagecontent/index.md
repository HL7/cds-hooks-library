<!-- ![CDS Hooks Overview](../images/logo.png) -->

<!--
<p style="padding: 5px; border-radius: 5px; border: 2px solid maroon; background: #ffffe6; max-width: 790px" markdown="1">
<b>Continuous Improvement Build</b>
<br>
This is the continuous integration, community release of the CDS Hooks specification. All stable releases are available at [https://cds-hooks.hl7.org](https://cds-hooks.hl7.org).
</p>
-->

## CDS Hooks Library

### Introduction
The CDS Hooks Library contains specifications of industry standardized clinical workflow steps upon which remote clinical decision support can be requested. The Library is an HL7 publication at the level of [Standard for Trial Use](https://hl7.org/fhir/versions.html#std-process). The names of the below hooks hyperlink to their individual specification and the number following their name indicates their specific maturity, according to the [CDS Hooks Maturity Model]({{site.data.related.cdshooks.link}}/index.html#hook-maturity-model). All hooks are intended to be used by systems conforming to the [HL7 CDS Hooks Implementation Guide]({{site.data.related.cdshooks.link}}/index.html). 

New hooks are proposed in a [prescribed format]({{site.data.related.cdshooks.link}}/index.html#hook-definition-format) using the [documentation template](template.html) by submitting a pull request for community feedback. Hooks are versioned, and mature according to the Hook Maturity Model.
Anyone may propose a new CDS Hooks hook. New hooks will continue to be specified and matured in the Library while changes to the base CDS Hooks Implementation Guide become infrequent and tightly constrained.

See [https://cds-hooks.org/](https://cds-hooks.org/) for additional information, resources and ways to get involved.

### Hooks
* [allergyintolerance-create](allergyintolerance-create.html) (1)
* [appointment-book](appointment-book.html) (1)
* [encounter-discharge](encounter-discharge.html) (1)
* [encounter-start](encounter-start.html) (1)
* [medication-refill](medication-refill.html) (1)
* [order-dispatch](order-dispatch.html) (0)
* [order-select](order-select.html) (4)
* [order-sign](order-sign.html) (5)
* [patient-view](patient-view.html) (5)
* [problem-list-item-create](problem-list-item-create.html) (1)
* [medication-prescribe](medication-prescribe.html) (deprecated)
* [order-review](order-review.html) (deprecated)

### Intellectual Property Statements

CDS Hooks is the copyright of HL7 International and Boston Children's Hospital. The CDS Hooks specification is licensed under a Creative Commons Attribution 4.0 International License. All source code for CDS Hooks is available at [https://github.com/cds-hooks](https://github.com/cds-hooks).

<!-- IGs that don't define resources can hide these in a div tag, see https://chat.fhir.org/#narrow/channel/179252-IG-creation/topic/Orphaned.20xhtml.20fragments.3F/near/370612006 -->

<div style="display:none">
{% lang-fragment ip-statements.xhtml %}

{% lang-fragment cross-version-analysis.xhtml %}

{% lang-fragment dependency-table.xhtml %}

{% lang-fragment globals-table.xhtml %}
</div>
