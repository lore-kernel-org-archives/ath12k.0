Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2855CA0EF5
	for <ath12k@archiver.kernel.org>; Tue, 19 Aug 2025 08:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZ7SXOqdYE5cbuYLfbBnkhzEPd+7XTsm00icQVwD4wU=; b=AWD7bmJaSo6hOJSXAJxQu58xyC
	XW6sKgm65wttbOPpTEwA55hC76IykxxzEQ6wmTGr1Gsy+0lEr98V9kjRkdVnihfzItMfM05dGtlPJ
	NSI+OeM9IG0yKqruiczCkdTFheIWHz+KAPG79B34N5WSldPDP5b2O5det5FhjT/CN7q9jw/jZAseH
	0KvKgfzcYCrnZ9Jaa72qrZ+k5DgY7Go96IZdqv9xB9kcDyYJKD31gPU7mwmCzg2z/HGMNLiyi69Wx
	sFysOPkLL3/Q2MQZs3LvH6Cft+x+PBhtvXNSyqNT0zTIByqD9q54q0HcMmINnhT3IXOwYxkFW9Ux/
	luLXuToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHtz-00000009pi4-1EMs;
	Tue, 19 Aug 2025 08:41:07 +0000
Received: from mx08-0057a101.pphosted.com ([185.183.31.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHQa-00000009lfH-2Bvf
	for ath12k@lists.infradead.org;
	Tue, 19 Aug 2025 08:10:46 +0000
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57J5Urkj3536825;
	Tue, 19 Aug 2025 10:10:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	xZ7SXOqdYE5cbuYLfbBnkhzEPd+7XTsm00icQVwD4wU=; b=m7d02YkzuOn2ESTM
	d2Bv0ajvH9sViww1f+m26O7BRN7fb8vRthJJ9D7hFB+NfkETRuEMQNARmdkPHn5c
	UYuFyjm3eWQZOgiCg56NuA9GmJLYEoyaO6qQQbRfx9J5VQO/DXtIVKavF1/XAOz7
	LFTgNIqK5n7RlhyesGcq+x0z61BvxJaddrtKjQFfaimzjQVkyHIWXG5Th5A0y4qt
	9Un8WTILNvIrvVPnt6ohpigz9C7FNes+ySiCseaBeoa0dx70aR+uudwnw594F2Z6
	mhV9KciDL8DJ5qSGPiZIkVRyL1CpZITFNMQSXM0goxXyZtCpbPKYSyj6lXysqZLf
	mm4lPw==
Received: from eur05-db8-obe.outbound.protection.outlook.com (mail-db8eur05on2091.outbound.protection.outlook.com [40.107.20.91])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 48jfdatj6k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 10:10:33 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4jP5DYNwGrqu0ehYMEmBm/rHeNgCekvXjy7h78mDCxfrk6zBrXtWMiBtI0ggtNLAiIXkcGJY8UyfbzbLcmsz1r8LdpryELh0/9ePVryEaE1G7/w+35opIKJFFOSzxTaCnxsh1YztJ4nQLqw/LGzoeE5aMMvb7zvHjzqUtLFDCxON7fwa46awacxCeNjvMcadg1BnsgXLl9ISeEGpl4g3j+rsgZK9xLphdQ6k/rU/3MnZ7rD760qPkk01QykiU6afU5W5MScyfYavdKpPAafnTapCqO57fYXd/66IFP7MFnH5bLlnq1Q/zn/G+7gJzhGXL5fvSOwtleltXwYRMFUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZ7SXOqdYE5cbuYLfbBnkhzEPd+7XTsm00icQVwD4wU=;
 b=bMTr7du3RqSMGmeWnlOgTJrPpdD3x36MNu1UDobM83ZFtY2wFg1KIU5UXdp44bIaq8Maq4+bZp1CYx1bP3inhsPi/Hsg5QJd7OIFOjnOu6FjTSPAt7SDfjB1/ALZBwfnwZZ0pvQjreMIkR6jy/LxW3YNygxYBZ5Y4CGQoFhPcQEpAZohRTIOVQzGbSxPYA7fgrYv2Ndv9HIuot4JxF0btt6QMydXhCBQZnxDCteIHTAuisuRWoVhargg+fFXM/vaFQ65s9vn9kMv+0VcVNFBM5LSFGqrs1AaO1VED2LStnWhn/wpK5vSSyURYg2LwwWuf+WdD+DN8BEQpA/aMn+uMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZ7SXOqdYE5cbuYLfbBnkhzEPd+7XTsm00icQVwD4wU=;
 b=R9Vrw82IYsby7wiUJ/L1Jg/YyCGlY3LVCpv313H8HqzpF617hwiVykaIexT2UmeSeXaVYHdE8vcrRSo+MfT0zlZLDfKjwzhnrbf21crSZfQVVk8EyELccfyt7N/J6MJR3FvUP1WVc6vR5uVwvDwNgAU1QeZUrDJJiP6nVQHtKMU=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by FRWP192MB2873.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 19 Aug
 2025 08:10:31 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 08:10:31 +0000
Date: Tue, 19 Aug 2025 10:10:25 +0200
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: ath12k: REO status on PPC does not work
Message-ID: <aKQxcfbDYOWTa36J@FUE-ALEWI-WINX>
References: <aJ7sDOoWmf4jLpjo@FUE-ALEWI-WINX>
 <d6f0b64f-1764-41cd-a7c5-fb34d034ace2@oss.qualcomm.com>
 <aKQg5vLUplzMUMlU@FUE-ALEWI-WINX>
 <ff8287fc-7122-42e7-b6ab-550576b5d599@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff8287fc-7122-42e7-b6ab-550576b5d599@oss.qualcomm.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: GV3P280CA0092.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::10) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|FRWP192MB2873:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c6ee55-f011-4df6-3437-08dddef7ddd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkppUFczaWtvaXQxUmhaUTJLN1J2Z2N5d3M2R3FLQzdqb0dTQXArTnVySFA5?=
 =?utf-8?B?OVBGRjMza3FTZVJPVHFWbENuOUpWNlpIUjhIK1lDeng1S0V4RlhjN24wRitI?=
 =?utf-8?B?ODJUM1VuMkxRemVZRkFBdnZ3OHdERXdhNlhCWVZjK0QzWXkydTBBcjJ6SFN0?=
 =?utf-8?B?WUtyaG1KOVN6Y1dsbDJEYysvdnRza3R2ekc5Q0xraGErRkorb2dKMG9zTitB?=
 =?utf-8?B?SlJGZEZqTFhSMTFtQ3FLbnVaU0sxZ01FbnlVVVhCTHBWa2drckxBTWFab2U2?=
 =?utf-8?B?OC9PMWdQakRCZlFkR2NlUTdObTRCY05wNVE4cSsxcjg3VTBFanFZWUp4NHdY?=
 =?utf-8?B?WEJOREo3TXV0WWdPL2p1T0c5a2NTNG9mcmpZTzVCcGFsYUxGU1JHWGFPb3FN?=
 =?utf-8?B?T1cyRzVHbCtzYXBjOVJkUGI0c3ZsNWZnSWxrRFl4b3VBb2hUSi9zL2R1QTND?=
 =?utf-8?B?aUh0T2loZnFGeFZoT21pR0ZtUFhVRFZZbG9LbFBXcy81dWRXdGptTWNyWUdz?=
 =?utf-8?B?b3JNY3JkZzN3Ly95WjRscFdWc0tEeDMwN0V6QjE0aDZ6OTE0WFg0TVFLYXhu?=
 =?utf-8?B?eWNLVFF3YVY2MnRKaW92ZjRDL21Way94bTVETERCSUNYMHN3bmVhK29BNGIy?=
 =?utf-8?B?bCtHTHF2c0pkZzFkbUo4N1R4YWhLQU9aRWZmWkZCNmlzbU4vZndjb3NsZjdP?=
 =?utf-8?B?QUthRldPcGVkbU84elp0cnBSQTZFL1FYcGNjRDNseXpJd3hHM0hQa254WUFV?=
 =?utf-8?B?S0J1enZjUTRMTW5Xcm1xSE16VzlTbktUdFVLSTFRdi9qZnhLMm1wdUpYU08x?=
 =?utf-8?B?WVQ2SkdCTXE3SVFZRmJueGkydU8rOVRLZFNPK2dOMDF5dGttNzFxejhib0xR?=
 =?utf-8?B?d1dlQ2dDYXdtbFZnSGlGcjNNdUdIeTJXNmVsbEtqejFKTytCL1RDUmhZRi9Z?=
 =?utf-8?B?UkZTVmRQUDljcVUvVHdnUWw1MlBoUTJIakVJUmoybHRmNGJUdk5tRkMwN3lq?=
 =?utf-8?B?Z0pFUDV5ZlNHSVNNWGJNdEZYOTdwcmF6eDdGMG9pdFpaSk0rQ2plOUNVTmtr?=
 =?utf-8?B?ZWZsODNFQUNYaEFYcmhrYUp4Q1YwOS9MeVRwdHZ0clRLSVc5dCtmQmRXZS85?=
 =?utf-8?B?WEdwVVRnWEdYMGVtSXBhcFBVN2UxOTlqQWxQYVFUcFIzNDZqK1daeHk3Ym05?=
 =?utf-8?B?a3krdVN2czZYcUc0a1ZkZXl6WUl3RXFIUHFEVWtSV2NzRzIrVkdGK0ZDWW1m?=
 =?utf-8?B?MTdMUVdBTHpib2FFaHZja3FqZGErMk1aTERFcU8zRUNVVG9EMnFwUWRXbDZW?=
 =?utf-8?B?WmZ5dmpwS2pXLzFlUUU1a2NXVlh6cUFhNW9USnZXcHZXQnpqZ2haVnpqbFlw?=
 =?utf-8?B?OXVuT3V6MkdOV2dIYjA2NHJWWU0vR0JUbEhleTMraGZobGFmRmxTV0hSeEFa?=
 =?utf-8?B?ZDBHUVNXclljNklUY0N2Y2tWTGovU1BrdWxwaXZLSXBBUnNxR3hRU0xhUUwz?=
 =?utf-8?B?bU1hWi9EWHVxNjJ4bEV2TjArRzgxYm5FeEo0eXh2REUyZExEMVNCbzB3TWhm?=
 =?utf-8?B?REczNWRPOFg0bytyWVdnUEpLY0pVTnk0cUd4STlrMXVwKzdVL2xQblQwaldH?=
 =?utf-8?B?dVNFemVkb0Vta051MUUxMlZtdzBoWE9FazBLSFdCaGNEYlZpZ09Cdjl2aWVU?=
 =?utf-8?B?Tk5RaFp0N1hVc1FEUkRmS3kzSnE2SW5zdjlCRkVKaENVakgwWnFQRGZTTkJB?=
 =?utf-8?B?T3MvOVNJMWxQQk9LM3hodlRvd0k2ZWlxYXVFeXBQaytyMlBTYTg1WEVuTm5k?=
 =?utf-8?B?R1AwSWY2c0w3djgvUUlCbHp2ZVJGcnVITUs0VHdmNjFQMVFxeFB0OThybmpM?=
 =?utf-8?B?VW1wR3c2R1I2MmY4VStNWkx1Nm5oY09TVmppMHRTQjNYVTZFTHFGUXk5OEFN?=
 =?utf-8?Q?nfab4ZD5OG8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0lWbXAzY08xbUw1NjQ3NmpRV01OSDNrditsRGwwT3NNWXJCSTZ6RVlUWGxD?=
 =?utf-8?B?WjNWdGtmWCt2VFJsU2dnZDBEdXRmMS9lWlc3TkRtL3FLYWJkTGFMVmc0em1k?=
 =?utf-8?B?T0pXdzZCZjIrZURRZDFxelVpNHYwb0sra203a0tnU1BaOHBYOFRoT2JyOW1q?=
 =?utf-8?B?UjNRUDBheDgvZkRrcExQejRPdHVsMUhpak90d1FKM3p0aGV5M3Q1WVZFb2J1?=
 =?utf-8?B?RVhOVWJMdytIUWRsNFRtdXlOd0lFQzk0RHJsNTBqYno1NVpFcVZ4L0J0WFJi?=
 =?utf-8?B?T0pEeU5TVGVYdXVtM1l5dnBCbkp1Mk1vRnkvRGFOdWw1SEhGZ3dRU0VnT3Qv?=
 =?utf-8?B?czFMTmNjbkhYZFJhUzE1MytvUUxMM0krL0ZpUzhlYW5wQkVwa1RBeUZ0dU1a?=
 =?utf-8?B?N20ySktYRlFja3Z5NkZ5OG13UlJoUnhOb1RFcXAyclUybkhWb21CcUR3cjlQ?=
 =?utf-8?B?bCtRMEZMSmtNenhacUlqanF5UUJVV0FDakdtaGE0bHRmRmFkVzdzQzNJcjJL?=
 =?utf-8?B?M3RURTRaRkc1cW9WSkZZWnFqVU5JY2ZuOUFLL2t3ekVFcGxQUmZQNlRZOFhP?=
 =?utf-8?B?dzNPenAwQ05MRE41RXoranJkaWNBa1psUUY5d0djcUJ0Z2RLY2lFQ3NFZ2tX?=
 =?utf-8?B?RFp6cC9Ra1RzV2ZBMHlVd2tZdU5VWFoyczJsTmJwR3VGdHhveElubXo4VnpN?=
 =?utf-8?B?eG43SSs3allWaG4xWWYxY2Y2cHRXZjdqTGtHV0pmY2MzMDJYWGhqMTZKSlhl?=
 =?utf-8?B?VCt0bnlMUHEzVERlV1ExSGlCbjc0QzFlZ3U4UWExKzZXSHR1OERZbnU2aGFS?=
 =?utf-8?B?eWtMNXBGZEZjUDhtTms4dk1PSXBkREhQbHorUHpTeUxldWJ5dXVIZkZYdHk0?=
 =?utf-8?B?cWxtbnp4T1FUbWdRSlhBNCtJbjNGSkpHUmFEWU5lVjRKR09YMVcvQXJKWDVj?=
 =?utf-8?B?cUtBVzIyVksvcFdIUkRTU25SZ3NnZWdVRVRQNlNZNmhPelljYXlLTDBRYmdi?=
 =?utf-8?B?eWpHbHc5b3J2S1pEWnpaOFlqMVFtdE5LeHlYMDhHSmxZYmxGUnJwL05ZcFlC?=
 =?utf-8?B?UTBjTDNOYkkvVWpLVndjRnEzRE9GNm5HcHVGZWVpV2RqeU0wTVNwSlNYNExB?=
 =?utf-8?B?eUFOZzU3bWxNSlNTdXZ1VmFJby9YczQ3TFVIRE1oNS9mTVo1dkpZbG5malE0?=
 =?utf-8?B?SU1UYXVVOEFZaWZnTXVnWmRuVGV5dHI5UHpQK09PMlZTUVNNa1BLaGo4WWs2?=
 =?utf-8?B?a21Sak1mV1dVVUFPcGVPcDdVZ2pKSlV5L3p5c0VjbERscXlLQk1PcGpqaXlD?=
 =?utf-8?B?cWpnNm5UM0JZVGgvTVlDVWEvMDRVUGpqRWtFT0hwWnlBS2lVbUFPSnFoVlBY?=
 =?utf-8?B?ZU45OXRJcyt6RkZuWnRQNVhJWGdwdzZoNXlReWFuMnhURytVdUVuY244N0Q2?=
 =?utf-8?B?TUthaEpkaHhEbjRUUnhrYTBwcE5YMUw4Sjg0azF4OVdOYjFRZXZSY003TGt0?=
 =?utf-8?B?MHlhVkJtcjAyamVUaDJ0djcrUWpFb1F2QjZhYU9wRlZlQmtXK1ZHdXRYajFs?=
 =?utf-8?B?SmpuM29pcVc1eHB2enJ3Z2xPS0dxcVBmZThFSjJ5NlhIOUp3RTZrUTZPaExn?=
 =?utf-8?B?L2hVcWVEWXVUUWxmWGpCaEcwaHJha1BFa0h1L1ExWWV2UGkvTEJkM2w1d0dY?=
 =?utf-8?B?eWc4M2V1U3EwOUQxUnRkTjBLeitQVHBXUVBHbWRYeDVOWEtQckpzcGRIR2U3?=
 =?utf-8?B?c3FobVN3ajZuS0QwNjR0NnphQUtsSFZ6TlhUUXF4VmdsZkRlYmpyVElVdjBI?=
 =?utf-8?B?V0lnbkxRRXVST1VIYTAvRHJIeFYyYTVXcUZMcWFDcnNYc2NTWGFDYmxnNTQz?=
 =?utf-8?B?RjdVeDFDK0I0ZWlwb3gzRFZTOGVSaUY5eDdqZ1Z3K2lnTTROWVhJZGxudzln?=
 =?utf-8?B?Z05JdUdjZlFrWC8vQ1dJWGNiTnlXcW5rUnhVZHhkQzFCMGl1N0dXNW1HQTJx?=
 =?utf-8?B?d3JlRjY4cGlTYUNtSHZYZEpIL0Jxam51bE1mdnV4Uy84eXBsWFBQSXAyTVNM?=
 =?utf-8?B?QnpkelBHYnJjSjlLdlkxbG1tUDZjbUh3Ri9kMjY3WGZTQm8rd1pNSzl6SE9i?=
 =?utf-8?Q?WwS4/ulMqf4eZJg4vdpHCLaWn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: mHycf7dD/H3fQxuPV9ydwgxIXv3iG8nTd4uOnIikLVvexBFRpHdQVEkNzfwV2ZFbIJhX34lkSrpsw0pHlmKYs4YU9ydzw3G/MsAA5b0DbTS+TNhV0rIvIDR54WQO+WQ2XHLtEutqRu8ftAUx76e91pB79pktu5OVTyZhOnquIKuk+CQUlWj+NEDEwvWR6vdebNTEMI2SGGNtZX3U+AnKk79tX3JqJra8ROa8fC8HD0Sd6o9/NE0z4ZRAgtp0YnVfqcMWxTfVoOcSF5QSkf6ND0IJ+tfdv0L04T/Xpz/OQKzbIo4tsJd0fuK2qjupwkrUpuwwW8J5ikiPeLOjIuoN8W7iBVhGhPr2WLq8Id2INTP7kuusqkUVkEC8ebNvBkjugBuBf8v7sGJ9yTfWaWviIYG8fVpqr3aqSf+dcJwigvol4FvbBlNKsKqcoLrbmsLFtK3Ev0X11sQtMEYo+ISGojRcEnPbY81BkWfU8ua8/m+rxGIMJgN3tZrEn67CQRGtgPp/LpFSC5DBwMbKdPUKTfQDZL72v79q85tYtQjcn377AGCoFOyQCfd7cpgucWkAs6xU2G0dONDFE70etN36wFB9YdbR8BymPbUiVqDNOjFLmPPQC6vxwbAC0QI/d0W8
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c6ee55-f011-4df6-3437-08dddef7ddd1
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 08:10:31.7374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1wHGdxlkyiyfxTz0DwRdyed/XKvJdIhOTB0uC0l8lcNKSyrag9tWseHLXPcmwkWhO6WjySyQH9UcXqq0YvGYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP192MB2873
X-MS-Exchange-CrossPremises-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
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
X-OrganizationHeadersPreserved: FRWP192MB2873.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDA3NiBTYWx0ZWRfX45gDW8jr8QBH
 zBLu9GSkE3Un6zCnWk0G+ySP5VOdBXl1P/OaAostvgI6i/HVZ2aLtkX+LssyJ198xIQIUNnZuQ3
 Qf7lczOWP5RatLjCE34F3rS0RWxmPHN0pJdco395bCmCtYED4id8VLYEu0mfVBwfakYoQ9qGtSA
 Z/GCAmOjxliO+h5BnbT8I3SqPg3i3gad/eWadTuYg1Km8LEgzUo6h5tOxOlO6YWTjUzqxe2f+GQ
 Q331OIjVqI7MHp7gLrhImlPberIBlsAQU7urDGVQ10v4YLB0il9yEYWs++OYQmLE4fNW1ZHMDYB
 QrI5cIQ84G+zhGk6rl53uqIPcytDYo9bQx+ULHl3i4XEzUOXot+FsoWk+8Bo44AMAvV9gOauD2f
 Kikq5XGvR8fLgdE6Wdb4qHCT/bNLbQ==
X-Proofpoint-GUID: s6kJe4qNdp7UPwc9msb7jYU7kKMFnUl1
X-Proofpoint-ORIG-GUID: s6kJe4qNdp7UPwc9msb7jYU7kKMFnUl1
X-Authority-Analysis: v=2.4 cv=U6vLzeru c=1 sm=1 tr=0 ts=68a43179 cx=c_pps
 a=lcDmqToniXHsFda0YvPqtQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=8gLI3H-aZtYA:10
 a=uZppu9TIrXuza_6qFoAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_011044_844719_CBAE11EA 
X-CRM114-Status: GOOD (  26.59  )
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

Am Tue, Aug 19, 2025 at 03:26:34PM +0800 schrieb Baochen Qiang:
> 
> 
> On 8/19/2025 2:59 PM, Alexander Wilhelm wrote:
> > Am Tue, Aug 19, 2025 at 02:38:38PM +0800 schrieb Baochen Qiang:
> >>
> >>
> >> On 8/15/2025 4:13 PM, Alexander Wilhelm wrote:
> >>> Hello devs,
> >>>
> >>> I'm currently working on getting the 'ath12k' driver running on a big endian
> >>> PowerPC platform and have encountered the following issue.
> >>>
> >>> In the function 'ath12k_dp_rx_process_reo_status', the REO status is determined
> >>> by inspecting memory that the hardware has previously written via DMA.
> >>> Specifically, during the call to 'ath12k_hal_srng_access_begin', the driver
> >>> reads the value of 'hp_addr' for the destination ring (in my case, always with
> >>> ID 21). On the big endian platform, this value is consistently 0, which prevents
> >>> the REO status from being updated.
> >>
> >> This does not seem an endian issue to me, because either of them we should get a value
> >> other than 0.
> > 
> > Really? I always assumed the value remains 0 until the firmware writes something
> > to memory and moves the head pointer of the SRNG ring buffer. By the way, I've
> 
> correct!
> 
> > already implemented the missing endianness conversions for reading from and
> > writing to ring buffer pointers like this one:
> > 
> >     hp = le32_to_cpu(*srng->u.dst_ring.hp_addr);
> 
> I was actually meaning that, when hp get updated by firmware, either with or without
> le32_to_cpu conversion, we should get a value other than 0.
> 
> So in your cause I am suspecting that hardware/firmware has never sent any REO status to
> host.

Yes, I see it the same way.

> >>> Interestingly, DMA read/write accesses work fine for other rings, just not for
> >>> this one. What makes the REO status ring so special? I couldn’t find anything in
> >>> the initialization routine that would explain the difference.
> >>>
> >>> Could anyone give me a hint on what I should be looking for?
> >>>
> >>>
> >> What hardware are you using? WCN7850 or QCN9274?
> > 
> > I'm using QCN9274-based dualmac modules.
> 
> sure
> 
> > >
> > Best regards
> > Alexander Wilhelm
> 
> so did you see any obvious issue?

For example, in the function 'ath12k_dp_rx_peer_tid_delete', the function
'ath12k_dp_reo_cmd_send' is called, which in turn registers the function
'ath12k_dp_rx_tid_del_func' as a callback. On PowerPC, this callback function is
never invoked, which eventually leads to the following error:

    ath12k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 15 (-105)
    ath12k_pci 0002:01:00.0: failed to update rx tid queue, tid 0 (-105)
    ath12k_pci 0002:01:00.0: failed to update reo for rx tid 0
    ath12k_pci 0002:01:00.0: failed to setup rx tid -105
    ath12k_pci 0002:01:00.0: pdev idx 0 unable to perform ampdu action 0 ret -105

My investigations have shown that a cache flush is supposed to happen at some
point, e.g. after a timeout or when a threshold of 64 is reached. Since this
does not happen, I encounter errors after the 127th 'cmd_num'. This callback
function should actually be called from the 'reo_cmd_list' within the function
'ath12k_dp_rx_process_reo_status'. However, this does not happen because the
pointer is always 0.

I hope I was able to explain clearly what I was able to trace. Please correct me
if any of my assumptions are wrong.


Best regards
Alexander Wilhelm

