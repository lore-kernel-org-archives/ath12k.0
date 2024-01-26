Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EE7C48260
	for <ath12k@archiver.kernel.org>; Fri, 26 Jan 2024 11:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sz+ZIyqwS3LweWJ8AFqYiQKTpKpETqjZgeY3njKqrAg=; b=FOP0rT9gvcEPb8/0aa5gWmQ+xW
	6xDMkPkR+Nh9MrIJXkh/QVpkLtcEurfeb5Ohv11tvYo3vstScPX8IC0Cj9pvrxxzG9NfCBP/VyMXm
	OlB77JL8ZMLySxB3xzZQeB6E3OWBdfi4eS3wkFrOP9bF6sviQI5SwdAnv8+8Kmh5BUfdg0FhOW19z
	hCOtj3hr5ajNnoDOg/i4JGSN4t7W7uaNuGQo8ROWmDidmJpSolXtdVUwa91WKVmimdhiaGJBMJI+b
	De6CdOKuxU/sUH1uLHkeTqPJmECP+K2aIzE8yxqhTepcODzMhLJKCDiZFEZtibJo3efLBmE0Ffybn
	Fm1Ejd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTKli-000000042nb-1iIi
	for ath12k@archiver.kernel.org;
	Fri, 26 Jan 2024 11:53:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTKlb-000000042hR-2zy2
	for ath12k@lists.infradead.org;
	Fri, 26 Jan 2024 11:53:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QBekb5020875;
	Fri, 26 Jan 2024 11:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=sz+ZIyqwS3LweWJ8AFqYiQKTpKpETqjZgeY3njKqrAg=; b=bA
	rpn9g/th2Cf6soV/4CnifrunmGw+xQUrorzxDIC6GfpRwri1L2TyTabzm6ekNkUy
	nql5oyqklL2dOGkdoVsqhFLfJKH/GhivGHyHNSHPTk+4w6WAGZ4gLmcHBNh0nWJc
	UGO2s18KvVi+kUnJEHKvGKeUttv9ZqCwstDDIS7JKV3tzBvR9qM9HgdV0/CxCUw2
	pJAIghzld0aW18xPoJ49vekBAFPEeiL8+Vk0xw1G3ZRVBwD8tfNkL6Gf3dAnnIUK
	/bdMpKVNTsqSW7GKJ/fSfCcXXvpT5XCZ1iZ/4wIUd34OANdAkGY6ONHQk4V+slEt
	ZYhJv7r0gU2anMvh+MxA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv51dgxyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 11:53:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QBr2PC005667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 11:53:02 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 26 Jan 2024 03:53:01 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v4 09/11] wifi: ath12k: designating channel frequency for ROC scan
Date: Fri, 26 Jan 2024 19:52:29 +0800
Message-ID: <20240126115231.356658-10-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240126115231.356658-1-quic_kangyang@quicinc.com>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LuMlbOZLrpKozJK2z258YPWG2q1PGVp_
X-Proofpoint-GUID: LuMlbOZLrpKozJK2z258YPWG2q1PGVp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2401260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_035303_905693_841CAEC2 
X-CRM114-Status: GOOD (  13.97  )
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

v4: no change.
v3: no change.
v2: add Tested-on tag of QCN9274.

--
 drivers/net/wireless/ath/ath12k/wmi.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 34e676799616..9e2c6b98166b 100644
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


