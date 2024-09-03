Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464C4CA101E
	for <ath12k@archiver.kernel.org>; Tue,  3 Sep 2024 06:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARWztaqpqt6+Et2KPbZYq3BeALYixaYk4aF2nMYTYhM=; b=VjCDhgFByAI9xujy1z0u9Nxh4u
	rBjbi2XOEA224vr3RORC3Uty3R7u3M+2GaFl2Wos6QvLIJIYuemZoXlXISZCGsQar8tad69Mxf3mA
	o7Pt1VENHbCR/nvHavRJ+XrrK4cwLEfnLrUXia1hFl6BkUO+yzbH1m99/jO24/qi32E7pFBjjzhm8
	izq0kfnQMF25Xd+YS2lwkJaCK63xDgtgW9T+4mH25sDp7m3RZBU1OpYEJMnnKHbJLo4jz6d1BqYMZ
	U575izK08Un6xeX3RJW8+w6oqxyqwoQpN7+PPMNE2en4zb+a57ncsGjxYrEnps11RYjEGAHxdcRLa
	74j8A7yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slN2n-0000000GT1h-47PR
	for ath12k@archiver.kernel.org;
	Tue, 03 Sep 2024 06:29:37 +0000
Received: from mail-cwxgbr01on2072f.outbound.protection.outlook.com ([2a01:111:f403:261b::72f] helo=GBR01-CWX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slN2l-0000000GT0n-2XWk
	for ath12k@lists.infradead.org;
	Tue, 03 Sep 2024 06:29:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUtd0yEOF5Un+qC/rSRYeLpRkDc04xxmYnaK4sRrNpas93t+w840mRQo/XJQIBYaqIBHsJ3imh1nldYrk83rhOoHnep/ktcww7mN91DNRXofl9GjPSPNDjOTszQGT0L47BmthQAxng634+tdG4bgpIILWyXsoJ4Oo4QKLJhA97ldN4kuDTsLPw9Qc5o6TGyfLf7zHjYs6Y//3qPPz41dp26d3PPs7FN0Uuw1b244rv855IE8SkFL6VrD96kCSxpjyQUif5RFnOAzH5WihF2CmKQsp3z0ozmN2wv7ZdpiFNrFaOxEeBs1yQ4nPMdgRqWmiQctuqFOS+N9e/4/LRbldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARWztaqpqt6+Et2KPbZYq3BeALYixaYk4aF2nMYTYhM=;
 b=uJQ4a6hOaAmdkFgntHpmYgxKTbeNj4iyExJkJjdq/owYxrFbVljjapmTjS85i8odYGqgugYrT5JuAAfUj1LGNnpL3WUNxHaDaribrHOeJ3gA0eegkkIkEYbOuXETu3CAOj2+io/yzTRHXtVIE7bikF/gxgEmb10gsc7GBklUjnAKTCds34ZbvwJDqLduf0rhmnxspy6+TWt8ngRAJUdrafsBE+KoGUWW6StKYcO5SFPFbzWU9w6ATIXCaSVer6hIucPBO/bpBDtpluygZlCmyZm1xPNsc8d3ylTtxtVVrZdgzFHJFVe2fAoNr2H4EhYho3FCpOQf09HUe+vy64TyHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by CWLP123MB3410.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:73::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26; Tue, 3 Sep
 2024 06:29:29 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 06:29:29 +0000
From: david Atkins <david@3adesign.co.uk>
To: Baochen Qiang <quic_bqiang@quicinc.com>, "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
Subject: RE: wcn7850 issues
Thread-Topic: wcn7850 issues
Thread-Index: AQHa7kGb/waLDsK5rUe0AflzG3bOpLInNsxggABezQCAAjnlIIAEFF+AgACLnWCAEPZAAIAAFKQAgAMsa8CAATNCgIAARKCwgAAFVgCAAZPVMA==
Date: Tue, 3 Sep 2024 06:29:29 +0000
Message-ID: <LO0P123MB40578B26075CD4C9C66D144BD6932@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <be53813c-3edc-4734-b59d-83f43f14ea91@quicinc.com>
 <LO0P123MB4057C3085F445434F5E87B3AD6872@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <26bb8ec7-7170-4a09-ada3-c7c753c16e87@quicinc.com>
 <LO0P123MB40573F46A6D63145363C6B13D6812@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <cfe8e314-a28b-4ea3-85b2-9f5b4ac2db09@quicinc.com>
 <LO0P123MB405769E063E48B0F7AE18C5FD68C2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057E823BDB7B9ECCCD75840D6972@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <a6c609fc-150b-4779-b3f6-dddbd6ce93dc@quicinc.com>
 <LO0P123MB40578A6CEC43AEFE301F9ED8D6912@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <86bc1623-8845-43fa-9aad-a8a6066b1448@quicinc.com>
 <LO0P123MB4057266AFF389FA69FDC84B8D6922@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <fb455a66-b29b-4eb0-984c-254f9a1c5626@quicinc.com>
In-Reply-To: <fb455a66-b29b-4eb0-984c-254f9a1c5626@quicinc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|CWLP123MB3410:EE_
x-ms-office365-filtering-correlation-id: 960d3aea-f5e2-4d01-d638-08dccbe1c419
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RXdnYzl2cGtCM2VMMXk3YlVlaVN1RU8zZ3MwNkpsa29NdUlnM3BoZmRBWjMx?=
 =?utf-8?B?R1BMMTRQOC90dEpMclR0eVRtbittVnlNRUxBU3BLOFppUWdwNVVpM1NvK0o0?=
 =?utf-8?B?RmxKbDhDWmxFSFVHRHlmNlFwUGNCSFFRWXpoeVM0TTNxYjliUkRXWGQ4UmxK?=
 =?utf-8?B?UUNTeDlsUHk2Qm42Mi9KZzdzbHJBNHNQT0JGZ0tXenI0L0RLd3gxSmFkU0lu?=
 =?utf-8?B?L0NFZEtxUU04azd6Q0xkeVRwMDZ0c2RFQVRuMXNENml6eVVwNEFQTWxzZ2NL?=
 =?utf-8?B?V29taGNrMmRYck1WR0w0cWVRRS9jM1RVaWFiR2djbzRTY2k1T3MxYjZ5M1Vy?=
 =?utf-8?B?b2lYZ1VQVklvaDd0cnFJOCtDTjVZUXhNQ0tFaWF0ZW9lZmhpVFIxKzNDNDlT?=
 =?utf-8?B?N25takJqR0tDUXNlR0E5aG5BM1BuN3Y2NWVkTjh4K0IzM2FzNDBsY2lvb2c5?=
 =?utf-8?B?NnpJQ1F1NUpWUlRxNFd5VXU0U3l2ZVZQa0hzZEkyUXRjMERHZ0RaaVNWbGZP?=
 =?utf-8?B?NFJYQ0Rhb2Vobkc5alNuanNaYkdReVc0bHBDd3NLM3VhZGs3cWZaNHBkaFdu?=
 =?utf-8?B?WEFma0FaQUZBazdRdDZUbGJVVFlmNm1vT1pObDdmellQeWZGRFRCN2ZaN3My?=
 =?utf-8?B?N3JtOTFtd1hzbXZsWWlDQU5za3ZCL2l6L05kWVRPNTBjMkNRUExHYkxocFpU?=
 =?utf-8?B?T0JrWUc2bUNhNFo1QnZpU0NpRkFlNVR5NEMwWUVjR0VUU0FFd1pPazcyT01p?=
 =?utf-8?B?UGp3Y1EzWS9jYWU3UkJhUVdYMlgreVRtdUQxeEowTkVHRitkMnFmcTNjWjZx?=
 =?utf-8?B?S3RKS05jOXJkdmE2ZHc5cGJOWTI4T2ZObzgwNDNXa2hFcVkxNUl6VURVaENJ?=
 =?utf-8?B?NEkzMjZtSU8zUnNYWmNEN252VHlxVVd3ellLeG9rMjYvbWxMMzk3b2d5L2RY?=
 =?utf-8?B?dW1qNFlPQkdaWm12NWdxaFNZdVNHRld6QkhBVmx4WGRLKzg1TVRNbEVzcWho?=
 =?utf-8?B?Z0pnS2laaUp5OUsvZ1dFbHVxZ0J1eFV4TWcxNzVkRzB2V3REdzFLMldDdXho?=
 =?utf-8?B?Tll6bmd5WGZ3TXhYRnhmbG40NnhQY2tiOS9POEZIY1JBWHRpNGlmRFFka3FP?=
 =?utf-8?B?VWM1Q2VETFJ5aW1hNmtMVURnWStUODV3blBaK1hJYy9YNVNIQ3cxZjdlTFBP?=
 =?utf-8?B?V0t6ajk0YWh1YmhpbGpmYmhxWFh3Qzc0a3N0U1dwcnNDVFhlNmNXS1JoM3Zl?=
 =?utf-8?B?UVZ5bE40eXlxNmFVdGt2QlhkclQweU1RTDBiV3dSTG1CVGtFdGdDY1BhL2Na?=
 =?utf-8?B?cjBZOVMwMVhTTHNOMVM1dTRSc3ZMWFBRbWJ2ejBZTENDampUSzVla0prdlRW?=
 =?utf-8?B?VXY5aUl6UzdDQWpPSUpOMEJWQjZqNXZqSEFweTRZSmVTR0NZeUIyanczcjZy?=
 =?utf-8?B?WmsrRzJNY1VRb2pnSEx1U0ZIdEpoSVAxS2FOMnFreXFjRmpjZmFXT3g4TVNU?=
 =?utf-8?B?eTZpanVlNnQ3RUxPRVJ2SU9QTkF5ME8xNkcwVUZ0VG5wZTBoUnViZlVFc05V?=
 =?utf-8?B?U1ZCSlVHV2tUODc0M0hCdDBoWmZOQTBXREhWdjlwaW14RUh1WUo4OTlCTWlG?=
 =?utf-8?B?YlowOVYxbFdnYW1ES0FEZksrd05BdDliWkRqSlBsdE83eHpmZTIvcitaODEr?=
 =?utf-8?B?bWU2TVVRRGRCS09HckN4ank5STgwQ1BMT25NMTRJVWM1czU0N0NWdlBjS0p6?=
 =?utf-8?B?Smt2MnJyckljaXAwQTEvdUFDMjZQNWFkVWxjTlVlUWhYSHkwQU1kK2lJUjhF?=
 =?utf-8?B?VHFiajZMVWhoTmltRzhQaXArcVRzYVVXeGQ5b3ZXc0tHOWRQQ1ZnZ1FINzdm?=
 =?utf-8?B?bEFwVkw4blRRdWx5OTZVL1g2WHdZMzVYQVE1KzRLZDVUTmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVZIcDFaR29JMmNYRGwzT1kvdk90K2JpSUl4elFwemJsRUcrajJlYlhjSW1W?=
 =?utf-8?B?eTJqRlJsQTd5VkNNMVJ1bHhSUkxpekZ2OU1iQkxIeHYzQ1RYR2RVRTNCbkhP?=
 =?utf-8?B?c3NPU1FJcjJUcGFtZzA1V2RkNDlXR2JZamtYZUh1SWdqaVROU01aMzF0NlZ6?=
 =?utf-8?B?Tk41SE45V1AvZUxRMW5YcElJZ2ZTTnB6L2hMWnh2YlRsWFoxSlJ6WDhpNm16?=
 =?utf-8?B?U1J3dDJhZmxHRnoxVU1NL3ZZUlMxc3NucE5aUHpyc0FmV1NtQjBpRDdySkZh?=
 =?utf-8?B?WTRXSmxnY0JqNjR4OUlacGhacURuMTd6c3NQWDNvWThnUEZhdWNZT3lTYzRr?=
 =?utf-8?B?eFRvYlkxK3lrQjZtb0RIc2wreWY4WTFqOWNzb2ZzTnFXaGp2ZE5XNThlN0FE?=
 =?utf-8?B?VmJmRkNhcWJIRlpVOEpwVi9yUmJCN0FpWjVLV1lHZXBzdEhnMkRnVmlCeCtn?=
 =?utf-8?B?Z1FXc3lHTW1vZjJQSlVkT01USnArTlJ1NkpEWkl3ajlBSW9wc0ZlemNRTzJM?=
 =?utf-8?B?bUYzcno1Q1JvVi90TExKVzNzWjI1WEk1VUtQUDhLalBvWlJGZTFESUZOQnhR?=
 =?utf-8?B?OTI4aU1lNE9zdFpvVEpNVzc2RXZtR1l4MWVmcVFDci9BbHR1enBidGlsbjBt?=
 =?utf-8?B?WW1WcTVFV2MyQi9nQ0ZaZnYzZGRrZTh4ZW56SGpjc2xQTExpMWViSFBxYUYx?=
 =?utf-8?B?UVVBZlh1VEtNVk10NWl6QVBVTmdwWWN2WUdOK1A2dmxnMUM4OFZQSExjNVAz?=
 =?utf-8?B?QWF5MytQMzRtSzVnV2pqUkRQVTducTE2dlMyTVhRNUxKUlV4emg3bGcyQnVr?=
 =?utf-8?B?MXZKT1BDVFdTK2hDUTdwYXZJUThwVzNBRnVUK3dpSE1jMEFBMitaTmVUTUg3?=
 =?utf-8?B?dHp0cGxiMWdOS1J4ME83NTFJWjFhSkxaaEZVRWgrd1c5VDBjYjB0eFJlM0xk?=
 =?utf-8?B?bTd6WlNqNGx4ZGx2bnV4YUdGckIyU3NWSU9leVd6dTYxTG4wSnNHM29XcStp?=
 =?utf-8?B?ZklhcVZNWnR4bzBicTJOZ1lTZ3FxTkg1R0NkQ1dqSGVUZkRoMWJRbGRCbUF2?=
 =?utf-8?B?QXE5Y0hXcG5zdVZFaCtUZFF6eGhhY3djWEpFNGpCazdqYVBpaXc4MWFvUGMy?=
 =?utf-8?B?ZFMyc1d1TlA5QldjSFpHVEZ5UnUrK1ZPVUt0UXBwRmowSzZxMEFqenQwK2R4?=
 =?utf-8?B?MDdRN0gyTExWZ1dQc1ZOQXE2WWkxZ2kyQjdZUm43VktVdjVNWXJyWjZkVFJI?=
 =?utf-8?B?bjBuaTN0MHU4eHpqVjAyUHd2RytYZ1NCODNBVVNkWkJFWGV5VnN0Mzgwc29i?=
 =?utf-8?B?dEtNWksyQUNBdHZUdkR1Q2xTandUT2NpaHRnMUZncmxRZHMvS0xFU3lYK3Fi?=
 =?utf-8?B?OXgyeWk0ME1wekJIMmJaZzVqNEhkVjZmdW5sQXdwakFUMGxjcUgzblVMaEFi?=
 =?utf-8?B?VVFSWDViT0NMd3RwdHAxKzNrNCtra0ZNT1JsbURCdyt2UVhBZml2RWErQ2Nw?=
 =?utf-8?B?eU1sYWxKVElybFlsSEJlTjJUcWlaZ2NaYzc4Sy8vaVM2RHJwazBkSHhKcEdz?=
 =?utf-8?B?RUt6UDc1cFR0cjMza1dDT2t4ci9iOW9RWUMzMEFRd2loMTYyOEtLS3ZDUkto?=
 =?utf-8?B?RGU2UXNnWjVZKzF2dlVrQk5vcWV3ckthcTExMGFCT0hrYUZxOUhPL25iYVhk?=
 =?utf-8?B?RGtlR0xvQ2Rzclh1Q0NxQ0U0UzQwVy9GZkpaMGpFQ3VnN2g2ZGk3aU9GeVhC?=
 =?utf-8?B?ZUdJRTl0MkdkenZDSW5iV01DMGFoMFlQczhKTDg0TDV5TzNiMW1kTWhQVTJW?=
 =?utf-8?B?YzVwVmlvdnVyb2QrczE1WnI4SGt1UWFRa0xLcmNnTFcveEJYUjFSTWU5TFZJ?=
 =?utf-8?B?OHJKU1hHVGVtY3JIdFBXZVVDb1h1dEQ2emE3cUNubGZHejhINFBnZmtPQU5l?=
 =?utf-8?B?aGdLaVo5cDh3a2U5dEFtM1JnUU9RZmFtcmlGdVgwakF3SnpacmJGL2J1elFJ?=
 =?utf-8?B?aFBYSzFTVG1XZ0IwcjIxYlVMTlJuNDhoTGFIVGNZODJnMFFGak9wUVZ4RUxH?=
 =?utf-8?B?MlowbWRsb1licVh1VUd2ZW9UZC9sbnRwdnVaOVZvK0xTQWxXNWJMYUl5Y2xS?=
 =?utf-8?Q?H0cGiEgshMfwZJUHYZPu+t/2P?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 960d3aea-f5e2-4d01-d638-08dccbe1c419
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 06:29:29.7813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HlQE55x0hMEZFKVgBudPKXBV+3WCglYTINh0ZkgEFijPVwiMleZi1J5zl3gsFAkKCCJIV+AEZ81tsaDUvwONew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB3410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_232935_671731_1AFC798E 
X-CRM114-Status: GOOD (  13.18  )
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

Li4uDQo+ID4+PiAgICAgICAgIEV4dCBUYWc6IEVIVCBPcGVyYXRpb24gKDgwMi4xMWJlIEQzLjAp
DQo+ID4+PiAgICAgICAgICAgICBFeHQgVGFnIGxlbmd0aDogOCAoVGFnIGxlbjogOSkNCj4gPj4+
ICAgICAgICAgICAgIEV4dCBUYWcgTnVtYmVyOiBFSFQgT3BlcmF0aW9uICg4MDIuMTFiZSBEMy4w
KSAoMTA2KQ0KPiA+Pj4gICAgICAgICAgICAgRUhUIE9wZXJhdGlvbiBQYXJhbWV0ZXJzOiAweDAx
LCBFSFQgT3BlcmF0aW9uIEluZm9ybWF0aW9uDQo+IFByZXNlbnQNCj4gPj4+ICAgICAgICAgICAg
ICAgICAuLi4uIC4uLjEgPSBFSFQgT3BlcmF0aW9uIEluZm9ybWF0aW9uIFByZXNlbnQ6IFRydWUN
Cj4gPj4+ICAgICAgICAgICAgICAgICAuLi4uIC4uMC4gPSBEaXNhYmxlZCBTdWJjaGFubmVsIEJp
dG1hcCBQcmVzZW50OiBGYWxzZQ0KPiA+Pj4gICAgICAgICAgICAgICAgIC4uLi4gLjAuLiA9IEVI
VCBEZWZhdWx0IFBFIER1cmF0aW9uOiBGYWxzZQ0KPiA+Pj4gICAgICAgICAgICAgICAgIC4uLi4g
MC4uLiA9IEdyb3VwIEFkZHJlc3NlZCBCVSBJbmRpY2F0aW9uIExpbWl0OiBGYWxzZQ0KPiA+Pj4g
ICAgICAgICAgICAgICAgIC4uMDAgLi4uLiA9IEdyb3VwIEFkZHJlc3NlZCBCVSBJbmRpY2F0aW9u
IEV4cG9uZW50OiAwDQo+ID4+PiAgICAgICAgICAgICAgICAgMDAuLiAuLi4uID0gUmVzZXJ2ZWQ6
IDB4MA0KPiA+Pj4gICAgICAgICAgICAgQmFzaWMgRUhULU1DUyBBbmQgTnNzIFNldDogMHg0NDQ0
NDQ0NA0KPiA+Pj4gICAgICAgICAgICAgQ29udHJvbDogMHgwMiwgQ2hhbm5lbCBXaWR0aDogODAg
TUh6IEVIVCBCU1MgYmFuZHdpZHRoDQo+ID4+PiAgICAgICAgICAgICAgICAgLi4uLiAuMDEwID0g
Q2hhbm5lbCBXaWR0aDogODAgTUh6IEVIVCBCU1MgYmFuZHdpZHRoICgyKQ0KPiA+Pj4gICAgICAg
ICAgICAgICAgIDAwMDAgMC4uLiA9IFJlc2VydmVkOiAweDAwDQo+ID4+Pg0KPiA+Pj4gQXJlIHlv
dSBzYXlpbmcgdGhlIGF0aDEyayBkcml2ZXIgZG9lcyBub3Qgc3VwcG9ydCB0aGVzZSBmZWF0dXJl
cz8gSWYNCj4gPj4+IG5vdCBjYW4NCj4gPj4geW91IGNsYXJpZnkgdGhlIGlzc3VlIHNvIEkgY2Fu
IHJhaXNlIHdpdGggdGhlIEFQIHRlYW0uDQo+ID4+Pg0KPiA+PiBhdGgxMmsvV0NONzg1MCBzdXBw
b3J0cyBFSFQsIGJ1dCB3aXRoIE5TUyBvbmx5IDIuIEhlcmUgdGhlIEFQDQo+ID4+IHJlcXVpcmVz
IE5TUyB0byBiZSBubyBsZXNzIHRoYW4gNCwgdGhhdCBpcyB3aHkgRUhUIGNvbm5lY3Rpb24gd2Fz
IGRpc2FibGVkLg0KPiA+DQo+ID4gV2hpY2ggZmllbGQgaXMgcmVxdWlyaW5nIE5TUyBvZiA0LCBJ
J20gb25seSBzZWVpbmcgYSBtYXhpbXVtIG9mIDQsIHRoZQ0KPiBRdWFsY29tbSB3aW5kb3dzIGRy
aXZlciB3aWxsIGNvbm5lY3QgdG8gdGhlIHNhbWUgQVAsIHdlIGhhZCBhc3N1bWVkIHRoYXQNCj4g
dGhhdCBhdGgxMmsgd291bGQgZG8gdGhlIHNhbWUuDQo+IEJhc2ljIEVIVC1NQ1MgQW5kIE5zcyBT
ZXQ6IDB4NDQ0NDQ0NDQNCg0KTXkgdW5kZXJzdGFuZGluZyBvZiB0aGUgc3BlYyBpcyB0aGF0IHRo
ZXJlIGFyZSBtYXhpbXVtIG51bWJlcnMgb2Ygc3RyZWFtcyB0aG91Z2gsIGFyZSB5b3Ugc2F5aW5n
IHRoZSBBUCBoYXMgdG8gYWR2ZXJ0aXNlIDB4MjIyMjIyMjIgd2hpY2ggd291bGQgdGhlbiBwcmV2
ZW50IGEgNHg0IGNsaWVudCAoc2F5IGFuIGV4dGVuZGVyKSBmcm9tIGNvbm5lY3Rpbmcgd2l0aCA0
IHN0cmVhbXM/IEkgbm90ZSB0aGF0IHRoZSBRdWFsY29tbSB3aW5kb3dzIGRyaXZlciBmb3IgSGFt
aWx0b24gd29ya3Mgd2l0aCB0aGUgQVAgYW5kIGFuIEludGVsIEJFMjAwIGFsc28gd29ya3MgYm90
aCBvZiB3aGljaCB3aWxsIGJlIGluIGF0IG1vc3QgMngyDQo=

