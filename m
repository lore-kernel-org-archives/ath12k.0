Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DDF606A31F
	for <ath12k@archiver.kernel.org>; Mon, 23 Nov 2026 07:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZDpFHmI6;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=WKx0FQq3;
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=i2u4MPaX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ve0tCCRhSOMOyVMdzo6hSeSeGH8Y83gIuwPuJyk0T7w=; b=ZDpFHmI6oaAzuuq2eeLLLQBAP9
	qDDaYkIS0wZF3FVIj0V6xWF3h+J3eb/pfHu5Fjuigp4QbzDS+LMwQtP5yYtzZDoQ8dBosRJgVqY1v
	QCGVN5CTelZxRZrOHParPHRugoPlycPEawtsmJftwdR2LJCo+d4WKe4seGlVYFLj2Vf2mQQbR4k7y
	JYU8soXtclwwXopG7ED2U6gZxuRM9FV0EVH0e1RCSgexO9h3XOC5/xTdyVQSsOVd8fSRN6oJFXnye
	zOWqPTtexqRMJjbcPrW90kH1Uv5C9ik7V6CjaIq9rbeynAXmamiyQ7uM9/t1+//bMSby7aLdXvhUK
	rd/cxUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOwV-00000002WKP-0Owp;
	Mon, 23 Nov 2026 07:58:27 +0000
Received: from mx07-0057a101.pphosted.com ([205.220.184.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOwF-00000002WHF-0nDL
	for ath12k@lists.infradead.org;
	Mon, 23 Nov 2026 07:58:17 +0000
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AN4nai51448380;
	Mon, 23 Nov 2026 08:57:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=Ve0tCCRhSOMOyVMdzo6hSe
	SeGH8Y83gIuwPuJyk0T7w=; b=WKx0FQq3USk6jsZ06hUg0hCjlrjr7oHtPWwFPl
	tzwQ1YUnQ1LwEtq70L4lPRYi7lljdqQqFmS8VRlOZZjAyxC7o7JpOFvVC/byNuKV
	ZzuQNMydnnmWIfiQ+E1bRScutuYRKIGkFoP2eW95i1GP3gJ0rqH8EzcAJIbCiVnR
	dLnZhrIVO2Kjn0PVbJa0PgtITH01pJdJf9gsYrgZUnbpbINPN54hzHfnVVrAbhuK
	9xyvX9YfBQW9dPNuD6xUhF8ApSBLqK2njpYQxWmOMU8h12KOVuCQjY0BdtXA1LRV
	kXDSvEkY53peGi13EBdHy/ulSebvMdU+rYes6mWLkSkApBAA==
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11021136.outbound.protection.outlook.com [52.101.70.136])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4j30hk21dk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Mon, 23 Nov 2026 08:57:51 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/8uqC/T1k7jFP6O2qXfdIduC4Lc+5DXR8NbExs3OyWg/6RADNhRAYK8hArEegOaIACB6DFENTQEIhY6yvZSJjDUM/SmecRp1E4odfdTBkyzvrIW1mGOee/uhgocecOS0kZenwczlJ8P3t05VJGTtBm8tM5k09a4ichU/Dt7s9NACs/Mp3KXDd74Yxl7dIKyuZJG9C9uY+GI92ZvRD+rNVskcMF+cct8vNx7GJi5+efsaLJEf5JOspRGs6kNob7I9LtWLtK36OrcHzQBV/AH/+bRfKuFchcTa77hI24InNkodUCQs/M9PZ53Ttkw69tXqVN0swfsBUArfsQVpcsoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ve0tCCRhSOMOyVMdzo6hSeSeGH8Y83gIuwPuJyk0T7w=;
 b=Ku3wpO/qA1MQ25SNttR2+lM3N7SdWF3xYMcKd7JLy5vD13Lgw8f6Yhf9q7fmhVLf+3b0OYwv+dThyeUZ8W4NXeA020oKnY9Rygx6bHUd8UgVTDJFHeSVe0oEbOWEQJe7NfQmmnovNeoZP5hX09fozPSF10glwL9y8RJpBNIUWhiTC1xJP06GyZFG/6ZOVnDxlan43qmjt1G9LGgM/gfMqLjUCN7h+rXTt5dFlf9+z67IPWCOdRY1BHCO0D3Th5iE8vKOnkwYj7EE4ibocTc2xRQr2jKw/IDsQbuYo7DnOTMN4Lu1W2ja8sUXpB8qGSCk2dCtqrMTeCGOapj/BZpFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ve0tCCRhSOMOyVMdzo6hSeSeGH8Y83gIuwPuJyk0T7w=;
 b=i2u4MPaX2uLMMQgQc5miXZn7Lus2lAHLR30RaqOTWZ0mFpFrdscfSzykqyqKFhxOUJhI/XXar8W9RGhtT/dYhY2U4BPNX92DqDtFg0mxkc9G8bT+dO+3hhXmYCt5Woc3+s0CtbDIQEE42eDynbJF+8VwSOlaJYxRjGn29EebCEg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by VE1P192MB0766.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:169::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 07:57:48 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 07:57:48 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Mon, 23 Nov 2026 08:57:37 +0100
Subject: [PATCH] wifi: ath12k: use scan link for off-channel tx without
 link 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-mac-fix-offchannel-tx-link-id-v1-1-1ef925040ac7@westermo.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3M0QpAMBSA4VfRuXbKNrG8ilwszjhhtElK3t3h8
 q+v/4ZEkSlBk90Q6eTEW5BQeQb95MJIyIM06EJXSmmDq+vR84Wb9x8ItOBx4cJhFom2HKyxNTl
 fFiCPPZLg/992z/MC4tUVEG8AAAA=
X-Change-ID: 20261123-mac-fix-offchannel-tx-link-id-84d8387eaf40
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: GV3PEPF0003D7B8.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::287) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|VE1P192MB0766:EE_
X-MS-Office365-Filtering-Correlation-Id: e922249e-9286-4d4f-fb9e-08df4937775f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: txxMTQ0Zn0Nr8O43hVWlX/R9RScTn4El1R5z1TIbmdaMxarc7XaXnQpl6t9P3L8fBFS1EjNiJsTtqrkSPD2YOrkYrmt5u9Hfp+83XtKXSpgm5oj28caM0pamal/kksl83VFDnWrwDbFzvRhMWU+ee17oxykIdKBZSjuJ9gbiF1ZVppi6CWLXTOCLIY3H1As3yijmb5oaIgG8ZhrgPjPbp9aQxKNZMZMJ3y0kirrKVl+/Ndr0bmZiMuFjU2s3NBvR//L1z6HY06azRaBuRk4zRcTM9tezld1EVuExCFk95CD4N/XOuKyfDKXjr48Q4bYaX6PNYzp9sCOjYfnA64e6gfJVitF2SxSpkwEzL70ZeCngyW0orxdQWZ4tqH69JM574SDOqaAtLd0rZ2g4yiYQqp1m2B9ZcFe/J2sxf+OiGi3vSQ/LvuT93QOSq/HHpzdm1bgAM8GRmJiKpWipZw/DKE1sLmQtCldiJHqGUVId3SRj+LNNtnRgv31G+6CkcfB9Xl/KmWRTmShdjUdsLxlRerg0BSUxQ1o99l/SuCqMVeRTQHIbaFBAdB8jfYqGLtJsIEHK1BMTokMimsqam90ze0TCSdVbXVvvLbK/AW04n0azTEqpGF3bUbAuywFDFmqm5IFomikPFg/wC0UTp6ls0NIq0JUD2TIZcOi2GVLIt20=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjlOZ0pGcGJtV1ZvaGZzTC9VRDlBU0J3THZmQlQvZTE4MFB0ekdIZGd0ayt6?=
 =?utf-8?B?czNPYWJuSUFNbFZoYTJ4TFNOL0I3WW05MWVYVVg2ZE1JMkVlT3lEKzRxbjlj?=
 =?utf-8?B?ak5YUVhTQ1lmYW1LMkxPbmZmNU1iZjExNTBtbmZDMnRxMkxQeWNVdWoyS0c5?=
 =?utf-8?B?QVgrZUtXOGE4K082WksxSCtsM1kwVEJjWnBYOW1rTkYyREI4MUZwUTFid05F?=
 =?utf-8?B?WHlIaWJEeDQ4Q2NiM05NdU9JVWlLU1JoeXVpM2Y3TVd0cU14bStHd1p4U1ZY?=
 =?utf-8?B?dCtRNXpRQUlReEZIY1VpWEQyTkIwcm1SVnVLamtJRVFxL0VZblJGeGlCQ3Aw?=
 =?utf-8?B?dVNvN2pMWVRzSUx0Rnd5STgrNWFHYVZaT1FKRURrVUhLUk8wR0JaQWYxd054?=
 =?utf-8?B?aGpQK0N6a3NiWU5sMERXd1lqZTc5N0JyYlhwUEoyMmVDQmhSRC9rVU52S1lJ?=
 =?utf-8?B?ckF4TkdOTkw1WHZDYzcxUlJkWjJNRVcyczhEN2V3U3lHRVkyT1l0TTNmL0VD?=
 =?utf-8?B?d1RpNzZtdGJjRGJ1QVpZSUtKQ0Q0YTI4Y1V5eVhFaHBrd01xalljT1JBcWFl?=
 =?utf-8?B?QVFDTHBhTlFaZ0UyRlVtOWVpaUpkOVA5RW1nTm84NVJkaElUaE1nVDRRTmw4?=
 =?utf-8?B?M2xxSHh3bkJ3aWNPb2c2N0ppdW5mZ1FlelFRNklzYTVZcG9oRlVyVGNEdjFL?=
 =?utf-8?B?dm5lZjNIbkRJUUZLU3ViWERGamxsdmRRMllTNXFFR2VBOEttd25Vd0dRMEx0?=
 =?utf-8?B?NmlRN2lUeStuTmRhYnc2dzNIMmJ0TnN4cTFaOGZKSWs1UDBOSzYzMGIyemFZ?=
 =?utf-8?B?R3E5SVo2YTJvcHpsekJ5U2RidW52YzQ0SDluZ3BNT0hCbFZ2eG5Wb2xpOThB?=
 =?utf-8?B?UUFYQWNjL1paaXdNbnBucEFJaTIxVlBpTHN1Z3ZHWnZpNkRqTExHeVJnYUJL?=
 =?utf-8?B?RlNrZjYwbytkSm1IenhoYUE0NWFYeFJhSnR2VUEyZ3Y1TnBBSlFLWHNJV0RM?=
 =?utf-8?B?cTZUV01PdFNuLzJ2b1d4Q3VhaU5HNkx5T2NTTmNUQ0R6cWxBRmZpbHRROEs2?=
 =?utf-8?B?aTh2SDJNYzQ1SFRnRktiN0JSaHdBeVpqcU5SYjM5K1hERDlDWENBUXZ2K1Ns?=
 =?utf-8?B?WG9YOUlETHRMQXZiUU9NcTY1VjVVdndGL2lFaStQd2tJY3dBWEJqNmFkeWo5?=
 =?utf-8?B?Wkk3dzAvT3lINzNqUjZvSEUrZXRKeGZlbS9vSUZBMnYrenhQWTFFRFJiWTFC?=
 =?utf-8?B?S21CRUNYN1UyQUxobktpcGZWMWNlM0lnZUZRcGZPRmVqblpwTjduUm9nVlNj?=
 =?utf-8?B?S0k2dDV3TWpNZG1Zcm0zcWVqclBkQkcwbjRjclBpMWhVRkFFa3BFUGZBRURM?=
 =?utf-8?B?dGtidEswN0IvcjlnWU5PT09VYkZrYTJaNmN0Z3NiNXRnUnNEWUlGNElXR1d3?=
 =?utf-8?B?VHJmZ2p0RVRTYzhrOUw5RldHTVV0dm4zalRaMnJiVHZva1FSVTNjak1rRlZj?=
 =?utf-8?B?amxxaU94T0dLYW9KTnhYWXV6bEx5Nzhya2h0WXR3NC9xUlIxUEFZZ1YvK3Mr?=
 =?utf-8?B?SXQwcVhOWE82eXl5eEd5S0VEeXQzb2dHWVVlOTNzSmF0TC9NZi8xWTZjOUV6?=
 =?utf-8?B?K2tDVjB2UDE4aFNOcmtCN2hHWWlsVVlsV1pER1ZxcEVtR2ZvVTdyR01kTDBH?=
 =?utf-8?B?dkJkVFFFUXFvaTVpMHdQYkZvS3NsRVF6QW9RYjNuNzFSWWFEeGxEekxaeThZ?=
 =?utf-8?B?U2ljcjVrTHplcHB3RGM5V2VmbDJzMjZvM0dsV0JpOUdjaXQrSVk1ajV3eUxN?=
 =?utf-8?B?QnNxN05TK0ZseHFqV25rOVduTjJBakRTTEZVSHQrTjBmeVlKQVBwKzBqOVJy?=
 =?utf-8?B?anJzN1QzQ3JDZFdEWjBHMm95WFdyeDZnSWhTaW40dDY5R0owVlczTWhRUGhY?=
 =?utf-8?B?dzJlZm11UDViL0VWT3pzaHNLM2cxVjBBNHFQSUpYSWRSVEF5Q0wxVDNGSXZT?=
 =?utf-8?B?aWZwNEloeHM2c2ZvcGJuSUU5WFVtS3B2blZKRzhVLzFHdHB6MXlORW5IWnpK?=
 =?utf-8?B?Qkc5SnBSR2pkMTFQUzkxZGhncXk2RDVyMk0yL3FOSHhPbml4dVBxYm9CVjZs?=
 =?utf-8?B?TGw2M2M3TmNXOXBnbkM1a0xpUGNSOVd0SEZMUWZPNHQ2U3FTd2Q0TWhNendt?=
 =?utf-8?B?Mnljd01SaWhhcU1VRDNyMUZqQjJGMWEwa3pMbFE3ZjdWOGZvKzZ6YW0vRGww?=
 =?utf-8?B?NGpHUVUwa2FoSHhaSWYyck5ieUhxU25tSnZrbEZxR3RDUElGZXVMR25jbFEy?=
 =?utf-8?B?bjNMV2I3ek9jdnhuTEhlTVUvZjYxSFE2YURGcFVCNStGNjAzUDhYdz09?=
X-Exchange-RoutingPolicyChecked: LtS8BWhJrxHumAO8/2oIN5mqsXPvGg7wFDsRZ3TuBxcdeU/ltvzisKtuZxtjPeuL4DIWXa17xSfZ8uwRgNUsy8K5uSIM67RiRiMyZrH8VnARJkTzXa9rKD8QtrETMf+Kgx14wxj8Ic/BITrnNr39glyds+k3o5pe4TylTMK86+A/mE1y6rHiLMybiM8vxzgopEwqiA4ONZLi95yJ+0tqFxAudPl2k4H/Pu94mzxjcnGLpArBx3fdgwUMfDIHtrQIL9stQd2A/0Px4FSMm7tWmu74F+0KMy9IAfwB3pj8GB87uzO2w/qgzGR1ncgIs4XpOW94UIv4ROTEU+dP1Uxvzg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +JBJ7lJVpMqlGbkM9dL4x1ksvAyGQFJHRdrKaibljr0kcUQjLDv+6jy6nMAQPC/CwDMIci28fQD2DxKA9jxzsGevVpB5awra1Mny4rQi0CJKFP+tt05nw+ClARqCK4+/RCpwFZwHo7/QPYiMc7ddjVoLN684EkUz44vxSiaWJSLOrYS+tLmu01BU8XoyZ3wau1pWguUjX6YnBqV9+HTwpx/ZTIDGsAtX/WsKUcBeFgQ1fV9B+asXL3HgvI+Vwg+gFETxtQiqKzwdxrPr/rsRrkGrmuESx74jd7gjm5NWeyFK0tw058yOOp4fl4nN/TAhaHS/5OgO+a2M8vCC5Ckz0KiTA/c3L6ydGkjWyS+q9V10pR9h1FLo5kWNTMhHCz0SzGcMbkSLh0icioLNXoHpBQaLe4shOhlnC3qPLs109yFmyLl6EU/eenZ4kvQaO3CckQSZIdb7hbRzduBoqoM8Q9g89K7SIn+uX56UKpsKcgYBKYo0luev8yJ8cutg9B1puNxaKPj1fay4oym/+gSxvj6FVWgx72wynA5atfmR61rAqI0O9Y/9kL/g60yOY+r/8/yqdU+wJNfoXZzyTqrbLQYw2pqzB3aKZQWyPbfropQlF3ITgr0wuOgnQSVy735C
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e922249e-9286-4d4f-fb9e-08df4937775f
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 07:57:48.5967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07LzngdZOFPA60FBLqew2U6T21A9HReNe+K1TBfrvqVZcqJ5RFpkS4Ex4QLi4IUvUiHvcQaKMG94GU/SxQXoNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P192MB0766
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
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
X-OrganizationHeadersPreserved: VE1P192MB0766.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzMSBTYWx0ZWRfXyZi4xClfn9AO
 svQMecyZe6aLDljtXEOzzx+c2f7z0gmeTj+UPmQvqO55QJgjGLPoJ3U8Q000fwDVmIY06M/x6gZ
 zlDkr/pRbhHNv8+DFvmte8EIrjEMZCY=
X-Proofpoint-GUID: rXXu3Ip1KLbTxCAZSoAZ--lE_Nqh9_Vv
X-Proofpoint-ORIG-GUID: rXXu3Ip1KLbTxCAZSoAZ--lE_Nqh9_Vv
X-Authority-Analysis: v=2.4 cv=a5ClZkSF c=1 sm=1 tr=0 ts=6b03f1ff cx=c_pps
 a=Rk8l9q5nP5fL7JCuKTlGNQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=N9GNhs4bAAAA:8 a=xGTL_VUazcbwxR2MFpoA:9 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzMSBTYWx0ZWRfX6R2xhAxdBlN4
 4Rj7/bFwmdscGBxfXw8DZE1FRGnUabQSsbqZmkBsRx/ltK17MDhP0tCUpT2t6HoFJikDVEO2BFC
 tNsHFpjsD8qUpB5Q1YUL3PSwYlj8ey8r6y4bLvDGHkePNKaeZCKMVaZtrr65r7FWLa16Qal+2k1
 7WOqX6QfYZ+jJEAGL7RodwRZIU5fqIWNHJ4yNWqvYG1Vr/j37H2sr+bISfurbjp8X6fHFOwRmok
 6bHTExW94hXlqHAbDmvrFnsSEVUw3MhykwYcoOt16L1qZ2zKsmNQbBrIDd4K3UqHmd25V0P16wn
 VLeOss8E/NJffzO5k84PyG/SNBy0+1qewdcKkSis2Ytl54A5hsux9GCx0aFgKEvgkLuqdryNJZn
 bRUjsmKbKlwrZEfu5pkfo1x1recHJuIQ5UfPVznPNYUSgrtBRFtf41KKNFsLwdO+A4cOQaYKZBR
 AVStqHQJW5y7l9ojgog==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_235811_808017_36584D9F 
X-CRM114-Status: GOOD (  10.49  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For a non-MLD vif ath12k_mac_op_tx() always selects link 0, except for P2P
device vifs, which use ATH12K_FIRST_SCAN_LINK since upstream commit "wifi:
ath12k: Fix wrong P2P device link id issue".

A station that is not associated yet has no link 0 arvif. Off-channel
management frames like GAS/ANQP requests (Hotspot 2.0 interworking) are
sent during remain-on-channel, whose vdev is created on the scan link
(ATH12K_FIRST_SCAN_LINK). The frames are dropped with:

  ath12k_pci ...: failed to find arvif link id 0 for frame transmission

and wpa_supplicant reports GAS-QUERY-DONE result=TIMEOUT, so the station
never finds a matching NAI realm.

Use the scan link for off-channel frames if link 0 does not exist.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 48a2f6da16ef..20e977cde23a 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -1119,7 +1119,9 @@ static void ath12k_wifi7_mac_op_tx(struct ieee80211_hw *hw,
 			return;
 		}
 	} else {
-		if (vif->type == NL80211_IFTYPE_P2P_DEVICE)
+		if (vif->type == NL80211_IFTYPE_P2P_DEVICE ||
+		    (info_flags & IEEE80211_TX_CTL_TX_OFFCHAN &&
+		     !rcu_access_pointer(ahvif->link[0])))
 			link_id = ATH12K_FIRST_SCAN_LINK;
 		else
 			link_id = 0;

---
base-commit: 03b7c601b6e314115015a57061f5b377afe13190
change-id: 20261123-mac-fix-offchannel-tx-link-id-84d8387eaf40

Best regards,
-- 
Alexander Wilhelm <alexander.wilhelm@westermo.com>


