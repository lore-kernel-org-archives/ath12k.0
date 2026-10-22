Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C76606A319
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 06:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XHpWqf0B;
	dkim=pass (1024-bit key, unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=tTNxSY4s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YFthrKfKmSAcUSyW22/xyDsvmiE466rfFMP+jKjZ0Dc=; b=XHpWqf0Bqyy8R+Rav2pxFHQSqc
	k3Gu3hZy09eCzRGm3uESPRDxsbAwALnGoVy0B1CFmPN1YO/K+OwAL7Kw5fqDLhHmzgBSX7EkQNnKz
	DVDD/Lgvh+AVZ2JWH9fFzv+A2I/G3ESx2mv2d3ZTxobG0066OglZYDz12irk4n6753oLgiq84Eae5
	Kc0kP6rZfHA6EscudPty7ealG51PqIrcEs3ek2pftC/adOL5xSdkgKYncrjDBmAWjyCkJA+rXeAZY
	WlZ5o288HwJHgsjMVkCBVaIhyYWM5kjLAU1xMKJCkwJ7i35SupA1/4NnOKvkwOFso0XHBpAJ1aAeR
	uJQ7C9aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlyD-0000000DRyQ-3ijc;
	Thu, 22 Oct 2026 06:08:09 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlyA-0000000DRxn-2xAs
	for ath12k@lists.infradead.org;
	Thu, 22 Oct 2026 06:08:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/65QGMTILYwsTzRUbTXv5WXgBxlfmoZ5HBMLJRGeC2GMYIoquIvJvGtIdExXmrvqpsDIHKACO+BhB/vNvinpNz8BBxoXyKR76m1HLp0SLwqwGhzszqfyFN0sylLGvfWG9hCAiysTolbQ4ja7N5nNZ33K9KX3ZGzXXoQftf9MAQu9Ee2sdj7iBWfyeLO60oE11Glk93wNzS/Hn8mP7VkxX99KyuLRpT/V+4nESbZgKxKCZo26i4/KGQkQCaxruDZOvXhjsRSRSrYNuyP9+jPlRZYPSwnTGEQx0Yi+bb6UwyZ4F81GGUDIvbXoPGW7BLVSCRtJm8yWU1FKhNodCiKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFthrKfKmSAcUSyW22/xyDsvmiE466rfFMP+jKjZ0Dc=;
 b=U7ghqlZgWMjon1eCXylr+JH8uCg7Qdhh+iEWEECBaL4kEmgH3RdQpbuSHtqAd9f5vj37T5lqwgbaCYsecm6Z0NobAAZtzpVJ/Gd5mfvnnczHciY5tW5fBn4t+AUY+o7Fea3p3uIBU1b8QzcZf4RtdOlBYfhDxvJ84h3DUJYkfAyV3qyU/XRSmEJr04AFNM+qu/+pL9d8Nx3nV0cmLAvyGA6JoknrbZlSZEr+ZOJaajlekbVhWDoYMHZnmzcdqG6Mq1FoUUKXaPb7365mGipY5Ll03cq1+s0X4+y9wJuZPCUzqH09Yl79bhpR+M9+OxggykfqDkC8wyal2/VSC6J9ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFthrKfKmSAcUSyW22/xyDsvmiE466rfFMP+jKjZ0Dc=;
 b=tTNxSY4s0gCNE5Wm0J7+dJwjg9R7R/YoDXXGCXxOeoUtmzTtOEnD0FxJIua3GyVls8E5XRKWNNlB1l/LB/a4Kfa0aB8wWBE2JX2Wv3AUeh0g0RlZl2CSnJ6k7rHWcbd1TYlBKdcap1Z+SiNJAFIfAWo/RNX+8sDMfY8vVlBTVMQ=
Received: from AM8P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::27)
 by DB8PR06MB6540.eurprd06.prod.outlook.com (2603:10a6:10:12a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 06:07:59 +0000
Received: from AMS1EPF0000008F.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::70) by AM8P190CA0022.outlook.office365.com
 (2603:10a6:20b:219::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 06:07:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS1EPF0000008F.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 06:07:58 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 22 Oct 2026 08:07:58 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: ath12k: WCN7850: PTP hardware clock and time stamping - which timer and offset registers may the driver use?
Date: Thu, 22 Oct 2026 06:07:41 +0000
Message-ID: <20261022060744.1385839-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Oct 2026 06:07:58.0559 (UTC) FILETIME=[AFCC3EF0:01DD61EB]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008F:EE_|DB8PR06MB6540:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 413c2144-28e2-4511-3efc-08df3002d25a
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|30052699003|376014|23010399003|6133799003|18002099003|261021123027099003|11063799006|56012099006|10067099003|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: f/LZjbeMUbiBKzT7v2pzpGv8xm5fTFiVlHZEOBCFgLU+h0munktUMq/n0TVlz1uwvLlBkX6mvSNLwoLp4j19Ol71Et6lxgp/77IO6moxGN5PT0t8fwnKdKyduFUWlF1avonH0w1iwXB7k8nLmiD/S1QDAisUmFA//EXhxcveD2bkd8BvEEm9AvHaCAUSz5wEJLB8gd+i/PY5EAnEdZSCbYVK72Qs4HF2h3N4MYItnUVogAFCIy0Lv0dlunbjJYhMLUgGntv1cRXlGKXaJp1T+h7wArlu1ZQ5Qso+JKLdtz+cDrO2gBhvEQAdfne0EMR2rr0CNpgp8oAGsWYENpCX6GeNo6iaG/tVFCaYokDx+UlY98Yz7mCVl4yB5OLzn3orCO7GOyzoqGbuI4f7vf8tfIqMw9IEDcxcmSNwfxcB5C90P+IY01q74BDOKtk3TuTFZzEOAdgcMKEQJN1vzz9jO4LJBlBCY0L0Z+zzLIpurcqgHsMe26BDqSy8Keh8qzZeMf7Cc2qz0HEYEmfYZoVDZEuzBO5tkSEEc6LtnoQvy/WbTkN6xHRuXchco05cewQf5zOQjPS0wuDw/upbr8pFqqyMGOptLnSwKJG1h8/hsMg2O7eO/yaTQ7EvGnV6IwZVlsmWLW+bNguNPti/Hj4vYCJ165LzWzPMfAvvShwgPZOcKRUAgb7wCTBzGZ2OFnhHPDYyjxRVhDSzo6inE1w3QA==
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(30052699003)(376014)(23010399003)(6133799003)(18002099003)(261021123027099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gcdw2g8KFaF9aUor7tJ//xKuTh8o7oEEl/+oGo0Xd97dycR9Y+dgg1Vc6/r7yKbLSos/YaKV6zr9rxWdDv/ye9vt/713STQrawMN2VQnUrJKtiwoYGDRrkBQxOHv1Q10H4UVtG7iXPH5I20JQICB5gUq898fiO4VqgAdd95W6LcZ8T7O7tEghRZbjD4N97tcLgSnlt6fheD75lT+3HljBhHFth053C9DoJq3oXFeYW/x1kmaXXAivPsoP589Cdr5HFnSpwtEB6kVPTHggkaftklmiM+whsBX09s0MxwPI88ZelDVsbcPSkw61I9E/PbnFxt+Q3KlX0wjcsWbDpYWqrxBpakrxcp8wY+2VtH3juO0+qS3PcawMX7Qia1AbJB5UyyHo4rHd6PaWOomCtjSMlgcU73BQv9ETWgYe/jMNGkkinn7PZwAbXH63vRcOwqP
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 06:07:58.6724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 413c2144-28e2-4511-3efc-08df3002d25a
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6540
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_230806_802642_A780ACFA 
X-CRM114-Status: GOOD (  12.71  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hoi Jeff, all,


we have hardware time stamping and a PTP hardware clock working on
WCN7850 (hw2.0, firmware WLAN.HMT.1.1.c7-00108) with mainline ath12k
(v6.16), so linuxptp and chrony can synchronize the system clock over
Wi-Fi. Between two WCN7850 M.2 cards on i.MX8M Mini EVKs, one AP and
one STA, the client PHC stays within 0.95 us SD (p99 3.45 us) of the
master over 6 h, measured against an independent Ethernet PTP
reference.

Before posting the series as an RFC, we would like to know whether
the pieces it relies on are acceptable in ath12k, or whether there is
a supported alternative.

What the series uses:

- PHC: the free-running Qtimer, read at MHI_TIME (0xa28/0xa2c),
  19.2 MHz.
- TX stamp: the TSF in the TX completion (rate_stats.tsf).
- RX stamp: the RXPCU_PPDU_END_INFO TSF minus rx_duration, from the RX
  monitor status ring running beside the STA/AP vdev (no monitor
  vdev), matched to the frame by phy_ppdu_id; MPDU_START (retry bit,
  sequence number, addr2) to detect retransmissions.
- Both stamps are mapped onto the Qtimer with the PMM global offset
  (0xb500fc/0xb50100), read under the UMAC awake handshake (write
  0x3004 = 1, poll 0x1e04040 for 0x2), as qca-wifi-host-cmn does for
  Kiwi (hal/wifi3.0/kiwi/hal_kiwi.c, hif/src/pcie/if_pci.h, public on
  CodeLinaro, branch wlan-cmn.driver.lnx.2.0).
- mac80211: a driver op to report the time stamping capabilities
  (get_ts_info), so ethtool -T and ptp4l see them.

Questions:

1. The Qtimer at MHI_TIME and the PMM offsets: stable across WCN7850
   firmware releases and chip revisions, and acceptable for the
   driver to read? Does the same hold for the other ath12k chips?
2. The UMAC awake handshake: is it the right way to make the PMM read
   safe from the driver (without it the firmware crashes), and is
   releasing it (0x3004 = 0) safe?
3. WMI_VDEV_TSF_TSTAMP_ACTION with a Qtimer capture request: the TSF
   report returns a global TSF of 0 on WCN7850, in AP and STA mode.
   Should it carry the global time? That would replace the PMM read.
4. The RX monitor status ring beside a STA/AP vdev, without a monitor
   vdev: a supported configuration? Is there a lighter way to get the
   PPDU TSF of a received frame? rx_msdu_end.ppdu_start_timestamp is
   empty on WCN7850.
5. Which instant do the TX completion TSF and the RXPCU_PPDU_END TSF
   mark? We see a constant ~16 us TX/RX asymmetry, and the mean offset
   moves by up to ~2.6 us between associations with the same spread.
6. Multicast and broadcast frames sent by an AP get no TX completion
   stamp. Is there a way to get one?
7. Would a series along these lines be welcome in ath12k, and is
   anyone already working on PTP for ath12k?


thanks and 'Gruß',
Johannes Schneider

