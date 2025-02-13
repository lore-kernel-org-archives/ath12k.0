Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3720C021A6
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 18:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L86rz2INuqMLIKpQmCJYbnlT2jO9JwNru/tQ45YREaU=; b=p+asXEyBpWV8CPVHHKpvJF/uZj
	PzSBV12idUXfrg+nk6rAxF/uexiEkEpCrIabWvaQ2n9iWWDZJQGlXxLJ9MNlhr0wrZ4fgPCcQJC7/
	LODsEbn/G5BuJhP8X55JRmXLGrKHUxV2W+cQ2mQIdQpg01rMKA1b6ySxaFNX4X41NQOhvfWM6Kaeb
	tuukUnyBaylVEI9rcYD8fI2jozM+Tv8ty3jjfzGkvxa2+0MZyRBgrHmRE3zIRsgQJPi6mIAEV0NB/
	00D8av5LsAjW3Iz4zg9+rnkv1Oq3Hq3Vc7xIuOT60m3k1tCfBpwQ+udGTjjhuT+FbRa1ARclPWBBv
	QbrwQMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidro-0000000CDSq-35Na
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 18:23:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tid4h-0000000C1Pl-3x89
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 17:32:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DA70AL031744;
	Thu, 13 Feb 2025 17:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L86rz2INuqMLIKpQmCJYbn
	lT2jO9JwNru/tQ45YREaU=; b=jRWBxSrRObjjUlVcINRCbqpo8YiWM3kIEJsTgM
	WPsgyNhIPKCrRL0bGCEu5ZoPbG+2vxKct0B6UQV/7ftl1gloBhxzxGZkdsCazFpc
	ld4BnxcPJf8tl/9oJ33EKN+LepKL4OCCoDf1fFEFYPLiAseyIVLolUa7MTlZvAkj
	/fwurtNXhUuocvU5aYF1eH+c84l0or0hhfO+u6HZy7JKs2kG1dPrb8DHXjAYwsBG
	7csjCUfsc1mwIpamMXNPK5lC9gXAD590FxayqKuIc0h1XiQ64y+dUniWVt7C36Y5
	+hyPuJPtBTCsEWpAsxu2C6YshNaW5B+gOgkJHuOmwbFkKBxQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44seq014kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 17:32:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DHWTwJ014462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 17:32:29 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Feb 2025 09:32:27 -0800
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        "Sarika
 Sharma" <quic_sarishar@quicinc.com>
Subject: [PATCH v2 0/5] wifi: mac80211/ath12k: add support to fill link statistics of multi-link station
Date: Thu, 13 Feb 2025 23:02:01 +0530
Message-ID: <20250213173206.1665731-1-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IRV-5YIpCkXyqW_4398zS8JG5ku3cGOC
X-Proofpoint-ORIG-GUID: IRV-5YIpCkXyqW_4398zS8JG5ku3cGOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=663 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_093232_103008_66B292C4 
X-CRM114-Status: UNSURE (   7.82  )
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

Depends-On: [RFC,v2,00/12] wifi: cfg80211/mac80211: add support to
            handle per link statistics of multi-link station
Link: https://patchwork.kernel.org/project/linux-wireless/cover/20250117124554.3719808-1-quic_sarishar@quicinc.com/

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


