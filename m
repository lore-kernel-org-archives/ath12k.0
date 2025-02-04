Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A4DC0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 03:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/kdnAgNU+LnK4VpxBSPzpVHWdavjF3MUTH1is2900w=; b=p58ufCha3NsmVIo/O2vrKib2y2
	Z49nsSbXFJj06nlHv59nfB3G/ZuM1TaaYInMGVqgS/gLss9Ns7TKtXHhhrvy60WE5uBF4DMNDM4h8
	LoFRwWr9zn90EcBIURcakh8ed2iu20rqllhAvO/8zKVy4PxHgKVAZ6eAZL1coiYn1W7crgfSkuVzZ
	Y74Bs7JdmGtVAupbr+EjQ9EG9ujw4KPd1WP+DXDKOHyhxbyUaml4TJG4jxmJ9Y1K59PlwVy7L6Py8
	zdHeac3lD3Sau6SxOect6+hIkI/GazexZjo1ghNjAhSbvO+WKAOjHQCpGu/NEni6Wq53xAK63Qjds
	nmnhLaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfA4M-0000000HCeZ-2bLp
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 03:57:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfA4K-0000000HCd5-1thN
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 03:57:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141Rr8G024890;
	Tue, 4 Feb 2025 03:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t/kdnAgNU+LnK4VpxBSPzpVHWdavjF3MUTH1is2900w=; b=gTa/i4t4NzD8mpQV
	yROC79bG0lXp2ImCbz0gM+L/5sJJZMED0NwQ1KXjcbmL6CJkgU1vJDK7IYL6aJJh
	ykm/9ZBcC0PI0EkTkJmwrnabibHAbMHrPWH3PzRzdvUhyUnlKZR1S4Mf3KJoo+cy
	zL0Tc8ao2ShpKLR7I772S0E7aHtss3b8MEaRDaO2ZNg4xb/9q+7vdbEV7OkItGMv
	njXsc8Jd68Be5x7iYQPMBTqD22YhlY0g/SsAvVN15rp1aUlfiwl6eKz1dV6ThXW6
	2Nv0QeuGTk9kAbyfkDio3cduWqAYFj+OVheF5tpOJDp6gNMc/IGfqgtTmRsWjcCb
	tvTCSA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k98jg7qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 03:57:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5143vloO019521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Feb 2025 03:57:47 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Feb 2025 19:57:45 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH v8 5/9] wifi: ath12k: Update the peer id in PPDU end user stats TLV
Date: Tue, 4 Feb 2025 09:27:14 +0530
Message-ID: <20250204035718.3227726-6-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204035718.3227726-1-quic_periyasa@quicinc.com>
References: <20250204035718.3227726-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vHlxw-SdDIEqiZugFLne8yQcNaAdGdYT
X-Proofpoint-GUID: vHlxw-SdDIEqiZugFLne8yQcNaAdGdYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=974 bulkscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_195748_488444_41E6A817 
X-CRM114-Status: GOOD (  10.86  )
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

Currently, peer id get reported in the PPDU end user TLV tag. But the
monitor status handler is inherited from ath11k, but it was not updated
to incorporate the changes made to ath12k 802.11be hardware architecture.
Therefore, update the peer id from the PPDU end user TLV data to get latest
peer id update, it helps to populate accurate peer information on the
statistics data.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index f4552bc05eef..c4c5db5d5ffb 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1504,6 +1504,9 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k *ar,
 		ppdu_info->num_mpdu_fcs_err =
 			u32_get_bits(info[0],
 				     HAL_RX_PPDU_END_USER_STATS_INFO0_MPDU_CNT_FCS_ERR);
+		ppdu_info->peer_id =
+			u32_get_bits(info[0], HAL_RX_PPDU_END_USER_STATS_INFO0_PEER_ID);
+
 		switch (ppdu_info->preamble_type) {
 		case HAL_RX_PREAMBLE_11N:
 			ppdu_info->ht_flags = 1;
-- 
2.34.1


