Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AC3CA5FA1
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 08:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmBn9EnQykYtITq+zBL7LHMb/HCZovPgph51NDEpVA0=; b=Fq1Wp51lTYj5+3mB1QrlT1DRL3
	AzA3CbAw4StPqIavh3YHpXrYzagAbYQly2VYHA0FUlSJj8czZQQfLMbcQia8dvb7M5/MaWAv8zly1
	tZe9f/NrWjrlJcPj4MX1rr7NbefnqKZfZDy38FvjzRQAkl1zjiU/UDNuW0LOTJBfZk/2VGVi0RXBC
	k81XrEcT4Mpf2jCN6VgG9qT7PElRG8miIjcwEjwrqHAgPhORffkI9PmzcCgIAqTLP/SmE8lBJHbBB
	lmKha/knZ7/N448zs2S9EC7sVF0+O7qce4wbV2lE52mnPRBKrrnzb+WxhYuk4tEEZghQMLB4H9Lu1
	zAjp7wHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTEO-00000002maF-3jKg;
	Tue, 29 Sep 2026 08:30:32 +0000
Received: from mx08-0057a101.pphosted.com ([185.183.31.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTEM-00000002mZO-1MqK
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 08:30:31 +0000
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TWEu2951175;
	Tue, 29 Sep 2026 10:30:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=mmBn9EnQykYtITq+zBL7LHMb
	/HCZovPgph51NDEpVA0=; b=kjkHJIqQS/F7pTCMlzhXLTEKPOawY+t8EV+KIn+a
	gPYRZWmaLJ66a9k/x0tqI6IaizB2Tjtf0s700XB7XAeOswHsWPL5OWeK2AMJZPCy
	gRKxzp/ayKgkRhBQThSUl8tKmePEb365RhENuqYW9mj2IvrOltzDNgQftQs5wtDU
	CYr/PloJHrxDrHJf1aKEdBPg43f0A4ag9VVO3MU7yhTsMe6C4dsHcHFMGVS77Zyy
	pCxXCYiSzSl+RAyJOCvvU1qaqvduln1Y2PyVoatuZu7dWmOy5Mz3kNSh1JsOqcEs
	q6WM7vBnxtpQtHAiuaZyRgGdrL1uDblKQKZ8+s15aw0NNg==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022143.outbound.protection.outlook.com [52.101.66.143])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4gx221u1d0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 10:30:23 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PP9B7Bo2Y+VTVsqvs6/bHZGmT56JNqmu6Awz20A23rA6fsu80YsJftpFDeVVLkFrKjbGukjT0RT1BdZTaPw01bsd2Qnaef4lL1D1K/psrIqbV3t+vTofisRxkBCYQsPHg6cJsrBIqHbqKZXm3Gjf0EzTjS1ZN+jiQMsd7HtoVewuykTrGlkQF8da61DnyMyVyjEQKyf3UP4GukeAobcHvs0GKLtXg0DwbGMxvT8awfupmePgNa5fGLwTtu6CpGfOb/yl0Q2WEiO1VJ1LAij8qSHI8SQIKMrgnnptKvjBmW9tlPElrezo7NERL6JC0xofPaZR/YF1rIqgzt5zGZNbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmBn9EnQykYtITq+zBL7LHMb/HCZovPgph51NDEpVA0=;
 b=aNXTc1gTxLINa1G9b7VLLZjywS3sK9lqjJ5n/GSfXz+j+idJFFVV5xiQpQhoUXkFvXRzJRL78nE1fh+9KadfV3u6sN8Ub7kAgjlQYgqFxzTPpSIDwG6coJd3/0YnD3m31Hmet6x2ilFBS6OAjsij8YosaPUXFwvtwrw216/Lvdp5uE9/dOqdzZZdYGD/0VTUG8dlcM57oAPWxsjCbB4P/wC+X5aGcnvOrvYlUtmbtyYKqze/06Bsa9f961rgv+bZylIGbta+laXwY9XtEn7i8zAC1QzIs2Wacf4mCO+N2aa8A1gwimP/gcxp9tS8d6cbIjnpIZelxF3/5AhTAh7xfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmBn9EnQykYtITq+zBL7LHMb/HCZovPgph51NDEpVA0=;
 b=n31dpgDe3HJZ1UascFgLzXeOYgr+UzY6scYyVWRsGsLjRE44k+1/dOnO6G8MTXHpy+fdVR0EOILaDwScT+PBIwICLGlRMXtChyrvu1VxCTxulDzTiqTsexG4lV45QBt7cw5xbk/YxUt+DguRpmOuL+54WHzz8KfFz3bHVXAnUvs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by GVXP192MB3082.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:288::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:30:19 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 08:30:19 +0000
Date: Tue, 29 Sep 2026 10:30:14 +0200
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Thirusenthil Kumaran J <thirusenthil.j@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
        linux-firmware@kernel.org
Subject: Re: ath12k: inconsistent regdb for QCN9274
Message-ID: <art3FqNHatt7zjLZ@FUE-ALEWI-WINX>
References: <ap-vTGZiqGaodxKE@FUE-ALEWI-WINX>
 <70e4a7fa-6595-46da-8465-38906a41a6f3@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70e4a7fa-6595-46da-8465-38906a41a6f3@oss.qualcomm.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: MM0P280CA0116.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::33) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|GVXP192MB3082:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d29f5e-fd1e-45be-e07b-08df1e03e521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|5023799004|11063799006|4143699003|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: QJQ/01vzbbX/7O5CF/8LIt6aGONgt/JBBRkxyJeluxyGO4uDeeoyx7ghyBWbIZ7dJrFBIUQd5f57TnU/HNJ4phIxJm4A5ZyytbpNXVEvsbd7mC6mCyuZthYLXriJIIcO8noBAA7dnpRweul4RDOCP8c+ocErmt/UEOBKFeIt5IBsQuMYvDssE2Mw4gY8/eRnO31hS+/gTfMVxBt8a7iCBHU40fNXCCPjnOMUH4hey4OT2BFqNmyJgxQBv4Mtv5WOs04X1/JB6/5wAfwMh63IMC8KJ1hx42mGnqEh3W+eQ01FjJm3hQG8rCLeBmuKKj41BVzuXdtLMha+nnb5MEsuPabF4RnHDZB0VQ5JfPyAK9BZvzO+JRFPuR/ZztUfS9SHi2I0m3mzrRDvHcu+pDusmp4w+m5pgZVkrD97GA+kKGOo6Rk8Z3YK+UQgKT/mRAgl1Yh+A+4lc0AixUHRss2ktLkzLBX7dgyANpfjcgN2eebu4mtxS2/luV8FCoO5JmDL6Sgt2qRLD05PNeJL0Sgh1VbPc+h7a07ruwIt8apM/CpFhohrRUdHmn8mCTbq40yOCkNuuuYvuTXcH33Ct1IHav/2dy0S4wc/EwNnC0a2lAQNPbHODz1uBWID9dWWQrYHXOL9PX5DyVzFdW6Hy+yLnRW+4+7D84srhBRMqmJ2nk8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F4EIt6AcPX1K83qucxgcNtPSDCFhmnVgmWdW80FsduPidH9YfBCOFxpEuZ7q?=
 =?us-ascii?Q?xrAPmee3gPmNVg/rtKZmVXPL/5dLrZRwQqWTbIuwsd3OWL90Uj2yzbyRatNS?=
 =?us-ascii?Q?SG5EJcsL03kiKJXHyDxeQiIDq3WwJDU5s/zf6GqmrmtsyVZQaX5v+evwQ4Jy?=
 =?us-ascii?Q?mTPLvWlmXMheBs3M3PtAk4ARdKtGYSBPXrh+PRDx99xZuUeKODcUp0C0EbTZ?=
 =?us-ascii?Q?9OT7MzuNgJEtlVceOaMjjWd+BydSup/ULw1pTxUvx0vN5xkn2mvFSmmTVX+z?=
 =?us-ascii?Q?ZvvVXitVz+jkcHWLe4MzCyLgxEcKG5JJ6Tyq7u+k+Y4mpv6HY5jlCz1kEMtw?=
 =?us-ascii?Q?cqV7JQCJ8D+2sSzaH7dI5c3MRuF8VXCitDiImmBAJqkhU9J1gHuE85ZM6nQ5?=
 =?us-ascii?Q?pjgm1IYAbz8SAT87mAEww/X4X59LGzyj4foHWiZuTh7coqWh5LS5irNHxuUB?=
 =?us-ascii?Q?5YaE5ip8ds5vf441QnK9rF7y8JCy8RXGTYUDeJxe32hkaP5BP66LLBjbP7Mm?=
 =?us-ascii?Q?bANiSdjU6Sjh9F6JwVw0h1kCgr6ThAQ/XpaCViDtCa6q6OdiI3uwPgH7k2Gp?=
 =?us-ascii?Q?Jtdfz1//EdK3QeoKYPlWQXMh4HR+jNrxOITzUA0iBKYh8RvET/D2+Btrgx4t?=
 =?us-ascii?Q?AcMeB7NoQxLko/Lc8KJo7aFxcyZILwHH34ZA+aAFg9Aqdw44luZ7HlUk8V6n?=
 =?us-ascii?Q?/0BouuUWre0Oc2teZCVzafZ1xNZiNRpKn+9UtLrUTmzV95fxntAgyYvkAszM?=
 =?us-ascii?Q?X5WmKf39CJJZl+lj4j7OUxn5CBQPo6wU1b+JFB6nuOxKQyT74vNNxJB4eknD?=
 =?us-ascii?Q?Fw8X23yeXbgXqqlDvTLmVApxjj+vwDHW03cCKPPcw6FxucymeM4a++xzS01A?=
 =?us-ascii?Q?Lc5JcNdZiMsZRVmkN3Q82nnmulV1DrXQuf14tnt2BwO6nF/dXI861GWHp5rz?=
 =?us-ascii?Q?tLP6/mprgLLrd+X5zrFi6sB42T7hG6P2thLFtEcqOSUfo7FrVNnYqu1bcQBI?=
 =?us-ascii?Q?BmGDYaMkhlTEZtCO8J/uO8jFAl2DwnHJUu30w/kKV0Nfmx30xzIhSjRQpx0+?=
 =?us-ascii?Q?8PxAA/18N2OfaQ1H95Z9nf+5Bj4w0Qt9+6mu9CBQFuo61jBN6NZhWMvQd8v4?=
 =?us-ascii?Q?J0HF7E7lgS8hCJdiRtcjJxMR1BXkxJ7vyscutcIAC4aeiPvoKsS2Hfn2xhN8?=
 =?us-ascii?Q?lItmxW8QFfdnhUwHkV0RkDVISMvO+UmXwtjTAleRyZR1xeC7fxfbBORkIl16?=
 =?us-ascii?Q?njE71owAUr3NZUPef64qxHOgQ/luJg/BAmSAvO1LtNpho82+UPI7kkduz50v?=
 =?us-ascii?Q?daV0ueVFNNprIZmiEVDXwGYt6TZcl8Ab3HZKaO9JjKZUTWj2ty95uRzrskXv?=
 =?us-ascii?Q?NWh78sAu+3C/f1w4TUy4M75Fn7/tdlDqE99HnHWaC0O2ihoAvXkRhx53s9PR?=
 =?us-ascii?Q?Hg4G+PbkjTze2AsPKhiyqNxOKCnKEzLqhI2cC3aFtOLne1I6MGtMwd4J2WpM?=
 =?us-ascii?Q?WOZG7+ugTXVIrFsbFAVFJc4WjVk1raRVWA1WiCcySWNmborMLAuP6An3t0q+?=
 =?us-ascii?Q?AgOCV62EMwheVZ+2ctthxFFpMqYhxp6FPAsmvWIjq0nHRPv8ucIwj1M3kTEL?=
 =?us-ascii?Q?A+lAadh6mAanb6qgsKc0X0LAiARfVaHBE6reECoVr+0HD2q2ykwUSm0HezUj?=
 =?us-ascii?Q?yOyhKMkjBjwQmMV26XEq0KE/cj6ySiNPZVPncNTTq1k6i567LeBWBaHSaE2I?=
 =?us-ascii?Q?toqXvbiDsQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: ETuRI0ltCIuO/RWkdf6ZFXtCfd0/7IasXDQs2LQhyXKe166Z5wlT4GWeV7rh8An281liC+6cclMs+mRlnI9uUjhYqwIuqW8CU9kwRDCRJueu3/rv1Ps4XUlw3qABcLQS87CrZCE2NDmtE2C1WIERd4a9hUn1a4gmyl3zhw5keGsrXoPjjNwHR0JbVYEhFXvok1c0wQUDF820TVobzBgjdsCw//E2tCW96PAm2Zy1+MAGTcizD2t1/clrBuq932jkW05kWI4nfpu+9FCV48k9Uq0Ihv8oQU/S4bZUjiNWIrDwiqxWclDlnlZWy+/0MIElcPnbSyh4IEVGF9KAjN/1WA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: iUXQM91DEOE9zUVFV4evHZGrqslx8nvgmCxL9zOkXYWg8DoPzMYTyfOfZLKC1QwRg8PfmfS2N+e4JkHg4WqHoOX90Wp6mS/Z4Q+EkW+xNoSpKkQGvS7/caI/6xYT2uzjtRAMDURpYjYhu0oQn8F/Q6JvqZzrB5lTK32BETsQHTcPRZ7AMLiLsUYa7QFW4scDnXxtlEPnJ5NGXYqakpBpxCXb2J/I8YbQBcKpy7wQlEgOfOY2BZJBeqQFVhbnyddB0gfKOq3aZVLa1CCEQa80C2uSht+Q6SrHs+D0txAUOGTph2SgtXlLZZrtfRmWFJgfAO8uwlC5IUp3zl5wZSO+Y4DtCHcGFTvA8EIy9myzqrTACcaWdRCsGrGf3gGmmq91krqESEreOsIErv9M6ruZGYslb9QqJCuQ3Ck/waOYrDWj99hfIBl1gb+5LlHTmReWZFsesgQlfGsYhZh9aOxEcFB8KUxqrEIv4X0Xp/hv87EzbpDb1cY5HEDC2qUvcpquaAJj09e4S69056KuW8bfGVzw/hIa9bvR6WG2KrLwp1Q9O92fHLuMDYsroA3T05W2bS1BQm7bF1ovOj8ZKikCXCJE0C8qYKkvOGjLs9Tw+LJxASxIQDQRepJSGIxKCMca
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d29f5e-fd1e-45be-e07b-08df1e03e521
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:30:18.9213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cbpxp39CZ1ArqCahQOlvTmr6JEoUOke5TCT97MEmhkYPu63zz5ppszpUmpPWV/fM5gkw4RDc3DvkfUZjkR1Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB3082
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
X-OrganizationHeadersPreserved: GVXP192MB3082.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: TDswQ9AvZsOFESHtBJHlSqtZl8H5IYW1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfX1S0gAUj+DsRy
 1f4tWzcBa5Cx5S6VVLFquQBfneOeY7GhhHmRX46Yn8wTi69w+XDJgDIcbjNI5QtNsQIapycmNNt
 cq4DlRx3chyjVysAYKiEzjKnOMA5U6U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfX3baTIdHkeI5s
 HQU1TBGeapIC6OPk4JmYz3MTeJzlpNCLgReu26oeJduyRNvHf9GJC4tGqAD60gkhR+03g6P+Kc8
 atpMZulEGYp2YSP3JYkhHf6p/4Cw6ktlQExXRHJzMt6ENwqTAe9AdHkVKPLeiXXIvXem3LH2JQg
 s3CZ28vUo9e5zgjtvtf8EFbpM0xefrLFtjyF9Pa78bGJjOmyh11SCse1O0qpnOiuVzxJ/VO1+ws
 fVin+/xlNzABTa3JZmy4PfxVbT7ogMC7K7RxaqeHRk3gwQSTbgxh4QGjhfYuEajBjRojMcBkg0b
 3Po/55heebRxt1/aWHp4RIhDBm7PZi6MRm8qvCeK+oQSsYSMAd5sNb2Gr/z8KkMznHsi/QRxden
 F9nBCe1by2qSrZ1MxbMhhQkS7/3NsHQcCXNw9i0tKFUJJhPvo7QOoUiFYd0yYUYa8p+1iRYL9pf
 8qKV60Csia367rUGp4g==
X-Authority-Analysis: v=2.4 cv=HcqB3SE8 c=1 sm=1 tr=0 ts=6abb771f cx=c_pps
 a=TKz6ITTkQb9IZZ8wZUeSgQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=WQ4YJ39tjzx_Hbm9pN5v:22
 a=n4ahBwVgq5E5wYkGj10A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: TDswQ9AvZsOFESHtBJHlSqtZl8H5IYW1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_013030_658222_EC1D8608 
X-CRM114-Status: GOOD (  32.53  )
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

On Fri, Sep 25, 2026 at 01:36:39PM +0530, Thirusenthil Kumaran J wrote:
> On 9/8/2026 12:16 PM, Alexander Wilhelm wrote:
> > 
> > Hello Developers,
> > 
> > I am using QCN9274 chipsets with the `ath12k` driver on my devices. As far as I
> > can tell, the driver uses the regulatory database from the `board-2.bin` file.
> > However, some country definitions do not appear to be fully implemented, as the
> > values differ from those in Linux's standard `wireless-regdb` repository. I even
> > downloaded the latest `linux-firmware-20260810.tar.xz` and do not see any
> > related changes there.
> > 
> > For example, when switching to DE, I see the following values:
> > * Channels 52-64: 23 dBm; I would expect 20.0 dBm
> > * Channels 100-140: 30.0 dBm; I would expect 26.0 dBm
> > * Channels 144-173: (disabled); I would expect 13.0 dBm
> > 
> > US also appears to be inconsistent:
> > * Channels 36-48: 30.0 dBm; I would expect 23.0 dBm
> > * Channels 169-173: (disabled); I would expect 30.0 dBm
> > 
> > I am aware that `wireless-regdb` is intentionally restrictive in some cases. For
> > example, there are rules where 26.0 dBm is used instead of 30.0 dBm because it
> > is implicitly assumed that TPC is not supported. Therefore, some differences may
> > be expected.
> > 
> > However, the values above still appear to be incorrect. Could someone at
> > Qualcomm please investigate this and fix the regulatory information if it is
> > indeed wrong? If the current behavior is intentional, I would appreciate an
> > explanation of how these limits are derived, as they do not seem to match either
> > the `wireless-regdb` entries or the applicable regulatory requirements. Thank
> > you in advance.
> > 
> > 
> > Best regards
> > Alexander Wilhelm
> > 
> 
> Hi Alexander,
> 
> Our internal regulatory team is reviewing the source and rationale for
> these values. We would also like to confirm which BDF was selected on
> your platform during boot.

Hi Thirusenthil,

Thank you for your response. I am using a WLE7002Exx cards from "Compex Systems"
and have also received the corresponding custom BDFs. I then added them to
board-2.bin using qca-swiss-army-knife. For the regdb, I am using the default
version that comes with the kernel (the one with ID 255).

> Could you please share the following details from the affected platform?
> - The exact platform/board model, or RDP number if applicable which is
> used with the QCN9274.
> - The complete dmesg output from the affected boot.
>
> In particular, please include the ath12k QMI target-capability messages
> containing information similar to:
> 
> chip_id, chip_family, board_id, soc_id, fw_version,
> 
> These messages are printed from the 'ath12k_qmi_request_target_cap()'
> function. They will help us identify the chipset, board ID, SoC, and
> firmware version, and correlate the selected BDF with the regulatory data.
> 
> For a quick filtered view, you may also run:
> 
> dmesg | grep -i -E 'ath12k|board|bdf|chip_id|fw_version|fw_build|soc_id'
> 
> With these details, we can verify whether the reported channels are
> included in the selected BDF and continue investigating the regulatory
> limits.

The wireless modules are running on our in-house board based on a PowerPC64
T1023 platform. I am using OpenWrt v25.12.5 with wireless driver backports from
v6.18.26. The board-2.bin currently originates from v6.12.94. The dmesg output
(without debug messages) is provided below:

    user@host-A:~# logread -e ath12k
    ath12k_pci 0001:01:00.0: BAR 0 [mem 0xc00000000-0xc001fffff 64bit]: assigned
    ath12k_pci 0001:01:00.0: MSI vectors: 1
    ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
    ath12k_pci 0002:01:00.0: BAR 0 [mem 0xc10000000-0xc101fffff 64bit]: assigned
    ath12k_pci 0002:01:00.0: MSI vectors: 1
    ath12k_pci 0002:01:00.0: Hardware name: qcn9274 hw2.0
    ath12k_pci 0001:01:00.0: qmi dma allocation failed (29360128 B type 1), will try later with small size
    ath12k_pci 0001:01:00.0: memory type 10 not supported
    ath12k_pci 0001:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x1005 soc_id 0x401a2200
    ath12k_pci 0001:01:00.0: fw_version 0x160484db fw_build_timestamp 2025-12-09 20:09 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
    ath12k_pci 0002:01:00.0: qmi dma allocation failed (29360128 B type 1), will try later with small size
    ath12k_pci 0002:01:00.0: memory type 10 not supported
    ath12k_pci 0002:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x1008 soc_id 0x401a2200
    ath12k_pci 0002:01:00.0: fw_version 0x160484db fw_build_timestamp 2025-12-09 20:09 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
    ath12k_pci 0001:01:00.0: leaving PCI ASPM disabled to avoid MHI M2 problems
    debugfs: File 'ath12k' in directory 'phy0' already present!
    ath12k_pci 0002:01:00.0: leaving PCI ASPM disabled to avoid MHI M2 problems
    debugfs: File 'ath12k' in directory 'phy1' already present!


Best regards
Alexander Wilhelm

