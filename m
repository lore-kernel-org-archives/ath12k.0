Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052A2EB64D7
	for <ath12k@archiver.kernel.org>; Wed, 21 Jun 2023 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4Eh6MSD5sQz4f7aCdFZfHfok14o9unZydMRtww6kM8=; b=I39BpG9/YEMX2f
	g5OowzMG61954CoDbUf8iqTKzLkjgYtj8dBrtRxYa7yKTdg5VKvRdgyqLPgAP9BgIbZrQ/DMEy9vI
	Xr612nGlZukYcLbKjDCKJwVggXqoAs0Y50cCX+kB3wnYLkdc4bF2Ye92vBLvoQVLnH5cG/nGMhvfY
	MAeKRBhHVGL1CFv8xVYAZTgdLjUba2cP/JZH3mIx4Ame0U2KsdTYSVeVzJJYIA0Hm5Nkkn9g6avv2
	Ty/+BTb96a8jYgTVVLiYMnFdv0ZhzsYqbH51iCVOxwYWRm+HidVjNg0mFGx3RjgnldOmlHft0T/2E
	2OCMIDgwl1iITTs0BdRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBz7i-00Eqty-1k
	for ath12k@archiver.kernel.org;
	Wed, 21 Jun 2023 14:47:54 +0000
Received: from mail-bn1nam02on20709.outbound.protection.outlook.com ([2a01:111:f400:7eb2::709] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBz7g-00Eqso-07
	for ath12k@lists.infradead.org;
	Wed, 21 Jun 2023 14:47:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqMwgfVecBxa4iSz751oOEqyDE2ktDPaLb7JyReVYkZy2zR41wgpptc6Oq72nowObyhEG8iAEU29biYho2Ckpe8xY+BfsJbPNjdw5Hfmb7WgxldM1PzeqGQp4nuWIBqAVJmVt0oBzNoo1fYHVnCCMNC3XlFnZbE2hMJKMtzfLcPax+rQgZONE7riQZzl6f6flf2UKQyqZMqfwNViyPAWycIJMF9seWzv1tfw0VrlNIrMEw3vAIadOS3ApsnybeTcq4oI57I8z/PjEkJx/vVFFFdxn+fikWBNkgafpRyBlFQ8fI6IwY/gu7fRMui+RJh/L4jDXrSpKIoFUHPWlu1Byw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYRsYvQQAcwl8l4e2oqtGhwwKM50VJTc4FdQiWhzSJM=;
 b=l1Q31W0p2QnyPoZjo9cB+KFGlGKXIF4OiDnJnnGyEIylcpDL2wYcrZZXCzJrnWMQoU5DSnMLPR8b4894sboTQHEfXgDAGjh8G2VEkYRjbKtmokIsfpaqCon6ay7U6fTr1jTsF/XDf+wXhwroRVlQYMIdWSFlBY12ho+x3Fcx2uYgZqracWB7wO+RpiAXMKBrQ827cavI03AsyDZdmESoOcFuJRifGxqCWNb9/rcTiLS6sOd+dGM2M7uDVhn8DEGNxxRqZqI7HBn7vB/xCWwe+0XpgNoZzcOWmmihamXRwCLKdMspYphZ6ziAsAxTNVZ1m3oHBXh9xp4Ov2NOxvY0Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYRsYvQQAcwl8l4e2oqtGhwwKM50VJTc4FdQiWhzSJM=;
 b=anhVUnG1Sew8WSkGDdNlLXrdTO/yX8mU3esTgi89htLdvWEesaW6n35fZ5YAeJCmL/B3zWkqsci8GIbWAxuogEEUIlJm/OrIYcIwlBJFDzAemUKo/piMtLLwwjPqi8JfyDgaNbWa67TBtRIv2AGUclkotzZVutHicr6Q+m9EPXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CH2PR13MB4475.namprd13.prod.outlook.com (2603:10b6:610:62::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 14:47:45 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e%5]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 14:47:45 +0000
Date: Wed, 21 Jun 2023 16:47:36 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dean Luick <dean.luick@cornelisnetworks.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 09/10] wifi: ath12k: Use RMW accessors for changing
 LNKCTL
Message-ID: <ZJMNiEw0IekR684V@corigine.com>
References: <20230620134624.99688-1-ilpo.jarvinen@linux.intel.com>
 <20230620134624.99688-10-ilpo.jarvinen@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20230620134624.99688-10-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: AM0PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::20) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CH2PR13MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: cc3833a3-cc70-45c9-bf1f-08db72667975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yi+yv7jcOl8V2Z5m4yhgZNNaj3gn2zJ72wLHXYUuZMvKvz+1gXMknJIjV7GapdFUBQWFhl3ckLHDi4uKMglEJvl33pxosGovhNjvoSo8D79wVLsl6CUtGdjY+w78vck0NuHlMzoJpyjhilDADJwY21zdWUh/B0dorgnt+XB8VWONkaK21YlgUjEualEmYxqyokYeN8od7F3OneDujZdr9DA3UAs32toN+B1u4fV5hn9QMiFW2+wtGzMg3V/1wu/ddpJaA193F3qltn4YZXE5J6mahKBlfEIyDrw77PFaJli5LeFKQ4X1uT1qZeX2JW8heWBeHn8z8ThyrKULRf/R4q56AwmdFn7UQe39s/gN/+ltoTO0clZlalvxY9vp+0PwMKLettTyaRKOAe6K2X7TL8+3rKseNI1yrwqjm83Cby1TbqDTGZW5VPKHlMRQXwrER28KvYLA4Nb0nS66Pa5nfWd2omO0is15qiHS2oyLnwbEvPviF+EVw2HHHhckgUXTkvtwy8Dpj9Gd9G9fHVsbRhgLj76A3FBELZlAmixe/B+M2VWNEWzzHNf69wg9eySjHXPJBtLxU/9FyhI9KlSwMDb+TMRTM8EhNzFJEkeBJeY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(346002)(39830400003)(376002)(451199021)(478600001)(6666004)(4326008)(54906003)(6506007)(186003)(6486002)(6512007)(4744005)(2906002)(8676002)(8936002)(41300700001)(316002)(66946007)(6916009)(66556008)(66476007)(7416002)(5660300002)(44832011)(38100700002)(86362001)(36756003)(66574015)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUE5cmZ1cHg0WDV3M2ZGWFl0M2pEdjZWZmhpTjVHT3hNV0hSMVl1ZFRLUlBr?=
 =?utf-8?B?bEZQeDJ3dml6YkRURy9HbFpKSGt4Z3NCdHRBWXFaeW5oQ042NzVjQmtkZWhY?=
 =?utf-8?B?bHlpd1VNU0NNTURHTXZLcnJYUElEaHpTdnp0T2dHWGRQa0YvayswVStGQjIx?=
 =?utf-8?B?RHRka0NFVmsxWnU0OWw2aXMrTlFLeFB5dUNlaG9xNVlZWnB4blR3Z2NWUTdP?=
 =?utf-8?B?ZnhKbzdSV3RCc21NdU9ORVp2aUpWblY0aFRybkR3b1VWZUxjSTJzcVVUVlkr?=
 =?utf-8?B?eTVxK2Y0K1V6OEhpUUFPblBVQ09NUzVyc0FtMlBCTEZ4TFVGSHVua240ZjFU?=
 =?utf-8?B?WnM2SWxhaWcwZXZST0poSjNYaloreEY3MVpXcHJRYlVHYnZVSDB0dms0d2VC?=
 =?utf-8?B?M0p6ZTBaUUJMeXc1SVBFSlc3SVYvUzMzM012MzUya1k3NDFTVktGR3ViMDhi?=
 =?utf-8?B?L21VZngzTDY2L3VlK29sZUU3dGh1eVlseEphNDhlK2RsY0FQVng3ZExVWlgz?=
 =?utf-8?B?TmhRZzE3ZTdyZFY5MHBRcmlVSm9jeUh0TU5xSTgyTFR6d3Fsa0tleFpERm9M?=
 =?utf-8?B?Z1BxV0pmWk1hWk1tRXBrcVo2cHN1d2MzT01CeTE4SEZFbDRPT0kvTkdhNUtX?=
 =?utf-8?B?dHJVQktyblJpRmYwL2RYbkN4VVorRy82cWlXVkNXOFJIbDNvbGZQcHpDTjZ3?=
 =?utf-8?B?Y09Lam5WL3RDR1JXRnd1blVzRzJYTFcxQnU5cWhqZzJZdVFCVmVtNHBkazBv?=
 =?utf-8?B?aXdrUVZIZ1N6UzZIRXRhUVNMY2J3MHdHVDFybHlyYmUxV09EalJ6S3hsWjRu?=
 =?utf-8?B?VGJZV1pFL2ZnZFlPMWVVY0x0MzRZT3p5M1M2aTlJa0x1bWM1RGdZYWFEUGhL?=
 =?utf-8?B?ZzVray8ycEcybitXajZCWVZCODBKT0doTUVWK2FUMXEzbzZYM3hlK1pxUGdJ?=
 =?utf-8?B?NHlXMGxqN3VLNXpVVCs3a0hxaFFXaVBuOS9pbXhLdnp3WmFETjRXVTU3eks5?=
 =?utf-8?B?eGRVbVVlVnRKL0dFb1NDTTJXd2tyb3Mrenptck4rWDMvanN2bjc4c1VxZkIz?=
 =?utf-8?B?azUzRlgrRFJvYThjazhHZGt4UHg2SzFnR2hVTytXZTBjVmFOQk9tS0x2QnBw?=
 =?utf-8?B?WUEySkt0bVNTa0xmRFcwaDc2d09xa0JwbDZ0d0c4Nk03Tkpuam4rKzdrTmVY?=
 =?utf-8?B?RFdWUXlPamgrME9LOU1iaUxYbEpLY052MUt6eFBtck9UYW82aktJQk1NL01P?=
 =?utf-8?B?UnhTUGdJQnpFTnZIUUZ5NnVpejZ3YTVDWG9GVkVscW96MDcwTmoyQnNad1RD?=
 =?utf-8?B?MW1HNUhZZlZZLzdUTkNlcDV3RFFtQ0ltaFBFWFFCQnE5SGtZa0hLS2xtS0V4?=
 =?utf-8?B?T0xCNHQ2N29zSS8xQzVFa3YzTVpCRUt4US9oblJvb1hValZLeWNZdHpwWGUy?=
 =?utf-8?B?NUlJM0hzNDRwUHdHa2lKYk1UMTQyNENPZFFabGcvQkhyb1JHOU1iVmVuZ2V1?=
 =?utf-8?B?NGJSVDcxQWEvbW93SE16WjZObkh4OE5qNGhySmxLS3hwbEJjMDd3YWYzT3FZ?=
 =?utf-8?B?OG5kTFNPL2greTlzSXB4T3VnM2tqZTV4TGZ4WlJRem9KQXBHblpvT0w2N0tL?=
 =?utf-8?B?cDYyb3M4MmRCWXU4bnJWKzEweXBKV3gxMjNvTUNDcFQweUNsTXNuUFVvS3M4?=
 =?utf-8?B?a3VlMC9IVVdIbkdGZW9HTlEvVWNuVlFIbzBnODc5L25FS3FsZ2lYSk14SFY3?=
 =?utf-8?B?V21ncmNJajM1V3REdmRZK2N2bTYySTRGWWpDMDVNVUxoMmVTdEVZclc5WmdO?=
 =?utf-8?B?NlRmbUdobW44QTZ3ZXZYM054Vjd6SXovUmszTmtna0VqVU02RW9jUGtvL2Jx?=
 =?utf-8?B?bTVCWWl2VTYrdFZWZWp6Nzlnb2dWbG41TmNuaEJ0eXZVOEN3eUxuZzJIUFZB?=
 =?utf-8?B?a2hzbFM2aUhKUHdlMk83aDdJeGRXWE1EMmNtUUVhckhEK1A5b0I5V3plL0FT?=
 =?utf-8?B?ajdlVVVtWk9sRXVpMjIrZlUyYW02Z1grbktnMlhoU2pXci9qT1BXSEI0R3hI?=
 =?utf-8?B?MVczc2NNdnBMcENjcUhMaDJlTXNVTER1RElwMjBwS3hsT3J4Y01VOVZaOE5u?=
 =?utf-8?B?SUhpeFBvM2VTUjlaRUYrTFpkZWtJdGFNRFlaNnlLTDY2dmdRdlVrcGY1a083?=
 =?utf-8?B?bUNJVXBEOEJ4QzNqc21LOHMzbE5CQVY3aEh6Z21vZEJzZWwweUFTKzdSOWlr?=
 =?utf-8?B?N2lQUk82TWZiUUZKT2pvbGRlemtRPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3833a3-cc70-45c9-bf1f-08db72667975
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 14:47:45.4585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygmJJTUIp+0lfjP5wL0hi34n76LF3I5kpajTNWeddd4i6pvQKuzuJOCkkXOcn02IFdAqAJJcn9hsYB8Wh1m58Q2Dv6RvwwtD5K+HlQuGS+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB4475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_074752_073894_68C3EE26 
X-CRM114-Status: GOOD (  11.06  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgMDQ6NDY6MjNQTSArMDMwMCwgSWxwbyBKw6RydmluZW4g
d3JvdGU6Cj4gRG9uJ3QgYXNzdW1lIHRoYXQgb25seSB0aGUgZHJpdmVyIHdvdWxkIGJlIGFjY2Vz
c2luZyBMTktDVEwuIEFTUE0KPiBwb2xpY3kgY2hhbmdlcyBjYW4gdHJpZ2dlciB3cml0ZSB0byBM
TktDVEwgb3V0c2lkZSBvZiBkcml2ZXIncyBjb250cm9sLgo+IAo+IFVzZSBSTVcgY2FwYWJpbGl0
eSBhY2Nlc3NvcnMgd2hpY2ggZG8gcHJvcGVyIGxvY2tpbmcgdG8gYXZvaWQgbG9zaW5nCj4gY29u
Y3VycmVudCB1cGRhdGVzIHRvIHRoZSByZWdpc3RlciB2YWx1ZS4gT24gcmVzdG9yZSwgY2xlYXIg
dGhlIEFTUE1DCj4gZmllbGQgcHJvcGVybHkuCj4gCj4gRml4ZXM6IGQ4ODk5MTMyMDVjZiAoIndp
Zmk6IGF0aDEyazogZHJpdmVyIGZvciBRdWFsY29tbSBXaS1GaSA3IGRldmljZXMiKQo+IFN1Z2dl
c3RlZC1ieTogTHVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+Cj4gU2lnbmVkLW9mZi1ieTog
SWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPgo+IEFja2VkLWJ5
OiBLYWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwub3JnPgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnCj4gLS0tCj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMmsvcGNpLmMgfCAxMCAr
KysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpSZXZpZXdlZC1ieTogU2ltb24gSG9ybWFuIDxzaW1vbi5ob3JtYW5AY29yaWdpbmUuY29t
PgoKCi0tIAphdGgxMmsgbWFpbGluZyBsaXN0CmF0aDEya0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEyawo=
