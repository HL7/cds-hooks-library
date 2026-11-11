# <mark>`hook-name-expressed-as-noun-verb`</mark>

| Metadata | Value |
| ---- | ---- |
| specificationVersion | 1.0 |
| hookVersion | 0.1.0 |
| hookMaturity | [0 - Draft]({{site.data.related.cdshooks.link}}/index.html#hook-maturity-model) |
{:.grid}

## Workflow

<mark>Describe when the hook occurs in a workflow. Hook creators SHOULD include as much detail and clarity as possible to minimize any ambiguity or confusion amongst implementers. The hook name should take the form <code>noun-verb</code>, such as <code>encounter-start</code>, or <code>order-select</code> according to the <a href="{{site.data.related.cdshooks.link}}/index.html#hook-definition-format">Hook Definition Format</a>.</mark>
{:.modified-content}

<mark>Consider creating a diagram to illustrate the workflow in which this hook is called. The <a href="order-sign.html#workflow">order-sign workflow diagram</a> was created with a tool like: <a href="https://www.bottlecaps.de/rr/ui">Railroad Diagram Generator</a>.</mark>
{:.new-content}

## Context

<mark>Define context values that are available when this hook occurs, and indicate whether they must be provided, and whether they are available for parameterizing prefetch templates.</mark>

Field | Optionality | Prefetch Token | Type | Description
----- | -------- | ---- | ---- | ----
<mark>`exampleId`</mark> | REQUIRED | Yes | *string* | <mark>Describe the context value</mark>
<mark>`encounterId`</mark> | OPTIONAL | Yes | *string* | <mark>Describe the context value</mark>
{:.grid}

### Examples

<div class="modified-content" markdown="1">

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
</div>

## Change Log

Version | Description
---- | ----
<span class="modified-content">0.1.0</span> | Initial Release
{:.grid}