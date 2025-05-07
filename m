Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE75C3ABC5
	for <ath12k@archiver.kernel.org>; Wed,  7 May 2025 09:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:References:To
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srIr9e6x2S+8cOhruv+I/heIz6toFNbJf8gLUPCntYs=; b=vY1WkVUK4bQuZ+JM+iUnTVGR2N
	mvi/xYsLBL7/CIgzhObCYJ1kldFTfDduf6xbVCyRaUP9LrVEV6HQNLxlqy0HAnXyCarqRoDhpLgeg
	Z6G1rPEvcrra1tSy3CxIrQ6g3CWOH5isewYEHR3RwIrcrU88HYl5ZoQtf22Ba+CU/eEiZCti8eGo7
	p04ghf2/3tydhsvAbEDmWbCBCtxz2r3ZcedbGVD6EcEwkwiZeno8PIJNAw02CIY8rop1nkiJeZDdt
	AgTMp69MYGsUXT2d1yNSfs9aKpI5DpGps5xbEE3i44IGM5wCNMvr0/QBS111SXnCmfXagGjazhHaW
	PFrNG8eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCarb-0000000EtA7-23dY;
	Wed, 07 May 2025 09:14:51 +0000
Received: from mail-db5eur02olkn20825.outbound.protection.outlook.com ([2a01:111:f403:2e08::825] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZvl-0000000Egcs-0W7O
	for ath12k@lists.infradead.org;
	Wed, 07 May 2025 08:15:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guQdCs2cKd08gq2y31R72tFhErsuxRPFD5KABJaIonUekpKy4BNV7egHLiWPqOyJp3mbPaaLj9hDR/597f+Vx7n3Lak/26FKGPLyPsCTXWXZTZstJABCWFI32168f5fUobaVtNLV2bPmIoWFDSmni1GhhtDmeqyVPWL9cA96GyVr/suVb1XPInKxnZGh0Gia0XupP5YZnvDyG6N7uRa7mzi8IWqIkEfPlZZRgkIFG2QiToX1+8cUsdfV90pz+WRSGnSisiNmR0Pb96IEQZkZoBrs07JC0uB8lVBNHiDgmc6GgwNfIGNzNhFrNsJXAwLJwZEZdybFY5uvkP0tQ8J4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srIr9e6x2S+8cOhruv+I/heIz6toFNbJf8gLUPCntYs=;
 b=k284hjeP6C70eFMYe3053FdAUsa94kICMkWua6Uyntlya1kJZL2j5o3iNhu2MNoqAUkjJzVYveXnGvjueoBYFlgqB+ilx+1HHSCjnYZkWZR5gXNJqAV0VGcbMmJhmMDBy3+wJiSx1VjHsPvbV035wlc0tNkuICFFPPYGMasGOUm6c9iLKlZea7mLogyjWsFtnwFABFDC9J/yxpJDSsw6Urfglz/J7f/VSKv4x5hgLIax+pF1A+szI32ZmDajOBhGrDSlSWTpzVBc2wTOmxzixCjB8jRIST5Ivekeq7q72rZQqsAfkP7Mbf8ZQiC6lZhLfME5JYjuPzpjbvEtlilpag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srIr9e6x2S+8cOhruv+I/heIz6toFNbJf8gLUPCntYs=;
 b=CO2SypeZyIaotlEhfOHkoKggd3L+rMdiIWwvsY9NWvy6Jhs8NsHouZo1anhwYR8GGzgZvQeQYu6/duKXOL763MY+Gi+2ivomyV5BC7fphNb3Txus91fr5fruEuYitGWtU2qKjGMsqvDTy2zF2/Fy44O2bx2NP1wlcp/RkMe8H8KLBFmHvmV4PpSN7qzE4Sq0ao7+nNha9VQub62ojvFs/dtja/Qv4eAsGNBpMc3TL+bXbC81OvWY0DRbIPFitIkSSlwkfG42IRJhQ//ZzmClW0tbMP10cK7asKRirD/GCzO/MHo1gA9UKt2pOcC8wPCJG9x7B1ijNBaTwGRWCKKGKQ==
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2eb::9)
 by VE1P190MB0912.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:1ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 08:14:55 +0000
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99]) by AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99%6]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 08:14:55 +0000
Message-ID: <AS8P190MB1205DB2F92C7BCECB9DF27D28788A@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Date: Wed, 7 May 2025 10:14:54 +0200
User-Agent: Thunderbird Daily
To: ath12k@lists.infradead.org
References: <f450a1d4-204d-4d04-a34c-493af050893e@quicinc.com>
Subject: Re: [PULL linux-firmware] ath11k and ath12k firmware 20250424
Content-Language: en-US
From: g <gregoire.s93@live.fr>
In-Reply-To: <f450a1d4-204d-4d04-a34c-493af050893e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::25) To AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:2eb::9)
X-Microsoft-Original-Message-ID: <418e1eed-d0c5-432d-96ac-a9354257b19a@live.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P190MB1205:EE_|VE1P190MB0912:EE_
X-MS-Office365-Filtering-Correlation-Id: e644c49d-96d7-4cb1-78f7-08dd8d3f3f9b
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|15080799009|8060799009|7092599006|19110799006|5072599009|6090799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0xMQ0lQNERQMU10bGVydVJyQ0ZhMnZIcGdHcnZ2SXlHaUU4QTFrSjVrbU40?=
 =?utf-8?B?eHlHenJSQzhuSzc3Uk9jZmRVcUpMK2pEWEFqak5hQmNsdzh2VC92SXdHREVn?=
 =?utf-8?B?bEpGSy96anduanhyRVBHSHZjZXJHOEZxNW10RllxdnVoQS9jWVJQREY2T0U1?=
 =?utf-8?B?cisrZG4zWkNDRWxSTDBvQTNvWENHRGVZcVBpV3l1QjZoRFQvU0t0WFRTak5a?=
 =?utf-8?B?d1UxYWMzSWp0SWxTVVFMK2tGdzlVQWV4M0xCakFuOWtmZnlGYzliV29SNWlR?=
 =?utf-8?B?M3A1T29SNVY1OUpmZTMyeXhPY1VxK3VOMURvWnJsSWl4VDYycVJhQ3FoWkYz?=
 =?utf-8?B?OVk3Mk43VzRSUFU0WGxmU290Y0hFK3BsaitIZzQ0T2FaZVcxVllzT3BiQ3Bq?=
 =?utf-8?B?eVdLWHVTTWhTTmwyaTFlY3Nyb1pYaHhUbzVQdWJZT0wyL3VrcGpEcnEwb0RO?=
 =?utf-8?B?ZHl6ZHVjYzVMVnRKbE5pcDNWTGRESFIvNyt1RllhMEozWjNCMFhKNDN5dXNt?=
 =?utf-8?B?bUtFNE5KOGVvNmhBOFZrUzlPYXlBOTM1NkVOTW1LS0JkVmVGUmRRYUtVVGZ6?=
 =?utf-8?B?M3k1TGhEQVdmMzUrMDJ3a3R1aTQydW0rU0RvMEZyN3NkTk1EUEk0MktheklE?=
 =?utf-8?B?QnFNTENWRkd1VVNPdW80QXZaa0lFck5mRGJmRFpvN08vMEg0VUpqM2hnajBj?=
 =?utf-8?B?RW9RelJnMlE3QkdwWEgwTEYwRTR3cXpnbnZieXhlMGQ4b1BxYmc4SmVuakN5?=
 =?utf-8?B?ZXZYMnljMG5lV21odEtqcitmOWhiV256UDZkbzBDUjFBL1NnS1FNazAxUUwy?=
 =?utf-8?B?OHZpUko0UUszdkxxeEhYbjRDcTd1TTZibG16UC9ObHFtOVphcSszY3puMmNh?=
 =?utf-8?B?ZENrOTIwZ3RHSll3VjRzcGxVRVpVL091MXh0azhMTTUrQjlRMlZMWjJTWTRY?=
 =?utf-8?B?ZVl4eG5FOUluQWZvUEdFbnl4REQ5bWNNRzNtWXk4QVpPeDBtWTZuZWo3RlZD?=
 =?utf-8?B?VzBPVjVlUVFWSjNTbTJFSXUrbXdjaVhGU1YzS2ppR25SMDRIRU13RDNvNkZ3?=
 =?utf-8?B?dnVMbkNoVk52ekxnWm53cWJ1TDZadFZwa2d5aGVGQ0M3ZzJlbE5GalBrUXVC?=
 =?utf-8?B?L0xWL3NRODZzMis1aVFrVWEvOTFqSkNVbEwrRVhNM0VjK2s2UTZvS0Z2ZGFL?=
 =?utf-8?B?aEt4a3BHaEcvYitwdEVxaW93TlhEa05nNDVLTFJlK2E0OU5EYXcrRjc1NGRt?=
 =?utf-8?B?MjVPdkEwQk5QOUcvV1p2NVpUUTF0VU5FV1VDVUlpdEZseENGV0ZDQ2VUMS9L?=
 =?utf-8?B?MlNyVm14dE5Xcmw2dnJkZkVuVWYyWllMUnZGM0ZsRjUrSHdqNUh3WGFrMFNP?=
 =?utf-8?B?M0dvUGtWVXFCUndJdFFRcGQ5UnJZUFkrZGxPejJuYzBSSi9ZbW9RTEQ3WW10?=
 =?utf-8?B?V2NnUWVxQmpKMThRTWpuMjJhTm1pL1JNa1p0V2t1L0JUdmNlOUs1aE1aOHNz?=
 =?utf-8?B?SWE0cFlIRWNXZVhDZXZGVVlqdkNYR2xjNFdXMmtpWEN5R2lrT09nay82bmRE?=
 =?utf-8?B?d2VZUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGtGNUZOQnQvc0QrMjR0ZmtBV3FwRGdSN2FrRnpvMTQ4Z3FNdEI1NXZpNm1I?=
 =?utf-8?B?VXltRkxLZm1EcjhrOG1xMVlIZXNISC9EWXpzZ1IrQlp4WDNZLzdrZlV6OGx5?=
 =?utf-8?B?eUlmWkFlUkZ3Vkg4TzFjUFM0Z0RGMzFtVDZwdVFBZG5menlqTDFpc01SdnhY?=
 =?utf-8?B?WEU0WGFaWmtjOGlUaithTlZTZEFzbHVPcW1lcEMrb1RFTVUwSnJCMTJKUUt0?=
 =?utf-8?B?b1VCMVlSRVc3b0VuczUxWmdXcHB4SHZMc0VxbDBtT3d5Njl0S29IZ014L01I?=
 =?utf-8?B?WXBqbTZZbHRRRmdvU2RIdE5takJvdStGZGlnTmJadUNCYllueFZtZ0dJQjB1?=
 =?utf-8?B?VTVsbXBnM3JSVWdaUGc0M0EwSkNUZitWQk1LMzdEOXJnSkxldnVZWDlJdVND?=
 =?utf-8?B?YXZWU1l2Z3JndXZoZ0lyb0t6cWNIeUpOOWFCMHpSbGJDalhtaktrbHp2bXBq?=
 =?utf-8?B?SThDR2NNNEszTEdzejV4UXhXcHRIZXEzaTFsNm9BQVNGL2NOei9Ja001cVVY?=
 =?utf-8?B?NUF6VmRKN3pNcnl6NXlzYVpNL0tWZVNQYWdCOURSNlpSRWg1SDQzRFRFNjJG?=
 =?utf-8?B?RGRFb1NKcXFpdnMyU1o5ZUpVT3NjTU5KR2xNNC9Pakl2SEluTmVqb3BJQ2pr?=
 =?utf-8?B?UThzVTFEQ1VDbE1nQkJTT29YTlRKQnJBK1dWYmpGYXpPd0l5Z2JWaFowZU5i?=
 =?utf-8?B?OXRrNUpmc2dEaHBHa3VsaDVXR2xxWHFDOHNOQTI1ZEFxcHNqODRmU24xaDFx?=
 =?utf-8?B?QnNLSVR6SmFPaVRjTVpSdzdQK1MvdUVNRDBlaDZEOVhUZmkrWDYzMktyVzJW?=
 =?utf-8?B?RHRHSjhOVm9nWnowbGNUaWNCaGZNM3czRlNDQ3hsdDl4U2ZsamhCTEtWZXRY?=
 =?utf-8?B?ZzVnL1h2enBBQ0packVGcFE5aHdvWk5Ga1Q0TVNXS1VUaTlkMlNjakc3YWxj?=
 =?utf-8?B?SGJtT1BZNzVueFZjQ215S21CMmRaenYyVXVUaDRqcUNaSVZyNUFqNEdwYWlk?=
 =?utf-8?B?NXJ0RTkvdk1NR2pUa2JCOFdxdXVLUG1KekRNdmhjOCs4V09uNWVTS2RTZG1H?=
 =?utf-8?B?WUpXVlhtRWx3M1B1MHVTc2ZJem8wNitkZUVZcGdKQ05KVm5aNDRzM1k0eFVI?=
 =?utf-8?B?NlRqNzlndktlQUp6Y3g0d3dmUVZDSTc4clJGVjViYWtXb1BjWUorS1c1aTla?=
 =?utf-8?B?eHZ5S05TaTlPdkdVTUxzNTFJbVlSQWJ5OGd6MlBUWXBkM2RhcG1wMkNjdmU1?=
 =?utf-8?B?eWJZbzJEWXBRZVJVVEh3NXJvd1drRHB3OEpqQjJ5MUlFQm5Zc3MxcjhRSVpw?=
 =?utf-8?B?NU51MWJvY0gyL2R6UTlSa3gyekJSQVk1OVQ1b1pXbVV5aWtrNGt4Y3lkWjFr?=
 =?utf-8?B?bjZHeUh4eDEvUFRoR0lrM2tCNWR3aWRwTWpPSEh2ZEdhbzJXQlh6K1BYVFZz?=
 =?utf-8?B?eENBTW9vd3dMV0RuSGdRSm85S21ueWtxUzd5NUd1TTFvMFVrRC8yK0VvYUYv?=
 =?utf-8?B?czdwZDVXUHc1azV4Q2dUajBSdGNMaW1FVVJaNU5FV3FJdHkzRUNkVmFuci91?=
 =?utf-8?B?MjhYa1Z2eWZaT3cvVjVlVlFadjRlY21kNDhxMW1pSjBQUjR3aUpIUUtNcy9x?=
 =?utf-8?B?a1NCYTUrdGJHd1dtK2tZeWsvL1N6aXZyZzJpekhxWVZUK01TTmpIOTBocncy?=
 =?utf-8?B?ZnV0Z1pnWTBrVC9rRE1SNUo0ckVEcDAvOEhpRUxGY1VJa1kyN3dxcW5wd3Fa?=
 =?utf-8?Q?kjGW4Hw6l3DqsDWKtU=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-4ff97.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e644c49d-96d7-4cb1-78f7-08dd8d3f3f9b
X-MS-Exchange-CrossTenant-AuthSource: AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 08:14:55.2276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P190MB0912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_011505_173133_8C8D0F76 
X-CRM114-Status: UNSURE (   4.59  )
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

I previously tested both the stable 6.14.4 kernel and the 6.15-rc4 
release candidate.

I've now also tested the latest commit from the ath 
tree: 6.15.0-rc2-wt-ath-1-git-g21346cd925c2

I'm still encountering the following errors:

ath12k_pci 0000:c0:00.0: BAR 0 [mem 0xb0600000-0xb07fffff 64bit]: assigned
ath12k_pci 0000:c0:00.0: enabling device (0000 -> 0002)
ath12k_pci 0000:c0:00.0: MSI vectors: 16
ath12k_pci 0000:c0:00.0: Hardware name: wcn7850 hw2.0
ath12k_pci 0000:c0:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff 
soc_id 0x40170200
ath12k_pci 0000:c0:00.0: fw_version 0x1105811c fw_build_timestamp 
2025-03-11 07:08 fw_build_id 
QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
ath12k_pci 0000:c0:00.0: failed to get ACPI BDF EXT: 0
ath12k_pci 0000:c0:00.0: ignore reset dev flags 0x212
ath12k_pci 0000:c0:00.0: failed to receive wmi unified ready event: -110
ath12k_pci 0000:c0:00.0: failed to start core: -110
ath12k_pci 0000:c0:00.0: qmi failed to send mode request, mode: 4, err = -5
ath12k_pci 0000:c0:00.0: qmi failed to send wlan mode off


