var pageJSON = `{
	"package-id": "hl7.fhir.uv.cds-hooks-library",
	"title": "CDS Hooks Library",
	"canonical": "https://cds-hooks.hl7.org/hooks/",
	"introduction": "The CDS Hooks Library contains specifications of industry standardized clinical workflow steps upon which remote clinical decision support can be requested per the CDS Hooks Specification, which can be found at: https://cds-hooks.hl7.org.",
	"category": "CDS",
	"list": [
		{
			"version": "current",
			"desc": "Continuous Integration Build (latest in version control)",
			"path": "http://build.fhir.org/ig/HL7/cds-hooks-library",
			"status": "ci-build",
			"sequence": "STU2",
			"fhirversion": "4.0.1",
			"current": true
		},
		{
			"version": "1.0.1",
			"path": "https://cds-hooks.hl7.org/hooks/STU1",
			"status": "trial-use",
			"sequence": "STU1",
			"fhirversion": "4.0.1",
			"date": "2025-03-12",
			"desc": "CDS Hooks Library STU1 Errata Publication",
			"changes": "Move specification from bespoke to HL7 FHIR publishing mechanism."
		},
		{
			"version": "1.0.0",
			"status": "trial-use",
			"sequence": "STU1",
			"fhirversion": "4.0.1",
			"path": "",
			"date": "2024-03-21",
			"desc": "<ul>
				<li><a href='https://cds-hooks.hl7.org/hooks/patient-view/STU1/patient-view/'>Patient View</a></li>
				<li><a href='https://cds-hooks.hl7.org/hooks/order-sign/STU1/order-sign/'>Order Sign</a></li>
				<li><a href='https://cds-hooks.hl7.org/hooks/order-select/STU1/order-select/'>Order Select</a></li>
				<li><a href='https://cds-hooks.hl7.org/hooks/order-dispatch/STU1/order-dispatch/'>Order Dispatch</a></li>
				<li><a href='https://cds-hooks.hl7.org/hooks/encounter-start/STU1/encounter-start/'>Encounter Start</a></li>
				<li><a href='https://cds-hooks.hl7.org/hooks/encounter-discharge/STU1/encounter-discharge/'>Encounter Discharge</a></li>
				<li><a href='https://cds-hooks.hl7.org/hooks/appointment-book/STU1/appointment-book/'>Appointment Book</a></li>
			</ul>"
		},
                {
			"version": "1.0.0-ballot",
			"path": "https://cds-hooks.hl7.org/ballots/2023Sep/",
			"status": "ballot",
			"sequence": "STU1",
			"fhirversion": "4.0.1",
			"date": "2023-08-01",
			"desc": "CDS Hooks Library Hook Maturity Ballot",
			"changes": "Update hook maturity per CDS Hooks Maturity Model."
		}
	]
}`;
