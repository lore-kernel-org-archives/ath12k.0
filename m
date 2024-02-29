Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEB6C48BF6
	for <ath12k@archiver.kernel.org>; Thu, 29 Feb 2024 07:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/kB3BF3PfUsJKexE5b5D4wcDw6jQH+D7BLtK8B92KA=; b=mObuDmk34X3ca8TB/fh0wPSdTq
	vyP6bH6C959bj5QYbD4ZzVea/H2vcXy36naf+JBXzQgS5xYF/xfLYCt9vDd3gdKUo/Yr+zXo57Vr0
	UB25bqsTGb2Id4Irb76awCmpXrg1ON0n4R8I1eVmFR7HWfnOxtBGXotkC/IIEJdnsAiCjzVK1XUQL
	Q5zW3SKB/R910s/uj2gsQYdzKOudAKRHC6OLbiJe2rq4940sqhoHdvdcvow9NkyKIcfzPJDinUrGN
	pu+d2zlTD6FQku8UZo3slspTRAjXpnc3HCXBgBE3LpahIwRbaXkPqMztLGYpbhRR2Q56rKMs2TmAh
	lJPeThdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfajP-0000000CSMg-05xU
	for ath12k@archiver.kernel.org;
	Thu, 29 Feb 2024 07:21:27 +0000
Received: from mail-cwxgbr01on20700.outbound.protection.outlook.com ([2a01:111:f403:261b::700] helo=GBR01-CWX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfajL-0000000CSEN-0MsD
	for ath12k@lists.infradead.org;
	Thu, 29 Feb 2024 07:21:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8OZplgURT5S3+RgMIvb8rPdtZ3c4DiKoF1prhggB26SXTxjQddzrVxrmvfSP8jPYcuwfRjhDTgJSkq/0lZ87N22980Li9VLO/3QHVM0pN0Mcb+6ylnGIB0ROlSf+yYN4azLb+hBW498U0w9BBvTO/Gg2K+/mTYtCprwCjHvu+fYCyY2ee+EUbKL/ZWPeJFT+b9Hl3JvdqkJwLCm5G0B2wa3mhUY3R6VdmVUUnKy9Hfg0ayrZT+iexAbfH1pKxGTSRk5/fL9kBW1N4b2WPD4eqhNjzYcMNY6CFl1JqTlO7GAN0UL4R43VWU7fgu6gfW5Q0/3TPlcbr3HCxwpxm85nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/kB3BF3PfUsJKexE5b5D4wcDw6jQH+D7BLtK8B92KA=;
 b=VvRo4FCepYLAikn9lWgWv7Gp97/aXdvprLiPNkV7WbbuNAHWxlPZG2aWzzStIZWGXPX5I0F+Q3KBTE88wtcV2wbdQEk4mLez2bdYJv1fg6iPlwprxXpulw8FPWALibucs1WUTNDOQoi78Rjnd4BeZNmVrtbKN0oJakIW32fVG+5qqm9SVH6+VlZhYpnJHm3SINrC+1pwvSiNudFHwAvL82Ku0XTI8A5I4I7ctMf/GlT+mVqCM1eajETnLaDggBVtAVRIeGPs9DuVT1h9xQQHcePH6E4pFvYtoSnKjlB8valJAgc11ZjwvI1blfGpGa6BqeVVtrQRQkmDLBCC4XJKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by CWLP123MB6841.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Thu, 29 Feb
 2024 07:21:14 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::2ce5:9af6:5c25:92c9]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::2ce5:9af6:5c25:92c9%3]) with mapi id 15.20.7316.039; Thu, 29 Feb 2024
 07:21:14 +0000
From: david Atkins <david@3adesign.co.uk>
To: Kalle Valo <kvalo@kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: Multiple Qualcomm Hamilton cards on same host - none working
Thread-Topic: Multiple Qualcomm Hamilton cards on same host - none working
Thread-Index: AdpZkPNlBfuThMBpTtCHcDuar5GsnAAKKQBOBEmHUOA=
Date: Thu, 29 Feb 2024 07:21:14 +0000
Message-ID: <LO0P123MB40574FC63D7EF7424ADB5589D65F2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
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
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|CWLP123MB6841:EE_
x-ms-office365-filtering-correlation-id: d2c1d6da-39c9-4f9b-865e-08dc38f70341
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qKH+CPIMWcMXPrT1kJhLe0q22gezNzZ+PSU9Y7+QtSXwAqiVdZpjcrihUDWq7m0X2SQKVWZpzPuv9vqAVGOnMUAcTcf4bZRGg9Oe0+w81wYrsTu1S64vmTg180tjNxydO3ADTBJFNv7ye48u8Qk2eXkNJKAPdVqAe9vD0xJf2qJIYkY3OZ2rvBUMXq3S4iCRDDaVFsoRyZydqIC6KsfwJsvDrnL1Cl4Qb40v5/+KBGhROIgu1pbb+qhw5CfqSfuLgz3fZFIU839KXMXxdKjT1M/4kECYW7DmJF/fZ3sfcrJgERxrRH+cIhaF+h6PUecSxLgTxCtTk4Ppd/DcQsfhqKdXwQHSEnxphhUPYxlQWm3SHh3uaJrrsMJEd3FrLxgBbso7MnNVkIqaKyNG9T2McB/3F5TRE5R2frpR+F6aoshUJyv5FqG9jBY1xSOm7PO8nISYYzhQost1FuOOzOCczN7JGNWuY/g6BjFhSyCDXaN7sfzoeUUyZ2wqZrcvKxykPEx/uPh3YQnDTRX3gXUgsnMr7U5g5SyYv7mxBJ/+6cnN+dcXwZnYXMv665hluU0LFbri4/WRVUSFwuO0uP9RoC6pTj0pcxo+b+9/7BeK0YGsFlmNmjJ/3Zl2yYT6pc8x7wXCKbK4cI7uchKy+RylAu5EZFOcpZuSLlx3kiqK6CM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jSSnwYG84i0zEcBLoYWOxjAAUKmW3TR78TFGULTIPiebngy5h0QrXUFwWGMF?=
 =?us-ascii?Q?kVnr6BgTyvCRNOfPFH/VVAkK0UhuB2QOVl+wosDuMB8Wo+mwVUTU+joFFUJS?=
 =?us-ascii?Q?xJkRiPvjy2uB2wbvzXhg4K2+q2bjI7Vk9DyzNTRe4kEPgZysQ8eogx+2zz3u?=
 =?us-ascii?Q?kU3noZGMu0A3HbLgZLLI67t5rGyPaBvZ2tQcxUTF3HoPVObaU0iUGaqiRfov?=
 =?us-ascii?Q?rRs0bGjussQEA29bym0abgNkMUATmL11Iw9vAzLR4wnfjTmR4o7V4QWUaUzz?=
 =?us-ascii?Q?LgUYyZW4LbwNQ6lGnVqqsEZxn+kxw41CinB0cq7s8uoLrU+gZH9LUhtKWEZM?=
 =?us-ascii?Q?Hnai2+EjD2scxJP90jIzPrFzVuYET47lrP8VFhEJdqVZL0Ed1Nt7KVqOC8eN?=
 =?us-ascii?Q?UWJSbCezBRJ6vJeYWsMpjdTjla57bBFG9HSRWii5j56Sbah/HxxltruZeVvv?=
 =?us-ascii?Q?Y8Q4CTe+hs556Pa/tGVdY5CI8RW56VTO9SzfMtZmPJDutNEV+EwbMMOo9a0A?=
 =?us-ascii?Q?yWTdzW+/IPsSdHROIj4Fjm1wW9P+n5bw58JUsrqhsohCt2vTlvZdqZqtyd2z?=
 =?us-ascii?Q?D/vM3c1rvarB8OvsOjgoOI8qfHP4RLkKuBndBWOmsHtOZzvn5gw6z3hWmLHR?=
 =?us-ascii?Q?TTrjj7R/Dv1G8o7zwfG6SyJtfgOptjqTi/UHDYeoo3acIJzBBkNnQSxmX7de?=
 =?us-ascii?Q?PhNJYGsyfRqOkpKilAMVZl+Cp+LPlKkOACCZhu9A1hC27EeeBEI/sy++/Gue?=
 =?us-ascii?Q?lBqWH9jUSmmrA1jOahZTGgEgcKrssahAJHVGFAvXOxeDIKGZMnaZSKfj7jGz?=
 =?us-ascii?Q?5wSRbdhNM/5kln7Qwl/38MerjIYZobtdNyjM5RveLHy2mErpp+rqLHjb1OU3?=
 =?us-ascii?Q?xnaylHTKSQzs//wmE9R3fksdyb2Ec0j9XqHfk5P9aMYn2ztNwOjfnM4nQeZg?=
 =?us-ascii?Q?6lP7OMADAbP7A3CYAYHSpkhqvp/PGvQPVANIx8II3qvd0vf5d+9q5gQ03eSR?=
 =?us-ascii?Q?iBszoXw2g2RV5DgKAqh8lHPvkxPlInHG9x8Lgw43C+TYiqFlrLmqUvapd/rz?=
 =?us-ascii?Q?A2K2ubAXCV7n0Soy9yzQte1pOjorXYZ/XWgh6w8NR0QF+zSGSwl0kjpVjB/L?=
 =?us-ascii?Q?l05tL/KG0xzPxFXzFIwg4ZWRBDqdyvssCOttzKyLM1nN3H1ZDF1l4bMhAyTh?=
 =?us-ascii?Q?Szuxz6tCrfi6E3cw6K+/zU0vlxeOzBNDWVAPaKgWaEAgsVJCm74xsOID+vqy?=
 =?us-ascii?Q?kXQOdzV892HkyRpr/U1VOXjj8iNUuNJK2yicLigeDF7SKB+YOjpOFACyqrBF?=
 =?us-ascii?Q?gw5KsBeKj1530bq3cCLfcuZ44/ELUpkNhA6UcS6WzTOkC41xBiaFBO8aQZft?=
 =?us-ascii?Q?B8eHA1JpQUvgbTZk6j0Kpe9WDHYSkWEtcWVudSCgnWyu8AhS/DpLkRv1BwtP?=
 =?us-ascii?Q?uGVgvLIFbciQRuAeTvYfP5xj4EexkAvVyUdey2g4tDNM2Zdi6JUPBZBr89JP?=
 =?us-ascii?Q?kVJuR3ECBwKUf6ZlHVx9t6tI0ftRWrSnHZNKRrz10IeG2ma7RwTDVWSRgZEp?=
 =?us-ascii?Q?wIiFwuwlZ5qSfLlm+LjSwTZ3rt5l66iVr91AWXCC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c1d6da-39c9-4f9b-865e-08dc38f70341
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 07:21:14.1937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dlyxIychLhEjmApyYwk3HHnqGq/DvpGu8OumnxBwAWD0vCpdjXhBqDcmh6bVoxvBUYW112cNyAjQSb9tZhB1iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB6841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_232123_249734_98528F72 
X-CRM114-Status: GOOD (  10.79  )
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

Update on this, with an Intel CPU the first NIC is found but the second fai=
ls so slightly different behaviour, I'll update bug registered with logs

I note there was a patch with a comment:

" * support having multiple identical PCI devices (firmware needs to
  have ATH12K_FW_FEATURE_MULTI_QRTR_ID) "

would this address the issue? and is the updated firmware available?

In discussion with Qualcomm this week I think understood from them that the=
 ath12k driver will not support Wi-Fi 7 in its current form, is this correc=
t?

David

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

