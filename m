Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E421C02188
	for <ath12k@archiver.kernel.org>; Mon, 27 Jan 2025 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jNusOLwzCGjEFFG6AQbqxawnhGTXt/OuG91h8atH580=; b=vBYGq6io62WKfIIeu2coBwYrHg
	qDRjbbPvmQ51H+DwD3aiGaSRDDqNukXYO/+Sn330SekmQ17H3ueAKkdLpYse2rttCCyrQu83J/M+9
	mKs+D3MyXaT5uMaEXYy2NTFQ99vseJnWNJkNjItqil6H9lgOHRFGlF6LDWEqOK/9JFVfJL4DOBG2M
	BQYFx3l8DndYzf9nRnMEm1wXjvm5rm2Ns3nEsFhz5j+b1skgiMDfAfSN30SHKxBA4OgsTNUW5b+Vs
	KkbX6uP+HGVBx6kGJWiBGVmmvZZXmFNEGdhFjnQQ3Px2qzuvRorE+n/OQMXp3m6lVk6eXHTHUfUQN
	pk1lDqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcMey-000000029tF-1S2Y
	for ath12k@archiver.kernel.org;
	Mon, 27 Jan 2025 10:48:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcMev-000000029sL-1IAw
	for ath12k@lists.infradead.org;
	Mon, 27 Jan 2025 10:48:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R6KbvF032374;
	Mon, 27 Jan 2025 10:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jNusOLwzCGjEFFG6AQbqxa
	wnhGTXt/OuG91h8atH580=; b=Y36pq8Rj7I0f818hHsV0L+WPO3h9xU+9Qgi2a1
	6p8QibPefkpRv68TX1BOlJHWs0PtuZK9OBqmmUpibj6xRFM2nBGTksaZrOhiJif6
	Ij3reSSB7x+Gcfbtb25S2SCqgZqTQeUAMwv7bnPl53mGvVMx6rWB07+z13Fgs3Ea
	k6kg0x2OKFhQJ3vIgi9rZuYJVRnSM5qY8B12wF5qVmtPY3Jeky2kevlP9WVW7OBa
	dr2UwgJMKwimcKeILnhfdvFKDvQn1Qxlu0UuvzM/WXPIFPtv9RkKluwbJhPGrxKC
	K4JDSsBLo05pZAPDxHz2OaniU1IQ5ipATMWmHnPyQWBRIYdg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e4su0g42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 10:47:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50RAlvkw030975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 10:47:57 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 27 Jan 2025 02:47:55 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v5 0/9] wifi: ath12k: Add peer extended Rx statistics debugfs support
Date: Mon, 27 Jan 2025 16:17:29 +0530
Message-ID: <20250127104738.4174862-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ufCdAGn813hydebvYHhAFRUyyisN-2fJ
X-Proofpoint-GUID: ufCdAGn813hydebvYHhAFRUyyisN-2fJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=765
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_024801_367585_2D8F21B0 
X-CRM114-Status: GOOD (  11.87  )
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
 drivers/net/wireless/ath/ath12k/debugfs.h     |   20 +
 drivers/net/wireless/ath/ath12k/debugfs_sta.c |  337 ++++++
 drivers/net/wireless/ath/ath12k/debugfs_sta.h |   24 +
 drivers/net/wireless/ath/ath12k/dp_mon.c      | 1064 ++++++++++++++++-
 drivers/net/wireless/ath/ath12k/hal_rx.h      |  433 ++++++-
 drivers/net/wireless/ath/ath12k/mac.c         |   18 +-
 drivers/net/wireless/ath/ath12k/mac.h         |    4 +-
 drivers/net/wireless/ath/ath12k/rx_desc.h     |    9 -
 11 files changed, 1955 insertions(+), 63 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_sta.c
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_sta.h


base-commit: 5e40b6ac64339a78a5fbf1009581aa43eb46c352
-- 
2.34.1


