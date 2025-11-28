Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8DFD116EA
	for <ath12k@archiver.kernel.org>; Fri, 28 Nov 2025 08:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SWGtZ5sfUbBapLv3gDYRLvN5vWp+DbyfnlB1MiLBcfY=; b=il/rhWOKLMXmMq
	pc4PxDof9GOHM711mDrUqzg+k2MP5RRq6KE6OjfJzr+YE6T+0zJnyd1/h259al5tJP+auAOmxOoC0
	O0ZGEvN/LkI30kODj5rEo8ku8NTZbfEkDHgQ/rz50/xc2YqZ8qaBJl2XgyUQUxwFBfWe0KIRppPtF
	XPFk7FivggMn0TxrD3dQ1wPhlekV4Qg9k4rxad3ZM3PS12JpQic4/VzJkOBTtmZ5Jc22H6DrqaDDT
	0JO/qy1hPfSrzwjBmzvOIVZ6RF75gK9a17ogriqR/nX9edusCFh1O7kJT0KXZhQGfkhZrCv7V0phy
	mvS7rhT9bNx32oUUZnew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOtRK-000000007bT-3X5G;
	Fri, 28 Nov 2025 08:02:50 +0000
Received: from mail-westeuropeazon11013066.outbound.protection.outlook.com ([52.101.72.66] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOtRH-000000007b0-3uVL
	for ath12k@lists.infradead.org;
	Fri, 28 Nov 2025 08:02:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvaceLm17k3ThQVEwH/5v8FepHLyd/LzCroe9p2c7nOdc0emNZRBI4dTAxfVJunwpOW3wMYM8C+73YStSzfJstTXdLMLwhCV1XMigaSCes54TsezuxNERFYc1sQVrmEzPYq1dExGis4lY9xhr2OqeLEyN5aaqy3rEmU/Jk+Y1D9YaUtUIyFgxrTemW0IxVD8akjvF6zSfUMUHJn5icG4Wwj+rZm4HfvbJ/hhpVhsxjPkhOHm0qoer6Xf3vGvfE7/iA5GATwx0hFfxnGv98XmRh/52lMzl5O1ccHcUxE0uI+UVjdbgD8OPHQRehIeDn4v5vRuRij2y1FNL9zBK81/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWGtZ5sfUbBapLv3gDYRLvN5vWp+DbyfnlB1MiLBcfY=;
 b=HW2WXJjmwDM1F2Oj54TMndaYuX+Tiaevqt7cI9QAd4t2VhCLonazvGio83WcY+MP+X6AP9J97+RJqtU+Bg7mGoMBV132gfYQ4EQk3dg5SZufmueZ8vLKF9LRFCYRnUlPDw0OIjtEo5c4Xsbuvo7qWsm7hamgVtJmj8KN5+qbGfbjA2rscPLCz643YIxuFIi5pNxwWLVMwDAMunFBUPZLZPUtE1/AqlYLmvtjm/5JVLzUx7SWN26SQsOfpa1iYrelLHQgAtkrQjdSByTEI5wxW6fO2m8ARtQJWB+gH/e+Ao5PcXiCJLhEgKBRN6zbGZ97/xnjPq7h7EwSp6B3krvdfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ghmt.de; dmarc=pass action=none header.from=ghmt.de; dkim=pass
 header.d=ghmt.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kiwacompany.onmicrosoft.com; s=selector2-kiwacompany-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWGtZ5sfUbBapLv3gDYRLvN5vWp+DbyfnlB1MiLBcfY=;
 b=qkUpzA2LRWIxWAhZFBl/1IUT1Q3JxUH1njxEeRS3eKq+4cR5/dZt5n5LNmXhl7O/0pgcATtb/a3NYyIORwlJ+UKjqk4PkNkvz4VbV8kaixEx21m6/zwsCvZepFcMtiYV0/R/bagd8iGRo7zGRUjo8AmO5YZTdZH0A9hurQw9w9g=
Received: from DB7P192MB0329.EURP192.PROD.OUTLOOK.COM (2603:10a6:5:c::24) by
 DU7PPF7650E380E.EURP192.PROD.OUTLOOK.COM (2603:10a6:18:3::9da) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.13; Fri, 28 Nov 2025 08:02:40 +0000
Received: from DB7P192MB0329.EURP192.PROD.OUTLOOK.COM
 ([fe80::5cf5:794e:dd30:3301]) by DB7P192MB0329.EURP192.PROD.OUTLOOK.COM
 ([fe80::5cf5:794e:dd30:3301%7]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 08:02:40 +0000
From: Frank Lindner <Frank.Lindner@ghmt.de>
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: ath12k wrong MCS rate in monitor-mode 
Thread-Topic: ath12k wrong MCS rate in monitor-mode 
Thread-Index: AdxgPBv7PQSR47V/QY+WcSRbeP6q1w==
Date: Fri, 28 Nov 2025 08:02:40 +0000
Message-ID: <DB7P192MB0329B1ACC97E5BCDFE1C37A5EBDCA@DB7P192MB0329.EURP192.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_55e46f04-1151-4928-a464-2b4d83efefbb_ActionId=936a0b4b-8ad5-43dd-8d4a-4e41d441fb11;MSIP_Label_55e46f04-1151-4928-a464-2b4d83efefbb_ContentBits=0;MSIP_Label_55e46f04-1151-4928-a464-2b4d83efefbb_Enabled=true;MSIP_Label_55e46f04-1151-4928-a464-2b4d83efefbb_Method=Standard;MSIP_Label_55e46f04-1151-4928-a464-2b4d83efefbb_Name=General
 Information;MSIP_Label_55e46f04-1151-4928-a464-2b4d83efefbb_SetDate=2025-11-28T07:51:40Z;MSIP_Label_55e46f04-1151-4928-a464-2b4d83efefbb_SiteId=52d58be5-69b4-421b-836e-b92dbe0b067d;MSIP_Label_55e46f04-1151-4928-a464-2b4d83efefbb_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ghmt.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7P192MB0329:EE_|DU7PPF7650E380E:EE_
x-ms-office365-filtering-correlation-id: cafe0180-5ff4-4596-943b-08de2e5480ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?a5X6kMM8brmjxaAX3ZngBmxrinZamsoTBgUYyR3evM+e/suVnJOYNNqz2brw?=
 =?us-ascii?Q?JlIfpCQv5HvdVAfA6yEYSobR6qUM9vm33c3OQTtJrTMqoEPjlAfKwlH4fPym?=
 =?us-ascii?Q?AIEsoJGzAEwaAYBxZX2oEMAal5kqhfhr/EPlnvG2hKnl6zMlZAYly/yOi1IN?=
 =?us-ascii?Q?vGlyS2HkSx3pFIsVh/429ur8MaOsAtnibNecYyYupgMwPJKe/Clkq3nYjuXS?=
 =?us-ascii?Q?pTLsAtcgOWRRtPs0Jxk9lDH9onFL7LLOGDvoAWpGqJ9cmpnYZ6ibuQiOjUiO?=
 =?us-ascii?Q?A8cXlF+qSgZueUNv3o4pR20fG2eEwifylLOA0X5ucdJzAik9RBriybofEXna?=
 =?us-ascii?Q?zbLsF1EcduUV1rite1V3tSJHdhMrvYdDz+RxexXlajSRMbbsrRWr0x6IJV+9?=
 =?us-ascii?Q?GTIKqHPITtGlp4ZDuKcJL4rZ6fDJHtBFrEx5YEPrt/RJHuc9/MhiXKiRcQkw?=
 =?us-ascii?Q?SvR3E+a40rzHYvEHlsDxUJy9WhA8wkYYpjL2h2OpjctsLN5ZLge4N6xSwegk?=
 =?us-ascii?Q?IJ68KNwydqq1GUiNbyaRLk0clWOD3kBIXbTr5DyaCLXhD6PDn9A/UM1INcui?=
 =?us-ascii?Q?CNJo4bYv5AznvacTFjLB9PkLeKSjvHJzfoZGT+GILvwpEvZQZghODBrmex0d?=
 =?us-ascii?Q?qkpmgYJ6rFI1MDZYgv2JtoE7WlfzN072qd4CVuLjpKpSv4iHEo+hRwjRAPLc?=
 =?us-ascii?Q?DYLEC7iDqCM3bNn/WNSUItjptiMp6OX2ne3oWdrSiXxA4zM1uFtz0jKv/lzy?=
 =?us-ascii?Q?DBC0//AnAPCZmMNgaTUf+D9nuyo/N8d0Srse69RwxNe6Mkpjq+e9+u816zUx?=
 =?us-ascii?Q?CWdeTYUlvk1nt/bVBaxOiO3LbQVLG5SfussGNUEzvffA0NWPiHgrXqYJlKE+?=
 =?us-ascii?Q?IHcfrv7Vf6ICxJnahCKDui9H0z9OE0NaaYtnx7ZRYv3yQsfu2t4dDwFRNJ4y?=
 =?us-ascii?Q?qs/XsO+ctrU8wnpPy0QsPnD02eHwYJcnm4jl2W65qpaQmC5j8z6D51adZKRk?=
 =?us-ascii?Q?n7pDNnKUx3FxCloL26romrBTk5EjFGSvIPz0nXI+/LGnpBh76KSk2g/G+Th1?=
 =?us-ascii?Q?lc62tikayt4QpVUM0+d/+aEm/JNwQBdyYgREyAEtRUgjwsMJCYGRRq43PS8O?=
 =?us-ascii?Q?hYUvA5qnRKlnHt0SQjFkD97B+Vv6YoDR4Pc2K6Jr3gy6sgeF9j6FmTGh7vHC?=
 =?us-ascii?Q?Jd51klW/b9tmN+Ig3OGff0+tiZH2lDeazFxBI7UEx4s6Yc5X0vJ74utG3AyL?=
 =?us-ascii?Q?b2rvZCZeAdPML7UBGRdJnRkGTsAkWAYaL5x8S3OLoaxg2jVdq6Rjxh4Bh6SR?=
 =?us-ascii?Q?c9J+NUPImRcFW+gF///GQJ11KcLr4JpsnTWoBrSRZup7uG2O6p2eAo48Cou1?=
 =?us-ascii?Q?T4ZdP0wM9q8ZnlHlyAd9/mVLAqOnMecr+xHbGj86Rk6q0NTgXY1xDnRISHW5?=
 =?us-ascii?Q?kL7dO8X9o83sPtfMpPZ7936vbKJ3/6qRHJ0oUPeZAEnj+A3xIx1XE3Bt9I+z?=
 =?us-ascii?Q?XDHL5Q5l7PmfMx9nLHtzJYeuPHjIzNkz0xDG?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7P192MB0329.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?08bUpaT7ZztLI5Z30GbHfuS5as+bdGg1hif3SYfTRIHRhooAyjN7BqU6vUQ7?=
 =?us-ascii?Q?jA0MHhmaW2ajQDeQ/hRugu4zyRvNn69gjpK0XHtqP+j711VC1b2hmPPjxrjI?=
 =?us-ascii?Q?wUlCVL+cXqwlBPJAJpKuN/Y8B8khxNhRqa4hEtyzFmHEAfVZPpJh+78UsXkW?=
 =?us-ascii?Q?Ysjx1NfQrAzTJfe9BWQj71xxFZPVuC3VUVtAymOOwzgbc0IIbCCtKCO7htac?=
 =?us-ascii?Q?Ai1nB3pjhoAF6FnfIM1Z6aVAvRscHKY5H7Uxi0NR6vlH8iA9OT+Xybz3m/Og?=
 =?us-ascii?Q?S/B3klB6Ff5Eq/UDhnYKizroi8B/ICTbE0Au7CR4a9icvaHZaWPtDgVPDgKm?=
 =?us-ascii?Q?eEtovaYNWc0xRITTDIXBlO3WfDpFXka9vQoAO7REnN30MhI055W+LMDZi+e1?=
 =?us-ascii?Q?/fcssJ+cxsN9MidDv4xX2RWMLxBFidAilPuBG+exVmpkkAqAT3en+7QFa8Im?=
 =?us-ascii?Q?kZbYiyMxVy5NvlyHsL5KhFgnkoIpG8hx0KhKY0VYG/ZtguNuiB9uTNwKvJbx?=
 =?us-ascii?Q?t26e/vV4/AktL+lFTSKCmy9JMivbIh8+S63OgJyKnvMVYMk+tR7PJ4pYrOUF?=
 =?us-ascii?Q?VlKdSdQ6FJX+Hs8UZ8wiQ+or3e9kDSLN0Ammygjt/cNDrjaOgkI6q1saHW5/?=
 =?us-ascii?Q?lnsVvw85WhkfMehwNjPWYoivuwfafJQXtexeL3+asjsA6OFvV9b83dHwAmts?=
 =?us-ascii?Q?DgAWWgv+EMy5wN5PUK18pLEFHEssAuU9s9x7h4/osA4SC5dMIZkfkoJylBzk?=
 =?us-ascii?Q?NB8+YKD+dgVhWqA4GrGConUDLTwadhvbrjcIBD/KtnaupkdfyhTuf5ntGuBi?=
 =?us-ascii?Q?FpzGyWj23U9X5kZdgjciNMvUSoSQJg1IA3eTG8E64fgHYrl56Lge3Dp3WtX8?=
 =?us-ascii?Q?Z4L2cOwLVS4N+t1eyZOUxxXl4+CEc3sWKFP9rEHpKGKsj9+EWWh+1xJNFgVk?=
 =?us-ascii?Q?q8C+eDTranXgAfctVUH4QAmt5FzG3lMt3ADlN/qxe5uASFQvJUOc2eGXLB+o?=
 =?us-ascii?Q?fi3iGz8ZyR3f+jiJeBaXpGgqZtKY/Pwx5RbP+tidvyMhswVcSxh3eWzUxrX5?=
 =?us-ascii?Q?I/N4sVmp5cKGMCPcAHFy50NJYNtRfyCztGW1x7arXUK4fgTfI+bqTxTltvJY?=
 =?us-ascii?Q?Eite10j8vlbcziLbhvEiPjToGrbcQbyu3RlzVBy8czfd825t+TdYwV8MiAw8?=
 =?us-ascii?Q?RNO89da+O4s9jw0rcXDpowMM0BQL+5Du0YiTUOYzZzCCB29NxDABuVoR+qKc?=
 =?us-ascii?Q?84JrqK/q6TBjP9Chb0u9decicnltMg8VvbhsA5pp8TRUJ9SjAwDT2wuuEatB?=
 =?us-ascii?Q?/jONfuplY7VIOX/TCKTbe4XCrtRac8iaEsSUgbUmLWBl8hy3E9LVf+j+59Ox?=
 =?us-ascii?Q?E+4qifkK6XueSKyz2li7IDqa9GBhwG/CYyV80LF5nbSOfG1RRcVCKhwnBmJ4?=
 =?us-ascii?Q?8OcDTAfCrXHIBGGrb2pZm4M1Eho5eQrOI1U8puL7+MjSuVmAdfjJT173W2Nx?=
 =?us-ascii?Q?a9vrPFb3mQrxTxTG9KXhkOyz2iHzXDemmWXgjk6QndIZJqEzG3PDIq46uSF1?=
 =?us-ascii?Q?atTN5R5zdqCLVJ7eF+9RrTSjbzbqjceGsdKD5Xyb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ghmt.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7P192MB0329.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cafe0180-5ff4-4596-943b-08de2e5480ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 08:02:40.8112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 52d58be5-69b4-421b-836e-b92dbe0b067d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rKkk5OiiTc8U+GubjjPxZNFjzQX6zgDacDoP743hgDw1zqtzVWSL+iwoRRKc8rjzDsDGrTGG/DSy5vQPFpcPrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF7650E380E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_000247_981829_5D8F098F 
X-CRM114-Status: UNSURE (   5.45  )
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

Hi,

I am using ath12k devices, QCN9274 from Compex.
In monitor-mode, all captured data-frames are saved with MCS3.=20
A parallel capture of ath10k device shows MCS7 or 15.=20
The captured data is a wifi4 or wifi5 traffic.=20

Is there a fix available or is this firmware?=20

Ubuntu 24.04
Kernel 6.16.9-061609-generic

modinfo ath12k
filename:       /lib/modules/6.16.9-061609-generic/kernel/drivers/net/wirel=
ess/ath/ath12k/ath12k.ko.zst
license:        Dual BSD/GPL
description:    Driver support for Qualcomm Technologies 802.11be WLAN devi=
ces
srcversion:     555B1DBC205393C0C841332
alias:          of:N*T*Cqcom,ipq5332-wifiC*
alias:          of:N*T*Cqcom,ipq5332-wifi
alias:          pci:v000017CBd00001107sv*sd*bc*sc*i*
alias:          pci:v000017CBd00001109sv*sd*bc*sc*i*
depends:        mac80211,cfg80211,qmi_helpers,mhi,qcom-scm
intree:         Y
name:           ath12k
retpoline:      Y
vermagic:       6.16.9-061609-generic SMP preempt mod_unload modversions
sig_id:         PKCS#7
signer:         Build time autogenerated kernel key
sig_key:        5F:BC:19:FA:0D:D1:EC:87:49:67:38:43:F0:7C:3F:CA:9C:FE:51:03
sig_hashalgo:   sha512
signature:      6A:FF:EF:E1:BE:C6:46:C3:73:B3:15:B1:4A:B0:FB:9F:46:9F:BA:99=
:
                83:11:47:2B:7E:8F:88:36:B9:0B:BD:B9:6F:E1:53:6E:9C:BE:B5:AA=
:
                E0:FD:FA:98:62:DE:92:D1:7C:76:3E:FA:89:E0:7F:06:02:E4:F3:5F=
:
                D8:D7:85:17:D2:42:D8:21:45:7A:5E:C0:7A:FB:8C:38:14:44:32:9F=
:
                D9:C3:D2:1B:B1:60:9E:50:32:2A:B3:DA:36:C6:E4:06:29:D4:F2:58=
:
                0D:5D:98:08:A6:F6:D6:98:31:C9:AA:41:2A:80:7E:6B:46:0E:91:21=
:
                31:7C:2F:8E:77:78:02:72:72:17:61:17:46:F2:7E:D5:79:EC:5C:AA=
:
                29:04:51:83:75:A6:3F:66:6D:5D:4B:79:0F:CC:94:DF:F3:C1:94:CF=
:
                BE:A2:A4:5D:D2:C7:ED:68:3A:76:50:D4:BC:EF:17:02:AA:94:A4:DC=
:
                09:98:5F:5D:D0:60:55:64:F4:16:CC:B6:7B:18:DF:7F:8B:29:84:36=
:
                E6:88:5F:1F:DE:4D:40:EF:FE:A4:C1:C7:D5:EF:3C:59:BF:BF:47:70=
:
                03:DD:74:26:9F:03:7C:37:05:5A:DC:15:02:FF:40:E4:FE:E7:73:B0=
:
                DC:2A:EB:E1:43:2C:77:AC:53:BD:B7:80:C4:C7:E6:96:EB:A4:AD:FE=
:
                DF:25:DB:23:57:F0:3D:17:6B:7F:16:4C:4C:B7:1A:7A:EE:60:B0:B4=
:
                54:E6:C4:EC:EF:8C:0C:88:7E:6D:3D:D5:75:A5:6A:5D:AD:E6:53:6A=
:
                AE:5C:0B:DC:9A:24:1E:43:B4:15:1A:55:86:7C:0B:77:E6:1D:25:DD=
:
                37:E3:A9:81:D1:C5:0A:39:71:30:D1:05:3D:B9:75:66:33:9C:48:02=
:
                CD:B2:A1:8C:2C:64:4D:43:DC:AA:90:63:A6:D1:C6:24:28:8E:65:2F=
:
                5E:48:98:A0:05:2D:A3:3C:CE:48:E0:26:C3:E2:86:BC:37:2D:C2:70=
:
                BE:FF:56:50:94:92:48:AA:82:B0:C5:36:EF:9B:79:4E:2B:06:54:22=
:
                37:B6:F4:D8:48:21:41:33:83:89:E1:D5:FE:8F:78:EF:B7:65:48:3D=
:
                14:75:EB:82:96:FD:D0:FD:29:4D:5C:96:B1:1B:F4:E7:40:CA:FC:18=
:
                F5:39:89:7A:EC:76:E0:DC:84:3C:3A:C2:A7:CD:97:9B:2D:59:A5:67=
:
                A6:4A:F0:F5:B5:B9:C9:E9:AD:23:0B:36:22:62:E2:14:A6:3D:98:C1=
:
                A2:D6:DD:D9:43:05:5F:85:CE:36:D1:9E:20:94:47:24:E3:0D:51:D8=
:
                C2:55:11:CF:DC:B4:36:54:A4:60:71:91
parm:           debug_mask:Debugging mask (uint)
parm:           ftm_mode:Boots up in factory test mode (bool)

Thanks
BR
Frank



