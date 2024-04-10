Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36D2CD128A
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVtGj6uek4wBP5MIdtb/3brPGTGdUFqO1ZoBx7255Q8=; b=mjP0+7yWAGPFF29UeHpoUdmHRm
	f4bOHP6Z7R5Dztt/BgmvT2tIXX6Egh8V9ofVh96US17l+16755xjVCrJpbBhP13V6cRwYmYJg0AkC
	IEyY9Ca9kZwprLZJZRj3N6fTVfMpcO6m4WJXPTJFCbpodlmZMbPAjvE0nkViVOal9kLT1Aa0RPn0L
	wZf36u/tOqLycLiVzDtCHnjjhTw0OGLduvM5F4MiAk6QAU+rffEeS5/zCb4lL4q/aiUPtTFoY4QTp
	quivfU+Syw+m3hhEXDrwLG14uXloNF2La5gaU+of+gS1xez2IsYZJJcD1j7thZ7hh4VOhwaMAsR5I
	0C6PvMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZJO-00000007bXE-1ZNV
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 14:52:30 +0000
Received: from mail-lo4gbr01on20701.outbound.protection.outlook.com ([2a01:111:f403:261a::701] helo=GBR01-LO4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZJK-00000007bRb-1hO2
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 14:52:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIj7PeGw46kFyBDjfFF6fQ6wYdl9FL2qgsLi1cnPeU1gdrJxwW77+u+GSA7Im7Qt9e9fgoWH6zW0//hozytKsxBbKxdTb/ej56SgA8nm5xzRFjvrKk6aogQ1vMR+T/4zTxJZ/vI9ScD7OxdGmJUTTwtlmsQDjVYU9Ia2v4QaqUvMNKXwUc3OG9g2ReHtYng30rKOxn5w2kb6sKF0OzSnFLv85TrbchRgS0787ZMkD7XRirGG8zcLSOk0vAEWUoq+YQBfLNT7lnUPE6p1ANoha8SaseBGivEMhMcoQaLbXtEcT/cEWTKla0MN/kpGKoM8urH+r4julaTGfaaQPP0D7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVtGj6uek4wBP5MIdtb/3brPGTGdUFqO1ZoBx7255Q8=;
 b=PZp6t2EoJdQGAhelM5zmgF9+h/kruNtKSgsYnYHGJwmahKU6TqEvbGkMJnV+IescCPtHSOQQNljP7R+K5ICDGprHhbceJu5Mkr70JPY1FNdPfKvULzDrBcMjUUx7+JdKwi88Z+mkGwbuvjdK35QkwvzVuU+jCgThOcba1AZGApgne/5FNuQEA5wh59d9TweJJUacxLVoDZ+N1VTRExm0xY6mohNcAef3hfxj6WVTOcn/2p/p7lGjVESrlAL1Ce8w9c45IPH5ozWWmH0aGEfDonLEulSpXnwqkJQlj7Tv/HBSshPHz6zlSqlOWETJU0+XtOTePjYTududb07JyJ+52g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by LO2P123MB3725.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:128::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 14:52:18 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::2ce5:9af6:5c25:92c9]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::2ce5:9af6:5c25:92c9%3]) with mapi id 15.20.7409.042; Wed, 10 Apr 2024
 14:52:18 +0000
From: david Atkins <david@3adesign.co.uk>
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: QCN9274 - x64 - AMD or Intel
Thread-Topic: QCN9274 - x64 - AMD or Intel
Thread-Index: AdqJgm7oK+VC6oatRu6N2BZpo//o1QB09+tw
Date: Wed, 10 Apr 2024 14:52:18 +0000
Message-ID: <LO0P123MB40575CCD8D6A3AB863596DE2D6062@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <LO0P123MB4057B28CB310E5A1CEEF92F0D6002@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
In-Reply-To: <LO0P123MB4057B28CB310E5A1CEEF92F0D6002@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|LO2P123MB3725:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +R9EL2UBSeHr74j4LSA67zV+5mo/WXzhorOleWbanB8eQg2pscMzteLdjlEcJ08hqqN27UH9gNQM0VdlxVGlQhFimoh+1nJpBo3OhRmBgY7lhNaZIjcIBetiCrfScMLf991WxYou3sa3AmY2HIHdjPNiFYge2uhyWhFkmrOxx5SceqtCPjgPV0sYCuR+2LqDi2BLbIatHwhmnBd9LFSH8W4aIHVW+7h1Bc7d6euDmjdkbEmS1RuVx9OFRWrQXJuQXVpQJV/40nlth5BvUfKGtQ5MHjvPDvbcOXSzuPpPdmo0mEk43WAxzg2u9I3pvscBTKqN2vOTyRybFePuxKZuREVkiFB1f+4HzM1YstdjbDo/AsDli6xU2mdn/h880480skBDvz6JuJFbWJCZ20SsUrtalair78z4QhlkwtCyT7VG3WHngMUGiAvyhz+++PgU0JQaZ+lSwOa2zkt4UcmBc0nbePGUzLFZVyI/SRo+E1Mt7EpRBLis5dERJFUrfnOg7m01E7BRs5Hw3CYHJYiuTE0ua7SjeCcmLJr8shBf1VYepRyDTTll23udP6M6hEniAIVKB6wYQnMfsSqOvJ8ejweMkMQVH0ioBaCjm4J8bKzYW+wEwrYunDswfYcJ9UH0qEBeMKcxU0wQhiXDakelnHEtWaLwWUaNLM0hjDqtP80=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Wz5gwrC+dA2jc28RfQp9cMRblHkojmoAu6vL5ZC/Y4/0gU6ABgc96Bada6?=
 =?iso-8859-1?Q?tHNnEOdXAgMLUpKCPDhK3fs3T7n9wmc08s/e2DuK1IYW27cWnpNojORQJz?=
 =?iso-8859-1?Q?viaL1FFlNiKxV4UxIO1vHPMgSBazjGFYxDDGG5ZIskfB0RNwgHiT2x3FIp?=
 =?iso-8859-1?Q?jO9TeXpNmbA/Mnjm9vOtK6x+ngsCuZcf7WSVX7znNrRihjtG8R/lAx6avU?=
 =?iso-8859-1?Q?bFpexaHzj1dvvkEBsZiTEbf6pqfaXS9X+ih9w8cTWztccVNtcJ9mkfOBkb?=
 =?iso-8859-1?Q?In1c1SYvtOHq+pFVKHFnCDYqMPLAQrglnnxqvZXFNGFwtXwfceGE75wMtc?=
 =?iso-8859-1?Q?VltaeMr5sTywF8eJ278j1PvSihc4txhuyF47RDLTW4HNouACIdyb72ax8K?=
 =?iso-8859-1?Q?/T8C4WAD9+6/9EqFnBuamUChePDTZNjpHpbQqeexCKy3zVdJ4N4h1KPNrj?=
 =?iso-8859-1?Q?nklvTONxbZrE+ijJo1zxuj47/UTjrMhOsUdEEObWYylFsztXjhi9e5fFf9?=
 =?iso-8859-1?Q?zJAwmgEhozfXxH4znQ7VxY+13LP6G6d0JjYRVHwicEBd2dEQTmX24pJYty?=
 =?iso-8859-1?Q?EEa+0AoO3Y7IdKWRBee+J6RaYmWRgiX0Y4738K0kPFWf601GMUx0xPYNft?=
 =?iso-8859-1?Q?/s8f3jcqrFQUCk1wKdjdQ99ETgA0EHsjgsMJHBY9+U7Wky5soYHosoEhdf?=
 =?iso-8859-1?Q?Imx0h/ClRsQ3jhF7whBxqCL/n95SIS/n37FJTJ0sV6unbmuSdVQ7lCq6Sk?=
 =?iso-8859-1?Q?xMxwKRjCGyp7gCCurPmLpzemaDTju82E46gac5WM2Csz4NLRcL99XEs97f?=
 =?iso-8859-1?Q?xM1i0UhlGwZF5/n/CloOhaojmDLzqmshJTErTIQm1TZl9C8CurQXDtwfAW?=
 =?iso-8859-1?Q?jTleAsOHtPjulOrxNPkstvD4bSg3HE7fDebq/PsA47IESg618tPPdgbpfm?=
 =?iso-8859-1?Q?z1sp72CcCogu/euL/bg+3A31vhUwhnYl8V2ymmdR18avAmlm8rMo3eRFfb?=
 =?iso-8859-1?Q?ht4j5uxmJ8zc4XBuVUgsS+C/gJTum1ra187Uf5EQnJEVEMKCCLn2gsLv0O?=
 =?iso-8859-1?Q?8zIjmMO6z3aks8Jp4AC9AHqlcijTCYGoOnXOOYBms+LKGHdfqwRKzNkLoE?=
 =?iso-8859-1?Q?Dvb5x9DIU+JdHS561ggOcDYxsZiONTYNTPHYymfgTDCDIs/CB7BXZWvV7i?=
 =?iso-8859-1?Q?gefRdbp1OUj4d6vI3ic+y5suCI8hwihkwmWAFRkgHtPTvU7ZcfsZNMkT8c?=
 =?iso-8859-1?Q?2zPA2HBIZd7YInb47exVfD3NgBTLsZZmfN/0RJnhDl8ovwobgljq1FieeJ?=
 =?iso-8859-1?Q?/28ILm8vBPXDi5TgQoBGK1f9dwc5SLL/U17wTwBSIeAlbiumCatHe1ebx3?=
 =?iso-8859-1?Q?qa3QmNhZE1i8gdAhvAgGMYscTXB3DtIXLYXOQ7+514ACo0GeGhhRjxDBQv?=
 =?iso-8859-1?Q?sbDAru/iMBNFsx6x1+K4ABFjGCwreOCLPr3BHU7snlIoMYC0UgQkdCizjM?=
 =?iso-8859-1?Q?OFxjRyejToy2FYn1Iqc4T2Xe+eA5UD9B73dJOQDbFSB6WHvJqWoz9FxGKL?=
 =?iso-8859-1?Q?VNoZICwuDJBCcdTR12XFVbqgvTGrmI6/Y0vQJN7nbrSb0kp81NFBsLTfbj?=
 =?iso-8859-1?Q?RAU+Q9vQuAn+k+kwKqHPwwli7KUr5iH1fz?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d886a0c-9fd8-4861-e137-08dc596dd18e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 14:52:18.1513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5XOnQAskHGgYvyxf0jizACVs6ann7n2aKNq4Kod52E9Dy4SWhQDMHaUGjhmjqALmMrJpPWNPpD7L42lmw+ot8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB3725
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_075226_499346_F9E003BF 
X-CRM114-Status: UNSURE (   7.46  )
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


I just built the ath-next branch for my AMD Ryzen 3 4300U system with an 8d=
evices QCN9274 module, it appears to have a new message=20

memory type 10 not supported

in the dmesg logs

[=A0=A0=A0 2.705656] ath12k_pci 0000:03:00.0: BAR 0 [mem 0xfe200000-0xfe3ff=
fff 64bit]: assigned
[=A0=A0=A0 2.705672] ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002=
)
[=A0=A0=A0 2.705885] ath12k_pci 0000:03:00.0: MSI vectors: 16
[=A0=A0=A0 2.705889] ath12k_pci 0000:03:00.0: Hardware name: qcn9274 hw2.0
[=A0=A0=A0 3.405328] ath12k_pci 0000:03:00.0: memory type 10 not supported
[=A0=A0=A0 3.410796] ath12k_pci 0000:03:00.0: chip_id 0x0 chip_family 0xb b=
oard_id 0xc soc_id 0x401a2200
[=A0=A0=A0 3.410804] ath12k_pci 0000:03:00.0: fw_version 0x1011001d fw_buil=
d_timestamp 2022-12-02 01:16 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.WBE=
.1.0.1-00029-QCAHKSWPL_SILICONZ-1
[=A0=A0=A0 3.431347] ath12k_pci 0000:03:00.0: failed to fetch board data fo=
r bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D12 from ath12k/QCN9274/hw2.0/boa=
rd-2.bin
[=A0=A0=A0 3.431375] ath12k_pci 0000:03:00.0: failed to fetch board.bin fro=
m QCN9274/hw2.0
[=A0=A0=A0 3.431386] ath12k_pci 0000:03:00.0: qmi failed to load bdf:
[=A0=A0=A0 3.431387] ath12k_pci 0000:03:00.0: qmi failed to load board data=
 file:-2

I'll try on my other test bed systems, but is it expected that this will ge=
t further than this ?

System uname -a

Linux openwrt-wifi-test 6.9.0-rc1+ #3 SMP PREEMPT_DYNAMIC Mon Apr=A0 8 07:4=
7:14 BST 2024 x86_64 x86_64 x86_64 GNU/Linux

David


David Atkins


