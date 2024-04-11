Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57829CD1284
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:References:To
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJB6IE4qCaJEbDPMyH0lrY7XC9xkPtGLwVhLusvmVEA=; b=ZJU+2Sk7T7VHTw8FViRRSMBOoU
	IrRHyIcXpgD4Q9OIrxg9GFhy1f6nsw5ay6r6yrSWQyJ0R6EPc8y3mvCaqMsNikbU2eM99TY/I5EO3
	Ogf1Vb/Nf1RWCK8U66kvSSIHCGCesksk0gdswWDxEnnticxs0vqN9+/oK4+d10DuiNES1q9iqtEn4
	d/ZbLX5rsJOpve25usNhaeT3Bq33wfK2kyjt5dAIUqKX4vSHb0bV2jfscRJE9nS4NXPVIgeKd6gRN
	beKtNWcu+gxpikz4Hm9I8SxcDhB26iak+bZ8ia5NlQ23ULOFguXBk7ZzTVQE5BVSCTGMSdrcSb/eu
	RtSBXhpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rur6S-0000000BP5E-44Q6
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 09:52:20 +0000
Received: from mail-vi1eur04olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2e11::801] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rur6P-0000000BP33-3y49
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 09:52:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSDxWOTFsyPSiAQ7XgkUSeO5irjt5DZcNRAOMqjn2AKa96eARnWyu2vDCLypF9c6K4URZX2maxWtJv5ZDZHSBO9Ny38GTmjop25vYceBh000dWp/cx/AynpKktUouR454aYPJ1DIhgS0jFZdsgvjkF/LCaMvDmspz7xtNw0F1ihoyOSDSpbODF8dnOcjY7WWrB2lvzHwByzXI2T4NU6UjLgLJ5D4ei2vaHSs9Kn0OIhpj33C9mh1E830I4nxnvZwTG3YcHTk6oDLPxDW4wKRhyMA6eJ7QsVojkmWSMBa5NORa2a0QyEVMaWkhbGsWvu11T4pRK/940q5XEVwQC+pBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJB6IE4qCaJEbDPMyH0lrY7XC9xkPtGLwVhLusvmVEA=;
 b=MavuqtZPD2bAuFCmcUthVfwufY/iZXmyyeoJ7UB5vdEFZALHN3Re/GentrTAP3X79c9FhD1P1vFMgms/cxfVD+u0OxnTM4xDxpyCuB6klYLFd4CDib1lO1Pg3UkA4WMsELozR9jsvx+VeJul1wiM8SCJrleKpggpMew8UJM29HFm56EXBouHu9PeUVrvjM/nXvsT5vEkLEd832eD5QkzKjkzuk3GwgBUXfgtXYBdeHsZPWa/Wy7jC/m45CNv0EmMVROqUZ1E4QPebWVoO6K+XIkdP18hfwVoM9oOa9VkwSzgyHvu4jOzPt3X7/soL4QvA3SMzKIMi2Sj3F4NBllnvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJB6IE4qCaJEbDPMyH0lrY7XC9xkPtGLwVhLusvmVEA=;
 b=kKse1PWE/FpfWKo9Xtg/wiCiEePgu4TYd2aCTm+SshCqxP7O4SXkKvzMrz4iK/TTYzdXk1E/ZSq7O8h3nF0WFA+T1zsgxnglBPeHvPMFI5d8q2fsWGK487BI9dwEfpCP9x9QwdN5wGNi3+PMvuTF3D9PwplC50YGqrdmnD7RBRjwda093Zkr0gtsph906EkYu17a0BNXekmUQqLgMfSKBX4zs3fDXlNLTPIHrEO/mPQPelAGC8JWFGHBkdbloJXTaIRnG/5DA/hHPx0lEZPht4o1OMPCIduagrTNL5QJv/RjBLatfWMCP6eMOqS+adYMvCOmc6bGhCWbf1Mv019q6Q==
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2eb::9)
 by AM7P190MB0695.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:113::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 09:52:04 +0000
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::9281:a613:5100:48dd]) by AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::9281:a613:5100:48dd%3]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 09:52:04 +0000
Message-ID: <AS8P190MB1205C9279683B7A6F2E93AEF87052@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Date: Thu, 11 Apr 2024 11:52:02 +0200
User-Agent: Thunderbird Daily
To: ath12k@lists.infradead.org
References: <3a1c916e-b9eb-43b8-a6f8-896d8d889d1b@quicinc.com>
Subject: Re: WCN7850 disconnects and reconnects in a loop
Content-Language: en-US
From: Gregoire <gregoire.s93@live.fr>
In-Reply-To: <3a1c916e-b9eb-43b8-a6f8-896d8d889d1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [SixTN8NVToXQu1X1cmQMPJJ61AyvVxoonK9PRHcwxbAoeOEFfrjsDm8VwI2A/CZQ]
X-ClientProxiedBy: PR3P189CA0062.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::7) To AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:2eb::9)
X-Microsoft-Original-Message-ID: <a477e0ba-0eab-493c-80d4-3ad425799bfd@live.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P190MB1205:EE_|AM7P190MB0695:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b7b669-2ca7-4e4e-266d-08dc5a0d0a69
X-MS-Exchange-SLBlob-MailProps: 30ekHghIwFoZfJfhIqsBGJPdSU+u/GRVeDw0/eYGQGSh1QoA1McK27g0bL1xSQOjag4V+PtGptZfHoavdSRz6BbiuzSfb6f70X6AmNuD5vuXwnh7GaksuEAYEXQ18MuqGS+qTrHgZZ30A0vy+f9/MEyLf1/x3rc5A46bQMbD+PEzyDeA+Ech8+8iR+po41k41dfSVPq5420ngO3XWrX9gZG0+6Bqrx7BINkzw2FncgV/lkji4QI37284q+191ZomSlxRiK02V344w/7PXeKP/tPndu0GlIH3DkqVRc+urWKjTL2Rtm+WLqhRNtrZoxE0Fosvx6ZP6yL7sCcxSCHikcW5+7KlDlYDZMgZ9fnuzZSDv2/p+hE1K6xY2FgXgDjCJYGVwBw5K3VfJhvQl+wo2M7T8UIMyRZXo8nZxqypHrGHyDlM4EjN79W70F6r37rvo84MgFYDPUk1sVcohPS9GEaAQvdVAkNPuyh+Azj3w3rPUI1jcIxBJxr83zu3GRGpHYJZEYzOULiI+TzT033Am0Ft/jVQVPz61xdXVa8uQJfPQiU9K1WzLKntEyyT3aW6o824JpvCIKYC9/nl25YgegEJpvbyWwMIQmGDJqhQpDDqui4gMXN552GqQuvybilUl5FHfrNjx/+YUdtFR5TCiB3zK6BQHyRJxKMKY5CUzUcO/U1gNwC7bcYSPn5Rfl9Ugfov8zzj8dxD7OHNdYCnudVhwGlWpbOLQT7VcdkdkZNFs2umutWwc8JdPaN25+77
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXald+YbTCRiBMdD0YTcToJprtJOlMDjnlqnKB0AHqhFeMUBR2OA9AglHgFErwB0RcTD0lMzKvl15vgpzECbNJKAH+NvoU4+wXjbJT61YACJ5KFRy7wbkgS4h2y7IVNimoXgoipGI5KBMfV5RNQ5IJDlatecGitRBGX+9aPkP6pzjettcl/6RHfUXigZnmSACJkgfsVJwhJSLZWNP1c/pQ1Gy22uDy/uZIfKGOZAGAi33xxtxh3my9mgmZr1bU6hgquqc81Wr6KpuE6ksnUVBSyjQ0XEv9FMikLRBcS972ltnUKBeIzhm8QRwYQgCQ+APbc5HcfJD78QZNqpj+cOddvappw1K0MTyq6wp/PtkjTKIlwiGUiAoL9vQbrR6TqzIXseXWetY/aMcY1fdSRrGvq3uFrgTjM5fn+zBDItFWmbs437+MG0yV47bf7BMjn0F8gqtp6Atfu5LL01Uulbrn2+1wSP+G14Pa898lR4tZFRn9oSZYOglZpe4Spxe460qjRsb64WnzZ0RWvLhXeGLz+s3rOviY/rw7MccB78CKKcBh9ls33HVycISnJr+huB/ChqrWUfbgUoPYwoeV1CgjZYV0x/qwGmJ7BjqtPKkBU8F74r4njXi1nBAjItkOP5QWyMaM70I73/VXUhK4bNz1JSEEbEyGarFLnFyrHVXPU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnkxTmJqRmhWeWRpcUxiSG1GdkhORVI2SmxML1hWaHNLYmZsVUwvclc2UklL?=
 =?utf-8?B?MWFJM3Q2UzRvR2Fvbnd3cG9OSnVTMjJHaW90dEZsekJ1TjZpSW4rUWdzR1ph?=
 =?utf-8?B?ZGpGVnVNYVZmRDB1S1NGNjErekZRUXlzM2hoSWJGUGdKdFZHN2c5K2VmcDg4?=
 =?utf-8?B?VFZ2a2J3UjRObW9ScG9reEw0cmFqckJFZzZ6ZU5IUHJ6NEJkem5lRVVTZFlE?=
 =?utf-8?B?bDRGSU1zcWFOc0FjN2RYdnNNdVVZMk9zU0FzQlNXSldqRDBiVzI2a282SFVp?=
 =?utf-8?B?QmVCN3h5RHFaZlRObTlNYXowUkx5MFlna1lHTWtQTDBBZE96d1Rqc1gwZHFn?=
 =?utf-8?B?TXYwZjBONmRrdnBTbXBkMEhzY011RmNUZUpHOGlUZEpTdVlJSnFOR1orZ3FX?=
 =?utf-8?B?T0M3c1lFYjd5MmQrUUlEYWtHZ2FJbkMyZFd3c1FoSXlGWWZXUkFlWC9mVE1J?=
 =?utf-8?B?UEl5eVZreU1BY1NiSEJINDQ4bWVpK2FuVkwwZ1QrekxvQkhYaHR6QVBFYjRl?=
 =?utf-8?B?S2RkQjcweXBvTStMdHZNVVpOaXoyNGVmaHdBTlZWcDRpNkZ5TFdWRGlPWVZq?=
 =?utf-8?B?QzdLR09HN3gyNjNwMmpUMXp4TytUVEVzS3FUUFYvcUJ4dzU0bWVKYXhsaXhv?=
 =?utf-8?B?K0xuOGpEODJkRGhxeitNaDBJZFpGUjZvN3V0Qllza0ZpWmRYRmJUczdjMzlD?=
 =?utf-8?B?b2Zya2tXcm5WRDV0aHlnM1BYK1JRSjluR1cwd0I5eGl1UnZyNmVoV1dQS3ln?=
 =?utf-8?B?UklqdVo4VTY4SlNia3RxczlQZjlUOXhLR0lvd2k4bTZ0UkV0VzZVeFllMXJK?=
 =?utf-8?B?OFlleW56a05mcGdZMk1TYTdtaTN6QUo0UXFTTjdPaXF0L01veTlJeXgrYUpW?=
 =?utf-8?B?dmNHeExTaUJveDJQSlhiTzZMZlc2YitORWpFMTJoQ1d6ekpLWFMyVjAvYVJ5?=
 =?utf-8?B?by9jTzYzVGlrKzd4THBWbXFuRU1tM3haWDFBa0xkR3dhS3hzSFJsWDM2QWhp?=
 =?utf-8?B?bXNic3FjOEVkTlIyZmVuSzdVR0hidHZxTEZEUG9TU0VDUWdtMHM4aWZaR0xS?=
 =?utf-8?B?U2VUZWtXYlNEU1RSV25qbytoeW83Z0dSUDR2UGpCZnNsbk1PaWVpWi9pUVZw?=
 =?utf-8?B?YTBhOVVQOHdXY1hGZVpiNGEyZ3N3dHhEME1zcE1mWmZZUjZVMzVBc1lZV0pu?=
 =?utf-8?B?K3RGUkpoVDQ2dVpldytId2xmenRmS3JFZXROYlh1eEI2ZDcwaFVzbjRkUkJ1?=
 =?utf-8?B?SDRPc2pmNE9POGJrc3FINU9XMWdUTWxkT0VZVE5BMk1DM3VyR3dWdVlva0Nv?=
 =?utf-8?B?dUNXWmFrdzZaaGE4dkFKWWlhZksxYU9TSXgvcUVmMWtLemNGWTEwMTJib1FY?=
 =?utf-8?B?dW5iSk10V2xMNkpkS1AzQ1hkQnovWllmRFF5U1R4VlpBdzJ5c1RwUi9CZEFi?=
 =?utf-8?B?SndYdFVjS25PQ1VrcTNDMHJnckl6cWdWMnJLUXVUSHF5UVFpZ3JaWE83Q05X?=
 =?utf-8?B?ZUF2MmI2bERJdW1qRm82Kzc0Z2YwWjRXNWx1VlNLMnJoYlpEaTl1a2NNUnQr?=
 =?utf-8?B?K2xPdC9IeUNTQlhFYlRWeEI0ZkhoL0syNnRPUmx6Ykc5WVRTOFRXSWoyZ2VM?=
 =?utf-8?B?Ym1DbkZrdUc0dkRrZVVXcU9Ka1FXaXd5TTFudFYzQXpycGI4a04rb3dzQUVF?=
 =?utf-8?B?enRZTVd3dzYwU2kzdWNwRUc0cWpMaFdIakFBcS9zcDdqaktXajJZckNZS2Uz?=
 =?utf-8?Q?1hu7Il8JVcCoX+EdOA=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-91991.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b7b669-2ca7-4e4e-266d-08dc5a0d0a69
X-MS-Exchange-CrossTenant-AuthSource: AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 09:52:04.1469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0695
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_025218_037336_2BF46656 
X-CRM114-Status: UNSURE (   6.11  )
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

I'm adding this because I saw it here: 
https://bbs.archlinux.org/viewtopic.php?pid=2144901#p2144901

I've been lucky, it's the only one I've changed and now it works 
perfectly well. I have another problem but it's not related, I think. 
that when I upload very fast (at 100mb/s, for 30 seconds) then the whole 
ath12k driver crashes and I have to reboot my system.

I will make another thread for this, or is there already an existing thread?

Thanks


