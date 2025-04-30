Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624E2C369DC
	for <ath12k@archiver.kernel.org>; Wed, 30 Apr 2025 11:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:References:To
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMDg4VRaz8rEicVJnMA2TTLZFAtwy+6ZvASmbcZOWAk=; b=Rr15imYbpfAoWzU8haDVTPykJL
	wogrb//KI8tkCSlJifNBGWhcR6VlRKEjoF0He7ifjyRhOMxqaRdbCRmQhAq8y9gwziRM1HDP8bKOT
	Sa7QY0nH4htWpWBx/STewXKeePlsTjdxDWtIHsJ4Q+B7cWM+fSI+3sMHXK7fPeusUIay7jq9YSDMB
	obb2yOBpGrBqo7RkduF6MT2oGj5RBG8hyFjT3MpYvlY6WR8QtaxF4emvgzM2wTy7qURMsT0878jpP
	q7VUqqaJ2zhCPVUlrIGEuXgnAEqCAHKhlvVMqrpJ7TyuFYNnZVGCbF/8inTT3zM/DNHsy84vBIkkl
	ytZ0C0GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA60X-0000000Cjza-3cku;
	Wed, 30 Apr 2025 11:53:45 +0000
Received: from mail-db5eur02olkn2081b.outbound.protection.outlook.com ([2a01:111:f403:2e08::81b] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5q5-0000000Ciz9-2iVW
	for ath12k@lists.infradead.org;
	Wed, 30 Apr 2025 11:43:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+A+0HqMN8GaZp+kug2T7pfM9LBkZg90qt19/hPdQq1t+3cO6J7iVDTVuO7HFHMHRA1gYLwer+cVKwvObveDPM/9eBCgrlWMym1WhVBzwosCB1PrU9aKomspLLYRTfsXoWEUQ5taPnuU1j5u8U7O/72HvFG49PgA9pNnGIK2OVpP6pzs+HXQX3SS5rlwqTEOtCvY11mV4pto6w8o08+dNn4uHdUHE1D9e2J0zyBga6sJ4Y4evMWdgEm8GMdEacb/R3zdDW9aAi6PZHClOhyv64nzKlawC51+qdd7yUYtKOd1xd7z5rY8LwbHAo7nbQJy0h+83auce7xWMgO3upzfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMDg4VRaz8rEicVJnMA2TTLZFAtwy+6ZvASmbcZOWAk=;
 b=Pe9Jafwi4dx/hON967EjbcRdLFuEZPHZ7Q4bROJL9WO98vYWwcWCQwZTSz3LGIWiq9WdBZURpaqUho2ce2dSoV7FpaVZ8SRitYUVW5EYsy8fBskmoKUvgcfHvKBSFws0wjJeNz27Q17E3sSIgD5KSXU7bP6j/O6ixlEziM+zHiKgrC41kR8erppA+hQbrgVgoL9ioarnrUxF71nI1BtI8SrBNtbJkpQfRMbvHHDct8VKvip8nd08kt9MDLxN6Fm13I6WpdkqFO9UoDPphV1groHKUQVs1fDwNyPU2hg51dvR5NWFvL/n2xskPUyQantZVWzZwERf1ndx9B3ZB+bXWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMDg4VRaz8rEicVJnMA2TTLZFAtwy+6ZvASmbcZOWAk=;
 b=tElAa1+bNSyZWj+o7P5h8Rl3YPf96HethR5EEVzsUmKQwg3MFaeuA6nnagCs1VN+MknH2b0sRAMoFpivHgBLgk+q9SNFbjFWO7tI7Un2QpkE9oVuzOZ296N/Ydti8uk48pDXbHgZFDzCGQI0BrhTPZSosV5uZmWPVTAzbpqfPZlwYvJgdzug7ccjiFEAy2fQo9oQqbXIa50u8kSUwQAYUBRlVsQ5mu++PHourGdvLhwkPmlRoJJJkW+AS2HzWTfJaS3Wy+CL2sYC+gAXF98ttDvGGPdR0mHyzclXAQJXLq1XFa1Z5BSVXGoi2dr49P2PhmOwPTa0xpqwbUO+JDMfew==
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2eb::9)
 by AM8P190MB0834.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:1d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 11:42:53 +0000
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99]) by AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99%5]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 11:42:53 +0000
Message-ID: <AS8P190MB120554CEB603837E6A45DD8587832@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Date: Wed, 30 Apr 2025 13:42:51 +0200
User-Agent: Thunderbird Daily
To: ath12k@lists.infradead.org
References: <96b43d18-72e1-44a8-bf06-6a22fd012b07@oss.qualcomm.com>
Subject: Re: [PULL linux-firmware] ath11k and ath12k firmware 20250424
Content-Language: en-US
From: G <gregoire.s93@live.fr>
In-Reply-To: <96b43d18-72e1-44a8-bf06-6a22fd012b07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0363.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37c::21) To AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:2eb::9)
X-Microsoft-Original-Message-ID: <a4a241fd-b633-460e-9ab1-861b5058eda9@live.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P190MB1205:EE_|AM8P190MB0834:EE_
X-MS-Office365-Filtering-Correlation-Id: 83371a6f-063a-488d-b18d-08dd87dc2449
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|461199028|5072599009|19110799003|7092599003|8060799006|15080799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFowbzFDMno1YzJjMEpUdXZZbnM3UFFaSTNGSlNoY2NuajdsQ3AxbXpRK3BB?=
 =?utf-8?B?QTJJV2RNaUM5QW1mZzlZZEgvejJzYlAvTGtKRjE0MmVxS3g0RXo3M3FGVFd3?=
 =?utf-8?B?Yy9NYktCQUJiMy9UdEIwdXkrYzh1TFhFdHVwdmZ0emZjZkxaa0wwck1TMDJl?=
 =?utf-8?B?OVA2eXF0MDFLTzBLUHQrUkZrVHhMYkdCVE9veTJuZnJWVnRjOU9BQm0rM2dp?=
 =?utf-8?B?UzBqUVhXamEvblRhN2RkQmVxRWw3KzdoNHhra2pFRE9WUVB1Q3p0ZG9BM1Bw?=
 =?utf-8?B?THN1Sm92ZmVQVnBZdkZkd2VQNUNRRFY2R3RIVjEvT2FOUnFxUVlqWStlQVdP?=
 =?utf-8?B?RlFzWDdsenAxSUFLemxIT0J3MGZnanZZREZLaFJrVkJEMG92VWdUc2duZjVH?=
 =?utf-8?B?RGlVTytHM1FSYm5MbFREa3Npc2daZTZiYUpkMVB2YnNmZUVGNTBuNFpxVE9R?=
 =?utf-8?B?Y3Y4d2ZxSWVVZGphVlU4SC9BVXhTY1h6TmJ1MlJiL1haUDBPQ2dvUHJDTm9u?=
 =?utf-8?B?YjFuZUhjY21aM1BqQ0tyU1FvUEo4b25yWkx6dHk2TTgzNzhMTm9uZjhOOUgy?=
 =?utf-8?B?c2trWk1OYXVxQU5PU0Ntb3VPV1ZrQnpXUmZxNE9BZitpMEhtMTJLc2x1Tnll?=
 =?utf-8?B?Q3VBQjNKVm03bkF0dUpDV1VMdGxDdjEyYzZvNXVZQXZQNk9NWXN0WVQxd0Z0?=
 =?utf-8?B?MGlvVUxkV1VJTTgrREJKNFlTRGJORmx4YUdSZzNTSmpJZUtIait4KzhPaC9D?=
 =?utf-8?B?MGRaOXFaTHpFTVNRTWRtb1creko1ZWJLZ041L2s4Q2pQbUcwc0daY0VwL0Jo?=
 =?utf-8?B?a0JLekQ2aWx4dkE0UUhCSXA2dU1TdnVRaiswbzBHREZ4MjEyM01qOWFsWXhh?=
 =?utf-8?B?UVJhdVBZM1Y0VERYNHQvT0pZZ2pVdlRQd1JabXZYNy8zcmVDVWR5UFpLK08v?=
 =?utf-8?B?R1d1eGJhZUlCK1BCNlNteVRYU3ZQSDJoK0Rab1h4U3FJZWVVd0x0b2xOMWxO?=
 =?utf-8?B?QzJsdkttQW9hSC9XMXJvMGFWY2dqenFwOGxhRUNnVEM3cXZFUWk2NUtlL21S?=
 =?utf-8?B?TXd4bW91b1hkT2RGSVI1OEs3WlFiT0FFNXZnR2gzV0JmUWkwejB6TGJnYndo?=
 =?utf-8?B?TUpSWU03dW1POG1OY1V1MzExWDRhV0Q3TlhzMUZMdXd6SXRjL3ZEVnNNN2pz?=
 =?utf-8?B?VFZNTXFSaXdkeENvajdzZURSVUNHaWlXWG93NTlXbU1STldKT0IwSDVkdU4v?=
 =?utf-8?B?TDd0SmgrY1lSUkRHMlhkaFBGaE9yTXdoZHNqOXZ5bGJPR2g1bDFmV1ZhZ0ZC?=
 =?utf-8?B?enNqSkcwMnBIQlVGSHM1TXJ6UmdmcGpyWkd3UXY4RWh2SmYxM25SMER6ck9j?=
 =?utf-8?B?b1VSeGhCdnJGcVIxK0diVVMrb2ZoemF5Z1g0cmVoRWR2aC9kZW42R0Q4TlpW?=
 =?utf-8?B?Q1R5bHhtK2ErcE14NktieW5zUVd2MmJNZllzVE1aTCtWUnVobUo5cTRsVllY?=
 =?utf-8?B?N05sU3BzcmFpdFB1TmdMU2RKaGY0dkc0aHlqK203MndZdWc5OUgzUTcydXcy?=
 =?utf-8?B?SUhyQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3cvNUtLdTNNT1QxcHdTOGZrbzd6MnA0dEJ4ZS9jZnZwaUV0V0xuS3BzMGtX?=
 =?utf-8?B?RG01aE9ZYlo5d3cwUjVKdFkrMzNwQkJpY3QrM25PWEovUjRNUFFjSSsvVHFK?=
 =?utf-8?B?cmlzRkZOWE42VkFicnIxcExLVkVNMjNLMVY3R0hjYUEwaTFEZ1hYNENwZk1w?=
 =?utf-8?B?LzZSMGN6c0VlY2dPU1VXREhaTnJnK2ZVVCtTVG5XL2VIMlJsSXFIb3BWYnZ5?=
 =?utf-8?B?Q2hoSTNra1B4Zjl5cTQyMmFVUDUyMExuYlQxc3FzZEhBNW9VQUdoNHZLYmtK?=
 =?utf-8?B?S0w2a2hVeXFVR2Z0dGFBN2ticGl4S2MyUlBLd1V4RnZweUR1em9MNDZTaUV6?=
 =?utf-8?B?b3pOQ0cyZzVmRXRML3UydllzKy8xVTBRMGVRMGNmeURaOFVRZ2JYUWN2RnZi?=
 =?utf-8?B?UTM2eXRMb0FOYjBlT3dRUFI1c3lYeDA5cXU3ZHMvaGxFOXBhMytHTlI2dVlD?=
 =?utf-8?B?UGFKR1NaVFdGeVhZZk84U3orNnZ2MkJaSkM3WDZENWhRNDlXQmU5ZEMvcFVn?=
 =?utf-8?B?TW13dHRYU044bFpXMHpJTFJKWHJ6SWM5UnRsbUxxVmNKaWRFZm9GT1U2TUVU?=
 =?utf-8?B?cS9CK3ZJTnhBRk1CQmVUODNXSnB4b3hhbTZySElMNE9taTByNTBDbVh2emhT?=
 =?utf-8?B?RmVSSFBURnN4a2F3ZWw1MkVFdEd4dzMzOGFxeXlGM2VIOUpucnA1NkdGb2pJ?=
 =?utf-8?B?eVp1QWdZZXgyRDA3VFR6a25ySnp3V09IcVpsRFYwVzdUdm1LeWJTVGF1Mmd6?=
 =?utf-8?B?U3VrSUxLcFoxZkVEOFpxdUUrQ0tDN1l1eGlIcFhXUkE2amNMOHM4cVpycjNa?=
 =?utf-8?B?TERidHZUcFo4VkkzRDdPa0ZPemZ1Z0h4R0xYWDc1RUo5cVFNVzVDNHB5cld6?=
 =?utf-8?B?eE1OZUduRTdjM2J6dzQrQkxOTWcrMTV4dk4zY3JIalRWbGIzZGIzZXY5cEhr?=
 =?utf-8?B?c2lWbUJXVEk0bVkzVmlqbUd6Sk1kNXgzdVRERW52ME5zZzVwd3pSRm1hSDll?=
 =?utf-8?B?RGhCb2w5Tm9iOFFyTlBqRkFKTVgyTTZBUW90WVh6eFNvdWdLdXVTdEhtN0pU?=
 =?utf-8?B?VXA0RC81dW9XdUxNbTJKVGhFSWp0WEZHbjBydHhvT1Z0a3RZd21hbHNoR1hq?=
 =?utf-8?B?NmJ1M01IYXVoVkpjRzkzOFg1eElWMEV4MEc1RGlaZGhud0owakxSWkFzNU5B?=
 =?utf-8?B?b2tJV3hpb0RwYlRVNFBlVmkxcHR0UU9KZ1FNb2FpRmQrcDY5SzhQSTMwM0xj?=
 =?utf-8?B?aTlnck15eGhuQ05DeGhCUXNHVjZzVmh2cTBwOXhaRUZqZmlGcVNxUXpHaFdV?=
 =?utf-8?B?dU91OXJKRGQzS2c3akp4TktJVS8xR0lTNTN2SkhIUWQ4RHM1Z2pyQ1VFcmUr?=
 =?utf-8?B?dFpxbmlpSlZCK2VNa1liUk85SW41QkNQTFQzWFR0cW9tSjlYTnNTRjAxL1Vi?=
 =?utf-8?B?ck1PaEhyMStyQytqYzRjR2RHMm9IZTVLNUxzQ0Mzc3RvMnpXT1NITGdlS0s4?=
 =?utf-8?B?MWJob1FJeGZmUWtRdnpYMDZhclF0VnRya0p0UXRZbkp2ZUV0ZXRkUXN3MjhW?=
 =?utf-8?B?TkdoZFZrNUlHWS9KMzAvUmJrS2ZjeUdYSlZZcE1IN3QydjhNUFRmdzZUaCs2?=
 =?utf-8?Q?xm2j7ZeZZd6q0NFpnOevPQ6yKNEY6Jl2+7iMMVb34M9M=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-4ff97.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 83371a6f-063a-488d-b18d-08dd87dc2449
X-MS-Exchange-CrossTenant-AuthSource: AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 11:42:53.1612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P190MB0834
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_044257_696352_4AAFBF20 
X-CRM114-Status: UNSURE (   4.56  )
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

Hi Jeff,

I tested the new firmware, but I’m no longer able to connect to Wi-Fi. 
Here's what I’m seeing in the dmesg logs:

[    5.542233] ath12k_pci 0000:c0:00.0: BAR 0 [mem 0xb0600000-0xb07fffff 
64bit]: assigned
[    5.542255] ath12k_pci 0000:c0:00.0: enabling device (0000 -> 0002)
[    5.542755] ath12k_pci 0000:c0:00.0: MSI vectors: 16
[    5.542759] ath12k_pci 0000:c0:00.0: Hardware name: wcn7850 hw2.0
[    6.082937] ath12k_pci 0000:c0:00.0: chip_id 0x2 chip_family 0x4 
board_id 0xff soc_id 0x40170200
[    6.082946] ath12k_pci 0000:c0:00.0: fw_version 0x1105811c 
fw_build_timestamp 2025-03-11 07:08 fw_build_id 
QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
[    6.083130] ath12k_pci 0000:c0:00.0: failed to get ACPI BDF EXT: 0
[    6.363942] ath12k_pci 0000:c0:00.0: ignore reset dev flags 0x200
[   11.240664] ath12k_pci 0000:c0:00.0: failed to receive wmi unified 
ready event: -110
[   11.241174] ath12k_pci 0000:c0:00.0: failed to start core: -110
[   11.242839] ath12k_pci 0000:c0:00.0: qmi failed to send mode request, 
mode: 4, err = -5
[   11.242841] ath12k_pci 0000:c0:00.0: qmi failed to send wlan mode off

Thanks


