Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF3DC67861
	for <ath12k@archiver.kernel.org>; Tue,  9 Apr 2024 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:References:To
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+D48edSsO5YJWVuP1wTk2O7WHic1ntkpz/SOBX59eoc=; b=I2LxNWVoYz1fiEdYtXneIZGJU2
	pK56p49BwdbFqX9uJ5wXrbjmO85viJp+cAr+hFscCBZeQTbdfKi9f809SvkXYtFWA9tE3eLqWxb3M
	vIfi6NbXWpFeIh8fPGMz+lTVoyn54pbi/6R6G/C3miCqwy5iWV/l5/T2DYE+cfoAWw09IWGkCp+El
	3J/sulseCf15zj2RA5QdS79nW9sq5Xo6pBJwPzs8gxaT1/xHZYz1kkbyrN0Vq8vw2F104GNS/4LNo
	UnJW+kyVv98WTKk1j8x0HsZQHMNEJTB24yLDp5WPay9EI21Gk2zhGoV4q5SBKeagbib3weouW6dUz
	ZQZGDDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru92x-00000001WQ5-0Fhg
	for ath12k@archiver.kernel.org;
	Tue, 09 Apr 2024 10:49:47 +0000
Received: from mail-am6eur05olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2e12::800] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru92s-00000001WO9-3qbV
	for ath12k@lists.infradead.org;
	Tue, 09 Apr 2024 10:49:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLHMP7ziakxFT2kGfbb3K6SSAWgJGKtprhysCc1/FFDKjYWT+tX9fMKcEsEv8PmEbH/R3SMSFlt8IuuUQ0OexiP/XN41sMnfRXTlcm/YjCyqrlweo+0RoU1GyW1YuuMLSyALuBcO2FdXl6LFZWo1VQyBSUovxDKC/xJ+eGKizuPPprXV+qlg6aKLqVll7d2g54tVd1ws4+VHONTmyhcTHpuJyMdmXjB+5nDdKtlGN5/QQPjjsZwKsn+7t5GOdwJAO/T1sTjTSBw+pF6cKtpvOSCr7NlefDchKpYCeMNlYwy4Ygg/8fd86zGZ2H3KEuwMiTNXZrZ4KQ0RPaQVwCi+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+D48edSsO5YJWVuP1wTk2O7WHic1ntkpz/SOBX59eoc=;
 b=MVuD7QnA/UM9wg1nZbeTGW/7ee9cy+9ZMnZnSseohMbUkcPrqdnfbY0pHt3YzA/ZmxESgl08Y/dfkmY1EvMU3eBI+PlAtF1sU74xJsPwHNHU61iEA4EkcpxJI7vtG1Vda82y+SVuS3kQG9mhpWA+37x9TGLgvoo3AA8cH4B2pWWobCi1mPgsHOmFV+tW5IjTG5rVlZCYvnAKlzDFBhTYOZ/gLaUuc7QheF54mL9wSgwvPA8ZgDR0B4OLwn8CahVUGBFxnJuFKYhTqo1wB01+0Us413Y1nP5P/dNEVXH61KMT4VJrWJkmzI8BLvOuo4g4cazTEHmaFKs4St6nrrHBJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+D48edSsO5YJWVuP1wTk2O7WHic1ntkpz/SOBX59eoc=;
 b=SF7fE3kUtnUHs42Dj8O30zEvqZWkCJS1oD4sf+uLDLAzkx57sfI+h/7grd1AydgButv1zRan8altG8OWxYLAjXkHfFZr4fLWvP1RM81zw0ofUmTVmSNsF8yJZRZFp+j78rb2CymQK8sV7pWQj/86Jmn6KB3Z0pIWMY+JVbJqhm2vPjJOA1bOgamlwIhP6nqbNwJEUJZ8VVMSEeGN7k5UljoGk6aB0/STSkQnWyGx87u5tnDjk3uioQk/5YP5S2aC9uyOmDk99LcJ9YT3S5dP9hkAMtqdp8Vb/yebJkmKrVlrRICQfOKgwGrE9t2t22trVXH3QbtiNIcKOJL9kvtIFA==
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2eb::9)
 by DU0P190MB1859.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 10:49:34 +0000
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::9281:a613:5100:48dd]) by AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::9281:a613:5100:48dd%3]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 10:49:34 +0000
Message-ID: <AS8P190MB1205F5A75A6569B2E6F6C02687072@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Date: Tue, 9 Apr 2024 12:49:33 +0200
User-Agent: Thunderbird Daily
To: ath12k@lists.infradead.org
References: <87ttkc1dkp.fsf@kernel.org>
Subject: Re: WCN7850 disconnects and reconnects in a loop
Content-Language: en-US
From: Gregoire <gregoire.s93@live.fr>
In-Reply-To: <87ttkc1dkp.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [rWjhwtrt6+XONYZPi445qm4lf/ZHExi7CDoAA+rgi2QuRC0OZw9JY0l3rqVcvHaM]
X-ClientProxiedBy: PR2P264CA0043.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::31) To AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:2eb::9)
X-Microsoft-Original-Message-ID: <c0f9ad1e-7fcc-46c6-b514-372b8ce16a44@live.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P190MB1205:EE_|DU0P190MB1859:EE_
X-MS-Office365-Filtering-Correlation-Id: d32c030f-2f2c-4ba1-285d-08dc5882be3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+Jv0e5uAvrfJ8Z1BQ7e1K8dw6c+IaBA5hbquCIl69FpJlM7XHeML57BD8dmsJSexdSd6KwEZUj5ol35i4k571XY6Mm27zAZ1LI4vHIC5Q/aX9is97Jhoh8NQHOB+wz/GCxyJJJTOJpa9RGHqU2A/td+y74NJaCOS2vbrw9aHA9Y8vWB3OMKa/n5xTSr0DB4q5zZYGScnI8J/rytDI4MzTtip6etWv/EMP/4CX816mW/Mytpmd92bZqxj8sBEUI4pSgMPZxzf3YUwGHau474N9+LrXN4SS3s8FScRtNnITLG/YuLcNUvHiTTs5cy9o5UiBfa7K3uDN6vLD0TmYrv+EkUYFOu0kqcILFUxRLM45636nTl0pS23mOx9EIIZcSj8xZhJv8181Q8qGTJVIyYbq29KvP50NQbPlbFdeMSpBZptk1emrDswus/Rc2h9XMlcLFVbnrcFBHaev+8f5G2xDGg7HS6HHutzbmV3ySvp0eNvtUrNg9ERzAvEsJfk0F5NJcM1N03H8VjpzXl+pQbPkbp7OEMOpjNSxILoCOabLiWDqUXreO7LLmc4SIJ3oqK
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG55a0UzVFZjckNXR0hFYlU1MWtTdDYrNjVoK1YzTm5zM2lqSHBDdGxpdDlu?=
 =?utf-8?B?c2xuREVYV1crRTBLL2hJMVkyZkVqVERCK3BwSGxQNWFweklWR0hBc08xL0Vp?=
 =?utf-8?B?UGZ6QmdvdGw5Ty9wU1BNSzAwSTlwY2N2S0RZMmd4NjhwYzI3RlVKdXJjV2Vz?=
 =?utf-8?B?ZjNaK3JNWU5SZWNsb3k0KzUrdk1BOXNqOGhUdlNwWEgrdDlhOUo3eXA2UHlC?=
 =?utf-8?B?MkNTVWx1VFFIeU85VThjcDBaYUpRTnFuS1o5b1V4SEd4MWIzRDhWUUdtdlBm?=
 =?utf-8?B?YmNTNEF1Q3NzUXJhdlZLdGxQc3pONDdEVFljclQ0S2xHbUx3aEFVaG9OYVpR?=
 =?utf-8?B?Zzdra2hnYk5ML05IRFJ2dFlScmdiRjJ5UCt4cmtPSDdXYitVZHFCMTNabFZ2?=
 =?utf-8?B?UjVMYmhtZWg4NUVNcEFTdktoRXNIYmNTU1EvKzlvZ3J4ZXNsV2RFaVM5TDRB?=
 =?utf-8?B?VGFPeG1yUW0yclpZNnhRaXlLOTdLUFc3RjhZSHQ2TS9QTVVUZ3B6NThiKzNN?=
 =?utf-8?B?emx5MllGd2NhVnFUd0ZGKzRmSWxIV1hSSmpTSkZvSTBCZ251Vmc3K0Nmd3VS?=
 =?utf-8?B?RE5paUdwekgwTTVGOCtPOHBHZEFGc0x2YzZIMDRBaXh3UUk2UG54UHVOZi9P?=
 =?utf-8?B?aU5ZZDBIT2l5a1RuT1Rjbi85OGFSRVZtUi9iNW9ZMGYweWk5T3VGTndZcUx0?=
 =?utf-8?B?cFViRWI4ZXp1ekFBNEtuS1JmVkdKNEFoeVVWdVdQeUpuNGhNZ1pOUzlmV2ZP?=
 =?utf-8?B?VWRQUWhyWjFQMUtuWUozNHNnNi9TYTVVdys4bmVsUTluNkN6VlE2bitiYmd4?=
 =?utf-8?B?RHA4UmMyL0VVNjdNVGREQkt0NmkraWZ0Q1BqcVJ1enlLWE4vMDhjWlh2cFFZ?=
 =?utf-8?B?ckFiYU10c09rSGNYK3VQVGRpS3RYcExCRXUrdVlBUXJQT1BuTnVKbkZWR2NF?=
 =?utf-8?B?QndXOTNwOTlwaW5EeWZXajVnbTFGRG14UmdKNWdmYytsSWw1YlMwK0JtMitl?=
 =?utf-8?B?Z25IaUVYRWZ4ZWE3MnJrdEpIV1p6UkM4SjUwQkdIck9VUXRoaitwV0M0aGc2?=
 =?utf-8?B?MEdTSTJSSUpqaXVPd3NBWWdEVmdMRk13aXNaU2kwWVlERmxTTm9HL282UE14?=
 =?utf-8?B?aGQrbDRYTWpQY0ZqOWZtanRFcGt0N3NPUnU3RXlaK1FrN0pHT3hCdzVaaFRj?=
 =?utf-8?B?dlB5ZlJsSWhuNXBNWDVpaURYV3lkcVFlV3kxR0JzRG5XWGE1dXc0QkZNWDlD?=
 =?utf-8?B?cnFLYm0ycjhmZnVFN2dSVzJBelVHV3o3SHJMSVJ2RVp1a2dUQnJUM3NpbU90?=
 =?utf-8?B?S2ZVaWxxVmZ2ZFU5MTFMK2hGZ2xsWU9RSUZpcnR3MUhXNjRmWHVMeVFxb25k?=
 =?utf-8?B?Q1JjNTZtd3dsclRQU1Q1eHBrRloxbW9qVlNnVnhDMHN1YWd1dVZJZU12TTVs?=
 =?utf-8?B?bXQ1NVlpR3cycEd5bjhlUWNMZEVYU1dpVzVhMGliYWpPWmptYUtqdkFRbERz?=
 =?utf-8?B?TndrMzVHTmdGMi9RL2RFa0hBKzBRRmdxYitRZTB1ZXZqcmE3bkpRQlhlek83?=
 =?utf-8?B?M01jS0NqY2xBbndaSzhmalFkbXo5MENPdzB2M2RGR0ZDc1Nya3ZHUEg3NUZh?=
 =?utf-8?B?aGFWUEp5WVpMalRlZm9Id3Nnb0RwN0twU0sybnRQbFV0QkUxL0tPbmlVb0RC?=
 =?utf-8?B?cG0yamhOSW9wTi9VWVphZDVaN2kzMzYvOVZuUEpnSW8zTmR5NmxEVUJJT202?=
 =?utf-8?Q?0yCeNq8uami10/a7Vg=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-91991.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d32c030f-2f2c-4ba1-285d-08dc5882be3f
X-MS-Exchange-CrossTenant-AuthSource: AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 10:49:34.4642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_034943_036279_FFA189B3 
X-CRM114-Status: UNSURE (   3.90  )
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

I've found a workaround:
I had to add
[General]
  ControlPortOverNL80211=false

in my /etc/iwd/main.conf

And now I can connect and I don't have this issue anymore.

are there any plans to avoid having to add this option in iwd?


