Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E0DC02192
	for <ath12k@archiver.kernel.org>; Thu,  6 Feb 2025 01:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ultex6AKGkfuO4aGfVVrUUGU3TEhgQVj/5NLiXk6QBQ=; b=thUEuyIMjAM8VErshWZUosKtWa
	SLD7zim9o+C/QKlNvzDSxZWxU4a4NHeGXT/IFZLfRXfe3Rwiwg3LksVMhN1R9Bt2nIU7Hmn/Wnzch
	6fxkmTAnMS8Zft8VAFG2rtbatk6Heuv7joZ+Q5decdrijTb78YocKPsISkHZ7vkAGRiF0+bU8e1ig
	TM8d3vtZtL93UGiWylUhtvbdRIaWWSWX/N0hn/xkqPOUJNbB6yiGRgLw09vB5+U5yCFBoQhCWB5jV
	k0FfQez8gKfK5JydavfJbiGdLeSa6wUpGO0rE59P0FGHVdnbALleDCW3IzKFo6nL8VWRG1np63ON1
	WzzIlOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfqrd-0000000501P-22JM
	for ath12k@archiver.kernel.org;
	Thu, 06 Feb 2025 01:39:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfqra-0000000500l-3VOu
	for ath12k@lists.infradead.org;
	Thu, 06 Feb 2025 01:39:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515GNjTC027031;
	Thu, 6 Feb 2025 01:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ultex6AKGkfuO4aGfVVrUU
	GU3TEhgQVj/5NLiXk6QBQ=; b=aDoVbf6kcumPXyaVwgLY/pavVH4jpp+QEsLEsE
	/20Ec670/mTu5vF3xysRmgW6sB2N5bsj2SZasHuuGx1wXdgszIOY21xxnTjIwpK6
	0oPz0c9h6meWH/StsoGq5iS4ShIsSx3/Df5iPHpBdioX15/674iPyHBoz+hT135X
	2MD2gFklZEQxHRiYoYpbuWft/Z0wJ9zfRERLo9VIci4VIoIOCkEx4X550Dmwnvzs
	pJ8v4YJ5HlD+NpzaEJLYlPgqHNPWgWHyse6Su/cyP24RVBEKl4M82K6on2MjSLV4
	kDeoVnh3+Pf380PMqQ4mdOfdKwsdxVTr6t9lUawc9m5OApsA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mbfh93ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 01:39:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5161dSE1003606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 01:39:28 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Feb 2025 17:39:27 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v9 0/9] wifi: ath12k: Add peer extended Rx statistics debugfs support
Date: Thu, 6 Feb 2025 07:08:45 +0530
Message-ID: <20250206013854.174765-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QlTZJmx4_IW92bXo4UzzKXdqLekvNGjE
X-Proofpoint-ORIG-GUID: QlTZJmx4_IW92bXo4UzzKXdqLekvNGjE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxlogscore=881 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_173930_994192_2D8D65A5 
X-CRM114-Status: GOOD (  13.67  )
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

v9:
 - updated the s-o-b as a last tag
v8:
 - Resend due to missed patches
v7:
 - Rebased on ToT
v6:
 wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
 wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
 wifi: ath12k: Add HAL_RX_PPDU_START_USER_INFO TLV parsing support
  - modified the return type as void
v5:
 Removed the patch "wifi: ath12k: Add EHT rate statistics support" since it
 is already merged
v4:
 wifi: ath12k: Add peer extended Rx statistics debugfs support
  - fixed the kernel test robot noticed build errors
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

Karthikeyan Periyasamy (6):
  wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
  wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
  wifi: ath12k: Add HAL_RX_PPDU_START_USER_INFO TLV parsing support
  wifi: ath12k: Add HAL_PHYRX_OTHER_RECEIVE_INFO TLV parsing support
  wifi: ath12k: Update the peer id in PPDU end user stats TLV
  wifi: ath12k: Add peer extended Rx statistics debugfs support

P Praneesh (1):
  wifi: ath12k: fix the ampdu id fetch in the HAL_RX_MPDU_START TLV

 drivers/net/wireless/ath/ath12k/Makefile      |    2 +-
 drivers/net/wireless/ath/ath12k/core.h        |   10 +-
 drivers/net/wireless/ath/ath12k/debugfs.c     |   97 ++
 drivers/net/wireless/ath/ath12k/debugfs.h     |   21 +-
 drivers/net/wireless/ath/ath12k/debugfs_sta.c |  337 ++++++
 drivers/net/wireless/ath/ath12k/debugfs_sta.h |   24 +
 drivers/net/wireless/ath/ath12k/dp_mon.c      | 1033 ++++++++++++++++-
 drivers/net/wireless/ath/ath12k/hal_rx.h      |  433 ++++++-
 drivers/net/wireless/ath/ath12k/mac.c         |   18 +-
 drivers/net/wireless/ath/ath12k/mac.h         |    4 +-
 drivers/net/wireless/ath/ath12k/rx_desc.h     |    9 -
 11 files changed, 1924 insertions(+), 64 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_sta.c
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_sta.h


base-commit: d132a72d768bae74d10e6539fcf6522dfdbd1115
-- 
2.34.1


