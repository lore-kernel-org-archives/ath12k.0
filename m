Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D3CC3DA4A
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhgRFpZ8aDDkPoMLqC2Cz8DmsmAgWA8qzVBdgKyjETM=; b=QnR/x2x1ize/rFjA93ZKttNgry
	z2CgFQUh57JTTzE6Nlj8AO6e8HeYb0MzS1oc8GPQ/6cGit9k7NVOq2VVtfJlJ7HqI+l2u8kQWFjZK
	PlU7Tx0Nzu6X5GlwkZUr3dJKnvJ3nRtH7YuIgx4d3rQ7dW2/ILaG+KJWctNhMFH3iQg0hkppu/9GY
	7zvmd5jegf0+gdBE8WvIntO+uGNlhQCNkQPRkBDbvTtXxfrJVCK5cBXnpLXc157URu07rX4fMVkms
	UwD/DLugUkaAxBuWFwo8/MAS2VQQoYpTe7OOXA9DkcbkqHddIs7IIefblMfIQPp9AgP9RFj03CDYN
	lUlRU2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seHKw-00000007knq-1bNc
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 16:59:02 +0000
Received: from mail-lo4gbr01on20701.outbound.protection.outlook.com ([2a01:111:f403:261a::701] helo=GBR01-LO4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seHKt-00000007klr-1uA1
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 16:59:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPf+IhcmKaUiva+DU+6oHn9RNS7aLOKvTk0Az5QlE0FS4kJT/NkTLo/qqos9xHj63vOL29ctweS2am3rjK7cVyfSdPGAEv0LVqyr2cxF3Z4nkRSx7/9KowCjmTEzN/fFP5HlUFyl5a3R8Ng0zG77NCdaIVLkdjxCByziZ8eTH4S/1v763bjJIRnHV3TdQ19ooFEznafOlCoyQnp+XYlmIqvsUEog4vMm42nh8KUX3J3Bjq2OBlqjBemTIFIiiOpWP1B24aZnUEkNZ66axIvry+MnCuZ64Dxb1nBbqTy0R4roq/7lmC+kzYPJT8WmmKkFrIABe9hXGF8mnC/QePajlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhgRFpZ8aDDkPoMLqC2Cz8DmsmAgWA8qzVBdgKyjETM=;
 b=ScYuWXIO7QMVu1G08UMfe24eEbuBcSGTi9bx/yotFjMWHQtiJ8ZFgAdM8XWE6ZvVtyQWqUkd6BN8P1eJi2NC5krkL5Y4jEMpmWAzpd+1nkRtTXCd0fOxvOKr+eLp1qNZCtVc8esMKAWuhWPjWFoA+2SElgJaeVynECd9/0H6mQybFbfZM5HbXOsZ2TvQl5iFJEUfZORUBZ7O6ptPUH8jtB7o9BIGd0adGt+LCu6y/mblKiLhSBiXpUPuExtybQBeCZYP+50drUVNPceKkZH/dukFwMUduhd7YRNMJdEOCqn3CZfmZAqIoOHcrMUej5EBZwnvR3xG9oz5+ENCGhg2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by LOYP123MB3504.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:11b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Wed, 14 Aug
 2024 16:58:53 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::493e:62d6:55a0:48c6%5]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 16:58:53 +0000
From: david Atkins <david@3adesign.co.uk>
To: Baochen Qiang <quic_bqiang@quicinc.com>, "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
Subject: RE: wcn7850 issues
Thread-Topic: wcn7850 issues
Thread-Index: AQHa7jVd5TGZt0mXvku3d4N0Q93CIbIm+bUA
Date: Wed, 14 Aug 2024 16:58:53 +0000
Message-ID: <LO0P123MB40574C13309402873741CA35D6872@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <480c4cbd-cacb-412f-b23a-14177a3acc05@quicinc.com>
In-Reply-To: <480c4cbd-cacb-412f-b23a-14177a3acc05@quicinc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|LOYP123MB3504:EE_
x-ms-office365-filtering-correlation-id: ed94af46-8907-4488-aef3-08dcbc8260af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Rnl1Y1NkOERXbDNuU2h4UUpwbGQraWM1bVRNbHpBZSt2N2VvTVo2Si9IUHVH?=
 =?utf-8?B?dEx3ek5VOHdYdFdQQTdzNEplV0NHMWFGMzVvZmFYMG1lZWlneHRxK1Y5SjBw?=
 =?utf-8?B?TEw1UldSek1rT1ZrVThsY2tIdi9xUFdXNUg3eDk5MFJQM1g1L1pBaGgxU0Q0?=
 =?utf-8?B?UEsxNENlSHFTaVpWNEN2SjI4cmpENlNkUWJtSFN4ZzRJVHExRzhsa3RPMnpj?=
 =?utf-8?B?RWZ2K2Z6Q2xtVlpxOXY2T2RENHgyMTdpckYyNnhLWU5HVHF5SS92R1IwQi94?=
 =?utf-8?B?ZWN2dG9MUGZpSWFQMk5hRXVHTm9uYVR4Tkp5N1FqdERCaDBNa1AwZ1hlOHAz?=
 =?utf-8?B?cUlOQitlaEN4b2NWemZ5T3lPMC9DczRpZmJFcGdtSnp2WUdvMHROOFZhV2ly?=
 =?utf-8?B?TTgrNWptRmMzM1pLQnBMRWxFYnFaMWd2dDYrZDVmLzhKMVdnZC9XVHE5b3Fh?=
 =?utf-8?B?K2laUlVhMWRvNnVmc2NsczdEOW00NllBL04wUENVVUhrSkpSKzA2RG1tWUhN?=
 =?utf-8?B?Y3J2bUNlL1J6UFpTc2l0WE4rMzFacFVDTDB5SXRvVFlxK2VGeVJsOU5ETnpa?=
 =?utf-8?B?TStkYzZZU3VEVGpkaHIwQng5RFZ5bnFYT3U1bmJtZjJvanh0Z3pWbGc5R1g3?=
 =?utf-8?B?Z3lKa1J5VWtGNXE2R3FidXJYSjNLM2FLSGtlQitQZU9kUjBUVDh1OGFXQzJU?=
 =?utf-8?B?RkR2c0JXc2VhMXJYVlhNR092Nml0V3B0bmVLWEdod1ZWY1ExNW8wNE9ESjhJ?=
 =?utf-8?B?NmFsT0szKzRZRWRrVFQxZmFOd2FwT0E5ODJMNmdWcVpHRG9xcWJnMGFEV0V2?=
 =?utf-8?B?eDZjWWhFVWwvMnYrRCtEWFVlczBJZ1hrRFhXbE9CQmtla3BqRG9OKzhkVjJk?=
 =?utf-8?B?a1ZPMndmdkhZcHhSTGlSeXZXeFpDVTVXaVR2K2R2L3FPR1Z4WXRYYXF4c2w4?=
 =?utf-8?B?Nk0zUkc5T25EcmszOWxmVkhQNVpVSXdwWnNMZE9nQS9Ta3hxRE11TXpVc2dp?=
 =?utf-8?B?Q3JLTFQ0NHNLanRkRHBEbC9sQ3hDN3ZyeXprcXpmaTNQeFZ3ZmVQOEpyTUpq?=
 =?utf-8?B?NjFnem15STduT3JlMU5RNHY1b29sZTQxa1g3MnA0cTBxaTRNMHc1WWxzVXFv?=
 =?utf-8?B?YVZKTzZ2OTdBYnBJNlBqQWgyRGpDVExiV0V6M1E2eWN4U2NCdVYyY0RyYWpB?=
 =?utf-8?B?b0ZmWG5DN2tSeC9Nb2tSMUE3MENRWkpXWEwvb3E0VUtpVkFNc1JnY2NvaXN1?=
 =?utf-8?B?NjV5MG5Ja2F1TUkycG0raE16UEFVeGpqalZzRzRiSWswUDRXMElhcGRkSmxN?=
 =?utf-8?B?S0dyNmFFY0YvZ2QvbEVUSG1tOVFkb0dieElmLzk1OERwOUVIanpML2Q3Y3dZ?=
 =?utf-8?B?dWtZazFQcXc4UEJrZEtFSW5WbFk2UHQ5VkRQMFhtOGdRVnh6Vzl3RnNSa2Rz?=
 =?utf-8?B?VE53TTQ1b3hRS0Z2amx3RzdXL3lVL044eDVseTV3alZIeUF2blBycUtqV1Ji?=
 =?utf-8?B?SEhudnFpVFo3eU1GZzRlcVZvdEcvTWtBTm1hNFI3bGVNZTRDNEtiMjlXVnds?=
 =?utf-8?B?VEdGTWJhUTYvVmMxMUlDeUhWQm9CQVVkYWxXL014alZTMGROblVZeDJyaVJs?=
 =?utf-8?B?YWFnU1h1WmROcGIzOFRidlczbGpyK1AwSjBhQjZzYloyUnFNNXFyQzRGRi8w?=
 =?utf-8?B?eU94VnRNNUNGMzRvYjJHNmVoOHE2ZEtpZGxzS09CSlZwbGlEd0pRYUIwRHVr?=
 =?utf-8?B?Y3BDY0tCUU9tMXFmZklaZDdnQXg4dGg4ZHZJQm9aamNpUGtoZUdaODlud3k0?=
 =?utf-8?B?Z3I3a3RtU1lZNWVXdTRsZDNnNFR6bHJMRFlJVkNrUEM2RXcvbWk1YnlMRkVk?=
 =?utf-8?B?SnRQN0p5clNJS1JrTlRVSTRtK2ZFbVBJa1dlUHNkWWJaWkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0hEWWZTSWNSTDdCcjB0Q3pXYzRscUllTmFRWVBGWEJjclVXSDhLcTFtQU93?=
 =?utf-8?B?VTMvV3dqcURXbFdicnBtSElIQzFGYXF1WStpS0l2SXVSWWZmOG56Y0p5SHdy?=
 =?utf-8?B?MkRiRHFSdWNRaHZhcm5INmJSQzRPUGtCWHR4eXNOanVadG1OWndYYjlvNzFY?=
 =?utf-8?B?elhncW0yMDZyaVk5Nmd3Tm04c3ZGNkk4RGkyTnNmY2o1Y1dqMnBrcWF0MkdJ?=
 =?utf-8?B?cE1veHNtVTNWQ3JPNGc5bjh3elBTblRVbFJkQnhkNXV4aWQ1T0NGeGdkNEV2?=
 =?utf-8?B?clFwWTZPRW5hREowOWIzdTFkam1KT2NsSm1WZHkraUw0WjBtSnc0L2cxTENi?=
 =?utf-8?B?V2I0LytKOTVQNVllbEtoQU9vMVRqR1ArcGFiaTR2bWlERCs4WFNKZDJIVWdQ?=
 =?utf-8?B?Rk9KWEhISUdSY2FoZ3I3ZDZ2VEJtcndZOFdMV3pkMFNpcVlKeXA1QUhRck1n?=
 =?utf-8?B?c2RBeVE1b3U4RlMvMnVWQ1N3ZmM1MnZReE1SOHVWTDdhSzRrc3hLQUt3Y08y?=
 =?utf-8?B?T1RudjlkOE5KS0U3WE9Ec2J3dmE2cFdoVWU5MTRrN3FjT2JUV1JKamlmTWV4?=
 =?utf-8?B?YnpMamRWQkNuaHdMNWZYQ2lrMTZUL0xUdCs1T1FXWEVRYTRPYVlIc3FyZTMw?=
 =?utf-8?B?VWNtQzFDUGw2N2ZmWFdaUC9LeE1TUDZGeWJkR3E3SWRiZUV6RmtEYTNxL2hi?=
 =?utf-8?B?RkdqY2xCMDB0dXNuNGk3Y3hQWjl6aTRXL3ZaRFBLYVFnYWdzMTNMYXpJaENG?=
 =?utf-8?B?V0M1RDlxRDB0RFB3RDBXa0FRTHU5RWFIWUI1WlcybUNSd1ZGYlVhZEV3VDl5?=
 =?utf-8?B?VFdjWWY5eTU2SzNDVE40ZVBJZnp2Znkwem5ETW9DQTRicURnTC9Sd2s4MHBU?=
 =?utf-8?B?dHQrVmRsMmF6RnpQRXN0R0M2S21nSGduRkk2Q0FIcTJBZE5IMjlkSy9mYm5j?=
 =?utf-8?B?a0c2dXNuTWNFWTcySFZjZ0RXeXJkbDNQOTFMTFBsNTFGWGJHcmh1WmdKMnhl?=
 =?utf-8?B?Zml4bWJvenRJeTNkUDJMUURHZEJCMmhNOEpwbjg0ZGhNM0RLYUpDV1lsY0Jh?=
 =?utf-8?B?YlcyS2s1U1RvZWU2RC9rVzQ0NzI2RWR0Zk10d1Z1bEhmeDAxQjVQQ3RpSnV6?=
 =?utf-8?B?cTRsM09pSi9EeUlYWjU5dmQyeDgrN2cvZGdSaEhOS2N2QkoyakxDTnJIRUpw?=
 =?utf-8?B?Si9uMkRZWVkzRG91Ny9HaFFHTTFJV0RJYVlWcElqd1VIeXlhZjZveHM3dUd0?=
 =?utf-8?B?UiswVnBqT0s0WE8rMXF0d2h6TVAxcUdwTW5tTnZjcWplV21ERzIrdllza0kw?=
 =?utf-8?B?V2gxZjY5S3EvTHBoNEZNczFRNmJ0RkpEWUl1N0ozSUUwZldrNWlXWWptb01u?=
 =?utf-8?B?L1FZbnVrMzJJMHJFVWdvRWRsUG5QNjQ0UHFHMGExS0hkTmRaUVcwVkl5YXdr?=
 =?utf-8?B?MXp4QWdEZG9yZmxSczVZRXJNczlPY3hzRUNlSGl2RUxGaFkvc0xURTFMdWVu?=
 =?utf-8?B?K3hKRU1QZHNYWFBmOXhSelNTZjQ2VkRuNzZDaEFLb1BoazFHcGU3YmVmcXBJ?=
 =?utf-8?B?NjdMWHdEelJNbEFtK1c0V1lJSHRHUVZUNDg1cHVwY0xqc2Myc0twa3VhK3Vq?=
 =?utf-8?B?UExnUzR0TDlWS3JyT2RFbFZsajBnemJVaS95OFQ4QWtnQVh5MmpPczhFQ3Yv?=
 =?utf-8?B?VHIwQ2pSZk1rT3FPZEJPRHZsMXZkbnlYMFNpZElPQ3RkYlVxeTZIQXg5SGp6?=
 =?utf-8?B?NEdnekpmcGs2dXNrVDQyTkUwVDhMY3B5U01tWjVqY1g1VXBtdEltTWlYY0Rj?=
 =?utf-8?B?aHhqVk1NckFObDZSa1VGUDlsVkJkb1hnNEgrcTVxZHdmdnk5eHNRTWVvc0p3?=
 =?utf-8?B?eWlSdHpKZ1NNcThxYisrT1VPRXJOM0c2TVBzUFVXV2JHbTA2L2FWenk3ZXBW?=
 =?utf-8?B?UGV6S2czeHVCQnU3R2lMeHJOeDRnMCs4Z2cxLzVqUHdpakVhOGYrSzRpWkRZ?=
 =?utf-8?B?bVBRNmRCL0ZqUmt3UmZ5NWdrNFRXMU5zZkZzakxwcmVYb0laZWdGeXFDVlFV?=
 =?utf-8?B?NWdVb05Cc1BOMzJZZ0ZvbmpMczJ6R0pBb3BEUEtWQlkveU9heTlIcmFwd3pm?=
 =?utf-8?Q?yTY0fDdc26qQP0iCowFqWdh1R?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ed94af46-8907-4488-aef3-08dcbc8260af
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 16:58:53.3347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N+Y55vW2FsxePC1xnr1aMv+RWrNI6QYtQ8ZEsWerMm91hmLak57Xru1dNF4FHJLwEJgKBkC45td4y8BTXFoGAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB3504
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_095859_519744_76A5C04C 
X-CRM114-Status: GOOD (  13.13  )
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

SSB1bmRlcnN0YW5kIHRoYXQgRUhUIGlzIHdvcmtpbmcgd2l0aCB0ZXN0IGdlYXIgYW5kIEdvb2ds
ZSBQaXhlbCA4Lg0KDQpJJ2xsIHRyeSBhbmQgYSBzbmlmZiBvZiB0aGUgdHJhZmZpYy4NCg0KRGF2
aWQNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGF0aDEyayA8YXRo
MTJrLWJvdW5jZXNAbGlzdHMuaW5mcmFkZWFkLm9yZz4gT24gQmVoYWxmIE9mIEJhb2NoZW4NCj4g
UWlhbmcNCj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMTQsIDIwMjQgMTE6MzMgQU0NCj4gVG86
IGF0aDEya0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiB3Y243ODUwIGlzc3Vl
cw0KPiANCj4gDQo+IA0KPiBPbiA4LzYvMjAyNCA0OjA2IFBNLCBkYXZpZCBBdGtpbnMgd3JvdGU6
DQo+ID4gSSBoYXZlIGFsc28gc2VlbiB0aGlzIGluIGRtZXNnIGR1cmluZyBhc3NvY2lhdGlvbiB3
aXRoIHRoZSBBUCwNCj4gPg0KPiA+IFvCoMKgIDEzLjA0OTY3NV0gd2xwMXMwOiByZXF1aXJlZCBN
Q1NlcyBub3Qgc3VwcG9ydGVkLCBkaXNhYmxpbmcgRUhUDQo+IHRoaXMgaXMgaW50ZXJlc3Rpbmcg
Li4uIHRoaXMgbWVhbnMgRUhUIE1DUyB2ZXJpZmljYXRpb24gaW4NCj4gaWVlZTgwMjExX3Zlcmlm
eV9zdGFfZWh0X21jc19zdXBwb3J0KCkgZmFpbHMuDQo+IA0KPiBpZiBBUCBJRXMgY29udGFpbiBF
SFQgb3BlcmF0aW9uIChJIGd1ZXNzIHNvKSB0aGVuIHRoaXMgbWVhbnMgQVAgcmVxdWlyZXMgTlNT
DQo+IGxhcmdlciB0aGFuIDIgaW4gaXRzICdCYXNpYyBFSFQtTUNTIEFuZCBOU1MgU2V0JyBmaWVs
ZCwgYmVjYXVzZSBXQ043ODUwDQo+IHN1cHBvcnRzIDIgUlgvVFggc3RyZWFtcyBmb3IgYWxsIE1D
U2VzICgwLTcsIDgtOSwgMTAtMTEgYW5kIDEyLTEzKS4gc28gY2FuDQo+IHlvdSBjaGVjay9jb25m
aXJtIHRoaXM/IHlvdSBtYXkgYWRkIHNvbWUgbG9ncyBpbiB0aGF0IGZ1bmN0aW9uIG9yIGp1c3Qg
Y2hlY2sNCj4gYWlyIHNuaWZmZXIgaWYgcG9zc2libGUuDQo+IA0KPiA+IFvCoMKgIDEzLjMwNDI3
Ml0gd2xwMXMwOiBhdXRoZW50aWNhdGUgd2l0aCBhYzo5MTo5YjpiNzowNTpiMCAobG9jYWwNCj4g
PiBhZGRyZXNzPTAwOjAzOjdmOjU4OjM0OjQyKSBbwqDCoCAxMy4zMDQyODFdIHdscDFzMDogc2Vu
ZCBhdXRoIHRvDQo+ID4gYWM6OTE6OWI6Yjc6MDU6YjAgKHRyeSAxLzMpIFvCoMKgIDEzLjMxMjM0
NV0gd2xwMXMwOiBhdXRoZW50aWNhdGUgd2l0aA0KPiA+IGFjOjkxOjliOmI3OjA1OmIwIChsb2Nh
bCBhZGRyZXNzPTAwOjAzOjdmOjU4OjM0OjQyKSBbwqDCoCAxMy4zMTIzNTJdDQo+ID4gd2xwMXMw
OiBzZW5kIGF1dGggdG8gYWM6OTE6OWI6Yjc6MDU6YjAgKHRyeSAxLzMpIFvCoMKgIDEzLjMxNDc4
N10NCj4gPiB3bHAxczA6IGF1dGhlbnRpY2F0ZWQgW8KgwqAgMTMuMzE1MjQ5XSB3bHAxczA6IGFz
c29jaWF0ZSB3aXRoDQo+ID4gYWM6OTE6OWI6Yjc6MDU6YjAgKHRyeSAxLzMpIFvCoMKgIDEzLjMy
MTg4M10gd2xwMXMwOiBSWCBBc3NvY1Jlc3AgZnJvbQ0KPiA+IGFjOjkxOjliOmI3OjA1OmIwIChj
YXBhYj0weDExMTEgc3RhdHVzPTAgYWlkPTYpIFvCoMKgIDEzLjMzNDgxOF0gd2xwMXMwOg0KPiA+
IGFzc29jaWF0ZWQNCg0K

