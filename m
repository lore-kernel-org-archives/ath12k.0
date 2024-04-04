Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9797BCD1292
	for <ath12k@archiver.kernel.org>; Thu,  4 Apr 2024 15:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:References:To
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3p9GhHG/R7rnJFkaHNL0azISElqKKlBc4AaTl5vKRI=; b=HRYwFmSTVOG43zv1SX6LeCwvJ1
	JdiIRzyxasj/A+zFjaD8dImDePOlMHcmqI1+6nnlgXfEUHt3oSH1amgrerpLKZIhbNIDpAWrmXaQs
	SPDGolNfV+Xxc6ekpyY7WGr0nQDLS9cgpdW/dMSeOYEur1HOuaTWGozT0hvfU1og67a2sTVpacZkT
	wV+am4uDaKCKspiXE6Bsa8CJHY1EYryK9i91JWscDw/EsVXByzyLX8a7i3V+55UEyiAwi9Ic0If7/
	iuiLhp1SdPTa2ueyVoJRWRXw+yZHs03Lk6r3RW5t5UnnlorH8AFdxdkyES7ykdZCrUWU21IhGIp9X
	Af8pha0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsPEF-00000003HeI-1Mfk
	for ath12k@archiver.kernel.org;
	Thu, 04 Apr 2024 15:42:15 +0000
Received: from mail-db3eur04olkn0821.outbound.protection.outlook.com ([2a01:111:f400:fe0c::821] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsPEC-00000003Ha8-2AZy
	for ath12k@lists.infradead.org;
	Thu, 04 Apr 2024 15:42:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEJB64Lye6bGGKmloa5Ef43tCHI+JPCvbEQxAvqR5Q4rQs5BSUG7YQLVYls/Xapmc3sy4ZJpafIt2WfXzEm7++yKyRUzsQ8puPfENkgW9wAl+OE/JoZ1jEDVuEx4JCg0fV6K77Q0CAzpWYcpRGP+QKe4a7UnWn1skqGkYNmXtptQphAOIgvs+TSPcBL88Ib0B1WbKCme6D7ex4Hcp8WAopcgJdWIyULIXIs1aHDyegM6zxfa0PvLYZYrxa0cGBryaavur8qtEz2LSAnReIB5YwvvFApwVgZ3cI9HnAacmb3tT4WbL6urh1MAlMogPSrjVCIsFVifMoiimheHovno/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3p9GhHG/R7rnJFkaHNL0azISElqKKlBc4AaTl5vKRI=;
 b=dHXUnaZ9zhiVhNSfmfC6mW86PSqUM2WG1TZYw3027chZpqB/Uku405PzmleKSyIpalhi2BcznKH8zHJyK5+sbK6Kxxa0XPqGDxtHvaRJjVMntwmBn2jyWX+mNrLD156F0dxWYAvTNLKEuXBG8s4mGLlOk7ANQzTT6OkPkwMz4KM/U/K7e5poYK7wrt8Gt/LLN9WmqzB5rVw9traxnS0G6MOtxje8YSwk+X0L9Y+hYSOUz6KFHcl4ElQ/LbmKh/ftwMoNW62WvAUxx7hxQzbP/Xpoxzj4pHgt6Fe7x6DAZZH8rMYbHL333jMZHz3aPmb0jYr6UnkQsmQatOQ7QyWDNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3p9GhHG/R7rnJFkaHNL0azISElqKKlBc4AaTl5vKRI=;
 b=WZ3rAcprFUpQrx+pX41aUHj14nNc+g4j1mrYUMElmxa+dKHvqpYAkWR+OX4ECfkF+Tqm2v66vNG45xZG5FPH15keGyzX59CL+uC/l2thGV3hKMV4GKLsgJ4hUzkFxee9dCMghPMyQWohKxXSdRa8Du/9237Mfq3U/dG/ahf9wLYVJthtbekglfD/vXFKTKQ3jjnbNdhWO4s15AFAWOMrwvngXU7xN1lURxGnGt90b3slv8Zwg4WKUjwP5iVIPEftusu4k+b71XeWA/a1GUC+VVy5nizTw/6eXwXOLG815WUksgFIAhDOPCk8DPvqepsjs2UKIzSli0QeWmTPJaqqlw==
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2eb::9)
 by DB8P190MB0602.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 15:41:49 +0000
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::9281:a613:5100:48dd]) by AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::9281:a613:5100:48dd%3]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 15:41:49 +0000
Message-ID: <AS8P190MB12056A9DFE1C0A1C6BB12EBB873C2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Date: Thu, 4 Apr 2024 17:41:48 +0200
User-Agent: Thunderbird Daily
To: ath12k@lists.infradead.org
References: <adf6e7df-11c7-4692-ab8d-d53eb5675045@quicinc.com>
Subject: Re: WCN7850 disconnects and reconnects in a loop
Content-Language: en-US
From: Gregoire Stein <gregoire.s93@live.fr>
In-Reply-To: <adf6e7df-11c7-4692-ab8d-d53eb5675045@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [OFnQViVVhuRKe1ipkZcWSwPptjn4YugI]
X-ClientProxiedBy: PR3P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::20) To AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:2eb::9)
X-Microsoft-Original-Message-ID: <2bd04a3c-d868-4290-85c8-551505754804@live.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P190MB1205:EE_|DB8P190MB0602:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9bd98f-c950-4719-4ebf-08dc54bdbdde
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ckTrPOTnCJOT4yy15y607ml7BkXwB1PZNWlPGTSbSYhA9a6la+21AVVxEmVznvYw/G+R6eu2YsEiPX9msBAtsLMlzCsM4hNAEG+FRa22tqPSWrdJaGLsHar6/vQFTveiaUeUpRqi3+AxQFHAKsjICqHUQpOZGIz+QMULTRBszp+SH3YlqHsgYYzgGBLwUw1qfFzhXX6osYxcLRP2o+hZ44K7BLUWfgr3Ao0ycfl3nVm6WuiDX5AaQwgZl/4/R6fjZL2fm5cjP70rZq4lkYishkXnKlBOOJa7VBz+JmE6lcjMu/oWcsMCEzYyZs4NbIDmEwkidr8M66lYXxIAKdkItGTeOgaQvi/dUthjWLSYsFlOW6+s+fB6IMFet2HhmNhzyMb6pFvTGok/PyhPaeZkZ12UE1xXGA2VlctcTvbpkGqRkKtiLhlZhFH/HwMBBwLNllPa4L/Pa0WEhIf+3JqjW740/js9hzvdDZe1h1F9TZm68GtBfpLqKQD6y7n2qa+grqi7/+2we4T2S8MyUZy1ctCyAIUKVzVPTrCvTT90lDtO4yEn6fnZ2Fi0S0ic9EVYspo0CrgBKSdyRsfkCk8KVm3qGV+Q1x1h/ETpKnTbOnUe7U36S2LSYB3lnQa11UFYHjulDF7vGX5iyrplFCYFw/0Ku7+cwUcLIrt3cGeWsYM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTBxM2RJWGplSGR2MnhJbDk4aGljRnBxN2t3dDVFdXIzUjNIRnNXZW1kQmpq?=
 =?utf-8?B?TnhLckpiRmN3R3J5bVdYbW5WQ0RKcE8zVktvZnRTVmd3SUZKYm54ajNIRWxE?=
 =?utf-8?B?UHdVcmFKcWM4QVBXUEpGb05CTlp6ZHVNS3E4eitOdVlMaUVSaVg1L3FDSkh0?=
 =?utf-8?B?akh3dEZwYm90MHY0eXpDSHZ2UjJzMk8yYnV5b0UwSDE2RXR6bGxuREZEeFUy?=
 =?utf-8?B?K3ZQOXYrWkpMaG42dVlCV0hmOGtVV1JNYTEzMmFWOUJaaHp4RjYxaVU5RGRX?=
 =?utf-8?B?eHFHTUdmTHd1U05JcTA4cmxLZTZvM1VINzFFdk9TRjdvTUE5Y2ZZMVp1R3Q1?=
 =?utf-8?B?YkhVNTNRYkpFTWtsQUkyb1ZxcldURFA4a0E1SENxU0RkQnY2SzRNd0VrdlMy?=
 =?utf-8?B?aFlNRTgrdU9zVk5qSHp5WDVFdW9UeXorVE9lY05tVDEzZTM1SWZHZzhzaTBU?=
 =?utf-8?B?T1FVVWNublVQcFlLeHRLdVFVS0pJc2VmUk1MdUdaUWoweGRtNjRMamROSTRV?=
 =?utf-8?B?WnRKZC80aG5Ocm5kblh2NThTZDRNZTZxZ0p2Z21oLzJlcHpWeUNvY0dIbzZh?=
 =?utf-8?B?L0J6bms3am01aUhsL3lHUXd5dTBEMElDdTZXMm9Yczg3QnE3bGZXa3FGTUpX?=
 =?utf-8?B?U1B2ODkrNjJaeWZNQVYrQnJXVjlEL2FEdFd3aFhsQ0d5K3Vld1c0RnExbGR1?=
 =?utf-8?B?cS9iMU5CMFhOWXZEby9iZXp0cVN5SW5pNG92NXAzR2QwbFoxdThSR0J6QXhh?=
 =?utf-8?B?UjdZckxVTG1rNE5FTGhHYVh5dnY5SG1FdnFJcitGUHRiOFhYZjNFUTZSSE5Y?=
 =?utf-8?B?aVF5OTY1ZnF2Zkg4WjB1cDFKME5YL0g5ck0za2pGSHNyOWJSTXU3b0doK3lZ?=
 =?utf-8?B?OTJxMnFpYXlURFpIbE9kYXVycmJlQ2R2WUk5RHRpMFJkOVp3WmJWdTZ5Vkxk?=
 =?utf-8?B?c0VJS0ErUVcwdmo5N1FJQld6dzB3eXhja2RveFRZWC9hbXl3S0VuVWVTVVpl?=
 =?utf-8?B?ZEZBTjM3cCs1SXVJRXRnaXYrVk9PaEJjZnRPOVBUMnRlKzI5UnFoQk8yRDlK?=
 =?utf-8?B?STBDczhkYUxPZWR1ditRTHdFTHNNSEk3akRRVEQ5RUtBWlFXbjJJd2pYK09p?=
 =?utf-8?B?dGxzOTRkdkF3UW5VTTM5elpqblFMRUVrZ3FtSlFnbDF1VjU0Q3JiTFhpNkN2?=
 =?utf-8?B?b1JZMUlIM29mL2taK2syVHdjajYxNVJaUUVpN2M0blczUTlLekJDa05kZTVs?=
 =?utf-8?B?TXpQUi95Zy9HaXJGVzZpWjY4VHlvN1FiVXJjYkJJWkhqYkxYNE1GWUtZcVQ4?=
 =?utf-8?B?UFdwUHRxUnFJa2pLT05LaDNxRHM2K3lHWVJ0MFpVaW9SbUpES3AwdThSQUZk?=
 =?utf-8?B?aHFlODlKMkpER2pxaGtFMHM5OFBpdjZiNno0bTlmRXc5cHgxRVEwbEVvNE1p?=
 =?utf-8?B?WGRSNGIxM0JhK0pOODF3NFJ2YW1nZjhoTnVCOEhod1l2QnIzT0NTRktTUy90?=
 =?utf-8?B?QnNHTXljV1J6QW83MUJGbGU1NENhN1JQektoSXFEUXhpdlBvYUR2YngxaWYw?=
 =?utf-8?B?aEJDemtRei9DOE1VQisxUlJaUGo4MEQ5NmV3OEVyNkxVcUg2ZW82VGRKRTdO?=
 =?utf-8?Q?ed5U2xIRBdSXaWnBmOeL2LL5C4crXBkDFruVKSf1Rkbo=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-91991.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9bd98f-c950-4719-4ebf-08dc54bdbdde
X-MS-Exchange-CrossTenant-AuthSource: AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 15:41:49.6516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_084212_759430_66B95714 
X-CRM114-Status: UNSURE (   3.41  )
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

Hello,
now i'm on the last commit of master-pending 
(6.9.0-rc2-wt-ath-1-mainline-g853450ce5ca0)
here are the various logs you asked for: 
https://gist.github.com/GreyXor/927e7871e70630beabb522aeddc5891e
There are iwd, networkmanager and dmesg
iwd is launched with -d and the ath12k module with the debug flag
thanks

