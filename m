Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D43C54E58
	for <ath12k@archiver.kernel.org>; Sun, 24 Mar 2024 13:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gZ3LiAQXWTcrjJd7FTfGo3PA1sQBKTBvVUXPrRFEROk=; b=OipWZi3T50OS6g
	Yx4i6gXUeapQXxKpoKvs37O1z/4TGRl4sdgwCR+0jC3q0FykqNoK0hsgVQWxPME41Vcy+2lMhTiKO
	zzO55fVOvg8p8kiNL8CDhak/mc6t1Xg7JnzpkCtZN5w+m6cxZiO9qP9op6QNZ2P1aXQH+1ti/CV6N
	ZHeMfsg7+eu16EgFBDON0BQ/EFxjq12kIp6pOJzTXYkcinGNvlq8TtnqmyYMvmLYtwrq063ZtikiN
	1zmqbsclPHw2HAZFohfGDgHqL4psfssTYt8yeqpGo2pjl3P5jjpAWNd15GOWrCIQteKWf372p8t6I
	l8k7/2zbwW5QzgY9WdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roNxK-0000000Ccid-1EAn
	for ath12k@archiver.kernel.org;
	Sun, 24 Mar 2024 13:32:10 +0000
Received: from mail-lo4gbr01on20701.outbound.protection.outlook.com ([2a01:111:f403:261a::701] helo=GBR01-LO4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roNxC-0000000CchE-0K0w
	for ath12k@lists.infradead.org;
	Sun, 24 Mar 2024 13:32:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPlGRxbwd3BXOhyLe21rxhDHjqXO125qIwHYokQKFFZyoEW5MKQ/ylYmHqQKMP2JVGummevmFVrjaT3bbZrNss/iu85UdnPK4lbdpM/o2EZaka1NvwqTUQXHdiGq5PkLQNQ17cgcRph3I2DYAz3XrkkjwKxv4UKGeiiAWQKlLqLe3i+JYHcynAM5U3hhOwQqv5RqZGkb35Wfbwbxa3D9UNRfT14MYKxpsmayT3xW6IWBToqM9mzkgBaPmcDM7wO9astwf5G7YaG723WFU/aCeznY11rNHPTrRBF2XMEiGZdpgCyOw4zwzJiwsGk0+ZgcUSw/m4lzFg4iKGwQDYlPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZ3LiAQXWTcrjJd7FTfGo3PA1sQBKTBvVUXPrRFEROk=;
 b=jtP9OUXJHYOzbiLHxKGwyZ8mftyNZFbfge/fMFKM/Aaq4KAeLPQ1ilzwEkzZLpCCCAyERKOiLH2Nx+wqSr0DSYCho0m4L4dL31PnwlUli0JetIXygpdKccj1LM0obT8vyRYjTnNRmeQcQoiy+BXs012mvxOupap4JNJxlMif73wqUAQhJ1Zv2kGGl39xga4QSEql5hi2u5pygMjE5Y70fkq4mpwThvH+dtWMY8dn8E4kjo3jMWovNfb8jU/w/oiBE0iOyl6otLW8gxtufZKF7qbId/Pp4Nmpce5+LOFvxNojDL4uDNTRgUg/5sUgX0AxZ7dq04Pop0EGYxdm32eAbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=3adesign.co.uk; dmarc=pass action=none
 header.from=3adesign.co.uk; dkim=pass header.d=3adesign.co.uk; arc=none
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:182::14)
 by CWXP123MB4309.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Sun, 24 Mar
 2024 13:31:55 +0000
Received: from LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::2ce5:9af6:5c25:92c9]) by LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
 ([fe80::2ce5:9af6:5c25:92c9%3]) with mapi id 15.20.7409.028; Sun, 24 Mar 2024
 13:31:55 +0000
From: david Atkins <david@3adesign.co.uk>
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: QCN9274 - x64 host - board.bin issue
Thread-Topic: QCN9274 - x64 host - board.bin issue
Thread-Index: Adp9752y2kbQEd0ER/+VIXgyiMbgEw==
Date: Sun, 24 Mar 2024 13:31:55 +0000
Message-ID: <LO0P123MB4057F490A401955C653A0280D6372@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=3adesign.co.uk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P123MB4057:EE_|CWXP123MB4309:EE_
x-ms-office365-filtering-correlation-id: 2072ccfb-d5a2-4b86-acf1-08dc4c06c5bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iRUHxDuGAMuzN7MB1SJ34strPk1sBP6svQ+WK4zVDuY3GBfV7Y8Qr3Ihz93VJ2rjCQ2vQymw2my4YKDMG5B/mnWjXp7kYZX3PR4GHgXV853WTU/qGi+hH6tFHS7KGyhpgs/dsVMMLDimDJsdGTZraLILaOFbnDmGKoOTdIcgIg5I6Gzx1yRTEYffTH4MRoO8Cu4gyoKdHZx8ejE6ex8Z1ACFblUuZccY3B2/4C30C8jmKwFOKqLRHcLfJjFyupJ4SyfN74NZp6cBv8FoNJNhUS7qpFNtsvtgWp7IuOWFFE2qo0D7vnb0hRdm70WTS4W1hQ6jp7PSpEEFFGOpw7KZ1j+CT9zKiyV7C+YgB0xZXXAQzAYhYvjykVDTkEJtxeKiKgytNUX1TaPYNj5pzHE58o5ZVs8Iy8mhZZWMsLTBFMMLoXBWAHtUkRF4oLGmqRE23dRgxZohk7RDF/EmMtonU4DTA6KE52qdA/Bd18w2N1YTBlfdJS6WuKYJqU9M8L00kJPs7e1ZiLl1DVPOu6lUHzHxIyRMd+XU6BnbQTwTE824hBV/MnvoPzxTdi566p4TYcjmcEBgs8e3jXEKNCFflbOZD+OYTNFzvfCizYnhgzXcK2Hi92kafOumrNTAAhQK5qkZN0ZMngqs5BfpqBJXoQ9Sr3+/93nySo84mp5rB+A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gAytwv4C2KCySOSgrgJGeLHPzuFPNFbU9+UqX/UX9QwEF1uWHz7qZhFO7Jnw?=
 =?us-ascii?Q?SeHms8rHXy4KL4orz/DNNQz8Fg8vFdulvFnN4JaOZGCDQSy4OZzm/VzydOes?=
 =?us-ascii?Q?Udhz+QhLh/fCY2WSRg7zyHE7bH46ym+cifEM7sK2prYsdW25txBOafARFsRk?=
 =?us-ascii?Q?btAbMO+ahp4kFSWeRjBcTo9GvUVD86kyJDruWKdd+gqSgRmToo5NIAo1Y3nS?=
 =?us-ascii?Q?aDHdekv9JmeRWPASJYSoRUncKv/XUDUdfZsZFU425H+4rf8rqd8LcF8WfoDZ?=
 =?us-ascii?Q?+Tr60z/TjPXKA0oCUrt5rU8LvspaFOubwKl6VZcV5v0+2vXDLW+QCKwgXzBY?=
 =?us-ascii?Q?GddD5bSa07GcV0utICqxGrrmNLGTv7uEpfpkIvylTZnRd6y0UP3Iu36e8686?=
 =?us-ascii?Q?8MULMLcoFDD3Idf/M4N2FPQFFmMe+4xY0RGL4RWHfDMLp2oN0LKreID98Mn7?=
 =?us-ascii?Q?QMtQ7weAZrztznh0aCslWOuWTKQ3QqEIcCcTKtd/onZ2nqvllhoODhphL+d0?=
 =?us-ascii?Q?S+APuOh7NslG/nNeX484zm45X0IMkIDRnNVQY5Nlhz2oYaKcTFG09+BSEzhC?=
 =?us-ascii?Q?yfu3kv+ldmDOSLlWcfPEtrbSaAexwaD46UHMf36JTQlIeIGnv4jMCjFzQNc2?=
 =?us-ascii?Q?iRyfsIJOi4tlFOlTqtFvf0nE2DXeAxXHUAO0Ym3sQCTXn0xHoGxacCi4ISkR?=
 =?us-ascii?Q?J2QxTX32HtyLCjiQ1KwEqjqYbd3mXhEjr26D2BMvLEfPeVVlAz19psAJyZj6?=
 =?us-ascii?Q?UOCgNgisAN5XzveLGj8ClMu+QNbFpmmyr9Lkpl8XjnGwIlhPruno2O2805+N?=
 =?us-ascii?Q?4VeQGwmoUDKWUF9V0OlnQvOZr/wjuGmOEhWZwD2YlaUhlrUc12jHK2IZitSw?=
 =?us-ascii?Q?MiJ2sJvL+pPT1glf+slmfpLGvjHTBqCScjBww5dgzY4DNv9MOWfoog12M+D7?=
 =?us-ascii?Q?tkMM9/f3Or10i13ipwxEX4PM7xoV37eu3ufPjUy6aEIaGjY3JfQPfslsWRBp?=
 =?us-ascii?Q?tCD/+AODLEY/j1dgbw/55775OIEQAPNXk9cjH/6gt7C1oOiOWEz5mogPp69E?=
 =?us-ascii?Q?0lQ5o/yjSYbySdY8fD65mpMg8Fv2iSGDtcfAzt3h89meZyLmHWmVH06H1uib?=
 =?us-ascii?Q?UiRT+QfVS+UjVmP+UO2RBti5iWBGsc8GlnTQcpw+z4dqEMuhCODXnDB1jXw3?=
 =?us-ascii?Q?8am3GPeCx8KHF8Nf/NUPelvkjlpIe1z0APZDoZg67xrtv/h9e5D5Cl2R5k1N?=
 =?us-ascii?Q?KBcbo5irJgQN6+mIMA3LRR3qHMrMUG7A3r4XvmLiNeDb6h2JMwQ1gkxQTFp8?=
 =?us-ascii?Q?cgOMmzmxJZ+vMGjS0ccnifJsJGdA86CkyddBvFng0LV63qgCqS/daI+tsgfO?=
 =?us-ascii?Q?39RPOGjvb68YwRtx/KWOytvGKKUWOdaQCeVeCzTrr5x5uxHF1NOIHYXNk4hx?=
 =?us-ascii?Q?0pYJjbhIBSA32eAyJbhgcmJuO00rOAXQXplcZUBN9F+WmIRiqTfaR9ZxK1Ww?=
 =?us-ascii?Q?9Hf+PqdqPBZks6WD2F6EJ/T0Ejdffq53vAjscyLq1/6WISrONi8XLkOvZtWJ?=
 =?us-ascii?Q?DAHiJWfemW0QcWTAucajdCnVLlANXBIJLVZFgzqZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: 3adesign.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2072ccfb-d5a2-4b86-acf1-08dc4c06c5bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2024 13:31:55.0443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b153f19-49d1-4c9d-8de6-70aea15d7add
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ichCpJezDFZdNcqEn52lLZbsCIoFPq5G0EqqMJQPhIHymOcZG26XCcFJGlxRKB086cC1md+LbIW7Efwimspy3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4309
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_063203_797196_63FB2B36 
X-CRM114-Status: UNSURE (   6.60  )
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

I see a bug raised on Bugzilla

https://bugzilla.kernel.org/show_bug.cgi?id=3D217971

I'm seeing the same things and given its only a few days ago assume no chan=
ge, I have done a fresh pull of the ath12k repo you suggested we use

uname -a
Linux openwrt-wifi-test 6.8.0-wt-ath+ #1 SMP PREEMPT_DYNAMIC Sun Mar 24 08:=
23:14 GMT 2024 x86_64 x86_64 x86_64 GNU/Linux

[    2.925041] mhi mhi0: Wait for device to enter SBL or Mission mode
[    3.335626] ath12k_pci 0000:03:00.0: memory type 10 not supported
[    3.340770] ath12k_pci 0000:03:00.0: chip_id 0x0 chip_family 0xb board_i=
d 0xc soc_id 0x401a2200
[    3.340777] ath12k_pci 0000:03:00.0: fw_version 0x1011001d fw_build_time=
stamp 2022-12-02 01:16 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.WBE.1.0.1=
-00029-QCAHKSWPL_SILICONZ-1
[    3.356629] ath12k_pci 0000:03:00.0: failed to fetch board data for bus=
=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D12 from ath12k/QCN9274/hw2.0/board-2.=
bin
[    3.356657] ath12k_pci 0000:03:00.0: failed to fetch board.bin from QCN9=
274/hw2.0
[    3.356668] ath12k_pci 0000:03:00.0: qmi failed to load bdf:
[    3.356670] ath12k_pci 0000:03:00.0: qmi failed to load board data file:=
-2

Is there anything I can check or help with this? Different hosts? This was =
amd I have 4 different setups 2amd 2 intel I can test with if it will help

David


David Atkins


