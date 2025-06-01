Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329E9C54FB3
	for <ath12k@archiver.kernel.org>; Sun,  1 Jun 2025 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:From:To:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B3jf47nA1FgESkmGu+7Ej3lBs8fHUYkldef1NcPCDZ8=; b=vwfRdbzSaV47GH
	6eZ4UP/zKygABpfaTUZhFXGrJ30k50Jixq+cIUvisDgN00su+344EFCJH20tV2eKaoBTFrB50NxVy
	YRDiFGsm5z1Gl2lHeqTrnpJstPANk1PXowYgu4Ity3fl/WAWWRTf+NUXZ3vEJNoj4+YkZCQ9e1wxz
	GysSIxxHkBzzLpmAGcesYPPCd97MmRw1ayDaSVYOf0Ldl9tM6Hm/eBcnRCWmmodrjRONsjlo++WNd
	IoN5y3Vh+75PRbFk3r43G8oJ7n9GfJoIYgo3lqPLADm+fi5mjntxVdVfvEh6B9Fdq/5Yb1uGvQP3L
	L94geeDie/yg8uELQzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLeSE-000000054Z0-3QxF;
	Sun, 01 Jun 2025 08:54:06 +0000
Received: from mail-vi1eur05olkn2080d.outbound.protection.outlook.com ([2a01:111:f403:2e13::80d] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLeSB-000000054Yc-31ik
	for ath12k@lists.infradead.org;
	Sun, 01 Jun 2025 08:54:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TsSLCQ63uCRMtzQp4YHzsucP8tBgmv81hZCLTnoLBbAxjszwH2xZjwEmXLOS8Aem0AOUkjAjL0DaV8tBG72R5PEWT9ZwKp+V76DVi5+EwhPwSlZwMMU3kIMHcUZ3YMRHY3Pz3MR30JId4m5cV2hCC49gW0GppU9PdP3VMaeY9b1YxU5UohvInvE4htfvfO7aJDmPS7NuOEdXcEc1hAy+lIsl7GOuXjf0kx9r4SyEQmwUqOgH/MKC2M2AMZgJNX0L3cGxgp14NlK8Iw+4qx44Pk9xjkTqfS3lGjmOkUz7GnGxBEXnbVvyXZiEGCOgHyOmT5gLyylNJqKJ0waBbkURLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3jf47nA1FgESkmGu+7Ej3lBs8fHUYkldef1NcPCDZ8=;
 b=CneRaCiS81sbPU0eTK1DLZjDLQkB/F8GZaR8+Wot6KEpgw/w0b6hGg9PsYu29UWkEAUPjJEq7DKpplnnRQN1mHcVGH4fzoJIB27Y17M8Q1jXEURRORydLLEB+XHPBZFmLaxn6IQ3YLrDd5D6oqXZ8VOBEYphbCwzg4aZcPKotxr4mc/ezGbFTJ9fpng9ImBvwC764dGQGI6YO8FdhuFdNpLdI8rDu2OUV12NK3+2f/Nf/FDuXck4MVe8kP7EMQM1vJ520ATCGx9uwyei443WHz0pP8UG9gdgYZXZpQzsKgvC34vzKcO+CEpWSqDe6i1XhdQkBzaXLt8v4Tox1P3kXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3jf47nA1FgESkmGu+7Ej3lBs8fHUYkldef1NcPCDZ8=;
 b=GEf1kztkVyE8fgq5F9BU3im82Tqk3HcUdLGjIqhB+/CMV8z5wqZf+3phbANZ4e1iRwH2IXRrIFttqRUkeCWM3vFOV2t4XCyZSd7TnIs7ro6y/X6YxV2nmgERq5albTcqXpOBcp8pfgIzlWgooLN/uMDMQHA7G6IH0ojlC6dVpUuvJXRUoOne0GVrdiUYsgjhCVZDf/12j4z0iod2Grclk982Q92iImEvVBn++z+iit+WZy4G4CfWISVMHC+pKyDin9yrtTkm4k4U4g/mVI/xFlsLWAGBmJwO+tFkphyAI7tISsACiDgpugOpUP24MAftxk7PIqXGYcx06oWAll1YCQ==
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2eb::9)
 by AS8P190MB1255.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2e5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Sun, 1 Jun
 2025 08:53:55 +0000
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99]) by AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99%3]) with mapi id 15.20.8769.037; Sun, 1 Jun 2025
 08:53:55 +0000
Message-ID: <AS8P190MB120575BBB25FCE697CD7D4988763A@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Date: Sun, 1 Jun 2025 10:53:46 +0200
User-Agent: Thunderbird Daily
To: ath12k@lists.infradead.org
Content-Language: en-US
From: g <gregoire.s93@live.fr>
Subject: High CPU usage from NetworkManager with QCNCM865 (WCN7850)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0236.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:372::7) To AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:2eb::9)
X-Microsoft-Original-Message-ID: <211c66ef-6054-467c-ae05-444c941927e0@live.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P190MB1205:EE_|AS8P190MB1255:EE_
X-MS-Office365-Filtering-Correlation-Id: bb076d67-bf6e-419f-6bd3-08dda0e9d594
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|6090799003|15080799009|19110799006|7092599006|8022599003|12121999007|8060799009|5072599009|1602099012|4302099013|440099028|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2VHSDN1eGwvYi9HODNxNlNDOWV6dE9NelpLempPV0hTdis3NlNsdE9Ca2dM?=
 =?utf-8?B?Tm1pT3laRUJiRWV2aWhORndqZ1lHek4wazRxYVFibVJNbnpFSkczQ2daU01R?=
 =?utf-8?B?VGhBczFmWnE2THhqR1cvS1pPMHdqSi9CNzhhc3ZVeG5UYXR5a2tWM2p1eWxR?=
 =?utf-8?B?Z05mbThJL2hNWVpvWGJGSUdVcUs3b3NZVHl2djJQTkdPVGk1SU9OL0xFOUJk?=
 =?utf-8?B?SUFRS1lJdzZHMlZqVTliRjc2Nzd3UXpuSG1kTzJqQnM4TW1mRzBhMERTUk8x?=
 =?utf-8?B?N0tJQUIrMVBnSjlWYzVHQS9XM3Q4UmNBU0YyaER3bWZqdDR4T3M4U2tHTHBH?=
 =?utf-8?B?Z0dDTURvbjNjUWJuaEo5TWZaenVEekZrOG1zODVhY1dxMG1LYlJLRWhFRHFU?=
 =?utf-8?B?NmRhVmJucE8yL2hBUmtRNkxWVGFrRk1hY1RNM0lvOWs3bEhuQ3pIM2p4T3RN?=
 =?utf-8?B?V0tlWm5OTC9VT1ZBamx3aWg1WGJDKzEvYnNDSFB1Tk9VVmRmWlBGWHN6cDRx?=
 =?utf-8?B?bHZmZWJnRWpKcXpmS1NlTTlUZTFDSEMyQ0dab0NYRmdDRVRpUms2Mmo0RWZm?=
 =?utf-8?B?aGo4OGZ3d2MrUUU1dk1uQ1QrZUJTeFVsY0hndmM2NXY4dURsSmc3UGpSMkFW?=
 =?utf-8?B?bHMyczZuTVM0eHdmWVo3Q0NGZ2lvMlZsZjlFRXk0RzNJRVNBSlVOcjVYZkZM?=
 =?utf-8?B?YUNPaE1WaXVYZW9XR3dqSzRiTXpNcTFHeHlLZExIWkluc0NtVHlXbGd1YTY0?=
 =?utf-8?B?UnZFWi9LN3cwNUlsN1N5RkIvU2VqcFNpamNJd2lhejNocXNPRk1oWS9yRjcz?=
 =?utf-8?B?MlVxTWVYRVNwRTZqSjVBWXo3cVhoVWR0RHdTWTdWMFlHanJRMHRUaVVMQWNl?=
 =?utf-8?B?NXUyWDI5T1RwVUF4djlGRjd4Q0RyU21sa1g2NVlOMUdONHZ0Mm9qdVhwSjhs?=
 =?utf-8?B?Vk9VWFQ2Yis3QVJkajR6V3JxNWhIMVREL0d2aTZPa1Fqb1hMZzNZaDJxZlFD?=
 =?utf-8?B?Zi9pV1N2R2o4QUJtNUtCZU9jZEM0WkUyZGhFYUFKVVNOTjNtK1NsVk80YUFx?=
 =?utf-8?B?NWJhV1JVVXp3T2kzM25GN1o1bW4zQmtsbnhvN21QOTR2VVZBVUZ4NGE3WHRk?=
 =?utf-8?B?bktIaTFHZ2NlT1M1Nk9qQ0VFMzgxQzB2NU5BeXd0dTJkenc5aE0rWGtEbmU1?=
 =?utf-8?B?MnJqcXd2TTRCalp2Mkx4TExxKy9HV3ZMN2tpRU8wbkxubEMvdWppS0VmbER6?=
 =?utf-8?B?VjlQTnl2Um52N1FBZWNaVWhmYkpaSTI2Mk5oNEhWRUdoMjFVTHd1WlJiQnhn?=
 =?utf-8?B?dXpBaEZkKzgyWXhQYzdwVk5hczdVZjd1V21XaVNVd2hGWmIyUThCK0lMeXRH?=
 =?utf-8?B?a09zbEZ1WkJPNHplU2dxVmkvWWR0Mnh6MGtyTEdPb2RXclZYcXhWZE9qK3Rn?=
 =?utf-8?B?T0YvZkN1bktMVHpuR0FvSDBDdk5saEhyeW5tamlpUGpuMUthTUlLckxQbzZi?=
 =?utf-8?B?SlB0SFdsYjl4WVRNV2VQNDY4WGVGbmgvd2NNUkJLQ1c1UllQUHVPeUtGbENP?=
 =?utf-8?B?VExFVllVRTRmQWx5cGJENVNhTWtqaEllQVpnb2RwSzBBMWhaVnNySjkxRG02?=
 =?utf-8?B?OWxVYmRnM01mN3hxRDNGdW1tTXdKQlBOR3hLNHk5ZTA3WjJWY0U5WDMwWFQw?=
 =?utf-8?B?K210T0NGck5pU0h6c21JT0dsaWxMWU1kOHZYRTRtamJxSmxscFp5cjgvL1Rx?=
 =?utf-8?B?Y2pNTDVsckVQQmhUTzZtcFBJY3NpeEJhdWgwTUVDZ2tIOXluS0lzcnRqaFZK?=
 =?utf-8?B?bnlHeCtTdFExVWI2MjY3RlZ5Q2loMnI5MGJDSVJnZmttazFzMUNjbjY0NFNX?=
 =?utf-8?Q?HjdrPh3Ut0ImJ?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZldEYXZBN1hzYW9SMEdxVitrRGtoNlBaNDRlS0lLaDV4bmMrcXBlcUExZVFP?=
 =?utf-8?B?NHBBZ2xhS2R6azZIdjd5ZnFnSTZJbHpWeVlOekJTYzFXSG1nT1dBSFJUcjlD?=
 =?utf-8?B?Y1gzNGp3R1Eyc2pGWElCYjRsbFVxVmtrSC8vOVNVekQvWkZuZENEckZqYzJG?=
 =?utf-8?B?M2FkcnYvMm9HelB6NUdUVHZoM1ZRWEFlS1FQUklrN0dRY08vUkMvcjNOSDJh?=
 =?utf-8?B?NitzNzA2K1RiNzc0YlZoNjRkcVVoNkpubUdmaTFxa1lHd09BeG9PZW1Idngx?=
 =?utf-8?B?Mlhxc2pDM3k1Qmh3Q0pHbHo2RlZGRTRsTFgvSW9od2FvV0lzdHRrK0ViSkJ4?=
 =?utf-8?B?WVhUNVlEVHJkTmZ1N3dhQW9IeDNaVzFMMjB6Y0hkWm9mdTJ2YnNSY0ZuSEtu?=
 =?utf-8?B?U2RqSjR3QllpV0RmZzJNT05VRVduUCthWjhQSlFrZXpZMmtGQ0VTNTFaaEI4?=
 =?utf-8?B?Q1dvaFlOanVyOXBHMkZCUUFhTXIrcE9lNW56cXNjUWdRWGVveGNNM0p2R1Vq?=
 =?utf-8?B?WUx2c1MrSjNqcXRQTGlhWVhhTjNLaHRmUEVmU1pXUE9OVG54SVI4aE5hYWVK?=
 =?utf-8?B?M3NDSDhTK2V1MWZFTTRXMmhmcXR6QU4vWXU3MXBCTDZhZTlTQVRzdXM0UkZh?=
 =?utf-8?B?SWhOWkpkWjJ0cWZJMlZxWk54ajJPUmtDSmh0bDdsNlV3a1dCaFRaL0drVmxM?=
 =?utf-8?B?SkhMNzFIZ05sOG02dG9SalI1MXVodUJISEZRVWliMEQrQzJEL3FiZndzT0R2?=
 =?utf-8?B?QWNUbC9KM1BzUlN3Z3ZuQnY4MmZESTBsK0kzTFZSRzZrUE1iSUhUaXQ5V2NG?=
 =?utf-8?B?YUcyc25YSU13NlBSWFpBbnIzaFJYdTljZytiQWMweUFWeENFR21xYjVSMHlH?=
 =?utf-8?B?TWsxditrclRUYk96UkhxRExIVC8yejZuWURydGpxSUViUFFXcW56ZlVKczdP?=
 =?utf-8?B?RzcrTEVFMTl6Y2VNUE5ENlcyQ1p3UFpJdkpQZzRKbEZxVTZLUDNsL2ZleDNV?=
 =?utf-8?B?SUE5NVBkSUJtaVlRbUFPaGRabkxmRkFJZ01KdWFvRnhpQysvUjZBYmtoemxZ?=
 =?utf-8?B?RmdRZWN0NS9iYjcxVGNQTmRHaE9GeVZpN0owZHpGR09tQzZwQ2hIQnY3K3B2?=
 =?utf-8?B?RHJOM3RNeTBPelNoQi9yL0xua1cycUtNMGVmcmFVMnByb0U0cTU3S2VEM3NO?=
 =?utf-8?B?QWtIOTFKRFo2R0dIOEVQY1RacTlzNVJnUXFNRG9KYmVPQ3BiRGJRM1lETzNZ?=
 =?utf-8?B?R00wVktRZ25tR0drZ203K2Q4T1NoVzdacVNKcW9aMzlPdGZZTmV2VEZuNkZI?=
 =?utf-8?B?b25TTTBUcjNnWEZKOE1OMEhBN1VzMXU0Tnk0MGxudEM1TVJDeUpDTVJOTEhm?=
 =?utf-8?B?Mkp1RThZNmF0WE9kRkt1Y0p5dVlORUIzdnRlUlNxQ0duSVArcE9iUE1iSEhS?=
 =?utf-8?B?WHdtMkRHZ0JNYndGemdqck5RVGxwS0k4S0RadmxWVlJ0N2YzYmg2UytzYXY3?=
 =?utf-8?B?OVl2YXVrNGU4cklpczU2QnpNMmZSZUllZjVEUVlTOXVRTlI4UGw2cUxwZ2dr?=
 =?utf-8?B?MldYUkl2OGF0SjdlSU9IMytLNllsaytEVFNtSTZNTFFUcVk5MFpGOEhjWmth?=
 =?utf-8?B?NHhqaEhpZzR4L0dZT3pmdkxzM0ZkUUpnc01sbEJhMXJPN1RtQy92c2xnRXlJ?=
 =?utf-8?B?TjFZRndWVzhkUEhiU3I2TEplRitPWncvcW5pbUtJRWhDSk1Xb044eVcrWElV?=
 =?utf-8?Q?z6LMDVY1o0cdb/Gfo8=3D?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-e6540.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: bb076d67-bf6e-419f-6bd3-08dda0e9d594
X-MS-Exchange-CrossTenant-AuthSource: AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2025 08:53:55.3525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_015403_779009_0A6AD7A8 
X-CRM114-Status: UNSURE (   7.36  )
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

Hi, I'm experiencing a reproducible issue with the ath12k driver when 
using a QCNCM865 Wi-Fi card based on the WCN7850 chipset.

After boot, everything works normally, NetworkManager shows 0-3% CPU 
usage. However, if I toggle Wi-Fi off and on (using rfkill block/unblock 
wlan), NetworkManager begins consuming 100% of a CPU core and stays at 
full usage indefinitely, until Wi-Fi is turned off again. This is fully 
reproducible on my system.

There are no relevant logs in `journalctl -u NetworkManager`, and the 
memory usage remains low. Only one thread in NetworkManager is affected. 
Disabling Wi-Fi immediately returns CPU usage to 0%.

Here is my system info:

- Wi-Fi card: QCNCM865 (WCN7850)
- Distro: Arch Linux
- Kernel: linux 6.16 latest commit from torvald's tree : 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7d4e49a77d9930c69751b9192448fda6ff9100f1
- Firmware version: 
WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 (I also tried 
the old firmware, same issue)

Relevant dmesg output:

[    5.705423] ath12k_pci 0000:c0:00.0: BAR 0 [mem 0xb0600000-0xb07fffff 
64bit]: assigned
[    5.705440] ath12k_pci 0000:c0:00.0: enabling device (0000 -> 0002)
[    5.705877] ath12k_pci 0000:c0:00.0: MSI vectors: 16
[    5.705887] ath12k_pci 0000:c0:00.0: Hardware name: wcn7850 hw2.0
[    6.230762] ath12k_pci 0000:c0:00.0: chip_id 0x2 chip_family 0x4 
board_id 0xff soc_id 0x40170200
[    6.230774] ath12k_pci 0000:c0:00.0: fw_version 0x1108811c 
fw_build_timestamp 2025-05-17 00:21 fw_build_id 
QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 

[    6.231110] ath12k_pci 0000:c0:00.0: failed to get ACPI BDF EXT: 0
[   14.038268] ath12k_pci 0000:c0:00.0: Failed to set the requested 
Country regulatory setting
[   14.038525] ath12k_pci 0000:c0:00.0: Failed to set the requested 
Country regulatory setting
[  194.622322] ath12k_pci 0000:c0:00.0: failed to enqueue rx buf: -28
[ 1400.638540] ath12k_pci 0000:c0:00.0: failed to enqueue rx buf: -28

<info>  [1748767795.5349] policy: set 'REDACTED' (wlan0) as default for 
IPv4 routing and DNS
<info>  [1748767801.5408] device (wlan0): state change: ip-config -> 
ip-check (reason 'none', managed-type: 'full')
<info>  [1748767801.5420] device (wlan0): state change: ip-check -> 
secondaries (reason 'none', managed-type: 'full')
<info>  [1748767801.5421] device (wlan0): state change: secondaries -> 
activated (reason 'none', managed-type: 'full')
<info>  [1748767801.5423] manager: NetworkManager state is now 
CONNECTED_SITE
<info>  [1748767801.5424] device (wlan0): Activation: successful, device 
activated.
<info>  [1748767804.6745] manager: NetworkManager state is now 
CONNECTED_GLOBAL
<info>  [1748767804.6842] dhcp6 (wlan0): activation: beginning 
transaction (timeout in 45 seconds)
<info>  [1748767804.6846] policy: set 'REDACTED' (wlan0) as default for 
IPv6 routing and DNS
<info>  [1748767804.6940] dhcp6 (wlan0): state changed new lease

event: disconnect-info, reason: 3
event: state, old: connected, new: disconnected
event: state, old: disconnected, new: autoconnect_quick
event: state, old: autoconnect_quick, new: autoconnect_full
Received error during CMD_TRIGGER_SCAN: Network is down (100)
event: state, old: disconnected, new: autoconnect_quick
event: connect-info, ssid: REDACTED, bss: RE:DA:CT:ED, signal: -22, 
load: 5/255
event: state, old: autoconnect_quick, new: connecting (auto)
event: state, old: connecting (auto), new: connected


Additional notes:

- The issue only occurs after toggling Wi-Fi; it does not happen 
immediately after boot.
- Disabling Wi-Fi instantly stops the CPU usage spike.
- No errors are visible in NetworkManager logs, but it clearly enters a 
tight loop after Wi-Fi state changes.
- I suspect this might be a bug in ath12k or its interaction with iwd or 
NetworkManager, possibly related to buffer handling or background scanning.

Please let me know if there's anything I can do to help debug this, I 
can provide more logs, test patches, or try different firmware versions 
if needed.

Thanks


