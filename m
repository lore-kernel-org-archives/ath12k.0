Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032A9C71150
	for <ath12k@archiver.kernel.org>; Sun, 15 Jun 2025 08:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:From:In-Reply-To:Subject:References:To
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teQTkmOA9uVKSO5eQZFG7xkKYEjjrKNQp9lcQj0mGTs=; b=MDiS5uSF4qPxW8xe7yWbOn9CgF
	hiYdIdI2w3lv7bHi++cgCrK8dzURnOr/cri7b/D89zEQg5DSHQrgUVtsuOaPGG15Oa8difc2uIxBW
	HXd15XYrjV8tJ39Hs+3PhvnkTmm4KDpnuAfL7bqhRu3aSqh4KIyYvadG7stKyAQB/K4rlNDFeUrq3
	5ohbOila71I82jitM8j49kUn5bTHK+3pniQl060vN3v6APQnIDSvD0GdjHgbh9a43Rf9y6wB5lxcP
	aApN8DO1oXa+rgWI8jLZCDvUgHa7T2NbNdDq54mMAl3p0tjFLTfqH7tdUX/uS1jcp1RVAtFmtvrQN
	kS/CdTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQijX-00000002MCC-2Zhb;
	Sun, 15 Jun 2025 08:28:55 +0000
Received: from mail-francesouthazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d207::1] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQijU-00000002MBm-3C3Z
	for ath12k@lists.infradead.org;
	Sun, 15 Jun 2025 08:28:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nn/YJNbi2kUFDuZPvlEB5CAQdEEipcLPi6vWZ/u1RqoeIOba6D0PooK4G6Lo/Zn9lLjTZjc+QRPpRTBu+GBvHhA8NtDYymoWekxXoA+XPwZ6G2pBXTpSRFdSRC5UC3OqLUeHcWVnu2rT1f0ysuUvucj++w/9iE/gh9NdHGn3Ar3XIEyzzS3f9YDq6Ku09fgW5SECpYSY6U8dl14xtrt/nNp9klplrTQmb1m2gmk9vAe0X0XDLnIq8JDtkyogZUaFC7R1akWNuwBlmlF761RCVMbcibKXR0XYrTtNfY3lCfMgg+YQGWVrI5LGzdrtaNxVO7wGt9//+Cjv5hQEepTNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teQTkmOA9uVKSO5eQZFG7xkKYEjjrKNQp9lcQj0mGTs=;
 b=tf4QfWJx+5hWIidlv3QliWZGvw7uOHeLbl5xPwlUaht+FM2tD4oMWmipewzZmqZ0HCbRQ1avA33KjMDrN2K/LTP8IlRlIIu6U+B7LmcvlVrb/Z5jwZf6kV7J8YL/lThe/4o3FRT/fQkahB/B39MA6a8JG5hrwvgNTloiQwAX12GrwigGwc5MgjkYRpnRkF1s9WEbeCQGIURxyVtFGq/U/B6kaTyFOpMhtfz0WH5h2MsNMWp6ZbqupaWS8tG7nZ+XPXcNGA1+4sVEo11QiJRkGDubtmBOtXsXPBATRQRVSVO81+fMsoyqaXvGx1damt9/u9X28HgqoKPxdlAJ7Ms0BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teQTkmOA9uVKSO5eQZFG7xkKYEjjrKNQp9lcQj0mGTs=;
 b=L80MCVwbuK3p7iT4wOsUHNceEFF2IRcRLXSNbv4z6ioKk151rLBdANkqzY1m5XzmMlCLZUbFCETrYp3eOXDhCrpmkaGjlxbC8kwM/yUk+qi0hZeQuNb6W01out1TfVnbAPMCdBlAAlUjt55bBz5K98xGdSaSV3iGDyufrytbQakGhDLVAl7bAaOsLEBxG3gbrhvlUOiYaRhiVHzdKLcZb7FfO8XOtQ8ZJxqYIwxcQdeRu6LuEw2UqV1+xluVq+IMLSuXZFkNvgB/iU31VGokiCQO50vUzSegFxSGkc0gcF8yNWN9iaORLhcxz23EhESNfmisnDbwSFlg/sB07uwqRw==
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2eb::9)
 by AS8P190MB1125.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Sun, 15 Jun
 2025 08:28:48 +0000
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99]) by AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99%6]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 08:28:48 +0000
Message-ID: <AS8P190MB1205381CAC703C21F90D115F8771A@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Date: Sun, 15 Jun 2025 10:28:47 +0200
User-Agent: Thunderbird Daily
To: ath12k@lists.infradead.org
References: <87c2388b-67c3-450f-8257-38855aba0da5@oss.qualcomm.com>
Subject: Re: High CPU usage from NetworkManager with QCNCM865 (WCN7850)
Content-Language: en-US
In-Reply-To: <87c2388b-67c3-450f-8257-38855aba0da5@oss.qualcomm.com>
From: g <gregoire.s93@live.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P189CA0030.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::35) To AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:2eb::9)
X-Microsoft-Original-Message-ID: <33e1a3da-f77d-40a2-a1f1-fda6186408e0@live.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P190MB1205:EE_|AS8P190MB1125:EE_
X-MS-Office365-Filtering-Correlation-Id: 88912456-61b2-4647-efb3-08ddabe6a6a1
X-MS-Exchange-SLBlob-MailProps: 9qw5+ftluCCriVBxNRHnw/rj2q8X5K21o34t72qND4Mmr+EGE6LGFGEmuKG+gicqzVdpSUGvnbaZPbRTOBxkwNUUOFy0OeXPNZI5KfKQl6NIFC4csMRPj5cgm6RFlUAOv6Ha3mHvi3J68XwmQ6ODojyQ76KJLqC3yllCpD3FxpIxLLgviBOZHG/o8M6v3KD44dNAxcqdXmz/O89sSjooMUkmiLBcd+dnghJBU1LU7C5aBz4kKiCrgOcTTLmly5iWTkIYPJE2eGkwnDelNOw+gL51bsmil+1KNGCnZWO5tq9/NWJw+pvB7LplqB0wdtfW7eWI1zpk/v88iiEvrn3TXHtILePla1CQGxVo0Dvz220WWZ/AHmAs240+a2Y3NTq3IVQK/41Fvy/LCKVtUFtjGRjslU920fq5JF7Eb8N0430pageBFBC4PZ5OvSAF4ZCuJybObTF8MdgMjWJjO3SkXXoxDTKQM75r/BDDHtNsLk6kOKN6jcyNgc5N4XJvC/8TuQ3JC+a5nh2rEqmaKO2jx5T2LQJSRc8diFmUqzKRmvtNTzMrBGyyY8ouDTGo0GrQKaNXGj4MmIRNKxwmkJsFacZmLCtIzUg82l9hsFxTG++cq/NxkyHcIA55m6d15JihkdWapva9koZQjx8SX9cYYnrSgh1WerkUtmjaBA17YmVPRC/2OX4hy9zEjxGeDP/MuplCtMvWkY4=
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|5072599009|8060799009|15080799009|6090799003|7092599006|19110799006|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzA2RTBiYVdUVlNwWm5vZEJvU0tHZDlxc3hoNlFvUWcwZGtqRmlFcWU3emNQ?=
 =?utf-8?B?NDRLYkZzVFpWSHJUR1JKRU53dlozekpkSWg3bVIwVkZzYW9GZDQ5bkJIbnBT?=
 =?utf-8?B?YXpjWHFMU1NLMWVwVko0NDlYR3VienBZS2RFTHB3SjlpNGxXOFI4VmM0SU81?=
 =?utf-8?B?NjluSXVIU05XblFrcnNlS0dXQytwY3JwdWNmeDNXOU9pSVpydHVScm9mOXkv?=
 =?utf-8?B?Ykc2akwrVjNUR0xsUng0RjBkbnVNWUVDUW5FYW5QL2tjeCtMM2IwZlR6UWMw?=
 =?utf-8?B?eFpiMlpBR0t0WTU3U3FjNFA1cm5QeVhtYUVPRmZ5dkYrZzhWZ0hOOEJVZFpX?=
 =?utf-8?B?WlcwRVRQTlBIZ0xHU3NWbmdxRHd0VGU4a1FYQ3RGc2pkMHpkQlgvUkx6d2ZS?=
 =?utf-8?B?RmNBa08vVnNNYXlPdVlNTWtWUU1PMDhIV3Rub3pnREw4Qi82RmpRR3VQYmFs?=
 =?utf-8?B?Qk5QYzFMMUZXZVRFM3lEU3hLR0YyZXo0NnJyV3JkQmkvNTZiY282cFVnL254?=
 =?utf-8?B?YW1aNWZ1akt5R2htVHFQTXJ4dDUxQ2pZUHVZd0hIaWtZcGdrMDc4cXZvTjNj?=
 =?utf-8?B?M1BmdnB0cm83TGUxTGZmQUdqbUxweklSQmRLUjBxTkNoM0ZKNTVnRHptOVA2?=
 =?utf-8?B?ZHN5clZrKzN4c2VZV1BvQTdLR3BwZndHeS9uYktRMXFacnNMYXhjTnNEWHZn?=
 =?utf-8?B?YjJ5SWFuMjkyOVdtNW56R0RxSTRnTDNwQ0xjM0dFM2p5R1Fha05DaGxYcHM5?=
 =?utf-8?B?cTlOZXJ3V1hhTUxnQTlhb3RCV2xWREdlSGJkeUZBa3A0bjFFUEtVU2l5YVk0?=
 =?utf-8?B?TDc5MEczQ2dYNEpFenludlRGRk43U3BLUy8zUlZaVk4yZ29FcDlRNDRaMzhi?=
 =?utf-8?B?ZXBXSlRDZmRxVThBNTZiK2p5a0xaQmlIR1NJNU10TUVJcVR4ZVAwTU10bjBi?=
 =?utf-8?B?SEl2QWRMV3FoSUVIeVhNYzViUllFOXUwdzRNL3FWNFdnd1cvVjhDU21hNHlE?=
 =?utf-8?B?bHplbnpXRnZzMklMSVRXRFplM1hQdjJjdWl4UXZhakI3VEJNeUwvRk1ROEJP?=
 =?utf-8?B?enpYWmhLZE1SVDZDS1dGc2UzWFVPM1hJYjJPVE5JOHovMlFLbWk5UFhaSlV6?=
 =?utf-8?B?OEF3REtmSWhnZnkrY21ocHVGR21HN2RIVytmTm52UmVPT3Y2SHRTRGl0M1Vs?=
 =?utf-8?B?YmZKMWJPVzNrbis2Q3BKTzJtV21HSjhYSUFyaG5FanE3aVU5UEd3N21LZkZN?=
 =?utf-8?B?NXZ1Z3A1bC9UYWFwQ0s2RXo4NkV2U2NDa1BXWmtzOWpqSmF3Y2pJNWovZ2xw?=
 =?utf-8?B?N0NHMldjK0lUUUtaTkwrNjFUa1QwM0VGU2J3dGliaFVFbXRpQzM1TWlUUkFk?=
 =?utf-8?B?ZHFpN2ROWWxVY0NBYkFQV3ZVMkp4ZGtXbnNseG5MOGFyYldlT3MxTmpCcmI2?=
 =?utf-8?B?RWV2K3FWYTVIUWdvUWlWSXYxRU1yKy9uWFJueGpzWVNobVRMSnVEbXBxRHlk?=
 =?utf-8?B?T09wT1NXNE9VdGQ1RDZJU2JJV05tY241UVBDcTNURDUyWVpxQk85WVdsaG1J?=
 =?utf-8?Q?YGOrIOHs+8CNM24lRulAOiI3w=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2NwTUtkYlcrN1NEbHlLaDRjeWxwMEY5QUdVZExUTlVFZ1pLL0F2aGNvUk1u?=
 =?utf-8?B?Mi9WNEVHWXZEUUZHTnBuNW02QnA3aUl4bkxSTGp3QmFUYXFCRm1sSFY2WnJr?=
 =?utf-8?B?NHlXUkpVRjVmcitZQ2tISk9VTXM1RzFYYlc0SDcyMVNJRklhcWt6aEpJUy9i?=
 =?utf-8?B?QWRBdVBUSEJ3UjE3b05hR1lnZXo5MjduRWx1aG5wWmxGRmpmMjFoc3Z1aTBz?=
 =?utf-8?B?WUt0WnhBdlJZelRTK2Jxa0wzMXdBQWtyNUE0OEdjOWViaGhjRThqUkZWWVpH?=
 =?utf-8?B?Mlp2TTRkT1hvWHBoYzA0Tmw3bUgrQVlxTHdNeXVUVFYyUEpLVWR4cWJZTTRo?=
 =?utf-8?B?enlPYzByQzB0UUVEcXlVWG5EMEhRcllENWFYcTNDN0lmOVdadHQ1emZJNkZt?=
 =?utf-8?B?UUlGdFB4VEo1YThmd1NLcStLTXhwWEVnV0hJbjMxaFpxUEtnQTlzMlhXbWoz?=
 =?utf-8?B?Ym9MellPRWhIeTBYd0xVUDEwSCtjVGIwSGZkR1BFbWxaSUptQTQvaTZHNWsz?=
 =?utf-8?B?NEUyR1RRVnJERk5mbDVaNWUrTjVIdlNzcDdsNHpxTFhJeEFVVGpRNHZDeGd5?=
 =?utf-8?B?UVZkak9JUzRuM3lJcTc4Mk1sWDA2amNRTEwvTWEzUWRBU0JTL1M1WVRHbDRY?=
 =?utf-8?B?TlVubkRpUThnelQzL0c5aEVpUkluMkVRK0FqQmRtelJzZk9wU1NHSElMcjUv?=
 =?utf-8?B?Yy9EOU9lS3pxRS9HaXVTdEpydHdkcC8wWlRVa2RFbUZ6TVhsc2N3T2x0Z0w1?=
 =?utf-8?B?dGRsMm1Qc2hJSUt2REVHTlBITElJOTI3MkxyejA5VDJqSTdXZ1JhQmVINWUx?=
 =?utf-8?B?WEd0N3ViYW9tR3dHNlNnMENTYTNwcnhnekxPb2Q5VVdqSSttajc3NkM4aWxI?=
 =?utf-8?B?K3ArNGE2eDFGNWFYdEw4RVJxd2YzZW92dHN5bUJoNjJUZ3RKNVdGWWtVbDB1?=
 =?utf-8?B?SHI3Qlh6MG5iL3YxK2lWaDdzVGpaakxVK1gySE01dnBUMWpHMWdaamNZa0Vu?=
 =?utf-8?B?RXcxZUtrQjFCd3lQZHA2U1JjcnV3eGlBbEtMdjI2ekZYeEMwVm1RWU8wc0R4?=
 =?utf-8?B?OHdNTzRlcU8yT2p6ejBUbVQ3QU9raGZNUXVnMEZWYi9HMnVpS3E1Z2xaNzE0?=
 =?utf-8?B?UTNCRjZpaCs5UytVczlmdk00YlNYMUVIUEI0dEdZM2tBM0pLbkFXcFhWY0dP?=
 =?utf-8?B?b0J6cGYxTk0zMlI5dDlJVGpzdXJ3endmMFk3RUZpaG9MRTliZHM5NVRXU3Za?=
 =?utf-8?B?UXpYUnVzKzFESWZmNEs2QThXSTg4LzR0TmxrVDRJQm02TnU3N2d5TjJpZFBR?=
 =?utf-8?B?QkY4Z2c1aVV4MitDdUR3VytHd3FPZmxOaDlTWnFIa1FtcER5STBjMG9OdDB6?=
 =?utf-8?B?aGYzWlA4ajBqOTlDTC8vNWtqa0ViWityenZ5bFpHQXgvMVUyc2lqMWdwUnEz?=
 =?utf-8?B?YWJ5NmppTGcvZDEvRkxYbGdYYzBwVFJqbUJxdHk0eHZpZWQrMkpFMmZiOVRh?=
 =?utf-8?B?Q0JZRXo3QXluY0d0VE96TE1INUdhRHVHcjRoNlRQcGV2aFN6VmdPaS9EM3E0?=
 =?utf-8?B?bUZ6OUJFaU1IY1dkS0NHOGg3SmVCaDUxOG9CWEo3bGhhVStoRDYwYlUySTlt?=
 =?utf-8?B?T2d0R3FGWmUzZVBjTnkzeVZRY1A4eE5NMXVPMmJSSTdscEIrTWs2aFA2WlRH?=
 =?utf-8?B?cTRWWUFRYXRMbVV2VXpFdmI3THBERXgzTXJsbWs2a2M1MWFCUjc2YUJDbSsx?=
 =?utf-8?Q?EdMTFhfQzOdyOr6POE=3D?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-e6540.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 88912456-61b2-4647-efb3-08ddabe6a6a1
X-MS-Exchange-CrossTenant-AuthSource: AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 08:28:48.8260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_012852_809096_E1772D61 
X-CRM114-Status: UNSURE (   2.67  )
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

Thanks, but this patch doesn't seem to solve the problem.



