Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C8ACD1288
	for <ath12k@archiver.kernel.org>; Mon,  1 Apr 2024 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:From:To:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=912rwsLVcuo1bl+8Y6fryzTIc+WcVrk+9jNm29CvHJY=; b=Hydv/YD2Kh8Ah/
	5Gr4NTzPC0kRg4aGmtolmAC9XOTxwC2J49gswK65r1ivyy6jv+KZMVpzbWl/37Fef/MJFWaKiZ8g+
	++y6BFCmfNauYuSk+JlFQl4UrC5h3+lwjS6W42ylXo0CqGnl57tYQVwDzy710jfm3+EbhK5YQ1LFV
	vPAxlNM1oiulsZyCjTrrUeg3DXV45WTtqGFUkd0a9Fktt3s2sSYPX4MQMmmaNyJWb/toCreNcK3yS
	CmZWSCDEKsp9FVGW7r5oOq+ZVuvo527QqqUDd5RGDgUM64b2chEzTYbzW4xlhCbDhh+SchJiytA6C
	vpagqXvLBZVwk7iP6Rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrFQ9-00000007WKe-11ot
	for ath12k@archiver.kernel.org;
	Mon, 01 Apr 2024 11:01:45 +0000
Received: from mail-vi1eur02olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2e07::801] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrEPG-00000007P0j-0evC
	for ath12k@lists.infradead.org;
	Mon, 01 Apr 2024 09:56:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtTGjWOe6Xmijk8ndCkvVk1BD7DGk3ewqc35eC77WlsBe+zc4fozvBtL0DDvt8eiUwc7fnSJsxHYuF9lKxdX08Ap5AO1P05vMpPouTrDcEKcYnO7PSKtm1L/tiWCcyEsSLEJLSu6zpBLZAGvn6fRTPG82R9fMNh6Obu6On7xc5TEKXpSzcGJkZ3u430ZWgyodXExk3sbVrWpFSMZRt5pqY9XM514VRHzifJWKYZf8lTv7Q7imNq43NhcOcrsIMwpNyUxk8rxVsreTn3NK4y9D/Bk+EqoKLihT322ZbFS7rP/1SX7U16AR33nsV3j5/9UMOY9tCuOw+9yyA4YykWkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=912rwsLVcuo1bl+8Y6fryzTIc+WcVrk+9jNm29CvHJY=;
 b=ST98ooBXjiJpLjG1prEGrjgyUaqYnlE0BicMYhX/FZQtsG5GiLKzXLcdCaSTYeLHHCu0Ull/LjG3jjlgrRv11ybzK0eWOayU4vf2LASGPfqrEOqCXG0RjPStX8QoY9deb2YfY0yHufc8hjlic2p9xGCNMg7jGK19tPQ35a7VcwPvFXDr3pUOcotkT5ofxFFpautocfWxI0ozVgcKos3E0Nf5nj/BYQ9jRpl5Wn2hjcTHoauAZBRrYJug9PUhBx2vpPJ/3SJHjOtKdvW/fZqGc2uzBU+JVbV3RRRJ/lOnzZMAJgqEfIYOoZ7mtuh9Ot4SCjH1MxcbeZ7EFJkx3IEh6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=912rwsLVcuo1bl+8Y6fryzTIc+WcVrk+9jNm29CvHJY=;
 b=qQxjJ71ZjT/vS7QaS3A4LRnpBCkBOt7ZKYTv+5/djYJr13xgW3Z/7t2ctR0X1B5woRSSlDwJiHBI0qbfdVPQux/EXbPsMfOnLaRlWNZdC+VTX7wugM7NH3gh/7lMPel5Cmw/l+rY4duFgkYPoMG689qLzIJ8rDbskllsQhpoRMxtRG6KBNjgeHHgGf3wiEIPx2Wk20OQx5rDDOEolIpNNR+tAHVd8e2M50oH294D6mYNe7nbPxWxl9omcx8uulbbZ4a158LuN05ipqtQGTBiPK5Zk555UqFA621lSJvCdxWqHGpKlazt+PPFDoLtHrbgqf7sRXoM+18a9bb04L4AFg==
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2eb::9)
 by AM8P190MB0899.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:1d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 1 Apr
 2024 09:56:40 +0000
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::9281:a613:5100:48dd]) by AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::9281:a613:5100:48dd%3]) with mapi id 15.20.7409.042; Mon, 1 Apr 2024
 09:56:40 +0000
Message-ID: <AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Date: Mon, 1 Apr 2024 11:56:39 +0200
User-Agent: Thunderbird Daily
To: ath12k@lists.infradead.org
Content-Language: en-US
From: Gregoire <gregoire.s93@live.fr>
Subject: WCN7850 disconnects and reconnects in a loop
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [cmGj0zE3cfBeero55lxnud4oIeERCAMU]
X-ClientProxiedBy: PA7P264CA0249.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::16) To AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:2eb::9)
X-Microsoft-Original-Message-ID: <aa17cb3d-59d7-449d-8cab-d98015e71289@live.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P190MB1205:EE_|AM8P190MB0899:EE_
X-MS-Office365-Filtering-Correlation-Id: f637c39a-6ec5-4cdd-3f15-08dc5232071c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJIud4/DIAXdFlC2cePivOr179iS7H/JYboY77RgeoEbwroIysjCXFvnzkZwHVEeETLM4689m+kmIGEA0pXS4vQUamwyc8s9Cwc5+YiiBx8PS1swCriq1kg5FqgEYCsulS2g83IyyIbL1sxOlZEQzqkXdh6jkdyDc8wijtt/6iKuzfweL5Bklg3CxePBQlDl5Ax92o6J+pWD5vkluFekeHlsCQkH1jDQFdQHUE+IXti90HcAb/6ZgkgGhPPFEWzI4gxWyzBhpGFyNGOM1scoXdEYLThDlr9RnyeugK19rsUpNOI9y7uWFHX/kBXXYiYs/w9xIq5SI4dgZ4alIdjU2RHSI0WF/deJgv/0kJrcuoSFslDwnC/w+ytK1Wp+j1rLVgHhNB/JA1C3RAmrMbVcht4/mvT2Y3/R+7M0mHQkOo7Fb/gKuETV3/463x69ELHLZex057IYnZtjGIp7yLYJ4jLRz9hvp9RkuT/vtYzFBOclcV0FOB7GsMrArVcWorIy0QZdaohZpPfzZ/LwH7+2WEFnO3mvBLb1rifUg4zyd9dbM1gK4nAko5hM7VbH5ujzdhjJUsNQNjm6hoRpmi+a7i8oUugL7r5a1UGuKQa/itkMW3nWH6uuUdLGPOZLqrEnzFAFVVPU16khzk2Z1F4Y0Mg9JydbGsPrDVZ1mIXDrBk=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHdweHFiVldmNU1ZZ1lLTWpManFkS0Ixd2I0bnlaMGxPcDRBUGhPdEtuenFV?=
 =?utf-8?B?NTkvYW83dGRLS0c4ZUFkdHhLeVRGUUo0MDlXRExKNUExM2lQaTNPeUhCSlVa?=
 =?utf-8?B?ZGZxZDNNUjJTYklNSUJpVmdmb0NXdlRzOXNPNngxU29RbmhrSzF1Q0duejd0?=
 =?utf-8?B?WmQ3V00wcCtJaFRIcWZJc2lHM0p6UTN5MktQZkZ6aEg5UlN0dnNCZ202aEpF?=
 =?utf-8?B?b1d3VytXZTU5Ui95Vko3U1k0MURYeDFTMzEvbjViQ1l4NGRvZWxRbmxZbmF2?=
 =?utf-8?B?clNYTjU0QjJDOGVndEtBczRjMFFJb0lIOHdSc0dpVnZWQWRwSHVsSkhqZ0s5?=
 =?utf-8?B?MmdhVVA2VWpURDVZT3RxRmZNaitHMEdNOTl0ZlkxSVBOL3NqR2l0SExXb1Rv?=
 =?utf-8?B?SmZnbmJTdC92OWQ0WFRoMC9meXdCNkl4VERWVTZzS2JENkZRWDdhMzUzUGdj?=
 =?utf-8?B?WkJuRjhsYjIwcVoxUllSME5heDZycjBDRFJVSkZOQzR2SFI4N3V1L290WFZk?=
 =?utf-8?B?b2lYb1cvK0QxcjNwRVlLNldtMEZMc1VCT0lPZ2VWWmx0VnJlb3BybFZCSkJt?=
 =?utf-8?B?Z3NHeHFUT2RScXh5bGNtRHRYdGRWRkRYOHdEMmMveUVkV2JhQ0Q4a0luM0xU?=
 =?utf-8?B?ZlF4NHUxbkhhOW9tcHVobEhQYzdWZEE3NHovdER4dDdpSGkzYTRSaE91K1NZ?=
 =?utf-8?B?MUs5MWxoVk9yMnlWNnQ1SFczT0h5cjN1VW40S3VwSEl1b2dmeThRT2hxSGNh?=
 =?utf-8?B?S3JrQnJGb2gwUTh6NEtBWllrdXRpdE04a0lUMmU5WDREaEM0SGg1SEVXODRZ?=
 =?utf-8?B?Y1RPVEFEOHVPTmhwSm56SDZ6MGZNM3hVYm42M3BHMytwZkgvZ0diaVNTYmd3?=
 =?utf-8?B?Qm5UOUZMS3M1MDlNRUozU09LYm91RGZLUHdPZU1sWitCbDBxOVlZMmRidkFz?=
 =?utf-8?B?WTJUbWI4N1FHNEJ4aS9aL1BlalVxR0xWYjV3UVJ3RGpLT3ZqbytFUTYrQnNj?=
 =?utf-8?B?amJ6Vy9sTjZySFpOQnV2N1F0dzVVNHZYSTV3VWFlTEYwVVJ3NDVRcTJ5UHRK?=
 =?utf-8?B?dEpDZXBaclJ2UzhaZmhUakh5algrc09TUWNaRGl3Vm8yeGhheTVXd2YvR0h1?=
 =?utf-8?B?eUN2cDVNcENjSjIyeHFETFd0S0ZQUnUyaWc4YXg2SlNjOFkvRENLRFowQ24r?=
 =?utf-8?B?RzNjWmdVOWtacTZGZjZGTUQ4ci9kVTlURTQxdDIyL0Rvam8rUytOUldLb2pO?=
 =?utf-8?B?Y0dqU01ieTByWi9VR0RpWWQ0YlM3SG5KbEp5R1RHWmV2NXdaaTR6YTdsRjgz?=
 =?utf-8?B?WE9qRjBFTnEzVmxMYTBxSGk2MmxhUENoWkl2QVJuVFdmeFlnZHpqQlhWdTV2?=
 =?utf-8?B?MjgwOWhCemVndDRoWVQrUUVVOEZjSlRiUlFOclNZemdEd0syaWFWUGVSRHRZ?=
 =?utf-8?B?V0xFY0lZM0hSb3dqNlMwakF4TnV2QXQ3TXZxVjBiWjcvTk0yc281UG1vWm90?=
 =?utf-8?B?SnErMXlPbEJmbjlZM2tveEdia0pzQ3V5bEdaVjBpSDRvZWdhWHgvcG4yL0c1?=
 =?utf-8?B?RXMyaGJTUUJENHpxbDdJYjlob2hWQWIrdXVmaUV1WGM4bmVLNzFWbUVsUWxa?=
 =?utf-8?Q?Qq9e3Qce7rL/T/Po2vVXhgfDyc3GFw4osWscab/OnNj8=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-91991.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f637c39a-6ec5-4cdd-3f15-08dc5232071c
X-MS-Exchange-CrossTenant-AuthSource: AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 09:56:40.3118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P190MB0899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_025646_296785_C7449125 
X-CRM114-Status: UNSURE (   3.33  )
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

I have a QCNCM865 card with a WCN7850 chipset. I'm running Arch Linux 
version 6.9.0-rc2-1-mainline.

I'm experiencing difficulty connecting to any Wi-Fi network; the device 
connects and reconnects almost immediately.

Here's a gist containing some logs from dmesg and journalctl related to iwd.

https://gist.github.com/GreyXor/5e6dc8e610a00c8aab37a1251d36dbc1

Let me know if you need anything else for debugging

I also tried 
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git last week 
on master, and same problem

Thanks


