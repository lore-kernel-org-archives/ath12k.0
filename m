Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0DBC48286
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 04:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mSKNHW6N3wUJJd8WcY9isE77vwY00ukugURjUTtcvE=; b=1x++U3VfRxd+auCyoQD+SsWylL
	OyeluIPwQsosrUR4iroJ0qk+u7i9r9nkYjxhhKZb4/fdlYDc6OaTUGCwfxgBBiYWg2cKMF9J14SUQ
	+1vCodUNBSV0YQ2527Q2fCAxaga++feqxFFtpznSkG2OUGtgi1+xdF95ivd89QiFMbaYr4Dh0zOA5
	qv0smvdAane4N0Ja3MVh12WaRwkavhI2ek5+0DxIfUpZ/fF26drgcuHS1FTKEkWcI4IeQ1AK5/UOe
	inNb6qA/IjSm6THekvEBqUcQS+nYK/d8pfWZ3NiT+yIkOBBM9aUw0bc52ymYmfWM2agVmn5q5C7f7
	gFcCKduQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUfLd-0000000FCTQ-12ok
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 04:03:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUfLZ-0000000FCNh-2mDu
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 04:03:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U2pYOA005704;
	Tue, 30 Jan 2024 04:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=1mSKNHW6N3wUJJd8WcY9isE77vwY00ukugURjUTtcvE=; b=O9
	CPAM81XNWR+NLNhMVpFPzaqGSuiVnvgFDZoTqs/13nxQwmKM52v51d4yiATGX+Iz
	DQNDuJ87r7xE4vJe6qN0UVAhf0Gud5v7wIKiFBY+WnV4TnkH9FagH2tJsf5yAV+n
	zu6dcy7qkzr+JkU/V2rWw9bA/aUBQFBvKIiqQ19GkUr4Tn+D5QzWKp7PgTGt6NGR
	96KZ3bc9c6XUWWJuH7ZdPRPtHrgzuUjH38m/3/c8OKx09PJbPpcvj2MMdGMA6E+F
	rx3iMGXxcCeNu2WXQRXRSvUfBG5J/nLFYPT+waOYl3qDoRnFwuCe/4ql2jZPTaHi
	aimm598kVay72pXaNBbA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxr2v060k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 04:03:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U43eSP022657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 04:03:40 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 29 Jan 2024 20:03:39 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v6 10/11] wifi: ath12k: designating channel frequency for ROC scan
Date: Tue, 30 Jan 2024 12:03:02 +0800
Message-ID: <20240130040303.370590-11-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130040303.370590-1-quic_kangyang@quicinc.com>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _339ka1BBoauH6VHEximSw8ekoJ5Qx-w
X-Proofpoint-ORIG-GUID: _339ka1BBoauH6VHEximSw8ekoJ5Qx-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_15,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_200341_783501_8530286B 
X-CRM114-Status: GOOD (  14.15  )
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

For P2P mode, the WLAN interface may be requested to remain on a
specific channel and then to send some management frames on that
channel. Now chananel frequency of wmi_mgmt_send_cmd is set as 0. As
a result, firmware may choose a default but wrong channel.

Fix it by assigning chanfreq field with the ROC channel frequency.

This change only applies to WCN7850, other chips are not affected.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---

v6: no change.
v5: no change.
v4: no change.
v3: no change.
v2: add Tested-on tag of QCN9274.

---
 drivers/net/wireless/ath/ath12k/wmi.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index c4fe90b5ff32..5af69bce8997 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -732,6 +732,20 @@ static int ath12k_service_ready_event(struct ath12k_base *ab, struct sk_buff *sk
 	return 0;
 }
 
+static u32 ath12k_wmi_mgmt_get_freq(struct ath12k *ar,
+				    struct ieee80211_tx_info *info)
+{
+	struct ath12k_base *ab = ar->ab;
+	u32 freq = 0;
+
+	if (ab->hw_params->single_pdev_only &&
+	    ar->scan.is_roc &&
+	    (info->flags & IEEE80211_TX_CTL_TX_OFFCHAN))
+		freq = ar->scan.roc_freq;
+
+	return freq;
+}
+
 struct sk_buff *ath12k_wmi_alloc_skb(struct ath12k_wmi_base *wmi_ab, u32 len)
 {
 	struct sk_buff *skb;
@@ -757,6 +771,7 @@ int ath12k_wmi_mgmt_send(struct ath12k *ar, u32 vdev_id, u32 buf_id,
 {
 	struct ath12k_wmi_pdev *wmi = ar->wmi;
 	struct wmi_mgmt_send_cmd *cmd;
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(frame);
 	struct wmi_tlv *frame_tlv;
 	struct sk_buff *skb;
 	u32 buf_len;
@@ -775,7 +790,7 @@ int ath12k_wmi_mgmt_send(struct ath12k *ar, u32 vdev_id, u32 buf_id,
 						 sizeof(*cmd));
 	cmd->vdev_id = cpu_to_le32(vdev_id);
 	cmd->desc_id = cpu_to_le32(buf_id);
-	cmd->chanfreq = 0;
+	cmd->chanfreq = cpu_to_le32(ath12k_wmi_mgmt_get_freq(ar, info));
 	cmd->paddr_lo = cpu_to_le32(lower_32_bits(ATH12K_SKB_CB(frame)->paddr));
 	cmd->paddr_hi = cpu_to_le32(upper_32_bits(ATH12K_SKB_CB(frame)->paddr));
 	cmd->frame_len = cpu_to_le32(frame->len);
-- 
2.34.1


