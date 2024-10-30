# <mark>`hook-name-expressed-as-noun-verb`</mark>

<blockquote>
    This page defines a workflow <a href="https://build.fhir.org/ig/HL7/cds-hooks/#hooks"><b>hook</b></a> for the purpose of providing clinical decision support using CDS Hooks. This is a <mark><b>build</b> | <b>snapshot</b> | <b>ballot</b> | <b>release</b></mark> at the level of <mark><a href="http://hl7.org/fhir/versions.html#std-processs"><b>Draft | Trial Use | Normative | Informative | Deprecated</b></a></mark>
</blockquote>

| Metadata | Value |
| ---- | ---- |
| specificationVersion | 1.0 |
| hookVersion | 0.1.0 |
| hookMaturity | [0 - Draft]({{site.data.fhir.cdshooks}}#hook-maturity-model) |
{:.grid}

## Workflow

<mark>Describe when the hook occurs in a workflow. Hook creators SHOULD include as much detail and clarity as possible to minimize any ambiguity or confusion amongst implementers. The hook name should take the form `noun-verb`, such as `encounter-start`, or `order-select` according to the [Hook Definition Format]({{site.data.fhir.cdshooks}}#hook-definition-format).</mark>

## Context

<mark>Define context values that are available when this hook occurs, and indicate whether they must be provided, and whether they are available for parameterizing prefetch templates.</mark>

Field | Optionality | Prefetch Token | Type | Description
----- | -------- | ---- | ---- | ----
<mark>`exampleId`</mark> | REQUIRED | Yes | *string* | <mark>Describe the context value</mark>
<mark>`encounterId`</mark> | OPTIONAL | Yes | *string* | <mark>Describe the context value</mark>
{:.grid}

### Examples

<mark>
```json
"context":{
  "patientId" : "1288992"
}
```

```json
"context":{
  "patientId" : "1288992",
  "encounterId" : "456"
}
```
</mark>

## Change Log

Version | Description
---- | ----
1.0 | Initial Release
{:.grid}