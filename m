Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F69C02187
	for <ath12k@archiver.kernel.org>; Sun, 19 Jan 2025 13:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I2AmqruUOLD6/2jeqltzi8h0g74jC1oDguA9vUDmlOo=; b=hDYnrNZZSlz52bn9Yc91omdqOn
	i4jywLaeuQ9gyUIbB/JnmtyWcdhl+wcQSPhcN8+K876wB+u2/DiKpBdy9CQFz45zP/xsXecQ8ihJH
	jN5N87g6JALPfVkHkz11rUy1SvpD2p9MDS9KAbUzg9+n2ZAQMxatV6Y8ba2eXg7xvBNUXmOyNuY7E
	V/izo5/sq/iEwurkPYMJwwNPPs9OQsPcaFeeIa7M+71KLqvOtmCvrfI//X9QxPIYayJRe0wMcOdqO
	senlWIIHAiAKNfCq1feVM7SiNmhJfkpczLTQnSkFwDhRc6LJdk6+r7pI80eOl8KN0QRIwPf5bQZPq
	ljmBHs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZVoh-00000003xyF-1qJM
	for ath12k@archiver.kernel.org;
	Sun, 19 Jan 2025 13:58:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZVoe-00000003xwt-3kuM
	for ath12k@lists.infradead.org;
	Sun, 19 Jan 2025 13:58:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J7HtYb013413;
	Sun, 19 Jan 2025 13:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I2AmqruUOLD6/2jeqltzi8
	h0g74jC1oDguA9vUDmlOo=; b=kBzWzRnf7wrgRky2nNTbiSpimv+m5PI10wHudM
	MFBRTAqBrTlHnmVMczWPpJc3km0/rEZxnqhlWZQTJK3gl13PQiDIRqTBN/0ylN4n
	Vf/pMv1cXQOZ2LQtvdfhwMVVl3jqtZpj57d/wa9+JdrW1Ci0o9VAipJbyEx+csF4
	4IZkVcMVnofMg6QOr04Jxtzj+ZB5YmHj/vtZgoFTXVYpHUheKJ1OY/U2d2ElBNXZ
	kXVuzMheOPJJj+f6YaV+7+hRRi5FXsgifxXW0F6Z87F+Hg8GllRIepXD82IY6ZUi
	Ccq8dKSfNsH361ACW3KwjBP69LKtQLypeRXoMrw1nkt3ZkJQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 448vv40cx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 13:58:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JDwBLL021364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 13:58:11 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 05:58:09 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v3 00/10] wifi: ath12k: Add peer extended Rx statistics debugfs support
Date: Sun, 19 Jan 2025 19:27:41 +0530
Message-ID: <20250119135751.2221902-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5QCLBY2hjRJnKQ1ByYbyXCiINE0yK_dg
X-Proofpoint-ORIG-GUID: 5QCLBY2hjRJnKQ1ByYbyXCiINE0yK_dg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-19_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=765
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_055816_952440_6C3B8725 
X-CRM114-Status: GOOD (  11.27  )
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

Currently, peer extended Rx statistics are not supported. Peer extended Rx
statistics are collected form the TLV data reported in the monitor status
Rx path. Therefore, add support for TLV tag parser handling and debugfs
to configure and dump the collected information. Additionally, this series
does not impact the WCN7850.

Depends-On:
	[PATCH v2 00/14] wifi: ath12k: Enable monitor ring for updating station dump in QCN9274
	https://lore.kernel.org/all/20241223060132.3506372-1-quic_ppranees@quicinc.com/

v3:
 wifi: ath12k: Add peer extended Rx statistics debugfs support
  - avoid ext_rx_stats filter overwrite in default filter setting
v2:
 wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
 wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
  - fixed the length calculation in the EHT radiotap procedure

Balamurugan Mahalingam (2):
  wifi: ath12k: Add EHT MCS support in Extended Rx statistics
  wifi: ath12k: Refactor the format of peer rate table information

Karthikeyan Periyasamy (7):
  wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
  wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
  wifi: ath12k: Add HAL_RX_PPDU_START_USER_INFO TLV parsing support
  wifi: ath12k: Add HAL_PHYRX_OTHER_RECEIVE_INFO TLV parsing support
  wifi: ath12k: Update the peer id in PPDU end user stats TLV
  wifi: ath12k: Add EHT rate statistics support
  wifi: ath12k: Add peer extended Rx statistics debugfs support

P Praneesh (1):
  wifi: ath12k: fix the ampdu id fetch in the HAL_RX_MPDU_START TLV

 drivers/net/wireless/ath/ath12k/Makefile      |    2 +-
 drivers/net/wireless/ath/ath12k/core.h        |   11 +-
 drivers/net/wireless/ath/ath12k/debugfs.c     |  100 +-
 drivers/net/wireless/ath/ath12k/debugfs.h     |   21 +-
 drivers/net/wireless/ath/ath12k/debugfs_sta.c |  336 ++++++
 drivers/net/wireless/ath/ath12k/debugfs_sta.h |   24 +
 drivers/net/wireless/ath/ath12k/dp_mon.c      | 1064 ++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp_rx.c       |   15 +
 drivers/net/wireless/ath/ath12k/hal_rx.h      |  430 ++++++-
 drivers/net/wireless/ath/ath12k/mac.c         |   19 +-
 drivers/net/wireless/ath/ath12k/mac.h         |    6 +-
 drivers/net/wireless/ath/ath12k/rx_desc.h     |   10 +-
 12 files changed, 1976 insertions(+), 62 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_sta.c
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_sta.h


base-commit: e7ef944b3e2c31b608800925e784f67596375770
prerequisite-patch-id: afb04ab90da26435239077de723d1276946a194a
prerequisite-patch-id: 1b12bea72973c14f461b8202eed9432f27932876
prerequisite-patch-id: a6719494f46b8568504be8c64255676e67b4deda
prerequisite-patch-id: 054756eb1705babff324a743e62685bb78035198
prerequisite-patch-id: 889c4a0174fac23261705a42b46e923d7e7a0a18
prerequisite-patch-id: ea0321fbd8a59c09191873f59b6aea8225f4b8e5
prerequisite-patch-id: 3c8ccb635d319f8755649e445b68feb615fd82c4
prerequisite-patch-id: d516b2a3196218f42fdf4567516a1fd2c8b4c40f
prerequisite-patch-id: a2c59b4e468384e27d934a986e5fe9a951685fd9
prerequisite-patch-id: 359fecf93ef53f39243cc1b3466ab06fbd33cc71
prerequisite-patch-id: bf0b6542c65299c0bfa7fef2da6f09dd8453c39f
prerequisite-patch-id: 1dc79cafb399be590d1e418afcc5a719ae35834f
prerequisite-patch-id: fb1e39f2dce024ff692b0e6b112dc90c6a43ad00
prerequisite-patch-id: 9ea3943ae0b6e6a5a09cb648eaa35f8087967ac3
-- 
2.34.1


