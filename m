Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D037C79FA0
	for <ath12k@archiver.kernel.org>; Tue,  8 Sep 2026 06:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v/VroY80SuzkKQYkTOReEYAH/u0JCRcMA9syeFIwalc=; b=0mfL4EjyhUSVB7mDOAhKbkOUiK
	VEIZ+1pzQjduv3krWuQ6rvrlM1vySOE5GR2jvKYkOnNdReqOc87Dm1A+4R0fNJ2vJoy4qYu3/C/dk
	WMNFw1qe/BAOeE8N5a942l8QjNSPWM5iwva22nKjPVm6fFjt73ttR8AGpHXA9WgNQp4srl2XpvUCX
	4KByC7YAVS9YPJYNHCcqdNdwHSMZv7WuSv0ZHo60sk+G3F66/jyluPyMNu1zOHS/IVuZm0RimJc2+
	rxBSa0gixVB8mx1kxtEnaR48p/eWKhqFti3nJa7sAca/igLiW8YZ9o+8guNqcGjHyC6NVOYaIbE+/
	BmRHuo4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pbi-00000008CaF-0gUp;
	Tue, 08 Sep 2026 06:47:02 +0000
Received: from mx08-0057a101.pphosted.com ([185.183.31.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pbg-00000008CXw-0ivV
	for ath12k@lists.infradead.org;
	Tue, 08 Sep 2026 06:47:01 +0000
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886QnU83112611;
	Tue, 8 Sep 2026 08:46:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	270620241; bh=v/VroY80SuzkKQYkTOReEYAH/u0JCRcMA9syeFIwalc=; b=uw
	lzZ4WYWrQAJfRmTgxOcpKUouc6cwiqWfqWZJM7GILXRBG7LBkSK9FzwL6TtnDi9F
	4NM8eV8JsPdoR9GJroIhs2qkWatNQb4RUrIK1d3kdtyZT16tqkbWgpR3wR7AK1l7
	yGqeuCUk17U3ECyfeZq8IZCWm8IGb6sKfDw/rOzK5bzVyuPcH8l/kjzEoHPfVWgo
	k9dkbJciuMysfHRXyxnPDK6PsQ5xAed97d4NsjIuavx6G2tzEur4xN/mm2X52tca
	OyyMNYBv58jqlVORzhKdIXyBRGSeafWf4J1BB47V581BIOWRShbMHtd3KNLkx3dA
	AHSogny/ZF+JUZGhmpvA==
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11023121.outbound.protection.outlook.com [52.101.83.121])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4gjd3r80gh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 08:46:45 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgJH3rxGX7wQvGPS6oco3rFxfG55XLZVphJUWay2jSu+oHA+4ZjTM9CYsEmOl48ITbiKHn1YayZ+deTnABvcOkRMQ0d7/yjvibWqqmGvwNS1O38bpAeqeunX04/9QqBE9OWKclDItqcOwDsKOoQd8E4XPXg/XqufCAlMiXvy7uH3HctjbyxjvJLJAxwCATGvfK/lx8HnFQ80YmKWpgHMMnmRqetE75jwUFSKFUmrPaDTfFrSmCmoZTaoC0jNKxbSh+HeRVmHwxb4k0uyZT9G8LjY2b3fl7xBco85NsI7M+5uutEe7/kd77NwySNdf6d529IR/d724i2e1NcI863s6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/VroY80SuzkKQYkTOReEYAH/u0JCRcMA9syeFIwalc=;
 b=JtJS2wnkpTr+JSZ/3El6rN5hHqZzdk/ZG9zLfJ+xXj5Xbbgk7P7j3tz+nEosv0simvVSyFjak3slj4F8ujF1Hx8mLeb5d3bZQLyJ9BMjMwoZTF4yVHlHW+mqbmx12ijq3d0SGu88sgbUDQtq7DSG8+aiOwbsD3+/tDFEDsDeK0WQR7uH7USUv6N4D4VUeLur6TD+khDIxvdgsi440FrgwoqIt2A0uulznli8KfnTVcX/YEuu4xdz9Th3IaWstpwoIywI2QNG9hV8uhxj9V/6e9G5LvSIAXgoKlY7XSpkVpuRevAoAHjVTVw/pFCro1m2vMOFVIhdTUNUDq4+HTquTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/VroY80SuzkKQYkTOReEYAH/u0JCRcMA9syeFIwalc=;
 b=kn5l7AaxUR0+0UpIijRrwwOS0qAms10lQwxlpBlRZNyHgt7n/YpfebEeRcYoWXohGiG8Wxd0Y0a8d5yvGj3CyGqwVr1fHSORHQXCR1/LPND5SHKBUzN90YZ85SghvGqcVBXT4aInSw9zT6eM3fVVlhGanO7detKHMmzJ8eAvCSo=
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by DU0P192MB2903.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 8 Sep
 2026 06:46:43 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 06:46:43 +0000
Date: Tue, 8 Sep 2026 08:46:36 +0200
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-firmware@kernel.org
Subject: ath12k: inconsistent regdb for QCN9274
Message-ID: <ap-vTGZiqGaodxKE@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GV3PEPF0001DC26.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::113) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|DU0P192MB2903:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e67e410-2ae7-4864-43df-08df0d74f1aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: ypZAlwjpZsKYRo4djyx1FStTcMi5V+Fle1jVlsQj9lOGjuIvqAIefTfk/cAQo4MKB6JMOAIQiEryJVrcM06653Oe8kQB8EAqRdHJExCR/JKYIf2jCzwTca9XsP/hbdRDY79pbY1d1q7g3W9I8iT2MrogduvIVX+2t8XDGYAB+TwCDbvE0IrYfxqIJz5AyagKdiVAHFwgUsJL7vbAIiO8++kdI54bfhWR8D2aVOodA9NC6Ux7Uwyyt0nv0IW5Y8BV+8lUoAGZR/+ofrj/dwv8WeN3qrSORQzGCMC3hGnJJ2ggB3TuZzLvyCrlHBIv+RZWBqehnvjgA6oxFQdL63jWQklLyajJCY2mMky4tyI0tZYQqu/UZr/4dYSTgSN57vQjR+Y5GaeGJHGvAQXUFBVI9g4oBPCdrdidKWEzbnFKn5H0PHbdkVCx8T6paBXl/wL0SoU+3+qFiC2IxPuDE5XoZS2LzVQ9L3fNOUkTitsXG5DPdo2riY3GEoKpyRqv1Og16HfPVG0mYoxV4dtHDdQaOQ6lDsIDX+kznQkvx4ePeC8lGIRljFehpO8frNzktVEmqOoRHAYFKv9lgsa0lGTDkiIBJtSUu0HMok2rnLlFD6DW34sVRHFljKP5Q+DGwh3HGsHNLsiNEe+HVgqKWG0oKz8sYSsTe58ZxVylgALSL5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rrvta8cfCyl/rJttvCM2CJRyU/nha2WCFDYn75yZ25oHtPS3mSPLFs3jZXC3?=
 =?us-ascii?Q?IyV+pDFwykTpwnv4s6u8IjWnw/vG7ovgDefbHzTgcEmjh97iTslMUcQOsl+k?=
 =?us-ascii?Q?ZiDZH+UOqidJezKjniY8UeU3cofKN+VpIoE7RnspsH8V2JnebH+l3oH/ROkL?=
 =?us-ascii?Q?bANMf++jjPn+97FuumQg/0vNFy22R3bHvDbeBajPT+kGVSKNq1TMPiHUrKsY?=
 =?us-ascii?Q?MyF0x+pqciQoqhryhjDoq97y8EN2v1Yxz61VPCsm6w4DoH9oDkH7WWxtE8uf?=
 =?us-ascii?Q?A7AGC1C7UdSDjfW14JjERWeAGmfXZUsmCdMtQg/EkxwH+Kf4W94BbUKH6ook?=
 =?us-ascii?Q?jcrIHummzvHNixgHdHt/KubC5KKysxoQlu9C6BCqJzCzEKhDP0QNRNCfz3U1?=
 =?us-ascii?Q?96Sql3LtPvqsGQ19viQ6UCv4tEYADhH2gsl+XPU8voWhExQaFN17I1c96BNC?=
 =?us-ascii?Q?rFCxVEi4RT3I5h8/AHqJ/YlQuFYzqxQE440zAmteOJwJLvC/qR155xON0Csu?=
 =?us-ascii?Q?ttbJgglxpVJq0233NPuPvdB8Znwha5m6IsXmC1/CDtiuy1IoxEmsLp79cp+M?=
 =?us-ascii?Q?LFx72BqIbczat55jVtZaVAOSfu5Dcm54cf2iF7YeB4n1b4uwjUrqS/Wo2acI?=
 =?us-ascii?Q?SyL+gUgs18asSkkV/9hIKvxXVZtEOiQjA9HXHqbO/z5j2616o0/NqknLNgrY?=
 =?us-ascii?Q?WaCWRcyFjtKIGtulsUDyyrCX/kT9mV1n3WZMMgl8/Cp2QI2VmUO8Qy4fKWh6?=
 =?us-ascii?Q?kCXwo/u8DWLpA5FDYqACPKDttsc45MJ5vjiOBciaefD0Rz/lWtnEU+yfNrer?=
 =?us-ascii?Q?QBgbyBKN8qQBPhQBgLjMw3sfBODkxJIM5cK9K33Qc3+A2TGxMJWJxq857dGi?=
 =?us-ascii?Q?Ufe2J9hFagm6KTQ64wTH0SzrnU+0GjoYXUNGZFAXrZwP8vY95VcDShp/S5et?=
 =?us-ascii?Q?kl0hcNJ7SXDNQmCwWuoh3Ua6vyKd7+6aIurt9OtDYInjBHiz6ViugV535BNy?=
 =?us-ascii?Q?G4LmDiSielH0BnAnySeAK8tu7lRtpAyjSFjrhapBhYiUl7Nh1VSub+N/0VIo?=
 =?us-ascii?Q?sJzxy1Anr4fr2L5amD9I6EPk5WdKNkQIypyD60192StO1Aw/QNsCKxPRTRc8?=
 =?us-ascii?Q?sp1e76vDiKEUnLm7uN4bk0rS5uyq2rxsKAUYi6/RwW8ONgIWFEZ3VTE8hqfA?=
 =?us-ascii?Q?eEVDgCeiRb2siASob8ze36QhG5Ui+WDUe5u3SYxcu1ZbPrtOnj6vG6mjXjGB?=
 =?us-ascii?Q?E42KXl5Mc88ZjFQbNH3tjy13iQbs5pjcQjg+QXpAwLHnihSgkw6vFLLAVsfu?=
 =?us-ascii?Q?ITTVq76xVi/GCT0z9LUhAAcpqDXiizhOzlnajICVQpRpNknCxf3Xx5ZRA2yP?=
 =?us-ascii?Q?ZMWn/Te9xNOWhA/qzQyYpGIaBlYnbm5ITa6P9rCIsuteFN0XIy/j4iUEF/b6?=
 =?us-ascii?Q?Ggdv042KjIdV5+mXn79WztFAKfJTiL+gixHWi46pH4h2N39XLpuiTClrx9G2?=
 =?us-ascii?Q?vb9wjOT8+dmUhtEkZhK3XAN7al8SdHU73O5Tg3UkLkqyIoY0X3FNcGQCTWZ2?=
 =?us-ascii?Q?otYHX0iH6tY/7+wrQ9UKckVJdaHWbQAkgCrWw1u8R+nwfdCtJTkVFa2rags7?=
 =?us-ascii?Q?njNAvm9jjO/msHcCPFCdaZ0CVtO9qXO2YdhjvruE47Klk7RKJRHmwjuAMVpS?=
 =?us-ascii?Q?QTidvctdBSfVd3ZtpBoq8UJYcf+kC6B93xd8N+jbC4X7Gg/MFJRgaGPS1E1V?=
 =?us-ascii?Q?Go6ZYnDepQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: WmFRhZcT9PF9JlOnJht41iASPvaqS2H7zMv7b1PjiJDdK37aJKNKkoqdLfbnTs1rOboCSj9yDZDeLiJUXvFXBLB2RucAg2We6wqUnbg7ILm5XupplT2g1QzCtlq9TtHPqamQOoYZ1+Ip/WaR2rV8uWPKGTkw6WvvWUCyvwmn8a06u23MxjemGfXRXJ2Sc9G0ZyvIL8i0ouisK44UUthfXhBYE+re5p6NIa8m+rG/v3BB/QAMnub7Ii3MgGHgEkJatqfgbAttz5quMPiFYTByePMT7T+pOV04lek5ub6pQvSmZYlCqCynIp0hHNa89aHEMXzZESwompyFHj5L2rb+OA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: qWYRdS5Fs/T/97poCEPgX3ThoocY1JqourbfSDLsqxw3H4PyoR8dG2WCDIC6S6dCFkQaZWhGmEFUTBSCj/83G+htqKDwzi3r3Qs7dW79DREi5HNZwO1XB35x6umhcAyuH1UHbbnJbfh+zArpdr4mp+O+V9WuhduFJhevGKLWgqHBOvxP1IgsOjbcWhT5uwdTaTZCxTh+qDxjBax90+2yxPf5rmdfMTQPXctDEPq88fON4Rl+gHuhHQmYg/a7Q1r7MDp+NxpyfhdvB1pGLcZTU9RxmTdRZPi0LneRi08M81E9sWTo6uyxGcDcf0yy0+8mQwmt1wVc27u9JPYI1EGOB7JxmYv0QZLvYpSRXxQd/Ro6OzsLix/c8oGHcX8h7nr80f0+dHgUPG19LmJwo2k6KCgUEnAvN2Q1vOFfg6tqPoWupB00WG4whXsEGaDrOkaXrWvUSPNmoBW1C3flxRKGUZ1ijQCvxKdN1BwUs5dAG9WuE1nHD+wIpLj0ST8wwsj4PvLte1kHRRgjhyHwn1F86cmlStDbRkN8ROX5PHcZGz7wONJRWthKlmSGBdO0D7ahAkvrLJuJgIxL2QkJQQMKcVnLOB1ADZPLf2PpGU6UMqpOg9pizBfZsNq55KoWCPnR
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e67e410-2ae7-4864-43df-08df0d74f1aa
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 06:46:43.2829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1No83leKU0RbNUuZnAnNTOPASfNh/nyBTLxQguTw3No40O5viK+0yu6pHop0gFR+p/uS3+QC4PnjPcStWP03sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P192MB2903
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission: 
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: DU0P192MB2903.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MCBTYWx0ZWRfXzQL5mcYBE+rA
 3ToSJedh2myCNCWnBd/AcwPvsVCBO8nXv+IxAe69Y/2vWChLl+WgYBLEqOVcCFT8bTH4TEFTMF5
 zQmwOy1BXxvRQtYR7Sf/tlbz2HHQo9M=
X-Proofpoint-GUID: 1tKsZJ794Ac24qdE2nr3jgWAxKTCUMDP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MCBTYWx0ZWRfX5e+xaZX/2YJQ
 dtkyaRAictQ8ChwhVG/+iXb3UAbNNv8gk8Yijo5G/pHDfYStnR7Rk1igS1aYRO05rBPGk+eFgdQ
 Kwv4xcnXmPbRg75BCM9Wer/WOQFzTQFxy4J/MSPE+OqNHPKd3Do8SD8B4Cp6lZ/gXUUJd+1/Y71
 oJZdR53k+DB5/nzVXQN6rKEfFwJTFLI+Y33eEcNj5d+ohvK/jxIFV1IlCGS9o6RJ1ztURu8BcN8
 hDfDamq6PeM2j+HqMjnqKHvQ3sGaUhtmtaMECNazEXdtbpKPs2JzkCHZJjaTPmzR4g5bUdT2XAg
 Iw6u/r5/d6dxM+2xwelUBp11awHN4bC9MDL5uTfzPquihU4YChZ3M0+B+9bw+BLu5ntHZhkfSME
 lyWS8SuMQMZ9FRzLCIYBz20GwY0+zl55/DHUkGHa0z5sXQ/Hw6pvB9L390dKYS6wUlto+XmrBcy
 nP69CItzRAp63gsvYbQ==
X-Authority-Analysis: v=2.4 cv=S4nRUosP c=1 sm=1 tr=0 ts=6a9faf55 cx=c_pps
 a=HxUF+Bg4wm8MAqGDKVF0Kw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=WQ4YJ39tjzx_Hbm9pN5v:22
 a=W83VjyT7d6D2m-waxBUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 1tKsZJ794Ac24qdE2nr3jgWAxKTCUMDP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_234700_493562_A7209DD7 
X-CRM114-Status: GOOD (  10.90  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


Hello Developers,

I am using QCN9274 chipsets with the `ath12k` driver on my devices. As far as I
can tell, the driver uses the regulatory database from the `board-2.bin` file.
However, some country definitions do not appear to be fully implemented, as the
values differ from those in Linux's standard `wireless-regdb` repository. I even
downloaded the latest `linux-firmware-20260810.tar.xz` and do not see any
related changes there.

For example, when switching to DE, I see the following values:
* Channels 52-64: 23 dBm; I would expect 20.0 dBm
* Channels 100-140: 30.0 dBm; I would expect 26.0 dBm
* Channels 144-173: (disabled); I would expect 13.0 dBm

US also appears to be inconsistent:
* Channels 36-48: 30.0 dBm; I would expect 23.0 dBm
* Channels 169-173: (disabled); I would expect 30.0 dBm

I am aware that `wireless-regdb` is intentionally restrictive in some cases. For
example, there are rules where 26.0 dBm is used instead of 30.0 dBm because it
is implicitly assumed that TPC is not supported. Therefore, some differences may
be expected.

However, the values above still appear to be incorrect. Could someone at
Qualcomm please investigate this and fix the regulatory information if it is
indeed wrong? If the current behavior is intentional, I would appreciate an
explanation of how these limits are derived, as they do not seem to match either
the `wireless-regdb` entries or the applicable regulatory requirements. Thank
you in advance.


Best regards
Alexander Wilhelm

