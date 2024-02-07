Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F6BC4828F
	for <ath12k@archiver.kernel.org>; Wed,  7 Feb 2024 07:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jDqpk3wui2OaHEgjt/sKXdXM3TZ5jWbMWlBsP3CjePM=; b=fo55rZqbO2iv7Y
	QvURDCqX5wnh5tT9wY4JyxxuA+os8B/zEfnvHpPFFE5/fY0FMZYSNheiL6Q2U9grjfrlnDOeP6D/t
	zRHqfJ32PY8NJZnEeXHs7QK/VjJKOco1Q3bu2LMT9UT6c7r57u1BGwcbJmiYug1ZxriLy0n/cDcsW
	YNZbr1ABmfPtlvHjJaahtqgLBapscjMviEuPvo4/Xd+v6J6ID4JEFQ6wPoiIOWSGtbySZQK3//TZf
	c01GXXiYmBIl21YvO/7BNKiF7HZ3ONFZAnsxfajESLnqjf9cNayvyT/kO8lzlZ/iRp4dE5LgTWb6x
	V45AwMGY9/rpSVuXuE9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXc2d-00000009uNe-1ql4
	for ath12k@archiver.kernel.org;
	Wed, 07 Feb 2024 07:08:19 +0000
Received: from mail-cwxgbr01on20701.outbound.protection.outlook.com ([2a01:111:f403:261b::701] helo=GBR01-CWX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXc2a-00000009uNF-1tUu
	for ath12k@lists.infradead.org;
	Wed, 07 Feb 2024 07:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cP5cYScgHL/zPQerT2hi/zWG76XnEiuF4K/cEM70yza80cL/bwIGLoeYdV9cAYEs7f8EGxqlCBSf8/5d0/qkR9nDd+Xhx5DwNJG2vouliB399j1hO4c4UnOPcn0R7a9E+lW2TLDBQEPdAuEsDO4pFrrD3POjGiR6go0jBw+BixuzBNpA+owqJMOAFEFQjey0sm8QrRmsyKlGMNtiYj/GEcpXSRfD/CIGRjy43DjF5GsdPumFZxZHYSE6u3uPPdRolHccjL6WYJeQVvTNkMEfjT4GTUvI7kbn+NjTHpA7YLS5DOKg2axCHADfSuwYrp4iD56uMtSfBxRQnHDg1bPu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDqpk3wui2OaHEgjt/sKXdXM3TZ5jWbMWlBsP3CjePM=;
 b=MYbbZTxNhbVh6RjvCdHsoPaccurw0VyredjiqB4WaPnODyFWK8L10saW1yr/HWb44PkZGv6foG4gppVNUpA1hHZ9UU1IlZemXuo8zLBmJM2TS7mnNoyyc737QdZxgPJXL85nUF8faQYtt5aCT83RTNEvBQbwBM+feMlNmcFymULTCLgpwWABwD0vto5rIWjqtJ+HkXHQud2sEbZm91eHK+vDGrms748yDXxWwXtj90+Un8daJzDnEG6FQg//s9iVT7jiMjbZDcZWLr6g/bnrRdmjVg0WK3Em2FR3YnuESJrf0jsrlykTXdjCROFA+cYOM7Qq/ucEDoyuJIanjcSaCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by LO0P123MB6087.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:243::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 07:08:09 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f21c:6642:7a8b:426e]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f21c:6642:7a8b:426e%3]) with mapi id 15.20.7249.037; Wed, 7 Feb 2024
 07:08:08 +0000
From: david Atkins <david@3adesign.co.uk>
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Multiple Qualcomm Hamilton cards on same host - none working
Thread-Topic: Multiple Qualcomm Hamilton cards on same host - none working
Thread-Index: AdpZkPNlBfuThMBpTtCHcDuar5GsnA==
Date: Wed, 7 Feb 2024 07:08:08 +0000
Message-ID: <LO0P123MB40577FE30E1B6D72A554624BD6452@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|LO0P123MB6087:EE_
x-ms-office365-filtering-correlation-id: 0f4a9b6e-7390-4b1a-bb40-08dc27ab8a0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y2koaXpptlRTaXNBHINv2GE++LWwguh7Vpdb4hASrTVm69Zk5DOT9IJa/CnDLejFrVkAUW8ns8G4E6/ahb7rTfhd6QejDxux80jTRuXIlNqZcMoZn4J0eGMNZe4H2lrmqN/Kbg3EVb6vALaidfNFq/6Ka7zPqnOvbonC2n7mS6lnS0Awyzyf65mapMo2gzBQ/1P+IHN5lDuR9JUOjiAlvP36+Vrdb/3IStS6KC3Y4yUSCLOjdXUe6QnLvzz1LCBsfHWvL9TDsanG2zEKYZ3mU96bh7JoOKBurXOYq7fCbW+l6hzV2O2r32hFgL98fwNQcXhOum2mRMqDrqARx/d2neomDR2SBVaxagMhhWo7B8IJMovk1aUAlbHUfsklGuCzBvqNlK4FtsW3Y/6VIjWMT00+Y8ukWRxfVYuEAcsRkG8q6bfmjeGxb9w2XOfMo/3Zdd222Vs0yp0ZtS263bzuikK8fzCGc7cw9/0iOTn3FCvPIMPnqxFYCjY00OKH1i0+PuXTjvLui6/XQ/pswShMRLc9drnlqjUeq8r2hHhLVxjOcHLyOAyCRFex0Ev4L7e6Dib7W065XWFDTQCWBtFc9uK98kQpDYam+PEj759oIO4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(39830400003)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(122000001)(55016003)(83380400001)(71200400001)(86362001)(26005)(966005)(33656002)(6506007)(478600001)(7696005)(9686003)(76116006)(316002)(66556008)(41300700001)(66476007)(66946007)(6916009)(66446008)(38070700009)(64756008)(52536014)(8676002)(8936002)(5660300002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8zvYi0ZvVNA9xTi8J1yIyklCEjsvnrvyshHtOdP1aRQEHU4izA27hLpvhN+r?=
 =?us-ascii?Q?O4Ud6m+Wf/NOxeeK/xPLNbXEqzNJiuDcq54+qvbxCav62t0dQTi9SF5T/J3X?=
 =?us-ascii?Q?7VzaR01LkFXbaNUeveq/8J4Ct92ggDJROHPLCdcOL5Mt8k1so6NNCa6GDBhT?=
 =?us-ascii?Q?lQHZhWU0j56zfuwA0DDvnpk03kdY/sL0ZEX1C8WYQSAWszk+fLsZ3UUU1CxK?=
 =?us-ascii?Q?cjJcSR9PBVGjkReIglTfA2Ds3u02O0y7f4UljQE8SYHqvYtIWOOwyiB58Bdn?=
 =?us-ascii?Q?tpwyGbTJxkKX28h1ofQ1vsCXzSNC6uvE4E2g6+TyCOYYLDn7/DV2CHokxCR3?=
 =?us-ascii?Q?cZVCD65q6Va3iJ9ymg9O7GzFvw2KgMeBCtuH2IvRIwf4TFB/Yh+5hv7lUZ5Z?=
 =?us-ascii?Q?lhxDSoeAKfefp4NX60LzPmCtWhuV5cQk/tqRx+dJJr2gy0/8A7BnoAYfMrsF?=
 =?us-ascii?Q?bfgGUVz37BOcwl7y2Fu4PCOnU7SB3WswciJKigDULDYkFTZYt4LC0/v7HVEM?=
 =?us-ascii?Q?wnyKa0b67M12rM/Q0+WAeE11EqpZBd4fQhRYVHMzjtIh6uukJHmdhuP0b2P3?=
 =?us-ascii?Q?YR8jLsqOgThgUL9OrinGYcXOJhdv+IGtjXCqV9/f5amEqploVOk8K5ZfT5iX?=
 =?us-ascii?Q?A8GwrbQqtlJQHgmJ4LYhLRHU8ENy+61WjIi91PzTBKeV8en8FMUSPvr92OmR?=
 =?us-ascii?Q?fTiRwaRM/yjrjClYkfiBtU0r8jZE50HOkxHSJKzuV6UNS1qTG4mRky4lcyxJ?=
 =?us-ascii?Q?6n4wWCY2asdPYojMa0TDnu1N8c1UMkzQPyl32bnB3dVf+omf1W0txo8tklnK?=
 =?us-ascii?Q?qWCd5c3yhNn+wDIjsmwnjBkELIRgI+5v7x5UKkiC2pUzVAFq3SlN2qIfNlG/?=
 =?us-ascii?Q?2RmeJA9RAbYfNh0Mg+DqoCpCkjpKDqQomOTgTs/RDGCU803jnMGqIdsbGcLL?=
 =?us-ascii?Q?itHsvahVrzPnYuuxWU8ggfqEaarvV84HXFF2SJsktjZuxkqIMKvtLmtX2xhl?=
 =?us-ascii?Q?ZrzSZxI7nR4q2IvtuBdE58BWKdN4ad/d/co0PbLNQPJS5Nje7f++NTZMNsrh?=
 =?us-ascii?Q?UJ1QcCdxP2ToNLUu4rTeW/MQ6vVxULp+QzY2FhF9aK8PpnUnvD1yj2Qo8OoX?=
 =?us-ascii?Q?kQyYoeZZJgmPKVO8CAmJWFCDamm1CMsmbZPcVrNvHjMEyInIqsKXJ0iiRE80?=
 =?us-ascii?Q?WizuqBsJ6ht2mlkmzumbstCrDcvyfxx39khHIGOHkscPQY/N/bF70oDEbEwA?=
 =?us-ascii?Q?BdUvm5CfCXRnOqhfb5vZgNWPyfoGnh7fdgCcFeeDs7BN3pykXVFVcW+P8wbF?=
 =?us-ascii?Q?kQ0y4IrdenqYM8kPu+N6Z7fN5zsMEXFptyd1K8RIts4iQ8ILIEssuSFVvL4a?=
 =?us-ascii?Q?D7SlZ/9u1myu5hDhOnNYn7upuGPzKkELPWURpsWraPh9tkjXTlWzPFb1hNjP?=
 =?us-ascii?Q?EPhscAwQ3d0n/WAV9GOUS5qsCk3fUpW/FuAkcA1Iq7Z29t3udkp4m3CCO6ei?=
 =?us-ascii?Q?QA0Ucmmlr6bqd9uPwKxgST4zG5FY/FxxGBAdoVpP+m5OutqmCxtdpZQzI2M8?=
 =?us-ascii?Q?KHOuMK9yAhkUS+mfAEHwvNX2mQriPMCCUVJwW2GA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4a9b6e-7390-4b1a-bb40-08dc27ab8a0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2024 07:08:08.8298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UulzwK0X6Z4yc66i0GkH35kw4CMW9S5rcQkkUmNEXZdgJn62JoX5KfCjo7/qLhR+clwscsySzW01TxmgKVF9Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB6087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_230816_523981_E433AD30 
X-CRM114-Status: UNSURE (   8.22  )
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

We need to run multiple wcn7850 (Hamilton) cards on the same host.=20

A single wcn7850 works fine, more than one and all fail

Logs from a working setup with a single card using Ubuntu 23.10.1 desktop i=
nstall

[    2.494236] ath12k_pci 0000:03:00.0: BAR 0: assigned [mem 0xfe200000-0xf=
e3fffff 64bit]
[    2.494256] ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
[    2.496200] ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
[    4.993821] ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_i=
d 0xff soc_id 0x40170200
[    4.993827] ath12k_pci 0000:03:00.0: fw_version 0x100301e1 fw_build_time=
stamp 2023-12-06 04:05 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c=
5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
[    5.003142] ath12k_pci 0000:03:00.0: failed to fetch board data for bus=
=3Dpci,qmi-chip-id=3D2,qmi-board-id=3D255 from ath12k/WCN7850/hw2.0/board-2=
.bin
[    5.196430] ath12k_pci 0000:03:00.0 wlp3s0: renamed from wlan0
[    9.446866] UBSAN: array-index-out-of-bounds in /build/linux-9czVP0/linu=
x-6.5.0/drivers/net/wireless/ath/ath12k/mac.c:2774:17
[    9.447067]  ath12k_mac_op_hw_scan+0x39c/0x3e0 [ath12k]

Logs form a similar setup with 2 cards

sudo dmesg | grep ath12k

gives me

[    3.570029] ath12k_pci 0000:01:00.0: BAR 0: assigned [mem 0xfc800000-0xf=
c9fffff 64bit]
[    3.570046] ath12k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    3.570347] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
[    3.659620] ath12k_pci 0000:05:00.0: BAR 0: assigned [mem 0xfc400000-0xf=
c5fffff 64bit]
[    3.659648] ath12k_pci 0000:05:00.0: enabling device (0000 -> 0002)
[    3.660023] ath12k_pci 0000:05:00.0: Hardware name: wcn7850 hw2.0
[    4.910790] ath12k_pci 0000:01:00.0: Host capability request failed, res=
ult: 1, err: 90
[    4.910795] ath12k_pci 0000:01:00.0: qmi failed to send host cap QMI:-22
[    4.912112] ath12k_pci 0000:05:00.0: Host capability request failed, res=
ult: 1, err: 90
[    4.912116] ath12k_pci 0000:05:00.0: qmi failed to send host cap QMI:-22
[    4.913414] ath12k_pci 0000:01:00.0: Host capability request failed, res=
ult: 1, err: 90
[    4.913418] ath12k_pci 0000:01:00.0: qmi failed to send host cap QMI:-22

After running

sudo dmesg -n 8

then run

sudo dmesg | grep ath12k

again=20

[49523.559674] ath12k_pci 0000:01:00.0: BAR 0: assigned [mem 0xfc800000-0xf=
c9fffff 64bit]
[49523.559965] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
[49523.615645] ath12k_pci 0000:05:00.0: BAR 0: assigned [mem 0xfc400000-0xf=
c5fffff 64bit]
[49523.616109] ath12k_pci 0000:05:00.0: Hardware name: wcn7850 hw2.0
[49524.094457] ath12k_pci 0000:05:00.0: Host capability request failed, res=
ult: 1, err: 90
[49524.094469] ath12k_pci 0000:05:00.0: qmi failed to send host cap QMI:-22
[49524.095445] ath12k_pci 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT=
 domain=3D0x000a address=3D0xb7000000 flags=3D0x0000]
[49524.095668] ath12k_pci 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT=
 domain=3D0x000a address=3D0xb7000000 flags=3D0x0020]
[49524.096223] ath12k_pci 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT=
 domain=3D0x000a address=3D0xb7000000 flags=3D0x0000]
[49524.096307] ath12k_pci 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT=
 domain=3D0x000a address=3D0xb7540000 flags=3D0x0020]
[49524.096316] ath12k_pci 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT=
 domain=3D0x000a address=3D0xb7000040 flags=3D0x0000]
[49524.096327] ath12k_pci 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT=
 domain=3D0x000a address=3D0xb7000080 flags=3D0x0000]
[49524.096335] ath12k_pci 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT=
 domain=3D0x000a address=3D0xb70000c0 flags=3D0x0000]
[49524.096343] ath12k_pci 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT=
 domain=3D0x000a address=3D0xb7000100 flags=3D0x0000]
[49524.096353] ath12k_pci 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT=
 domain=3D0x000a address=3D0xb7000140 flags=3D0x0000]
[49524.096361] ath12k_pci 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT=
 domain=3D0x000a address=3D0xb7000180 flags=3D0x0000]
[49524.099587] ath12k_pci 0000:05:00.0: chip_id 0x2 chip_family 0x4 board_i=
d 0x10e soc_id 0x40170200
[49524.099593] ath12k_pci 0000:05:00.0: fw_version 0x100301e1 fw_build_time=
stamp 2023-12-06 04:05 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c=
5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
[49524.110011] ath12k_pci 0000:05:00.0: failed to fetch board data for bus=
=3Dpci,qmi-chip-id=3D2,qmi-board-id=3D270 from ath12k/WCN7850/hw2.0/board-2=
.bin
[49534.169968] ath12k_pci 0000:05:00.0: qmi failed set mode request, mode: =
0, err =3D -110
[49534.169981] ath12k_pci 0000:05:00.0: qmi failed to send wlan fw mode:-11=
0
[49534.169986] ath12k_pci 0000:05:00.0: failed to send firmware start: -110
[49534.169989] ath12k_pci 0000:05:00.0: failed to start firmware: -110

The error

[49524.094457] ath12k_pci 0000:05:00.0: Host capability request failed, res=
ult: 1, err: 90
[49524.094469] ath12k_pci 0000:05:00.0: qmi failed to send host cap QMI:-22

Would appear to originate in ath12k_qmi_host_cap_send(), I assume that all =
works but that the response read from qmi_txn_wait() is 90, which from qmi.=
h is QMI_ERR_INCOMPATIBLE_STATE_V01. No idea where to go on that!

Both the working and non working have this line

[    5.003142] ath12k_pci 0000:03:00.0: failed to fetch board data for bus=
=3Dpci,qmi-chip-id=3D2,qmi-board-id=3D255 from ath12k/WCN7850/hw2.0/board-2=
.bin

I used firmware files from

https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing

using the files from=20

ath12k-testing/WCN7850/hw2.0/WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SIL=
ICONZ-3

copied into the appropriate firmware file location

the last error

[49534.169968] ath12k_pci 0000:05:00.0: qmi failed set mode request, mode: =
0, err =3D -110
[49534.169981] ath12k_pci 0000:05:00.0: qmi failed to send wlan fw mode:-11=
0
[49534.169986] ath12k_pci 0000:05:00.0: failed to send firmware start: -110
[49534.169989] ath12k_pci 0000:05:00.0: failed to start firmware: -110

Appears to originate in ath12k_qmi_wlanfw_mode_send(), not able to find a m=
eaning for the -110 code.

Not sure if the later error is relevant given the first has occurred though=
!

Any ideas?

David Atkins


