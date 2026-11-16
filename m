Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016F1606A329
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 07:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RcGi6gCn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jh.edu header.i=@jh.edu header.a=rsa-sha256 header.s=jhiron header.b=Ex7o6pY+;
	dkim=pass (1024-bit key) header.d=livejohnshopkins.onmicrosoft.com header.i=@livejohnshopkins.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-livejohnshopkins-onmicrosoft-com header.b=PjammqGK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hAmkkDkPlHI2kID0WXkRK9qgL496V1YcGBik12tKXKc=; b=RcGi6gCn9lR0CfNSlUZVWmkTyL
	pYpFj3Hn1cmm5rGop0P59/dgAtXe4i+0wom8wWk+cHm/kSPdXo4FAIoZ1mKBbsRzImP+EzZXnrXD1
	jD+jxgGv+t5U0Au2evq9NTdZt+D9l4jucCX6AvzbEcVxjLACurfpzF3nDVKG5SC/JX7M9X6PEalSD
	p3Y2e/AzJ8fSHB96idumC5lCSs+2N1jBPU6P4tyIJQp+KC7AVxNk5fNVeRt5Dm1FGzk7Y2i1Dfe3D
	gHu9ROc3RuKyZg3JAQHcQ9vNghnV6P3KnGBNlKWc4vzVN1H0YMuUH735Rp2i4hSktfxcjvpH+lwBi
	WG972KsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqml-00000001MKo-0UAF;
	Mon, 16 Nov 2026 07:05:51 +0000
Received: from [162.129.199.140] (helo=ironeb4.johnshopkins.edu)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqmi-00000001MIM-1oDi
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 07:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=jh.edu; i=@jh.edu; q=dns/txt; s=jhiron;
  t=1794812748; x=1826348748;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=hAmkkDkPlHI2kID0WXkRK9qgL496V1YcGBik12tKXKc=;
  b=Ex7o6pY+zQa7lZ+Mz6VDrvWL43S5pRsFYHAWpevQ7jE5y2JXsh9kagUG
   8kEB5J6tRwrSoLn48MuXhaCJy5xNIYjWit6q/3QHOnzT4recXgOX8lkOI
   gMyV0124ckHbuYkN6SxGSnZ9UKxyFiyOdER/HKSTRpMfemWNn7CiQjt4x
   E=;
X-CSE-ConnectionGUID: tslAfmXbSMyBg1rWj96paA==
X-CSE-MsgGUID: DvLNJ3IrSGeIJVx7xa0HpQ==
X-IPAS-Result: =?us-ascii?q?A2EHBQCAqvpqgTA4ZTRaglmCQUIBRkKBLJZMniWBJANXB?=
 =?us-ascii?q?gkBAQEBAQEBAQEIAVEEAQEDBIR+AgyOFSc0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEBBQEBAQEBAQYEAQICEAEBOwcOO4YJRgEMjT+BJgEBAQEBAQEBAQEBA?=
 =?us-ascii?q?R0CNYEcAQE3AREBfycECgQNhR8EEgM3uUuBNIEBggwBAQYEBNsuGFEJDYFrC?=
 =?us-ascii?q?YFNg3+EYwGFeRsdhxSBFUKDKIEFgyAgghiBfIIwgiaBDJgUCYFBHANZLAFVE?=
 =?us-ascii?q?xcLBwWBaAMqLy1uMh16KT4XL1gbBgWBHIEegRKBBV2BKw4aXQEhgQiBdQKCU?=
 =?us-ascii?q?YIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQxOJ?=
 =?us-ascii?q?jkQMB4kLwUaJj4bCoEOKW08ATcVGQd7OpMIgiMvNYEJCSYwMCF7EQE1gRsBA?=
 =?us-ascii?q?ZF/CweTdp9bAQYCg3MvohQXqnIuh10JKJBMI6NohQ4CBAIEBQIZgWiCFjMaJ?=
 =?us-ascii?q?YFsgUlTGQ9YjgiDRM46eT0CBwIHDgMLkWgrdWABAQ?=
IronPort-PHdr: A9a23:OZI+bhaW3/4dFnkOMOFyxhn/LTA4hN3EVzX9orIim/RLc6+5+I/lM
 lCZ7vJoxAaaFYnY6vcRje3QvuigXGEb+p+OvTgEd4AETB4Kj8ga3mlCSM6IAEH2NrjmOio9G
 skRWFps5XruN09TFY73bEHTpXvn6zkUF13/OAN5K/6zFJTVipG116a/94CACzg=
IronPort-Data: A9a23:uFjghqMldJtAccXvrR2Sl8FynXyQoLVcMsEvi/4bfWQNrUor0WYHy
 WYYX2+BPq2IMWuheNgnO420pEJV7cSBxtc2HgZtpSBmQlt08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAik/zOHvyjWLas1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 LsemeWGULOe82AyaD18B56r8ks14q2r4W1A5zTSWNgS1LPgvyhFZH4gDfzpR5fIatE8NvK3Q
 e/F0Ia48gvxlz8xCsmom6rMaUYDRLjfJ2Cm0hK6jID42nCuDgRrukoKHKJ0hXV/0l1lrPgoo
 Dl5jqFcfC9yVkH6sL9ED0QHSXEW0Zpuo9crKVDn2SCaItavn3HEm52CB2luVWEUF3oe7cijO
 pX0JRhUBi1vid5az5qnUe1FiMETJvLOLakQ42tfz2CHFf8PFMWrr6Xivbe03R8aoJl2J66CT
 PdBMWApawncaRpSPFtREIg5gOqjmnj4dXtftU6Roq00pWPUyWSd0pCwapyMIoXMGJsTwhbwS
 mHupgwVBjkaJtySzzXeo1quhqnCkT6TtIc6RebnrqQw3gX7Kmo7JAMyc3nggOOCpUOfeexPd
 Fwdogo2lP1nnKCsZoKmBUHnyJKehTYVR9oJSe4S7ACW1rGS4gCXHGEIQzdNLts8u6ceQT0sy
 0/MgNLzCDhiq6a9V32Q7PGXoCm0NCxTKnUNDRLoViMA6tjn5Yw6lQ7SVYxqAqmz14StQGmon
 2DMqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebJJeaS08lzy4/NwJr28X3OO5
 WI7mZnA9OknWMTleDO2fAkbIF2+Cx+43ND0hFduG9ws/i+x5mX5dJJX5mgnfB4xappUPzj0f
 EXUpAVdoodJO2enZrN2ZIT3DNk2ya/nFpLuUfW8gjtyjnpZK1XvEMJGPBH4M4XRfK4EyvFX1
 XCzLZ/EMJriIf47pAdavs9EuVPR+szB+Y8jbcuglUj4uVZvTHuUQq0CK1yAcqgy67mcyDjoH
 yJkH5LSkX13CbWgCgGOqNJ7BQ5QcRATW8usw+QJLbHrH+aTMDtwYxMn6eh5I9Q990mU/8+Ul
 kyAtrhwkgSk2SOYclvQNxiOqtrHBP5CkJ7yBgR0VX7A5pTpSd3HAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:+XMat6hBfsNEfESoVv7dfeKnjnBQX4923DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQZVpQRvnhP1ICPoqTM+ftW7dySCVxeBZnMPfKljbdxEWmdQtsp
 uIH5IeNDSSNykxsS+Z2njfLz9I+rDun86VbIzlvhVQpHRRGsVdBnBCe2Om+yNNJDVuNN4UBZ
 Cc7s1Iq36af2gLbsO0P38BX+LSjdzGnpDrbHc9dlMawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/stmgoyWsmFP73tBzop/M29FDDMuDhow+MTP3kDulY4xnRvmroC01muey81wn+e
 O87SvIfv4Dqk85TFvF4icF6DOQkgrGLEWSjGNwtEGT4fARgghKT/apy7gpNScxoHBQx+2UmJ
 g7pV5x8aAnQS8o1R6Nm+QhW3xR5zeJiGtnnugJg3NFV4wCLLdXsIwE5UtQVIwNBSTg9ekcYZ
 5T5eznlYNrmGmhHgTkl3gqxMbpUmU4Hx+ATERHssuJ0yJOlHQ8y0cD3sQQknoJ6Zp4EvB/lq
 35G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJNG6JO1zoGKwOJnqIoZ/q57c+4v2sZfUzve0PsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4RjjpwtE23ekKhlQ9fsuZDcSuciFeryL7mYRhPiTyYY
 fMBLtGR/n+MGDpBYFFmwXjRpg6EwhvbPEo
X-Talos-CUID: =?us-ascii?q?9a23=3AbYKmfmqw564UqIFecP2OTUvmUdw+dlTTyUfaGGq?=
 =?us-ascii?q?pI2kwUoKXGAGI8Yoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AycerzQ191wDZa5wRZ6ONEVysGDUjz7qKLmJWsI8?=
 =?us-ascii?q?9lMSlFxJgZCeU1BSve9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,216,1787025600"; 
   d="scan'208";a="93702260"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-MessageIPDirection: Outgoing
Received: from mail-eastus2azon11010048.outbound.protection.outlook.com (HELO BN1PR04CU002.outbound.protection.outlook.com) ([52.101.56.48])
  by ironeb4o365.johnshopkins.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:05:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCCNRi7qdiWyouHG9g2ifk+ZgURqX8nzT5QeAa9rHEF1aW2ZoAKd7CyQtvKOW7r2qXqjH3FF4UTVnjKYyUTGXee/2LiySAE4ONLnjlcre4kpvODP+fz5tiTu0fMMzSuYe6gen23f9VFrpueb6zUKuuf3X4q+MHlI6BU+9A29vMvUDYC5pbesThMmUx4+IawuCbMT76J3BaTCvnB9rK9TxhUZx9TTAzsVnup0sUEPYvFn8BesmkU74+11A3VGLqs3Hb5bMKQsJYUIO1L4snqp9anJMeO3/9ltBdIT7Tbmm+NiHwUw7TnyGwqT4msiS6cA8IIiLisSS6bh9c+q/vn5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAmkkDkPlHI2kID0WXkRK9qgL496V1YcGBik12tKXKc=;
 b=G5EustiS4cQ9H5kJMJwKXRh3l2tTLOsmeAw14DvRcC39gG8LBCOVUhBOhbvO44ycH7iaqUbdUN38+AVkVnUXUBvH8KewhlY38K9eIILSeSIAGQRc86PW0rU8Aamb2RPCUlOnmQfA7xjYrxJ+webd1/QDfNc3ERD4VOKTSCfgiV+FYxMYMk1bNMKxvVZWCe00hga7LbhtHOV2Dex9+LVlUiU93v4oHaXmyfFGzgsDliobWKxQdq8P/g0/Yj7OVmjlsWRYnhs6IMDEJ713ZcITVSIRN0TPJQ16K6S+CTl/Upek/x5evXk9D5FXJHl1qNynXKcCEeru5w5YkkNu+WwvwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jh.edu; dmarc=pass action=none header.from=jh.edu; dkim=pass
 header.d=jh.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livejohnshopkins.onmicrosoft.com;
 s=selector2-livejohnshopkins-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAmkkDkPlHI2kID0WXkRK9qgL496V1YcGBik12tKXKc=;
 b=PjammqGKOAdQmwhaTx6EH4Trd0VhtdrwKBcpkdHK7F3+3RXCP511+oPUh7oAEegU7+5/rtrLx7kKGcAsmytdZp5Lw3A8XW6J3158M3+8gc6JwwgG+7gS/HF96+Mn83OSwtLy0fWpVsERsOEb89BFyoFTefEBu1YuRj/UF4bOWx4=
Received: from PH0PR01MB6312.prod.exchangelabs.com (2603:10b6:510:a::9) by
 DS4PR01MB994062.prod.exchangelabs.com (2603:10b6:8:2ec::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.7; Mon, 16 Nov 2026 07:05:32 +0000
Received: from PH0PR01MB6312.prod.exchangelabs.com
 ([fe80::d534:c4c0:28e8:a6c1]) by PH0PR01MB6312.prod.exchangelabs.com
 ([fe80::d534:c4c0:28e8:a6c1%5]) with mapi id 15.21.0639.006; Mon, 16 Nov 2026
 07:05:31 +0000
From: Honghui Zheng <hzheng39@jh.edu>
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: ath12k: WCN7850 dead after S3 resume, then oops in mhi_gen_tre on
 device removal
Thread-Topic: ath12k: WCN7850 dead after S3 resume, then oops in mhi_gen_tre
 on device removal
Thread-Index: AQHddZguGHNaF9NT/0aH9f+fKcRCMw==
Date: Mon, 16 Nov 2026 07:05:31 +0000
Message-ID: <PH0PR01MB63127545EDAE7A007082F57ABE7C2@PH0PR01MB6312.prod.exchangelabs.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jh.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR01MB6312:EE_|DS4PR01MB994062:EE_
x-ms-office365-filtering-correlation-id: 10f30892-1eff-4018-017b-08df43b000d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|10070799003|786006|1800799024|23010399003|38070700021|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261009221727099003|261009221227099003|261009220027099003|261009223027099003|261009223327099003|18002099003;
x-microsoft-antispam-message-info: l76tXSPm9WJ68bwHlhOB1Z1f6Pleq2bdszK+YH2MfjKreHJgUratXuH3RvzixpQSSbNBaaDdyB+1S29GoHJE781sqbDQlVxXO4QPhnerr0Nb5XvotaIjRfysp+ihDNKkds4djQy4chK2/JB/4LG5VG4/azizFiRoo/kJiDSdymWlR1fm/yGESTQ1Jwjj9mjSiaz4JQ5+K9H1fa1SJV1vexQeZhoLA16N7GiMxvhLTW9BCv5FckI2bvpF3a/wYy7cx+/1lr3g7CMP7CGlJLUXWxflFiWM+9zCQ5QToxIyyc5FkWERNVkLbTrv8VYw+PPC/x5Ly30iXkICSlg1NoUTGmP5LySyvnBlAM5PI0MkxkMLvePtuxNerHt8io+3/EiMC3OCuLWrNCpt8V47PNFomzfHyfGK/HYlR6esDgbagdjsscwKlFbqGk5t4R3qJx1KS11ORXgCc3564BgObgFm0xxXqTbt9fPdGTXuJ9oRabpiU2l49F0bClhZ54r2uVBEYawWjkQZkIZ2iKrwAQ8HWceuYL1nhLZzgjz7R9Idzh7mtL60doSQuB/8uJexg4meeAnGfjodWN87qlF9kXfyUfwyl2XC9uJZv/9m0fzan9tc+3wqsRyyk2TcPqthcS50Pj2v30BFElIeT1kggXJ2pQywwY34uJEbfPguV9+slIGZM3YIqpGkHQSY8vSOYUuqqw4VsENpS7VqaAPOcvbPBvhd3AsXr5MAU/Ti3i6KpKI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB6312.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(786006)(1800799024)(23010399003)(38070700021)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223027099003)(261009223327099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?jw5xBVnO6W+XzN0CyiN2CeDMSGX5lZ3n3ugs9FR9O8rnZQROCtIGtyvB?=
 =?Windows-1252?Q?SGpfegp7m7pxQ49M48/apxwvwdk9/x7n4OLmlpDhfmZ3SVn4EBNt9Tun?=
 =?Windows-1252?Q?aTZXEXc8lSJLiymvtPNupLoUpKS8oUPnaKR1xFFbBZ/HAZpcq6NyySUd?=
 =?Windows-1252?Q?kptyM269DZ0buO4Hfd0VwcFYuc+7JD08agH8cO3FQvGoK8d8wjcFmYfM?=
 =?Windows-1252?Q?RkotiIx6pbjkWxzpjkUBDxHy+GmEMSjubdIoGnYvK6UARCt96zdh9PXU?=
 =?Windows-1252?Q?BvW1vX5Rtco7lcT6YFMF843BwMV4kO6lLkIIwUNUeBPF2nUuBMCisVFu?=
 =?Windows-1252?Q?Vsv5q/9pcH0vCAOIdiIyfwNHPTBka4fYc2LigUuMczpiU5JnquL4Bt9v?=
 =?Windows-1252?Q?8y3FcwSBu9Ima1vvd03Akw+2Y+TLd1QpGRdCGLz60SKAUAGy2rw76zvi?=
 =?Windows-1252?Q?4tTRj71CVbPS+F/CbPERalYVwJZnjlZU5Cd9dDbw016Feb0aHBnpGFml?=
 =?Windows-1252?Q?YG0mHRaAEk6IrO8kGeNTqJu4hqHyjr7HR2AiEZiX1XvybCjOOIqfZ1wz?=
 =?Windows-1252?Q?2uT9tPInxWHWADgmNJYuVJVpK8AZM9l2kXVxWR8RoBS3YaNSNJKfEekQ?=
 =?Windows-1252?Q?QrzDOp/c6wQa2a/zR4GLifyIPyyEy6S0HnyffqQrxXUYBORn+1fx+Id4?=
 =?Windows-1252?Q?jtYDQXV5Oz/igRDiyQZuQ5seJf/91zwTsGggHpE513ES+X7SxZNgN37F?=
 =?Windows-1252?Q?J42GL+DcygHqQRLQltgtTM7EOXcL+au4jSWaqUx9ewFcybBc3fiTUHlG?=
 =?Windows-1252?Q?ahpXUCqzsr0J+nqEVdk/Wuucc8sGnmI5DzgTa7E9laXdVBARoA2qYnVO?=
 =?Windows-1252?Q?YpuSY6ZiyWcpJX0iZjf9cT9yiXphdfE07ZLrtYMb60KYT/Nb4FZp4kAu?=
 =?Windows-1252?Q?SMK2/sB5bN3T3HX6dlf1G07/sREVR6/v/qKM4DjsLtXZeEu0Y0uD1BpU?=
 =?Windows-1252?Q?A0o3uWW5aeVEZtzKkMR1ikdTrZNNEwIObCVhRlI7SV+tE/00b9ViHwg9?=
 =?Windows-1252?Q?MPByOGld1r5ERFYXgp8B5iskpJz3JJBXVR8AXSbw4g36e7ZXuv0+O3h3?=
 =?Windows-1252?Q?FZgas//P/DHc7LG1S4aeXiu4TovFcHgPGREkcil736A+FZDlsfiZiTkB?=
 =?Windows-1252?Q?mWePZgK1NVCGnLOpgXuISnbBLjSgLVoT9RcRfVbPOOvE+kTr2W+c4822?=
 =?Windows-1252?Q?Y28/q7CwUNqRqjiWmSa0Gmw0k+xJouCeQQX09xPIvYrI0Pd5sIRUmOGr?=
 =?Windows-1252?Q?bB3WZVkpdCRS6L7BTe2ZrkzMAIGcU0hg5o496kSw6DLjnx5Dd+4804dw?=
 =?Windows-1252?Q?CVIZQdaNfLYXDJdzq6ZOZVcAfVpvicXIPXzAByZAPg0cNI7++evSLzoD?=
 =?Windows-1252?Q?+bWKVr2kqYpt6rvCZPZq5mf6J9k4aYid0dG0GGTP9UkbCRbTVAXGvaBB?=
 =?Windows-1252?Q?UK8oarS7kfxrEziZRAObnuqto3/qATnDMay4YX9UQhLGNKKT6BJK6QRd?=
 =?Windows-1252?Q?ERz48NuO3J6zLji9h1CljIr0MsXN8J2NsRmqkhQnI2hmBCExAoXq320U?=
 =?Windows-1252?Q?vdmXlDz8xcnonVMGNKZH29i/0qkjnN6BToLihV5RYNofQNNK/jz2kWSH?=
 =?Windows-1252?Q?CU9692amEILcI/IfOB8UdUBxW4R9mMrCzwmnvX7YnvLSxVphIbOl7HYt?=
 =?Windows-1252?Q?GhTZTE7VgpUoIpOiEAsOcbP5LTG5MyVUSfo3gMkOtU3RS9NtZCl0CPLG?=
 =?Windows-1252?Q?oTomHXct3bvQd0LOi7FOGaF15QIsIJWNigIvAeEK5XgAq9L9zHOcoH3A?=
 =?Windows-1252?Q?3WJH+A0fFwGUJw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: h7TJJOUm0qLH10lr7zzn9ny6jCuMsYuiUOeRRgKB/LKRq1d3N7DeUlBGLrIPgMDteGkkHfnEm0LGZkByh7QF71w79E+Je+fwXYfFiksh9O+X+y0bVOS2jM1TvLhP1whd7e/ym5QQilExivmLKljm87oTRZefQCTI25mSMsE9i1/6VN/Ob7XqDNAtDg/Ku8FISnUfetcdT6qRb65/sxEt9xrvMEGG6ONEUXoXDl8BGnO86AzUOHKUscyGrm20Wce0+8i+VtwI5fXglP+NTP6ckd24MY/k8kVGWe6vg14g5cruJIKUjO2OIB6Tkz8kzixz8RWc4oRHNwJlGp0wuBoLNA==
X-OriginatorOrg: jh.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB6312.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f30892-1eff-4018-017b-08df43b000d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 07:05:31.6316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9fa4f438-b1e6-473b-803f-86f8aedf0dec
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IxiqRduK1IpHMCe4CTPoX4/YCLpf7G/I8+X6y9qJscPxrcjGeX8IJNkWljX0+7Ob
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR01MB994062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_230548_828243_3686D4EF 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.5 (/)
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
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	LOCALPART_IN_SUBJECT,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,=0A=
On my desktop the WCN7850 sometimes does not come back from S3, and when th=
at happens the kernel oopses a few seconds later while removing the device.=
 The machine is then dead (no display, no input) and needs a hard power-off=
.=0A=
Hardware: MSI PRO X870E-P WIFI (MS-7E70), BIOS 2.A40, onboard WCN7850 hw2.0=
 [17cb:1107] behind an AMD 600-series chipset PCIe switch port [1022:43f5]=
=0A=
Kernel: 7.2.11 (Arch), mem_sleep =3D deep=0A=
Firmware: WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3=0A=
To reproduce: connect to an AP, suspend, wake after 10=9630 seconds. It fai=
ls within a few attempts. Sleeps of several minutes are usually fine, and I=
 never hit it with Wi-Fi switched off.=0A=
On a bad resume the link does not come back:=0A=
pcieport 0000:0b:06.0: broken device, retraining non-functional downstream =
link at 2.5GT/s=0A=
pcieport 0000:0b:06.0: retraining failed=0A=
pcieport 0000:0b:06.0: Data Link Layer Link Active not set in 100 msec=0A=
qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22=0A=
mhi mhi0: Resuming from non M3 state (SYS ERROR)=0A=
ath12k_wifi7_pci 0000:0f:00.0: failed to set mhi state: RESUME(7)=0A=
ath12k_wifi7_pci 0000:0f:00.0: timed out while waiting for wow wakeup compl=
etion=0A=
ath12k_wifi7_pci 0000:0f:00.0: failed to wakeup from wow: -110=0A=
ACPI hotplug then removes the device and the remove path faults:=0A=
BUG: unable to handle page fault for address: ffffcd24c3b52034=0A=
Workqueue: kacpi_hotplug acpi_hotplug_work_fn=0A=
RIP: 0010:mhi_gen_tre+0x43/0x1e0 [mhi]=0A=
Call Trace:=0A=
 mhi_queue+0x7d/0x180 [mhi]=0A=
 mhi_queue_skb+0x62/0x80 [mhi]=0A=
 qcom_mhi_qrtr_send+0x68/0x120 [qrtr_mhi]=0A=
 qrtr_node_enqueue+0xcb/0x470 [qrtr]=0A=
 qrtr_sendmsg+0x18e/0x380 [qrtr]=0A=
 qmi_send_message.isra.0+0xee/0x140 [qmi_helpers]=0A=
 qmi_send_request+0x20/0x30 [qmi_helpers]=0A=
 ath12k_qmi_wlanfw_mode_send+0xac/0x170 [ath12k]=0A=
 ath12k_qmi_firmware_stop+0x1f/0x40 [ath12k]=0A=
 ath12k_core_stop+0xb8/0xe0 [ath12k]=0A=
 ath12k_core_hw_group_cleanup+0x6e/0xb0 [ath12k]=0A=
 ath12k_pci_remove+0x60/0x110 [ath12k]=0A=
 pci_device_remove+0x4a/0xb0=0A=
 device_release_driver_internal+0x19e/0x200=0A=
 pci_stop_bus_device+0x80/0xa0=0A=
 pci_stop_and_remove_bus_device+0x16/0x30=0A=
 trim_stale_devices+0x167/0x1b0=0A=
 acpiphp_check_bridge.part.0+0x166/0x1c0=0A=
 acpiphp_hotplug_notify+0x14a/0x2d0=0A=
 acpi_device_hotplug+0xa5/0x490=0A=
 acpi_hotplug_work_fn+0x1e/0x30=0A=
modprobe -r ath12k_wifi7 in the same state gives the same oops.=0A=
So there seem to be two problems: the card (or its link) not surviving a sh=
ort S3 cycle on this board, and the remove path sending a QMI request over =
an MHI channel that is already gone. I can't tell whether the first is a dr=
iver or a platform issue, but the second should not take the system down ei=
ther way.=0A=
Unloading ath12k_wifi7 before suspend and loading it again after resume avo=
ids both; no failure in 13 cycles so far, including a 15 h sleep.=0A=
The kernel is tainted by the out-of-tree nvidia module. The trace above is =
from pstore. I have the full record and dmesg from good and bad resumes, an=
d I'm happy to test patches or collect more logs.=0A=
=0A=
Thanks,=0A=
Honghui Zheng=

