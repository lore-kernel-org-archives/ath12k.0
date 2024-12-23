Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13C0E7718D
	for <ath12k@archiver.kernel.org>; Mon, 23 Dec 2024 06:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5mP4p+HWYZf73Sj9F0DdpPky+siigckD53zfda/AbI=; b=RDuc37SxRk8erU3/y27A4f2WJW
	PJmI267gEf3FBqZWJmTHxKur3g+VI0cmZVdBx1qzb92p6BOc9tFMT74lcfmv8gY8HGGGxnKgkaSLC
	fySnqjv2ZYIbigQEYC8ytZHIGKh+7lRTkwQOCjdxbKM6j0SNJ8ScYhpu45sqxg++M1ytkrpGpXG/5
	1HMw7IsqdCpGHxOFFTkyc7mN6kGi4BIOT+OrgPyuyG8gQYOSrT+KPns6Sd5kCU27KPGMeBUX6zj9n
	qYPLjpUQnLeBrDKjuh3UdMKerYmJ//W6zj2hUHH8UgffrvdPUC7+Ynh9whacqUu+R/OLmzl5Lij7X
	DaLt+deQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbWC-00000009NWo-2t6J
	for ath12k@archiver.kernel.org;
	Mon, 23 Dec 2024 06:02:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbW5-00000009NOO-3dyI
	for ath12k@lists.infradead.org;
	Mon, 23 Dec 2024 06:02:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BML7iqN026695;
	Mon, 23 Dec 2024 06:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5mP4p+HWYZf73Sj9F0DdpPky+siigckD53zfda/AbI=; b=S+kh6jYyMJ5mgOvv
	hpXG900xeU4qloU3UFA74htg50e4oGEk8YAiVuve56ONaxepxVrkF2jSHcg/s1TE
	V7ZLhhT77CFqYdjba6pmQFhYSbx0YyWntUx2LrTl9mufY+9pDS1C+RROHJkv6sHh
	4/gAj3vEXBl7+GZNdt3s7UdRhroCtTFw+JtS93JJfK+EK+GKYoLWDY9UKKntysNQ
	27+HS0nkwEkMJ786Y/3XaPKmZjhttVLYrt9ByYuqb1Iw2193O3Ug1VTntJsvo93c
	mO9R/fFzy7h1wBHoqALbJQWAJi/93TFuPau5wjaOPm4gk2T4twgu9S92IK58Pl/3
	dsNkkA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ptdnh9eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 06:02:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BN628Dh017722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 06:02:08 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 22 Dec 2024 22:02:07 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH v2 11/14] wifi: ath12k: Handle PPDU spread across multiple buffers
Date: Mon, 23 Dec 2024 11:31:29 +0530
Message-ID: <20241223060132.3506372-12-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223060132.3506372-1-quic_ppranees@quicinc.com>
References: <20241223060132.3506372-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ViPZSX9kcL-HNW_Huar2ZDixgwtb1PeF
X-Proofpoint-ORIG-GUID: ViPZSX9kcL-HNW_Huar2ZDixgwtb1PeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxlogscore=798 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_220210_000592_9D806E5E 
X-CRM114-Status: GOOD (  13.20  )
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

Each PPDU contains numerous TLV tags. HAL_RX_PPDU_START marks the start
of the PPDU, and HAL_RX_PPDU_END_STATUS_DONE marks the end. From the
monitor destination rings, the driver retrieves skb containing these
TLV tags and their corresponding data. Sometimes, one PPDU’s information
spreads across multiple skbs. The current parsing logic uses memset on
struct hal_rx_mon_ppdu_info after parsing each skb, leading to information
loss if a PPDU spans multiple skbs. Fix this by setting the
ppdu_continuation flag when the driver fails to get
HAL_RX_PPDU_END_STATUS_DONE, and do memset on struct
hal_rx_mon_ppdu_info only when the ppdu_continuation flag is not set.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 8 ++++++++
 drivers/net/wireless/ath/ath12k/hal_rx.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index a11b39ae3774..4b35dfcbdfe1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2419,9 +2419,17 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget,
 	if (!num_buffs_reaped)
 		return 0;
 
+	/* In some cases, one PPDU worth of data can be spread across multiple NAPI
+	 * schedules, To avoid losing existing parsed ppdu_info information, skip
+	 * the memset of the ppdu_info structure and continue processing it.
+	 */
+	if (!ppdu_info->ppdu_continuation)
+		ath12k_dp_mon_rx_memset_ppdu_info(ppdu_info);
+
 	while ((skb = __skb_dequeue(&skb_list))) {
 		hal_status = ath12k_dp_mon_parse_rx_dest(ar, pmon, skb);
 		if (hal_status != HAL_RX_MON_STATUS_PPDU_DONE) {
+			ppdu_info->ppdu_continuation = true;
 			dev_kfree_skb_any(skb);
 			continue;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index b08aa2e79f41..294583edd7a2 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -231,6 +231,7 @@ struct hal_rx_mon_ppdu_info {
 	bool first_msdu_in_mpdu;
 	bool is_ampdu;
 	u8 medium_prot_type;
+	bool ppdu_continuation;
 };
 
 #define HAL_RX_PPDU_START_INFO0_PPDU_ID			GENMASK(15, 0)
-- 
2.34.1


