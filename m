Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0949C021BE
	for <ath12k@archiver.kernel.org>; Thu, 27 Feb 2025 04:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2fBkDN6g3V/Vwbh9XAPI1K5QU/WxRT6Ay3lfITV7lxY=; b=vpeVWky2K4+WOGCaa3GaByGAey
	NpJ0E1rT5ffcS/JLL9kPXG8GVmH3Y5m/kovptM2PsARoJLNZSjHJcDa0WYEY2B+boKer0EehNhqfb
	IJ58YWudXpE1ZUJrSY57VXUikhMr4des1guo3GRAxflwUDFkppsRTfagdJs12GpMkhh9WMZBKhS/G
	DyetAjt0yOyXFTn28JlPXI6ivAHtfHFN0DhAtcy6AZFPc+//kfYpElieKprh15KVehbxAENXBGukM
	tSbwSJWPDf7fkkQFmze+4DiBOWVWpBJbO2Wnveox9ZcxKXa/m53hyVQ9a0a/C9mdO5Z1xB2/HOnK/
	jEcLlUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnVyx-00000006Kby-2p3C
	for ath12k@archiver.kernel.org;
	Thu, 27 Feb 2025 04:58:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnVyv-00000006KbA-2UHe
	for ath12k@lists.infradead.org;
	Thu, 27 Feb 2025 04:58:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QGHUrN022657;
	Thu, 27 Feb 2025 04:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2fBkDN6g3V/Vwbh9XAPI1K
	5QU/WxRT6Ay3lfITV7lxY=; b=JDmxW4GYYV9Dtwc19968T2oD4jHn/9b7yC66lg
	Ga4nxPFZL6SDrbbQiSW6Te12in4e/uOM8vn4VmEZkdLCAdklwrY5jGmeEMlpDyhp
	cFn2WeCNfc0Vb7yJvBN19+0uCwDlNBjqVjBFleJF9ZPaRsGPoc1uC/y/MwHedwnq
	wib5527pNN4MZ39QofFlcXOEuoE4zDQGOlQI78WI3GDixTtAyolgJCQa26+PNe2h
	849crfpC9lX2GIK4cbByTiLJd2Wz3C1+sVUUFBYFzIKZeKqjyAeNQgdz/Jo1wtaW
	f5aH5fuz3Bohs8p2b9zQBW40pqkqoZVuJ7bbyE22OBu6dwUg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4526bj1qhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 04:58:42 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R4wgQC021818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 04:58:42 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 20:58:40 -0800
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        "Sarika
 Sharma" <quic_sarishar@quicinc.com>
Subject: [PATCH v3 0/5] wifi: mac80211/ath12k: add support to fill link statistics of multi-link station
Date: Thu, 27 Feb 2025 10:28:19 +0530
Message-ID: <20250227045824.91480-1-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xkXMff5SdIs20yunphj68anehcJR4GY6
X-Proofpoint-GUID: xkXMff5SdIs20yunphj68anehcJR4GY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=678 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_205845_640584_07A1F96B 
X-CRM114-Status: UNSURE (   8.33  )
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

Currently, station statistics are filled at deflink for both non-ML and
multi-link(ML) station.

Hence, add support to fill station statistics for the corresponding
link of station.

Depends-On: [RFC,v3,00/12] wifi: cfg80211/mac80211: add support to
            handle per link statistics of multi-link station
Link: https://patchwork.kernel.org/project/linux-wireless/cover/20250213171632.1646538-1-quic_sarishar@quicinc.com/

V3:
 - Fix kernel test robot build error

v2:
 - Convert RFC patch to actual PATCH with each patch bisectable.
 - Add new patch to update bw for ofdma packets.
 - Add new patch to fetch tx_retry and tx_failed packets.

Sarika Sharma (5):
  wifi: mac80211: correct RX stats packet increment for multi-link
  wifi: ath12k: add link support for multi-link in arsta
  wifi: ath12k: add EHT support for TX rate
  wifi: ath12k: correctly update bw for ofdma packets
  wifi: ath12k: fetch tx_retry and tx_failed from
    htt_ppdu_stats_user_cmpltn_common_tlv

 drivers/net/wireless/ath/ath12k/core.h   |  2 ++
 drivers/net/wireless/ath/ath12k/dp.h     |  2 ++
 drivers/net/wireless/ath/ath12k/dp_mon.c | 23 ++++++++----
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 45 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/mac.c    |  5 +++
 drivers/net/wireless/ath/ath12k/peer.h   | 27 +++++++++++++-
 net/mac80211/rx.c                        | 15 ++++++--
 7 files changed, 102 insertions(+), 17 deletions(-)


base-commit: 704a2d7237043317ed1b0f8a08203e9ddde70097
-- 
2.34.1


