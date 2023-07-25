Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B479C04FDF
	for <ath12k@archiver.kernel.org>; Tue, 25 Jul 2023 23:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtP6RpGNPPA8uNpvMukCcJR3Q/3u9qJskhBwKLkiORI=; b=XSJXj9i1MOXuTH
	JLRgZ7evFiDb8vlBSfus3MYngLWBV5TEyQDCyBCYDBD5oTl9PvzUmba1D6LZSrGYIQ6dHUjO/XFBP
	oAm1ONcbNeNcjgrsJi2b3Xqr9oz0CAypm9Ep4blsO6Xq6PlToQLGxbCb636xHcytvFDEsrovCqC4C
	QlLEEZsPF56OUGSwk1n8C5qqXgcI/hiEkWFcakLMg6LLAdVX4CPJVJTF2KKAoGbTOMBf24eiLGJt+
	9MUZGpux8Is43oRWyiTZCdPMmuERdDFIY8vfZQBgLg9RtmCBA+QVJ4EBCJihTzna9qADKhgZvXA3P
	n9I0C2+TWO79pgDArX6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qORig-008jhL-0o
	for ath12k@archiver.kernel.org;
	Tue, 25 Jul 2023 23:45:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOQi2-008eli-2w
	for ath12k@lists.infradead.org;
	Tue, 25 Jul 2023 22:40:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PMSXJX017050;
	Tue, 25 Jul 2023 22:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=0G9ugSp9nwC1JLNY3pI4nO1RvAsbuBIZLfiARhlaVEU=;
 b=HDheV4WFckxqVaKqJ2QFpjj/KW0dNQEZcMfb3az9GNFaiJYe59KhS0UBIsMNoEzJJ6kr
 RR7ogOhep5x59UYvHpp/ynPOTeB/JSqKE3ueXmRSqMnTA1aXUPbWMIXi51AKdrDE7gwi
 yGrHkNrnDP3GzGxZDBaOZ9U6dCIGNRMmjUjCaH0VnN4ycX/1VM2d26cROzu61Pqjgy3b
 vz0btYh2ACeKmhAL8Kp/GcOFOgeufKgKzDBgl+qUt8poSo3M/PAC9E6Hs0wz40qoGW0m
 Na59Kg1GcvKZJ5MDXMg1bCTDU4Hk5cT+vlVc+vs/b/uAwLqI8unse6GL3zyI+XZDORfx +w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s29j5j0gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 22:40:49 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36PMemNQ024642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 22:40:48 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 25 Jul 2023 15:40:48 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Aloka Dixit
	<quic_alokad@quicinc.com>
Subject: [PATCH v5 09/11] wifi: ath12k: add MLO header in peer association
Date: Tue, 25 Jul 2023 15:40:32 -0700
Message-ID: <20230725224034.14045-10-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230725224034.14045-1-quic_alokad@quicinc.com>
References: <20230725224034.14045-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bEp7ub-yam6FY-6pMarlwzGc5RlOVzVz
X-Proofpoint-GUID: bEp7ub-yam6FY-6pMarlwzGc5RlOVzVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_12,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_154051_068157_DD88C3D5 
X-CRM114-Status: GOOD (  15.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>

Add tags with length 0 for MLO header and partner links which
are required by the firmware for a successful association.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
v5: No change from v4.
v4: No change from v3.
v3: Moved MLO header tag addition before EHT rates to match firmware order.
v2: Corrected 'witout' to 'without' in the description.

 drivers/net/wireless/ath/ath12k/wmi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index b0722050206d..1debda890b8c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1909,7 +1909,8 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 	      TLV_HDR_SIZE + (peer_ht_rates_align * sizeof(u8)) +
 	      sizeof(*mcs) + TLV_HDR_SIZE +
 	      (sizeof(*he_mcs) * arg->peer_he_mcs_count) +
-	      TLV_HDR_SIZE + (sizeof(*eht_mcs) * arg->peer_eht_mcs_count);
+	      TLV_HDR_SIZE + (sizeof(*eht_mcs) * arg->peer_eht_mcs_count) +
+	      TLV_HDR_SIZE + TLV_HDR_SIZE;
 
 	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
 	if (!skb)
@@ -2032,6 +2033,12 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 		ptr += sizeof(*he_mcs);
 	}
 
+	/* MLO header tag with 0 length */
+	len = 0;
+	tlv = ptr;
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT, len);
+	ptr += TLV_HDR_SIZE;
+
 	/* Loop through the EHT rate set */
 	len = arg->peer_eht_mcs_count * sizeof(*eht_mcs);
 	tlv = ptr;
@@ -2048,6 +2055,12 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 		ptr += sizeof(*eht_mcs);
 	}
 
+	/* ML partner links tag with 0 length */
+	len = 0;
+	tlv = ptr;
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT, len);
+	ptr += TLV_HDR_SIZE;
+
 	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
 		   "wmi peer assoc vdev id %d assoc id %d peer mac %pM peer_flags %x rate_caps %x peer_caps %x listen_intval %d ht_caps %x max_mpdu %d nss %d phymode %d peer_mpdu_density %d vht_caps %x he cap_info %x he ops %x he cap_info_ext %x he phy %x %x %x peer_bw_rxnss_override %x peer_flags_ext %x eht mac_cap %x %x eht phy_cap %x %x %x\n",
 		   cmd->vdev_id, cmd->peer_associd, arg->peer_mac,
-- 
2.39.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
