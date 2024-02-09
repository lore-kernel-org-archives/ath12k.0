Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D52C48297
	for <ath12k@archiver.kernel.org>; Fri,  9 Feb 2024 10:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJ7g3jxVPvZXDwn8gOaFkNFu5gNKqL1bOqv7K5cY/cI=; b=kkh6IbgKvXu0DJ78GMtF4ZxVcd
	Dxi4GgmiF94R3ALqW7aKdSQY6mt78s8iI/3fMr1ub+JB644GGSpbPaP9LLzrzNHdbFhqjeRNgfIPg
	6/tzbZfe+RO9mN2r6BbDevevz3LSSM4u8ynZM3yucTxDGm8pfXkJGr80Y+6PT18oCHEWaHgeZRDIO
	VcR+Th5+wKU5/+FUSFYsHJSNyUxkvL85JS1T/fr2HnTD/FJ5IJopgMOUFklvm5kehsJWtgS9WUkXI
	Ohp0yeYnAa/YSz5No3JFiU4ZVp5dL7fj2G10UGmqR4HKJAN7bNLkvvg65ICa5vpO8aWvRrepfmzdd
	U99O90hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYO6L-0000000GiOJ-2zmm
	for ath12k@archiver.kernel.org;
	Fri, 09 Feb 2024 10:27:21 +0000
Received: from mail-cwxgbr01on20701.outbound.protection.outlook.com ([2a01:111:f403:261b::701] helo=GBR01-CWX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYO6I-0000000GiNY-31yb
	for ath12k@lists.infradead.org;
	Fri, 09 Feb 2024 10:27:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clENnwUcF9uQ02hQYb4kpMRPqI7MFZwSyAXBqyE6BQKY94IY9s16AGwZcTnIjEmbL/qUN3D3cpS0+gJGHhqd2oX3t8xWxf0UR+PXjrZyigHKD/HqWyxDVpUpyKv1P5dsdgpQSMvN7Ck0Avdw5mTkZElZVyvkLiGYCtJs7ONMWG1L9i32uQr20JjVb+kkma368QKvkQiGfRmzzI5rZroEREtD763hD6F/jDxDs6+/ZJ8kERk08p8T6nDjvjNGgrlVAP6A5uTX0znt9nZoGbwlJu1JSdgXSM0yd9QbiHQPRbLNkwIXEUXAI/t1XSx9ENOxgQFfsrGqVnbTDfJJgjYvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJ7g3jxVPvZXDwn8gOaFkNFu5gNKqL1bOqv7K5cY/cI=;
 b=YgSbk0TuPWb+JakejeCkL6g+5si/XkifS8UF0NyyN9YXlrATrqTThj9Ly06eQChGCbv+Ourmgx+/rymEsyHstUZUWk2KdlzGVTqoddU3WogHznoLVhuDfQXKp7D3M3uYYioUJmbpOxT4xHz/JPWNsMYSWkTR8+XU0qY1LPBHl5oDNRQUGnh/f7yT6Fq+Y0/bWIO0zMHcSV//QMbtgEtdlVto+TUr8he9x+NSXjYtia9WC7lOfdik71DSR4J8fnF4oHftEqVP0nnxU+gEDO68XdtIb/JKkg/R3h/fBnt9JEqystP/EWmZSqhct7IG9FTP32TnUaQ410s2gXTrxPXyaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by CWLP123MB2916.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:5b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.26; Fri, 9 Feb
 2024 10:27:03 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f21c:6642:7a8b:426e]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f21c:6642:7a8b:426e%4]) with mapi id 15.20.7270.024; Fri, 9 Feb 2024
 10:27:03 +0000
From: david Atkins <david@3adesign.co.uk>
To: Kalle Valo <kvalo@kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: Multiple Qualcomm Hamilton cards on same host - none working
Thread-Topic: Multiple Qualcomm Hamilton cards on same host - none working
Thread-Index: AdpZkPNlBfuThMBpTtCHcDuar5GsnAAKKQBOAGI0zFA=
Date: Fri, 9 Feb 2024 10:27:03 +0000
Message-ID: <LO0P123MB4057F538B284B42DFF2B5F1BD64B2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
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
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|CWLP123MB2916:EE_
x-ms-office365-filtering-correlation-id: 73502249-01d2-4efb-cae8-08dc2959a84a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uPJqNBjySUpKj/VweklFA4ipKt9xiHWpIXKZoEYporWK9JOLi1EN6987DaO8fYxPFY+dqjl5XunfQixGiwCkxLNh2v553K/lQ6+pM80nTj5IiQJ5o3qRnq/2IxOUqwdFn3o3jrvDnLznLLxGvL5ozyXjKhQo869mKysZuFbE9dR6pJ7XbAweW2r9q6K1eWdUjpP9vQQUp2JR2MTWVRtUG1T3Y+vZK0aVB2gP02URLWv4/9RKu1um7ubMxP/3nTI+BIiBr3n/wccruXPxswHXM3OHsJTuWEvCG6bz4Dh5fOvDWk3iJNl5TOeT+LbuM9Pqs1yOzuIfs1LSOMlVK7m/zJ5qNrPrHPMMD4QddKg5/WzbpP8VaUEknkj05f3FVcb9LbD7XDHs+1mjCloaFM4O1eMUSgcSOpXc6ICAitaG8sUaVvMgcir00NJx07VcXOYqmuSfi2xMKdBM2uxqdPBEE/bQ5H5YoS3pyS/v30dUxClwk3uSaU6zN0hgWMEV6Ulbj8We95mhnRRf4hN7eKyRKc2Mxw5Ff0dGTKpbbRMiue+v4mYZukpi3ZyN6SuOfv6JZd4N8NghjEFPxF14fo6iePnFi6Jm+oM2tFM8pfcU688=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39830400003)(366004)(346002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(55016003)(64756008)(66446008)(66476007)(66556008)(6916009)(316002)(76116006)(66946007)(41300700001)(71200400001)(2906002)(5660300002)(8676002)(4326008)(8936002)(478600001)(966005)(53546011)(38070700009)(6506007)(9686003)(7696005)(86362001)(83380400001)(26005)(33656002)(52536014)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hxVBcNfh/YwQaDRWIlQWKGq9hUAdz3PO6SvcGgnGZ585CnxhZ79clkH8GKat?=
 =?us-ascii?Q?GyhrW1wdZRXrE+k9RSG2x1lYCgju4+wItoV3OLLOgfDr6SDLugDoUAk+aAZs?=
 =?us-ascii?Q?ZZ89FJU89H7344UL7kMu9dun90xMT/RfEQDbS5Nr/uFktm7AgDuRAJjR0Pis?=
 =?us-ascii?Q?hO4NQSg2Fyic6oo7sbKONL+vDzXPP7w4UAMs6XP8z/YLPKDWLEFEvQkA9IhX?=
 =?us-ascii?Q?qveo2P6DGfCGJ3HJw/i/1slW6m64H/oa22bNi2F6zWgh7sn8C5pEWtNoFD8S?=
 =?us-ascii?Q?1OGYas4w0tRwXNAr1hbwa7G46BhADF9Ng0cnVU++cnQRaokOpaeXm3jj9h/R?=
 =?us-ascii?Q?h1mJwpn1dZpXTG88+3bMq/Gnc7BnkM6H3EoEK6GgXIavJeuo+2AwEE7cGlV9?=
 =?us-ascii?Q?nZxuqcssST2RxhNij26xz14pcTcHDrbzymzoH6N/5cGgNVl7dK3OOdtdkn+7?=
 =?us-ascii?Q?RQNr7S6HxJA9L1PkRRBwgiIhsCO7jVqQNY32tczUawwZSCZloGZayH6L+Nit?=
 =?us-ascii?Q?TWMqpkHlWdV1PxsWzBpAKqPfPQLU/eigA8pFw4ppKXo9J6hugJVwjJfalQeZ?=
 =?us-ascii?Q?RLy2/DF2Lqv82j13KUhPwqWUeSmqg1a6sv8CAx9zakQ3c5siXhwR1es74M/S?=
 =?us-ascii?Q?ra1iNy2Zw5pUu9lqkGiPBKzlE134r/kLBRAzH/WztPiCEvEpHnmOo7k1wKlw?=
 =?us-ascii?Q?M/NP/AL8HQ2QAGggLuclD/u82ERSKBILQwxb4sp5VjuIMt1dxLNwDSqyLo6B?=
 =?us-ascii?Q?dNxi60tx16+ceIBE9ZLsN6325JJalsFPq+VvQ2dgweOF8EoqFb4UW2OP3QNd?=
 =?us-ascii?Q?WgeFno+pjM8bs203XuzwzrYaSIiLL1JK2XemW83EcYdG/N10zdxdc5Dl0N18?=
 =?us-ascii?Q?6w3qgcolzYW/ENQCubyfOQL/as63fHSlc4b/CdWmdw6CHOzemvRAI7wLpzBZ?=
 =?us-ascii?Q?SVq3XtY7LgWhzFG4Y12HWTPJLqLhiF2PsMAsazoWY+u83269QIEx0E9LQSQF?=
 =?us-ascii?Q?+/1vydlU6v4VIcMYfW9DB6Tw6t0SB9XmmT4WxLgmA5YAorqlkqE5MHSlnwvk?=
 =?us-ascii?Q?WjMFR816mtsvT3LElKL0me+cBdzbHnHHRL0Kk8kXFC6xCf7wJm9AfB0kgDMx?=
 =?us-ascii?Q?Hf21+EPcqJpaDQh6WaccmeUwlNh2Gp+rFAdpwr+eGxSWNrwPQX3Q9OMTktyg?=
 =?us-ascii?Q?M5/OtOrY/8hmdHP5hCxkPdSQzarQhj6wYxBCVZgZofDKN7MMeuOxKRafbmuw?=
 =?us-ascii?Q?+tu1JtX1piYoKJrFJe94t1txb8Fr9Z5AdM9O3L9mGEpgnx8KwUZEuTvbjS1W?=
 =?us-ascii?Q?bzm/RHsbaCPH/V2308Kq2zG2LdBQiHr2LPsMZyhOFvNXHe2zCsTSPm8gqjd1?=
 =?us-ascii?Q?EcQEBySXTlLo7EMS40ZxjbpEfFMTsAthBlzjhKxgzRHZKf6L0GHmCQo8wToj?=
 =?us-ascii?Q?QcgcMWW5U7eesf107xe3yclrkSurGKeygly3gjzQT1l4ATHxxAeJvVUMeM7J?=
 =?us-ascii?Q?9yqvKl2sUbtSnw2DA0FHxHHTaMl2IL2JIvPtORieMuzeJuhvDaOQHQtnW+CX?=
 =?us-ascii?Q?tG6YIfwgmzrhbC8AnNyZHA2J4c+RLZMDOZkfQJV2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 73502249-01d2-4efb-cae8-08dc2959a84a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 10:27:03.1638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEvpWrhdSbKq99Q+xX9ZyCxAPXOTcrp8asFDgy5ynYTMrQUjAgx6NrEum/uw9/9VDz0Y5h5RUBsO8BvW/Zfhhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB2916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_022718_794725_F49A526A 
X-CRM114-Status: UNSURE (   9.82  )
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

I've pulled and built, is this a good place to report issues from (if still=
 extant!)

Linux openwrt-wifi-test 6.8.0-rc3-wt-ath+ #1 SMP PREEMPT_DYNAMIC Thu Feb  8=
 07:30:15 GMT 2024 x86_64 x86_64 x86_64 GNU/Linux

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

