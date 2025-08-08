Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D82CC87FD2
	for <ath12k@archiver.kernel.org>; Fri,  8 Aug 2025 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:From:To:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=atRwiYutvUJOfylio6NrNatPGg8JCS82sj5+j+KT18I=; b=q5KVQKGAB3/HU3
	f0a2FA8TbfXMwdsqiWc+DD4nRT7QLSkFa7m22cqW+m+EyfvKgphDOm5k/77MAK+j7LpIuiKmkLs6o
	2/Bbz0z+F1YmshL9ir0+Tg6VfmjBxzGkYJNH/bDPQAEmoLI2tfXNvG0kb3W1wLmv52TqjBw3VPPLo
	T/fDNZdO5luoQtfRSyBe1Tn32ruJ8FIafvG35asa0GmTn8X0Nh5m1gmw4lT0XjXdHZICWx9Db+DY9
	DQQclzP017oSAc/LkydzQdff1sjhJyOZ8j24nAmMDZBvmFHnp8Dv2dJoEIsdQJPiM45vj/tUPvwPr
	29biGN6NIjjTMapOgPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMQM-00000002paR-1Lbs;
	Fri, 08 Aug 2025 12:42:18 +0000
Received: from mail-northeuropeazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d200::] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukM7a-00000002nO0-0fcE
	for ath12k@lists.infradead.org;
	Fri, 08 Aug 2025 12:22:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLooOsew4dp0bnTMJHP58PxErMrAsLncGxcvn83Some/qhIq6FnLBRcAzsi4bd94pmfM4pCZ6jXK3tMVjUI+XB3AFOEBr2jZP9Sva9xU7y/XH37gUoVE+NbrHcR1XGcRLVaoPM9cBnmk+E0LAV+7ukonGbjMXIAwruNwnXnt4wdUouFB5ZFN3ORE4gB7d/YTvr3YIPsq5wI4RdvkeglVJHwEqgVb2PGkozy2askIgxMZ1HdEqzsnhUpKXQTpiqkITC7kCknOsaRwCmfwJsuhB9Afks45jo3vtJ4oE1EtldkE0vXGkEROUdr81ARWsObN0cwRPXw9fOPf6Fmih1RNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atRwiYutvUJOfylio6NrNatPGg8JCS82sj5+j+KT18I=;
 b=SB5uW+X70HBl5uEGebuzTZ0tQ8Pr2wJ3sjtSpJLYLZwHIgFAKe6yTnVNsH78nwfjSdQCvekbMFuAmoeQd5004uintoSbxasu2jWjnkJO7sijzV+USUD68rzAbTr/NXq8J9m08WX13Rp/+a8vd1xIvlqf6Szvaw9FHaMGnG8N59Gr9xNb+TuLYpAASpYWMau9EldJykjIW24jAda0g4ChVdw4fwAKFBZc/836YZ0ahgnfjIMePdkoano8znAGFtsg7UkaSAJRLAxATi+Vzj7/Cdg6j0liRfyfeQCxQ4KInu//9Wp8QgH1DD3AsOwKw/i6JLjMLZ/h4kWxNIyZFiqCGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atRwiYutvUJOfylio6NrNatPGg8JCS82sj5+j+KT18I=;
 b=KFX35WVzOxwnml9JlZj1ribODQTV9C4bU5ZJ2EUdN5KZoxjfPtpje7LRYiWS6UoKtvqLqFVKdRo142zfpV2SZqtx2BXhQkN+IlPwaFAyMwFJ/Ny3npv70QSI6ddSSUBz8zDkjUD7NRfoYwb8Q4UCTsZtgFYSlRRVfzvaI4+QtdIH7qIWWf2uaWGQgarUWqzoIm73XBYYUaDnk8YgS9muKilQDRT7YlACOf8oYeYn8IeCkbB32ZNvACkEJ43IrC6B6c9cM82OZF6hJoD0H9l16O9btcUfy97leSPSDBJ+gfxX/LYaW0s8yOSsc1yrZgwtBfVfzcKfU4F1hMVHOpitgg==
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2eb::9)
 by FRWP190MB2449.EURP190.PROD.OUTLOOK.COM (2603:10a6:d10:184::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Fri, 8 Aug
 2025 12:22:43 +0000
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99]) by AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99%7]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 12:22:43 +0000
Message-ID: <AS8P190MB1205E00E68B9DC98DEBD7CAC872FA@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Date: Fri, 8 Aug 2025 14:22:41 +0200
User-Agent: Thunderbird Daily
Content-Language: en-US
To: ath12k@lists.infradead.org
From: g <gregoire.s93@live.fr>
Subject: received scan start failure event with the last two firmware
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0255.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::8) To AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:2eb::9)
X-Microsoft-Original-Message-ID: <4591027d-07cf-4f83-9f72-ca2966ba6b90@live.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P190MB1205:EE_|FRWP190MB2449:EE_
X-MS-Office365-Filtering-Correlation-Id: 761e0896-b1b2-4c4b-3f40-08ddd6764606
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799012|461199028|6090799003|8060799015|19110799012|5072599009|1602099012|440099028|40105399003|10035399007|4302099013|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUhiOFpBdlcraytCWldwbFZJZDVGRC9NTjZQbm83SFFlS1I5OVNmTS91T2R5?=
 =?utf-8?B?R1lIYlZTQUs1ajk5OXlCOVh6YVFRQjRrNWk4bEorZ1JicVZBczMyNlJ2LzMz?=
 =?utf-8?B?S1RuV1E1azVuMExtUFcxM1R2Y05oOUhYYTE5UXFoemxwTStQWmRZTTdNZW5Z?=
 =?utf-8?B?ZncyWld5TlVuNmkvNEQrWU5TRGxLaHRsaUcrWGpVVEpSbStJcUdtY3VoWGJ0?=
 =?utf-8?B?REZpNmxPRDg4U3FFYlpzUlU0V0dhaVZ1ZkI3dXpyRjFCTk1sUUE0aDVzVVVZ?=
 =?utf-8?B?UUNieGp3a255Y0luWlAveGppd1NlS3N2NEpoSHUyMVJFUzZiaVFLaHU4Tit6?=
 =?utf-8?B?dGFmT21pdEppL2lWV3ZXWjJBVS81alJiYTFqQVNRVXhCQklRd0N2WDB4WUZB?=
 =?utf-8?B?Z09WU1lHVXM1Q2ZoUzEvekJ5bmVpUnlmY0k5NTRaU1kzN3ppRWFEdWVhS3Mz?=
 =?utf-8?B?dWM1VEtRenZhdXJQWjBpcFpRZXlnMEx4a3dob2dnUis0VFB1TE0zTHQ1eEZ3?=
 =?utf-8?B?T282eDRJWjNwTFFydVVLMVV4OUp4NXFhTzlCSDFQbVdSSXVlYUZEYW9ONE1G?=
 =?utf-8?B?R2dPVENCWXBXM01saElSUmFQbXh1ZlhaZUpCZzlMYXpKalQ3a0xWNUtPM1hm?=
 =?utf-8?B?TkVaNnhhaXRjcU1ESTljRzA1Vjg1Q01sQ2hNa1U2OGMxZTBUQStGaWQ1REFG?=
 =?utf-8?B?MjV2bzduM0xkWFBlRlJkVFZ6cTZZU3pYTGV0TTI3VVMzTDRpQ1F4ZTVXQnls?=
 =?utf-8?B?Qm5tc2FESWRZN01ZL2U1Wjg3bUloYTIyaHM0NnNNbmhjcHBqdjNOdTlZaTFI?=
 =?utf-8?B?ZFJ6TG1lK0U5OXRnS2J0dENHTlNIY3lodit3V0pQS2lwc3JRSCtZU0xERmMz?=
 =?utf-8?B?K2hqTW9DQitJZnEzUGZVTjJUNzBKUWFsM1JxK3BMRkZydWloZ3p4MzBYTjgw?=
 =?utf-8?B?RXdncU1ZQ0NlY0pIL2pHTFBaUXZpZ3pCQkUxTXpQNVNDWFQ1MEdsTTcrMVNR?=
 =?utf-8?B?OHNQb2JOekdRS3F0a2NFL1o5a21HQTByZE9HYVZtMEF0bTNaZk5MRFl4Um1K?=
 =?utf-8?B?Y2dBSFhuMUtZQzhla3d0aHBvZVU0QjNlZU4rR3NsZFBuNVkzbXBFbkg0L3ZS?=
 =?utf-8?B?SE56M040OUZPOUhXeGxic05iczI0WWRVSTdPMzBuUXNMQmRlNytLWXhTNnl1?=
 =?utf-8?B?M3lPWXdFRGtidXovRW5pM3JJUFBsaWZQdEhIUU5jS3JQSTA2T2Q5VlhMbXUr?=
 =?utf-8?B?UUNSMDdqRkFOeW9QQ2d4VEI3NlY0WUk3LzZiblIxbUVkS0ZWSGMweFhPZm1N?=
 =?utf-8?B?ek1QYTd0Vk5SMHBiS2Y1TXNzeGppUEFOZGNRRWppNTFuaEV0dG95cU1abkRD?=
 =?utf-8?B?dzJlYmJsSlYyVFFRazh5eGJqeWw3b3E3V09nMmZLL2xmQWp3VzRzRUtSOHJN?=
 =?utf-8?B?cU5lUFpkNDVVaHhScWN6T1pmWW15cDlmeUlIL2JwT09VV08zemV1VGZRMVd2?=
 =?utf-8?B?QnRvTGNkeUgrUDVQVUZlc0dhTUlEY0N3akV0M2oxb0RFTUNJdTJ4anFCYkU2?=
 =?utf-8?B?WDZRck5KWm1hMEhzZzdxU2l3eUdNRzVDa05tbHJ5Nk1WUnl2Z2MzUlRtbVgv?=
 =?utf-8?B?aDR1Z1M5U2JQV25EWUlxMkJVdGFKdHhNemJyV0wwNlZNZzcvVEc0OXV3ZFpJ?=
 =?utf-8?B?dSt1ZHVwMUhwQVBEWnpkcWtndk44VGsrWEhQNFZVdmExaG8rMklEMGZ3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTlEaGEzYXBtcW5KMmxTcE1sZXFYVjZvdDlHeTF0M1lqcUN0QmtKQk50SGRW?=
 =?utf-8?B?eTMwSURjMGZPejREQjJtNlo4QjFwUk4wSTI4VXNVOURpK3hKVEdweERZQzlp?=
 =?utf-8?B?NU01N3hBNzNwRFM5ZDF6NGZ4T0JaOEk5YW9oWE43MFVKN3NVTzlKRDBXWm9V?=
 =?utf-8?B?MFVWNUFmMkRYK0U5Mlo1SEszeDFlY25GOFB5L3FINGNSR3pDZXVreXdPVUZi?=
 =?utf-8?B?K1UycTRhVkdoS1dQS3hWLzA1cFc3UWc0MmU3aHA5Y0oxZkk5NENVWkVWb3d4?=
 =?utf-8?B?b0NaNU96RkVsT002M1h6dGFFdXFScWRQUi9YWDFDY2txU09WYWZzS2RYU01j?=
 =?utf-8?B?QU1RU1NVNDRwNjBaUWVvQTloWHRBdEY4ZjZvc0lBTDZPeDJ1alkvbGpnU2lO?=
 =?utf-8?B?UUF2R1dOeTNVNlBuQXFMZWlzV0NZRHdtNSswYnpaU1AreXVzSjhmNWtRMVpk?=
 =?utf-8?B?YnpMSHR3ZXEyUEdSb3V6aDJoc2prMnlMY0NsUXZEZUUwNFdaa0REa0VKSXVo?=
 =?utf-8?B?cVVTN0JMTVJYRkN0b2N6WS9UZFNUWWRudUhVV3dxczB5VTR5Kysyc2hFVjF5?=
 =?utf-8?B?UW5TMjd0eHlMa29POUhnNk8wMjJVOTlrVTdQaEhtaW9hVE1JMy81M0gybGIx?=
 =?utf-8?B?WXY0aStpK3l5VER6dU9tc3h0bllDUWNSb2JtemV6bGErQnVJNzduaHpSVnhO?=
 =?utf-8?B?c1dET1p6STNiSkpTVGJDYXF1by8vWDI4bzNNY0gxYzBrUGYvQXVhS2lMTUt3?=
 =?utf-8?B?YkFTcTNTZmxPcjRHdFBXTkxrQ2Q0WlpJRUN0Ly8wa05tOGtsTVVBT1FZT3Nr?=
 =?utf-8?B?N0FwQjBhZGxkUHpKa05RaVh5dGdDc0hVdVNzUGNOQVlLQjkxSTF4Rnk0NFpt?=
 =?utf-8?B?YkIyZUpZOGd6eDNnZUtqQWswZjEyVlFlckVsUStKVDd6Y2ZTdXNkMVd6MDFy?=
 =?utf-8?B?MnRhREZRUS9FbVZud1NFb3lUN2tsN2lSU3cxNlRWU1llZXh0L25zSnJLL2VK?=
 =?utf-8?B?cEtKU3F5YjYyU290cDJoTEhmclBoZjM5SUJLVk5DV2tyK2dWMVBOSXVQb090?=
 =?utf-8?B?MWFKVWFDb0l6dDIwa2pva1VDVmZjVXBZdGc0OWlHalVQMzFxc1pkSTl5QTZw?=
 =?utf-8?B?NWhXZzZOZ2FmTlk1S2JaTGFmaXVaNjBIVlNoWlRFZXVib2l3Uk9WSVhlK3hy?=
 =?utf-8?B?VmRKZmxLZHhUSGF4TE1oSFFEQjRvejh4aW1YblZWbmxZdnF3NUloSzdIOE9w?=
 =?utf-8?B?Rmg2YWtobnU2Z2h6MDdtUnUvNW9acnA2Q3BWbkNHSXNtdWY3UVVkdlg2OWhy?=
 =?utf-8?B?TEFZZEEyYS9qL3ZvZnV6ZW92NlhKbGJiT0NrNVE0cEc3RGtLcDJDNW1Oc0U2?=
 =?utf-8?B?UHdCalpUUkRDZWdCbCtIZ1RBZFRiMldlbXdsbGEzTVZsYTk5WWtvdFJhVHdx?=
 =?utf-8?B?RmFuakQwdk0yL3YvMy9uRzVFeVJzcEtoOHpicXZMZHlINnhQYXJFbzhtcVhF?=
 =?utf-8?B?TURDQUhtTGFUdDhYd0VYR1F3WnZjYmdabkZMT0NmYVJPZjVRU004aE5Ta2RZ?=
 =?utf-8?B?UVV2RDY3dUVsejZ1c1orYmpwYmxIN2MzWGdmWVJxb2FhaVZ4ejdLaFlIazVS?=
 =?utf-8?B?dUJTRnNNejhBSGZVKzJ2UXZOYU9lSjFweStibU03NThGRXRVRnF1bHdOWG92?=
 =?utf-8?B?RVVTMUNSVnQwRjVMd3hHUWhxckQzTjYrbWIzTWpBQWlBMWRpaThnNHdCVmhY?=
 =?utf-8?Q?CDniffQYaP3Hi6SIeI=3D?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-e6540.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 761e0896-b1b2-4c4b-3f40-08ddd6764606
X-MS-Exchange-CrossTenant-AuthSource: AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 12:22:43.0575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP190MB2449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_052254_211739_E8DB68C5 
X-CRM114-Status: UNSURE (   4.55  )
X-CRM114-Notice: Please train this message.
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

I’m seeing an issue with the ath12k driver when using certain recent 
firmware versions.
With the latest firmware, I get the following error:

|received scan start failure event|

If I manually restart the driver, sometimes scanning works, but other 
(most often) times it fails with this same error.

Affected firmware versions:

- |WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3|

|- ||WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3|

Working firmware version:

|fw_build_id 
QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3|

With the working firmware, scanning and connect works every time.

I am currently testing on the very latest Linux kernel from mainline:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37816488247ddddbc3de113c78c83572274b1e2e



