Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C57606A31C
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 13:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XTbJgYUr;
	dkim=pass (2048-bit key, unprotected) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=ny9AFnRB;
	dkim=pass (1024-bit key, unprotected) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=R4ouCQ/n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=I1IEgm548Y0ca0shnDld8JKWFWb/rP6kjIVgAoZr0Aw=; b=XTbJgYUrMi/vGxxMQF+a15qtGD
	ODkxm+XTxxLY9B6/GNBcPsJrfnoWjdVH8B4uyJXrYLJGUErdKKiawio3tzn850IhaYK/2+atNdi55
	wdAHsaK505pJwrySaNpjzbjodGH9drZ+CRt4aDDcEycfkKt3CENo8XrEe+KyUWjQpPMStuHnw7j+0
	11MvK3a1WyQq7meB0IGAqj2doC9JfY/pex9/L+hAZVNf9ED2oDjKvfTfGbR2i9qvOUzqYS2fubUeE
	bUF2ht1G0JoJjDs4iDThCN74CXg04XHdAaJK61OLIqSBmg028yH9jXPTKA4Mul8UQ6IPMFoIn3spK
	zvela9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZw4-0000000DS4X-488f;
	Thu, 26 Nov 2026 13:54:52 +0000
Received: from mx08-0057a101.pphosted.com ([185.183.31.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZw1-0000000DS34-1xaz
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 13:54:51 +0000
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AQ5Q6as593410;
	Thu, 26 Nov 2026 14:54:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=I1IEgm548Y0ca0shnDld8J
	KWFWb/rP6kjIVgAoZr0Aw=; b=ny9AFnRBWII58q4wtcDvaQDbIYXbFocQJNFwux
	A5FJccx8rQe9tiW5cdlkaTpXtOwSTTi3k68GbadVdX08QMW/uDlGRVM5lfkkHZaq
	2bvQLxmDOoPXrN5cgtyAnN+WxrCQa6HiDa28WinCQzyjGIe5N/DG0i1EI9LZfxeb
	vbuFfzmJhxsDGNCVri5DgNIZIpwXtYd3U+Yi3G5fp9zq//wRBfiR8evIUfTNs3TI
	YPo1mFJZkmTT1iANgiVg44XInsjZm2/m94gQiQO6DHnZ+7UFXNqsxzN5oRDJHg3X
	mbX5TlcgOTv88OXPHuV8vCoWaJ3tQcfCP/GsFQgbQeajADqA==
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11020113.outbound.protection.outlook.com [52.101.69.113])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4j3067q65g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Thu, 26 Nov 2026 14:54:32 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7wBkvEmI1zg2iqB7qUQ1mZWPh31DS0jalWIv8ZBFYSp+eBkD4oTEEWa969grlUwxjeBSKuEvJSH/S79o5loahdqp/nm8CL7sowELf75XPTSUexA6xcP/y7lkPfF5YXVDI5Jcj/iFEhWeGZeSVpsk2A71DpgrVgFY70tvWlb9U9NvG4R5yPHsfJO/eOALuJ9EB+0jEGffe+JbNb1uDJvSrZICytonKSknFUCQ6gJ95ANdnEhh1nuJUHGlFeEE4MtVGx5WKRWhAPiE8rJ1EWnNoBmeaIfMl6sgvoDYgfX45IWvgk59FMgsuyJ4MliHWWeuObsyIug5FygjkhS6OP03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1IEgm548Y0ca0shnDld8JKWFWb/rP6kjIVgAoZr0Aw=;
 b=gjOrbzWgbnEVL26NF0rcSke24tl6BOVr+DVLN+wXRevIwQp7foKNQ3rStCLJZAQP/eHq+xmY6bZ+Wsj610ai7YiLrPRORxWUU9ufcEgDvtyZmnTtFr9e+aq2h+pe6J8MsjXXr59fetXSdcYW0FllhmuPRc2efgZj38vo1emoGcCCdLYjJ3/P0Oi+b+RCKkHAhWscQLFnwRCCdXW4zYHunz64zi9JwC3bNtLnmpwQLBAZWK46tkfb7bbKfbweDFEkkW+YiiNoWWi7tzeYNbJgn5vE9KIfEqXg0BmAEAxfk+aHlA/JuguQU2MAhT0wdPFcGfd8dK9+tqFmJz4poXUxVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1IEgm548Y0ca0shnDld8JKWFWb/rP6kjIVgAoZr0Aw=;
 b=R4ouCQ/nmj0oaoclc5To1Cima0mD46x9TTR3b+SpevB/p2z+NX82xvJDMsSdAlxxwuYWlz9k0C+3q/uKtD94YF7BzM4GdI7h7Oi5Mx/2Mw6VPDnkgSNKIgpvOoi7u72DNzBqMRGInH8x7eONkVOiKjmJ9DwdD4a5Bed91Lc3okI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by AM7P192MB0756.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:172::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 13:54:29 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:54:29 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Thu, 26 Nov 2026 14:54:28 +0100
Subject: [PATCH RFC] wifi: ath12k: use random address for scan vdev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ath12k-scan-vdev-random-addr-v1-1-5560acd6907a@westermo.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQrCMAwA0F8ZORtIKgT1KvgBXsVDWKILYiftK
 MLYv1s8vstboXoJr3AaVijeosacO3g3wDhpfjqGdUOiJMxJUJeJ0wvrqBmbecOi2eY3qllBsv2
 BjkIiTNCLT/FHfP/9Da6XM9y37Qd+ETcIcwAAAA==
X-Change-ID: 20261126-ath12k-scan-vdev-random-addr-0d3809606610
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: BE1P281CA0294.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::14) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|AM7P192MB0756:EE_
X-MS-Office365-Filtering-Correlation-Id: 4848e65b-e950-431e-fd88-08df4bc4ca7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261009223027099003|18002099003|260925022911599003|260925021911599003|260925021311599003|56012099006|5023799004|11063799006|261022115727099003|261021121427099003|10067099003|261026135527099003|261028144727099003|261022105027099003|261021130227099003|261022075727099003|261022113327099003|261026140227099003|261021123027099003|261026130827099003|261026121527099003|261021135927099003|261021133027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: YGMQTS1KH4pqyj14o2QuE5LA0qsX5QMVWnCsvc5VXjvdseIDB7iurT+7nor7pdo4CdLea/xkGt75TzMfS+//JWnD1Ne6Wp6YEZUsc9Q8FqBTWyFEoSanJj8a/lQC3g+v4ooVTnQoSGROVPdRVCEKm4BA0mm/G8WI/KYIqX6HtEgPhiPbPyVEL+JR9prGvug6ZLtCEPO7N2i/IsCjjPvP69oFtF9UsDwd/Zn1Zd51ig2gYouVYvIkhO5nY2ABaKS3+drb0LfngtXsJ9XJMDNnDO5NpiIfYTCQNYIzMewf8Ym0Kf6AO1xQVPMHzE/Px/dEKkPKYXif7SDzLIYbby8MOY0Zl9rD8AjJT7EFh9F/8yFXJAMTlq7t6Oa+ye5QycR9Km7+ZAKV8ZTQ0h1EueFAcadqJuKC53Gi92HPcaPH4aRSr5w1DgoA9vK6vWs5sy//Mvi1zDppto2zmi2cY5xgQ06S7yAOtT+EZVmnVsadze+Gdk+n5kwgCCzapse8Dn4QXSQpQjVR485Hz9p5c9YaAChGv5Olp8w+qmXou/2zaeK8nAeuUGfncbUgc54V2MeXgC7Sz8Z+44bOY7qRKczQ6WYDniTgKXVTLTZYSyyMufdQ3TENKSYor8OBg4hrfVnUGOrPjuM5m30ulRj57sqoYwK/9O9Z9eGwBzj7w74zim8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261009223027099003)(18002099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(5023799004)(11063799006)(261022115727099003)(261021121427099003)(10067099003)(261026135527099003)(261028144727099003)(261022105027099003)(261021130227099003)(261022075727099003)(261022113327099003)(261026140227099003)(261021123027099003)(261026130827099003)(261026121527099003)(261021135927099003)(261021133027099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDdsZlZBSGNkRU5vSHlUeWhEV0xwWWhyczJKUVEvalVReVZxVUllVWxNaE1o?=
 =?utf-8?B?c2I0L1oweEU5U092ZW5PRk1Sb3hUNnUwRnI0YU0ySVVFenhDd0VROWlidTRv?=
 =?utf-8?B?RmNqRjhZNmtBZGVRd1d0TmppdDVNQU5mdzlUZ2lSRlBFWURCUzc4UElmV3di?=
 =?utf-8?B?YmNPRWp4K3R4dFNialBpZklpQjlRdGJGRUVJd3B5dTB5TXNYOWd4N29DTTlN?=
 =?utf-8?B?YllHcE0xSlV5ekYzTUtpRlpJenR3T2F5NnBvS1ZhTDhmd3M5bTlXTlFNeG5F?=
 =?utf-8?B?a3JOaUFpRG5MUTN6bEd5em1RSW9oK0R4UlVIdk5yZ04wSm0zelJ5KzhnbEdo?=
 =?utf-8?B?RjF4eHQvQ3lXdTNNRkNHdFI4MDZBR2wrYjhWWU5LeW1CSWVxSDdneEx1NUxB?=
 =?utf-8?B?cjdhNzZjSllBODBQYlkwcmttYTJOR3VQTzJpcnFJQTQ2YlJhWUJmOFhMTmxR?=
 =?utf-8?B?YzZkQ2xmR0VWMmN2WHdGMUhRTUt3aE5wc0FwRkt0dU1JUXRMYmliendQM2Yv?=
 =?utf-8?B?elRQeitMMWtoM2ZVMUdzRUNHQXNZN3QxN0tWRmpmYU1YV2trdWYyeStEV2w3?=
 =?utf-8?B?UzZSTUVJRjJBcnA2UmkrcDk5QXM0cVA5R3VueDVYMDRiTzVPSzNPeDZIekQ1?=
 =?utf-8?B?ZzlqdFp4MEo4VlZFNU83Z2hNVXdMcXNSaStqdUhoeUJvZlJWci9VNTBiTkI0?=
 =?utf-8?B?L0FZNkdRN3dhUzJHMGI0SUNpa0YvZnQ3dUdWRXhQQkxpWittanR0eDJDSkdG?=
 =?utf-8?B?cVQwUzBNbXdUUVpmbmgwRmlueEFMdDhibkU5NW5taWp0QkdwQytMeXA3MUJY?=
 =?utf-8?B?NWF0U3ZJbzR4VTdKbTVpd0sxNmVoQnBnR3BFQ0dOLzkzZ21DVGRzd0cvbitB?=
 =?utf-8?B?M1hQTFBtOXpiakZYbXhPOUNBM1pHOTZGWnFTK0ZuS1k5dGt0ZGhUNXlEcHF0?=
 =?utf-8?B?RFdlMHVSbHM1SGdpUTltOVl3Sk02YSt1TVZKQlZZZkI3TUM0TVVqTGFPLzMv?=
 =?utf-8?B?TWZwWm1ia04vOW9ETUJLL2YzS2MrQkwyWXBUdnQ5dnJuUXh4UUNKdGtnKzF0?=
 =?utf-8?B?dTJZbGNVbkRVRXhrN2NNS3BjaTZPbnJjMEdVUEQ5b0lUellXMDZKejNkM281?=
 =?utf-8?B?c2x4QlVQR1BwUXdNeFFLbnR2Yy9Hc3g2VjFlN21mb2pON1dSazM4Um90RkRl?=
 =?utf-8?B?ajQ4a3pKS3FXcjV5RlhMNUkySGlCUmtDb2d5bHFUSDlEMTlBZXVZbUxIVy9S?=
 =?utf-8?B?aExoVURSTUpaQklCTVJ2YWpSNC9LU3JnL0lpYWdqelFuWFhoQjZ3N2MxVW5r?=
 =?utf-8?B?MXc0clJvM3BCcU1ZOHZtRFNQV1VlT0dlYXo3ZVFIZXd1Tmk5MVdzYzZ0MkZh?=
 =?utf-8?B?ZEhUZ3hxUDJVQVRCT1FPcHdhYmVZM1QyY3dxSmp4TDI0aFREK1lwblhYQmg3?=
 =?utf-8?B?bmhzcVRaaGZhZ0hQQXp1VlUwNllHeU9tY0swaUpUL1YzTzlLdVZQNFRNV2NR?=
 =?utf-8?B?WjhGektMREdFaytpemhwbElLNXFRZ2s3QmFlcUU5VjVZOVc0NUdJOXZJUThE?=
 =?utf-8?B?SnVPZFFUWC9kd1ZSYnZoNjVwVmZ6Ukpxa3dyUmM2Sy9rd2lmbXRmZnE0ajRZ?=
 =?utf-8?B?aWJ3Z1VML1A3bkVRYlJNS3F3Wms4NmhSU0JLekRFZ2JUajM0cE9FVWdUQklh?=
 =?utf-8?B?OFhHZS9VWUhob2FkV2FMNGo4REo1S1cvdDVsYThIUWlyemJXMjBmTWFaRzJR?=
 =?utf-8?B?bXhhMWNYMytuNHpHcVJpaDdERXJqTGxRRytKYm84U1Qva2pPSHkrNkt3V1NH?=
 =?utf-8?B?aUliQzM4L0Zsdk0wVXprVG56UGswVDcwdnE5WXdrT2RDaTAvbnEzbFRJS20r?=
 =?utf-8?B?dE1WR3M4WnZZZlh4WGtLT3Z5aTBSZ0FFcTA0ZlFKck5RbEJubHBqR0dXWXd0?=
 =?utf-8?B?WjVrL1kwZXNQMlpxdXdBalZ1ZmJWdWdBdXhFWG94SnR6OEg1NCtSTHRmajda?=
 =?utf-8?B?NmJZSjFlQUJiWFZURWp6ZVVqQnM3Qk9xQzFyd0hXQUIwem5DZnBPdlZtSzhS?=
 =?utf-8?B?NVpLK2dRVzM4NitkZVkzR1FYZzYxTkthbDZEUHhuSEVibUhYemxXMnBhLzlJ?=
 =?utf-8?B?TTRXK0txY0diUWZiSFlDTnV3b0NrSEp0N2w1WXRVZHdpSnlXVVdNbVJQOVo1?=
 =?utf-8?B?NjMvVkdqTVJHd1hMaDMzWlVYbnRqWmlpWUFYaWIwZUJWdzNCc0FEZS90SHU4?=
 =?utf-8?B?QzNnRnhrVlNXTE1LQXBGWldnTmdmSjRnRFF6VzdJYjRveXJHM2JCbjRia3FX?=
 =?utf-8?B?REhCRlRPRjhmQ2M3bUxKN2RLcXMzeVQxejRqNTRma0s5RUZLVTZRZz09?=
X-Exchange-RoutingPolicyChecked: E1vts1eytdBzJsHMUrPBs0IVDW4/RIsL5RBzISu2/SsoSXEkEdFJg62jhLxPWjHgdRYYoG7bW/kJb+F58aDCj9lK0hTwvL1OmXoRmhkdjEVrjWCdfLvam4JF6m0cEGia8NVAV7Iu4bwN79RqMc9ZlTUxtQvRZlyvPtTRS464hP7i9iWCTJjML3hO6edETJ/8vUOX5UDeUHubAsc3TssqGJ3kRxj0rHxkR3ABSDpQoRqnHrLq9QLvx9F6YLfdOi3o6+fi+meb18v6q6904wbLNKqKV0vFxFTkNssuOzvGPoftSyy6sisomavkSG9Va7GiVmwXKY8qlG32KKzp3Jz0Mg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3+G/ZlZcSc8mOchcMrhHnyjDf86165U3byigEz2uqfN0Kz0BU+hIDEVY3IruU09Vq6jdtPC2lXzygLn5LtPsxGKAap/5Uq/+nmHToRYrWV7jeoiiE7DI7prLChYLv9erTWhGkckHm9+SdxYQrFc7ztcdN7gVOPzae4Lvr6BQsdDjQgGH0/y3N+Fd1eQ6v1x6e+5amP+kXu+jWizU7nsLubKzpyTdX6p6xQE/PTDkSkvQ8AIa51d/+mcGRNoTBFc5h3wXg3D+62umrp8Cf2yxAuiBWFtuY12JbscaX67XZbynqh7KEH22iS9mV3cVwbqIngSDdtOdCN/r7o1h4tZBzeiR8NZExVD4HeEcFyFSGqlkDov1W2EfbxqHtOSXYxw17ybmOp/cysGxb9L62i+JaK+xBaql2kYftmutvnGzSIEkBSQRx7a+DIkT67FfsrT3AWzhA6GlDs+4ENqJNDQjcfCvivkA2lW8urkVx3MxqE0mIjzGThZUfWYE3n199aISQj7YQPgdP1fCKtL2UILTorz9kN5C/oQ9y/CZSKSmJxipmVKZQF4bBuAk0JFg2Be7beDPwxlxE9pzR5tXc7zIbkqJT3az2Lud6K2WdlYHq4Neo2Tcxr6DjnYzKwva0vm3
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4848e65b-e950-431e-fd88-08df4bc4ca7b
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:54:29.3700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OxdjJfOkiZqUc2QTrKCp3MI6+VAE32rtVOEJFBApyr/U/GJvdzMKW+ERuCuG94m4nhbyEn+XnSvjI3M3xKQJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P192MB0756
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
X-OrganizationHeadersPreserved: AM7P192MB0756.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NCBTYWx0ZWRfX1pzEaeDPLCOK
 bXsJfbxfHpip1oDG2t2V3xAz4inLbBt4eGe5/MTAT2Hx98EgevtYRCpS+t8VCTWtCPfh7y8vgeW
 68KzurUtRwq8dxobcXs0eUj831dVhdPYC4QC4tNOTEg/FUgW6eUQyGEo9oRUL7QeHVxXC6PSljE
 EPdnVofFu5nvCS5Dd4TBnHgZpijxQRasyO4gTpz04zVoNvXTGqhnw5FdedcIzup0gxxlLW20B7P
 ozgSmArPctV3jGF448auCYuAMi/BMj+Q30khj246SNwAkIs4+S/GOccNelAYJ6KsBeM7uC7kviS
 JS7Fg47RLg1cOdgXJEbiX24xIRBm3hylQZP9zm6AZOQy05JI8rP6VQj9td2iZ+jZbQUCY11bbLy
 vYsKtxPBBLyPNhCN6PiZNUH7/IUs80CpKsLgYSk/csx/wlteoytbLMQgLYsfUlhyz+51VSoheX8
 d4EBQ08BgEna8UkiQuA==
X-Proofpoint-ORIG-GUID: o3y3x5C1P6CQ14pj9mXgIwfpT31aO8g8
X-Authority-Analysis: v=2.4 cv=YPcKWhGx c=1 sm=1 tr=0 ts=6b083a18 cx=c_pps
 a=JpH9R70RgxSUek5M03zB0w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=WQ4YJ39tjzx_Hbm9pN5v:22
 a=N9GNhs4bAAAA:8 a=q-QjkHNLre2dx371380A:9 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: o3y3x5C1P6CQ14pj9mXgIwfpT31aO8g8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NCBTYWx0ZWRfX8Ox9iHguKfgE
 yp0NdyuT4r1UQus1ySCBSJjWywJ9yky3i13EVnzbaBTy8T40JPs8JJiU8prQ7qER1zlV6X0Lruj
 yWdbGcVNMohFO6EgzOsIxwUoH3QzXV4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_055449_799899_8D3B4D50 
X-CRM114-Status: GOOD (  12.13  )
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

A scan on a radio without an active link creates a temporary scan vdev with
the vif address. An MLD capable station associated to a non-MLD AP uses the
vif (MLD) address for link 0 as well (IEEE 802.11be-2024 35.3.1).

A scan on another radio of the same device, e.g. on 2.4 GHz while connected
on 6 GHz, thus creates a second vdev with the same address. The firmware
rejects such a scan with WMI_SCAN_REASON_INTERNAL_FAILURE and the
subsequent scan vdev delete times out. As a result, roaming between non-MLD
APs on different radios fails.

Create scan vdevs with a random locally administered address instead and
send probe requests with the vif address using the spoofed MAC scan
feature, so mac80211 still accepts the probe responses.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 9 ++++++++-
 drivers/net/wireless/ath/ath12k/wmi.c | 2 ++
 drivers/net/wireless/ath/ath12k/wmi.h | 2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a247dcf387de..047d448a6fbb 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5737,6 +5737,7 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
 		 * above, assign arvif again for create.
 		 */
 		arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
+		eth_random_addr(arvif->bssid);
 
 		ret = ath12k_mac_vdev_create(ar, arvif);
 		if (ret) {
@@ -5779,6 +5780,12 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
 	arg->vdev_id = arvif->vdev_id;
 	arg->scan_id = ATH12K_SCAN_ID;
 
+	if (arvif->link_id >= IEEE80211_MLD_MAX_NUM_LINKS) {
+		arg->scan_f_add_spoofed_mac_in_probe = 1;
+		ether_addr_copy(arg->mac_addr.addr, vif->addr);
+		eth_broadcast_addr(arg->mac_mask.addr);
+	}
+
 	if (req->ie_len) {
 		arg->extraie.ptr = kmemdup(req->ie, req->ie_len, GFP_KERNEL);
 		if (!arg->extraie.ptr) {
@@ -10523,7 +10530,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 
 	if (link_conf)
 		memcpy(arvif->bssid, link_conf->addr, ETH_ALEN);
-	else
+	else if (is_zero_ether_addr(arvif->bssid))
 		memcpy(arvif->bssid, vif->addr, ETH_ALEN);
 
 	arvif->ar = ar;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..d3f8fb1f308a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2774,6 +2774,8 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
 	cmd->num_ssids = cpu_to_le32(arg->num_ssids);
 	cmd->ie_len = cpu_to_le32(arg->extraie.len);
 	cmd->n_probes = cpu_to_le32(arg->n_probes);
+	ether_addr_copy(cmd->mac_addr.addr, arg->mac_addr.addr);
+	ether_addr_copy(cmd->mac_mask.addr, arg->mac_mask.addr);
 
 	ptr += sizeof(*cmd);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 843f1d11f9c8..c0b474632e01 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3648,6 +3648,8 @@ struct ath12k_wmi_scan_req_arg {
 	u32 num_hint_bssid;
 	struct ath12k_wmi_hint_short_ssid_arg hint_s_ssid[WLAN_SCAN_MAX_HINT_S_SSID];
 	struct ath12k_wmi_hint_bssid_arg hint_bssid[WLAN_SCAN_MAX_HINT_BSSID];
+	struct ath12k_wmi_mac_addr_params mac_addr;
+	struct ath12k_wmi_mac_addr_params mac_mask;
 	u32 chan_list[] __counted_by(num_chan);
 };
 

---
base-commit: ba015e05863e3e57cb4c07ca94f78aba05b1ba23
change-id: 20261126-ath12k-scan-vdev-random-addr-0d3809606610

Best regards,
-- 
Alexander Wilhelm <alexander.wilhelm@westermo.com>


