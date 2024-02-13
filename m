Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7AEC4829A
	for <ath12k@archiver.kernel.org>; Tue, 13 Feb 2024 17:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Amfgf+F13Pk2Pqa4Up4teJ3EYZv2rryZ/60nvYk57EU=; b=NMC3sXxhEvX6kQHbrOn9vJR8dL
	4RL1kt6WNdgxOATeTkXpJU16JlVxR3AD0e/Um0dBYkBw1dlS1QZCqvHX5nYUdBeFpoyoGvh8nquWm
	gDr5rtkAlaNXyRJQpSp8e62xpBLORlc5bS4HECj6493Qsfmhx4RnrxW2dmZWVOfPmeTWfAoI9/GEs
	oK0rWV0xe8QAIH0eIs6qu5rzXwc/XPAPLhA5DN/cY4EhFyZA9K2qDBe4xOSODPtv/F2ntbLXSfLsl
	ZSEetxLoXUvmIb2nBx56qOLhOe/9a1GZziniD0bjfWs/oK1kAoR30jgHyVdmBh2d+gdveltU0u6cv
	HiPE3WzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwz2-0000000AD8h-2WcD
	for ath12k@archiver.kernel.org;
	Tue, 13 Feb 2024 17:54:16 +0000
Received: from mail-cwxgbr01on20700.outbound.protection.outlook.com ([2a01:111:f403:261b::700] helo=GBR01-CWX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwyz-0000000AD6B-3Z9W
	for ath12k@lists.infradead.org;
	Tue, 13 Feb 2024 17:54:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d38aFYyEwUq9XBUiGLPhlTsnMXwYoYRbx09FRHQa94eZInqxK+FWKQ+gecVaXJfIVPvhMwxOiVIpHZL46o7vxcQhZsC3EPqBjzggUcW0F4m7Vujkhs2EFNLrHU/kiOpLTrMVAM1uFzB/YkYBjWtfbu97K9K+2MAMttChB88hcumxGltO3VOZv9QVUSjXMcAE9hix5px+cPSUBZBAIdvvhqk5v3+XVLiP6Opvdv3pZaAZVpu8n1NiqV3fM7Ab1YjHKwrzu5Y/UfUoKTOgkLqRy+stc8oefIrW7CKEgyYC17vxhLQ/+GN/DPIKvbTh9LPkhyhJ7UKbRNpaCCpI40bpaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Amfgf+F13Pk2Pqa4Up4teJ3EYZv2rryZ/60nvYk57EU=;
 b=l06GizigSHpdVoxjlVt6YzexHqeVnLX6Gd6N+RQdFK77yAdEBdWNZLqrKNl3gl66kl7Qxkk1DtFYvQhF4lNFAMUnX7z/yLCoYXAQDBjD8U00j1Cul7FaFrZQU9Uwvbp0NEE2ITtgRGfhEXSS4AtgPrIruhC2gsE3wh2JEX9bFgi8WqCH85iSTDk+C4faSn/kEKUiHQWowh6q5sF4mRfQNCrsQNMn4FrQr9LbSDabAR7kTnHCJ/0AmTzFSBqx3QD87c8rn915OArMF3ZkMO6HHE4rKmVIUo/J1+y0zJRUPQoBhLshZL/jAVv04Loz63F39BRDM+E+df+a2cSLOQv2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by LO3P123MB2700.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:fb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 17:54:04 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f21c:6642:7a8b:426e]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f21c:6642:7a8b:426e%4]) with mapi id 15.20.7270.033; Tue, 13 Feb 2024
 17:54:04 +0000
From: david Atkins <david@3adesign.co.uk>
To: Kalle Valo <kvalo@kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: Multiple Qualcomm Hamilton cards on same host - none working
Thread-Topic: Multiple Qualcomm Hamilton cards on same host - none working
Thread-Index: AdpZkPNlBfuThMBpTtCHcDuar5GsnAAKKQBOATr9S0A=
Date: Tue, 13 Feb 2024 17:54:04 +0000
Message-ID: <LO0P123MB4057241161CC01F829A6736DD64F2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
References: <LO0P123MB40577FE30E1B6D72A554624BD6452@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <87a5ocqzil.fsf@kernel.org>
In-Reply-To: <87a5ocqzil.fsf@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|LO3P123MB2700:EE_
x-ms-office365-filtering-correlation-id: 9b5cc0cc-5957-4659-6709-08dc2cbcc4ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i97J7U2S2kriNv8//8Sz/zsjPMqC3wjp31BjzrZwW/DFAFIQYufbW2AYcx5tUz1d8A3kTDrQ53dHFWFLVODRD0MAwfmK6MP71wCumMr8+RmxSVrqbXrlVkblfegDYWlgww/MbjVt9I7Py4Fn3zy1k6YTawCr3HkAqC6pdEWEc8lPsq94FjwGo6Nwmv1do5qNjQtWs8DCFw2WZEK2Nk+iFERXOujIxj1fEBXEdGl1XXpK6d+e3AdijKEzpu6kkiGS3U6NhocMz1fTsD0gfJZRKldZmn3ynrEhS4ESDVZINmOmTbXQ1Rxq23N9ehekPmY3XF/vDRsKiEi62mXpyjBhAMlaUF93IAsg3OHogQcy3S4GY7NoL8dQQK9yWdU3jmZflamJxNWm8RJ7oLatxuR/AVTBvPQTHehFAqsLhuu3olzRc3ff/15sp4QBcl89RFhD5GvjePcGq7Bz2CDoCQsWicPlZy+0rJL+UPQjaC9kb1LeLd7L6RjraNr1hBYBh63mQM6olgFR2Po+Q5/E0WzRClG9Wm3Op8I+7E5tlJ0Et0lB2SR2FtxBr5RDgpIuk6f8PIaxsJ2wO+otby8BPGOVcC1D/M+B5rCBOkx1Tp6QCNw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(366004)(346002)(136003)(376002)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(5660300002)(2906002)(86362001)(9686003)(53546011)(7696005)(26005)(478600001)(6506007)(38070700009)(33656002)(71200400001)(122000001)(38100700002)(66556008)(66476007)(83380400001)(64756008)(66446008)(316002)(6916009)(52536014)(4326008)(8676002)(8936002)(66946007)(966005)(76116006)(55016003)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O0HaZo0HISjw129YmIK0jSJAqvEozAUypatzUQiSWn0byT3zOArDxpwDdVl2?=
 =?us-ascii?Q?pYbuTrhfAvtJP98c0h2L+jnPZ25KLSUVZrvPBwY+C/b51lQOdl/S9k9ADYus?=
 =?us-ascii?Q?Vk0HL+51rG6dyLJCsbjm51R0GxxJlsWyazcXYDh3AMud+WyhURLIcKuDTowa?=
 =?us-ascii?Q?1x8OlUU4xHXz2CmXk2Uej5/KbWJA8y35JbfVGJhRqcGbk0551CY9lZCQ4kJc?=
 =?us-ascii?Q?4pkX7z5HvYa9pwp5zuBBXxardArMVS32xKiyn7v0ST+YA6dIDV2f9H1dbuhH?=
 =?us-ascii?Q?A92w3tFSDiZRq/3/ocl684BPM6+aRNRQ3taFglPLdVdfpk1/oXiqajQW0u+O?=
 =?us-ascii?Q?SfFMOoeNd3sRZE1LGLMFHn6GFEHhVlemPfai28zenbZqjsDak/YdcJg0MKee?=
 =?us-ascii?Q?nm8+7UVT+pHNX1meEljJ/fVFG45e6JWLpZPFBvSjNm7is3qi8EOtadm4Z1X5?=
 =?us-ascii?Q?x5tbdBdTrESu5uIYPEZkrqJNcaW+qVHGP9L4hnW2lUg9Cr5935xJVDn3aQ8J?=
 =?us-ascii?Q?cRagJALYJV4Mu6r76LVlEijhrjPWuMaXN+ocmwk2ONTaEa1lUqYYYKxgWaQJ?=
 =?us-ascii?Q?jhhAf4XgO500PPhbPR0P9u7jaP7B3270n53O19MSdZIINt+Y17pbyY8vPH7l?=
 =?us-ascii?Q?T01xo+BTTQZYb7yV0RXMKlPIB8M8/qlYq6+Yy9GIQxUbvsjj/imyrXu6Mssm?=
 =?us-ascii?Q?en66QRD38mlik9/oU7GOdfZ/PGocJuGR+Z6rNbADcOD1azB6oA5KfiR4NPX9?=
 =?us-ascii?Q?gKoEUyfM5tpW8FZb4pkOo67fNe/B7LapPqdxgOEfrW+X9k1p9nf1QtSe7zLO?=
 =?us-ascii?Q?/pCRZu4X1SIXbQz8ttKhDw5G39y+mHNdlU57M8veIIQ6chJhQLAgulmIQj6j?=
 =?us-ascii?Q?r6OCrsumUYjG7f0JnJG9v+tMqXRPFShZE6psfCX3UVq/iiUu3EpwcUp5UEqK?=
 =?us-ascii?Q?XeOXbtLghzimITJOJbYLcs79Uuj0nrc0c9dqoCs3QsPKZIMcPTx/If7tjzjM?=
 =?us-ascii?Q?WVmawLLYQNG3CdYlHTCsp2sx9bxEzp2ebrenS1cKBWVc0eGCnH2f0G7fmSY2?=
 =?us-ascii?Q?ZtR4juPKlGagr+hXeWnpAaXcXEu/hoVsAJXvIFEtxtcNs7dat9AlJO3DKY3x?=
 =?us-ascii?Q?1f9P+YbqTDYYTYM6+YXmWejZULvChooCnLO188ZuejR0Lc/giJ/ASzVlFK8x?=
 =?us-ascii?Q?HEAUhK2GzZ/BGQxYOPOQYjZpPHOzdE2vlY1w3ZODjRRacgENAYLNernFttYP?=
 =?us-ascii?Q?7k5Qgwym6G6ccuIQ3T9dPllPKTqCB7bQz59r9E957cPsq6YRT5oHkCVgtt7l?=
 =?us-ascii?Q?NkDD6jzxelq4CEHoiSd6ks8fHwAuLTfQTWFzg/Wjtz6z4Y+uu2C/GbQD6oy+?=
 =?us-ascii?Q?sMEAPeEM5YzDUhoruq0tjUK+9EKn/Kl4s17Gek9bCbDt0R8RQok7SOJ9pfK3?=
 =?us-ascii?Q?uTX6MEwkcvZ8g4Ogw98XwDJGXfiKIi1I3Ax+PKU230C4jArsIIE2Fsf4sybx?=
 =?us-ascii?Q?nqSz99xvH86235C6qgDOTN21slVamti12DjSWPavpZ4ZolaIU2eVIdfhF1Me?=
 =?us-ascii?Q?V6lB5T8MpJrq5Xs8NwXYLPYlNAHRcp/HGmUVbzRs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5cc0cc-5957-4659-6709-08dc2cbcc4ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 17:54:04.5648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JNSfwePwvK0n9DGIwWpUYtM30JJWf8QINpHT0njC4xXTTvB/rcDrJW5KyAOU2OjKNNeFoJ2jeY6Wp0WflHh+Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB2700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_095413_910950_7D90E6BB 
X-CRM114-Status: UNSURE (   8.38  )
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

Done as requested!


-----Original Message-----
From: Kalle Valo <kvalo@kernel.org>=20
Sent: Wednesday, February 7, 2024 11:34 AM
To: david Atkins <david@3adesign.co.uk>
Cc: ath12k@lists.infradead.org
Subject: Re: Multiple Qualcomm Hamilton cards on same host - none working

david Atkins <david@3adesign.co.uk> writes:

> We need to run multiple wcn7850 (Hamilton) cards on the same host.
>
> A single wcn7850 works fine, more than one and all fail

Supporting multiple WCN7850 boards is a firmware limitation (and we need so=
me extra ath12k patches). If you can please submit a report to bugzilla, ea=
sier to track that way:

https://wireless.wiki.kernel.org/en/users/drivers/ath12k/bugreport

> Logs from a working setup with a single card using Ubuntu 23.10.1=20
> desktop install

BTW we don't support distro kernels as we don't know what patches they have=
. When reporting bugs to us please use vanilla kernel.org releases
from:

https://www.kernel.org/

And even better if you can use the latest and greatest from ath.git master =
branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/

And do include the output from 'git describe --tags' when testing kernels s=
o that we can exactly identify the release.

--
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

