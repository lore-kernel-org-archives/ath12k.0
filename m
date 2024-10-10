Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C84D24453
	for <ath12k@archiver.kernel.org>; Thu, 10 Oct 2024 20:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVbgUmy1jEgPxbuTOv2FdEUMrMJop4+FbG1CPlV7pSs=; b=T0wkXppYIr8vtwWU9+Yuv0RD0t
	I7g43sRPw5k4IqLEt3tnDZV2lUcP3RPkBlWb0sjeb4eSGcDlvePCmFo6QkiC7T1u8EnT2izAI7SFN
	5p1k6wHZSJviVWVSFc/mQJ968NzP9Ftw9ahRGIN52fPq75mI6OwzqKQCbgK4gYk99xbfYvOi66Tjq
	apin/L3QGPlvaftymqQtzBbuXvgxrRPQwrAwIBsv53CMibV5tJNc+3IuT5qyhpaodCiGCh8P5jTuU
	zHIsFuJFbYSj5UaaiUuOmqN+1Q62M1XoKyt/vFNMvV7NOMjTMFRKp28DOu2Up6mKnkFryKnogAIG3
	dwKzB/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzxn-0000000EIUC-3GA7
	for ath12k@archiver.kernel.org;
	Thu, 10 Oct 2024 20:40:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syzDl-0000000ECV2-3fb8
	for ath12k@bombadil.infradead.org;
	Thu, 10 Oct 2024 19:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XVbgUmy1jEgPxbuTOv2FdEUMrMJop4+FbG1CPlV7pSs=; b=Vtwr7sN1bitVTP0tfkRhTMpgi/
	8HUdznCWooMBNfilWAgDCDcuveQkPa8fIaVsK9UmhjNedc79r3ZjDK6z/RRnisf3SyzF60vw8YQCz
	TjhUvp4CBcUueBb3w0TGEd175iEm8g+oXDINqkb6x0jNjnJpgmYyEdACajHExTWaTdQZMb5nqv/dB
	CPthzxidzxTOuYyu3aEnbiL9+LCif0eusOwdx+HvIVimk1I3eZS5X7kVj5at1gbCxC9Pk4f/ggZRU
	NV4CDKnj4pqwt3TW+lBsIyagr1yU8L8b5/jNwyazavN73ftkTrXzjhqvHvPk8pNWyGkzNcyeFGgDf
	HrW5nX9g==;
Received: from mail-mw2nam10on2062b.outbound.protection.outlook.com ([2a01:111:f403:2412::62b] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syzDe-00000005bWS-0qME
	for ath12k@lists.infradead.org;
	Thu, 10 Oct 2024 19:53:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cn9juTCMc3KSjtCXZEnmu95l7F8JdPmATfLitoILqKI0f8SiooSStaTntWtFV670HsYCR+8cHIUnWuZvQuYRDvqnA8LnuKs+l47/PahzYXftQvGokfnaxFn3J/9KCIWiErk40HezCSrMOjSR+UEPX+Zfsr+q8SQYTVZ/7kEL6XeSUPbTxdnFs00iQMJTRrUwXL5YOFzZMCPNJDkxSk9XioQuZIwxQgtSMm8NKJZdk/i/LVH+P37Zjr+Lrgoou2EesGP7BRZ+L12KSofs56k/IyvhnhoxGyWiUCmA+5io7gpoPjHiCvqHcEfR5EFXL3SHvXq3MZQTVyBS6h97whUBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVbgUmy1jEgPxbuTOv2FdEUMrMJop4+FbG1CPlV7pSs=;
 b=VobNAwxB1Aea3LQjwg33PVjiOarcLSM3jXUK4r8FGsOmIxuMFz9UlO92g4HLsunthEFCzL/8O9awvxDoWqb+VsXQvV6WK/YefT91Vremdpu9FKvQYmhn8onp1bsaREfcAwwG8OvekMZozkJc0j0zYHzndi4rCkwbT6zcI3lZcXxFaw7jN16HJ0UOyDSxEw/ZI6NKM876KcD46m0YrzJHFZtQukqKGHl6erp59Agqwu1Jdf+MqCEgCrx9LvWbxP+UEIBWiY00niD7yQh4x+mAoueHkbRfzx+KwEd1+ieK8FSYqO4ZtQEsTRokuU5mUb7s/0p50KB6sHcc04ygP9hbQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVbgUmy1jEgPxbuTOv2FdEUMrMJop4+FbG1CPlV7pSs=;
 b=Zkin/AWIow/7iHH3KbanrH3f0J5qd4oFyw9s78hdm7wuOXKY1UiyDSjXRgaG++WO+EZZTUCtGDkZmc0Fbw0U2S3FqhfQeswiHBvsDwX03voXw69Utk0GMzsQbs8qWoZKdKcwDJ2BloGVbX2tUsgg+Pz/7MULXMooWUKl+d4bNZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB6709.namprd12.prod.outlook.com (2603:10b6:a03:44a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 19:52:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 19:52:51 +0000
Message-ID: <d496a87e-73a1-45e7-8ebb-b907d58dd4f2@amd.com>
Date: Thu, 10 Oct 2024 14:52:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath12k firmware 20241009
To: Jeff Johnson <quic_jjohnson@quicinc.com>, linux-firmware@kernel.org
Cc: ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>
References: <015383e1-f37e-4a1d-b2de-f3261f5ea1f4@quicinc.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <015383e1-f37e-4a1d-b2de-f3261f5ea1f4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB6709:EE_
X-MS-Office365-Filtering-Correlation-Id: 74afce8d-a9c2-49fe-66ad-08dce9651fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjVYT25qYytVWmlVRXlYMXJheDBxTEU0SWUvSjE1OWVWem5lTUZHdDRBWEdW?=
 =?utf-8?B?cGg4ZmF6TUxNV2tmM1BRUUFvM1RFaUVUTmJyd3MxdEMxSi83RE5LNUlIUEll?=
 =?utf-8?B?T0cya1VIb2lzY1FVUjBZSWJzaUE0T05oQWxkTXczSzc3MUZHNmRnQS9vL2Jo?=
 =?utf-8?B?S1p4SUJGcnA4OHBLd1J6TXJHdS9XVW55R2NwVk9yMGpwSnBWbzZMU0FLajhu?=
 =?utf-8?B?R2tDSkxIYndmVURlTFlZR1ViRTZTemZya0crL05MOS9xNzRpWWRGMThRU1lJ?=
 =?utf-8?B?QTJ4TkNYT2NIQ0kzb21hWmk4VStPUjd2SmFvUEpXNGxBU2lWblYyZ2RiY2ll?=
 =?utf-8?B?OVY0QVJiNFl2NUZDU2RJTDJVUlFzaStZM2x3Skg3V3lzRVRMYnN0Mk5SN1ln?=
 =?utf-8?B?TkVQSnkrMXRLcDhaWjlxbHFqMGxhc2V0SHRVazlPenlhaVZHZFFWYkN6TXM5?=
 =?utf-8?B?WEZXUFB2MXZOL1dJRjRkNWdKZFVXb1ZRdXNxOXBsbk1jV0dQNFBlK0FSL2VR?=
 =?utf-8?B?a29mUjlrbzVsMEE5YXZVdEY1bnZHN1ZMYkxaVnFseXh6VDVUNVg3WmtaeTJm?=
 =?utf-8?B?cENlL3VtTVRSeEo3WW1xRWw0N2F5NFlJd2doSVVkbXFSTVg5TFhTMXhybzVE?=
 =?utf-8?B?c1R1S1FXeEhna1FoemlUeDhVNDZOa2VGb3ZNRUg4eUFhQkJYTk45YjdHRXN2?=
 =?utf-8?B?UDMxNUFWdWwwaWJxbWZ4YWxJeG1wZGNWa2prdnV1WEkrbVN1S0dYbDg1U2xS?=
 =?utf-8?B?TXFCb21hSUU4VFFZbVJCRjJCY2dJWUt0SmQvck5CbTU5UWhRekFUMEVpNEJv?=
 =?utf-8?B?OFJETlFUQXpsajA4czI2cEJDbm9OelpHekxXbFhmc1NScmI5NUJSaWJVQWZt?=
 =?utf-8?B?ekpxVEsvRE91UFc3YTl4TTJXNlRYZ1pzRGZEWURrSHY0ZEtwTEh3dDZ2YUJJ?=
 =?utf-8?B?Ulp1SEYxaWNKTC80TzJHZlZVZ3JDa1NYNkR2eDdtN1d5R0lEeHFJNGZNaHRy?=
 =?utf-8?B?TlNFZVh4Q2NOT1BCeGNDRFB4UktBQ2V1bXQrc0p1SUx2NTQwSjRpM2FPeUw4?=
 =?utf-8?B?bzhnbG4xSWw4QzVHekxmVlNDcTd1ajBvd1NIOTlKQk5JOU5rcW5wYUsyN2w3?=
 =?utf-8?B?ZXJmbzR4U1hRRUlIdlFPSVBOTDFaZzh1Y2llMVRrQXdsV042NDltTmhoTThL?=
 =?utf-8?B?ZHdDU2d3ejhFdjA1ZmtRcmlGa3NYMHcwTTcrMHNDTEZnKzhuSjhiV0NhWnhn?=
 =?utf-8?B?UTc0RkxKcGUzeHJjd0V0VXlxTlVLS1NYc3VxMzRyY0MvOXd5ODBrWXY4WUxG?=
 =?utf-8?B?eEpCWjdKVFRVcjRwejEvSlRZZTE2b3I3bTRzMUJPODJzNGc1VVVkZllldHV6?=
 =?utf-8?B?UjVGSitReGpwRDVCaUU4QzVWeDJHNmtOT3dsNm5GYUhheExWdDJBOXFnSlZZ?=
 =?utf-8?B?bTdhVWRtMC9CTEQrTUplWUhla3A3TXYvZnZnRGlpQlpHTFdkc2lIU093NS9L?=
 =?utf-8?B?OHZScjZEZ1JLcTRaeUxvTnRaQXZ6b2xSTFdvRjFHZHdEVENYbzQzRWlGNTdN?=
 =?utf-8?B?L2lPQVRJc3RwNUUvbjV4TkR2eThPdFpmbGk2SnJxYkpHb2ExTnNIK1hUamxo?=
 =?utf-8?B?b1d3MmRyc1V6N0dZRlVyZEViM3ZsR0lPNThETUlLcUgrTXJCcUVyQnJVK2RE?=
 =?utf-8?B?TkJnWWtPL0RjWTFsdE9tZlhQK0g5QzVBckppWXRLbmsxZVpMTnBzM2JrWU14?=
 =?utf-8?Q?q5aBHccmtVB38AyvPk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUN0U3AzRDVjZlpWWnBvMUt3dlAybXJ0dy9QVDFFR3VxZlZHSnRxMmZFZWtW?=
 =?utf-8?B?MmU0S1hTT1F1VTNUVGVnSmcwMk5QSnVkNDUyTm43a1dUL293bHhub0JyeDU0?=
 =?utf-8?B?UkFpblNGanVydEQ0ZmovSlFRYXQ4dFlkamlWM1JrSHBKUVlVWFdhaDVzcURJ?=
 =?utf-8?B?WG84Z3ZkYm1YUEJWRlFqcjZZdEpYbm51WU16KzVmLytubmtoU1hNZnBJMEhS?=
 =?utf-8?B?U2ZsbjBZNU1WQm5hVDV6RWVGSjE0L09jS1cvU1N4Z2tkdXhMTXV5SjRrWUxm?=
 =?utf-8?B?c3l6UVBwdGkvNThWWHVvR1ZoWWM1dy8ySjBmNThTL3p2NWdjVW8wYTNtQWF3?=
 =?utf-8?B?ci9PVitDNXNyT25FMnUxL1ljVEMwWUpXblNscjRrMWZQNTBIbTNPZVhXMzV1?=
 =?utf-8?B?RVBrWkFhNmYvQngwZ0ZKbCtMWFRVSThSVkJ4RWZzNFZNaUlvSjk0cTI4djAz?=
 =?utf-8?B?NmtnNCtEZy9aSE42eEVZK2ZaOWYxM0RLZzU0dEw0MzZvV05ZdXg5aHVoZXVH?=
 =?utf-8?B?VXBZSkFMK0x1dnZXZnZqN3hyNUg0TUsvSzQxdUVYeTlVQ2FTNjN5TlI2dmlH?=
 =?utf-8?B?MFNrSEVleUo5M0s2Rk5tSHhZU3ptTWs1ZWRnZHMwWFlhN2pmZitLb3lDNEEz?=
 =?utf-8?B?VFpkTWJIanh0aHBZK3hYSkZPNURYcVF5SVpRdkxoblBoTHR5NFo5TU5yaTNF?=
 =?utf-8?B?ZHpIS2hFOVJ5L1dubjcreTJIOGVLMG8raFQ4QStLblo4SUdPajNGSHlRTk5B?=
 =?utf-8?B?blozRHhCa3VkQ2J5TERnVTQzS1ZESjhvTWZmV2ZPWHM0MFdHVjBnMHJZb1NT?=
 =?utf-8?B?U2o0cy9GRXZURFl1TDA2MlFFQjVtUUtwL0hWYzh0WDBEVzNPK0hkeGJlU1Ra?=
 =?utf-8?B?ZW81VEZ6aFhSRXhtcnNicUtRcmgvbC9rQ1dhbG1BcHQ1TGlFWGRZMk5kZ01s?=
 =?utf-8?B?VnAwRGh6Z2VkR1AzMUpib3ZLRFdJMkFUaTI5VVdrc2UyL0NzYTU3SC9BcGM0?=
 =?utf-8?B?S3RBMFVzV3RxeTgwUFpTVThtby8xck1HMWY2YXZ5TW9kU0dMR21KNnlCTUxW?=
 =?utf-8?B?ZUxsRkx6WlBKK0VjZ1RFVFpGUkNpeUJGNXhkT1MrUlhxbHk4SnU2MGFLWDZ5?=
 =?utf-8?B?K2U5M2NhWm9QUDVCeXdaRmdTOCt3d09DM1RYSVNIZXlkbCt1eWFXTld3azFU?=
 =?utf-8?B?NkVWbmxlZnJ6QW9CNnV0QVVMcjRKOWpVUldDQjdWdTZRbXB2c21YSUlkNjhW?=
 =?utf-8?B?dS8xVGZrSlNWRm9zRnM5djY5MnV1RjNBYUVqbm11cDAzS2dPbVhGaEZ5YlBk?=
 =?utf-8?B?SFprS1ZhcmhGWU56OHBFaVJBcDdDUmNzdkVKLzhjTnlkWEQ0Q3RkQnpYcnV4?=
 =?utf-8?B?YTh2d2FBcTkzYzNHS24wTytTVi9ra2RVa3JqSU95T1Z6bTNWS1l6RDRxL05h?=
 =?utf-8?B?eElQNUtrV1Nuaks3NXpyVGFXVDl3aTF4UGwvdFBIeHcwTTg1bXk0TTVMVGZk?=
 =?utf-8?B?elI3MUdxWm04OHFMSlIrbEdaK0lCWFJBYy9IN2hKaXNHZFhsODlHZHdXN2c3?=
 =?utf-8?B?SlMwTDFvR1dzbmF5Z25YaHNCNm9NNU5DY3NlYnp0U2hpM0xidjdSaituVXg1?=
 =?utf-8?B?SjJYMnR5eVg5WEFpQ2FKRE9DSlpnSkV4akJYZTY3Nm1lNHpld3BsMEE5VUsw?=
 =?utf-8?B?STFDKzNuaC8xWEdRRkNCS2t0RndHWXdIRGVIclpvekFPNVRrZUI4QVN4RWty?=
 =?utf-8?B?TXJUYTRrU3NWMnFQdTBwaEF3a2Q1RUVab3BKUUhIalRQbU9xeHJOUEVLZzEx?=
 =?utf-8?B?UGxuUm5DYXJmWFJodjR2MWkxMHQ0RlpiS2V6cTNqN0Vrdmcya2h0ZXB4a2dt?=
 =?utf-8?B?Z2tJMVRkR21mQ0R5K3k1dEhRczdnak8za05WWW11Mkw3djN1Slovc01sQ25h?=
 =?utf-8?B?dlZpK0h1eWVpQmpnQ2YzUmdVNEI4WlhEZisxVVlNS2NxT2xtSTduNHovcnh0?=
 =?utf-8?B?elF5MEIzTXZnVXg5OERTUDRoZG03ZUZiaDBCekorN0crKzU5QjNmNUVCTXlY?=
 =?utf-8?B?ak1QbWF1RUt0RmdabHRKTUhoS2loTTZaakx2aFVnWCtaYW0zVzNKR1JQVVNV?=
 =?utf-8?Q?+qELMNlJ/y5CZn0R/a7BMkLIR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74afce8d-a9c2-49fe-66ad-08dce9651fbf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 19:52:51.5511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJsmVQvbBEekdGealr/Hny2BZkKNP3UPiJoLn0BwAE7iT4GRZEPGfbLx4iGFJh09SxHJQJfwLLBuU3aU6Rgogg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6709
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_205306_599205_01ADB540 
X-CRM114-Status: GOOD (  15.65  )
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

On 10/10/2024 13:49, Jeff Johnson wrote:
> Hi,
> 
> Here's a pull request for ath12k. We have a new ath12k hardware
> QCN9274 hw2.0 and an updated board file for WCN7850 hw2.0 which
> addresses the issue described at:
> https://lore.kernel.org/all/44ae68d2-24b6-49d2-a4f9-ae9cbf6f9950@heusel.eu/
> 
> The following changes since commit 919f79f9fb5536c1928a15ac82a2e53183b213cf:
> 
>    Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04 +0000)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20241009
> 
> for you to fetch changes up to 42d754dc98e77e43bcb86def5ea60e009cc49be2:
> 
>    ath12k: WCN7850 hw2.0: update board-2.bin (2024-10-09 14:24:59 -0700)
> 

Hi,

This is pulled after a rebase to main.  FYI we had a revert in place 
upstream for that board-2.bin because of the regressions.

You can double check the result looks good.

In the future if you can use Gitlab 
(https://gitlab.com/kernel-firmware/linux-firmware) it's easier for us 
to accept MRs and let the rebases happen in the UI.

Thanks,

> ----------------------------------------------------------------
> Jeff Johnson (3):
>        ath12k: QCN9274 hw2.0: add board-2.bin
>        ath12k: QCN9274 hw2.0: add to WLAN.WBE.1.3.1-00162-QCAHKSWPL_SILICONZ-1
>        ath12k: WCN7850 hw2.0: update board-2.bin
> 
>   WHENCE                              |    4 +
>   ath12k/QCN9274/hw2.0/Notice.txt     | 3987 +++++++++++++++++++++++++++++++++++
>   ath12k/QCN9274/hw2.0/board-2.bin    |  Bin 0 -> 292160 bytes
>   ath12k/QCN9274/hw2.0/firmware-2.bin |  Bin 0 -> 15224888 bytes
>   ath12k/WCN7850/hw2.0/board-2.bin    |  Bin 1897968 -> 1897968 bytes
>   5 files changed, 3991 insertions(+)
>   create mode 100644 ath12k/QCN9274/hw2.0/Notice.txt
>   create mode 100644 ath12k/QCN9274/hw2.0/board-2.bin
>   create mode 100644 ath12k/QCN9274/hw2.0/firmware-2.bin
> 


