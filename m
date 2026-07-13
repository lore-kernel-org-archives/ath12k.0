Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A0EC44501
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aifJCenv1UQ5W+pu7DOQPFIw6v/9P9JnLq1j9kinOIE=; b=bcpDX9xsJ/h7LOEFifxd90d+jv
	ivSbxPyfc+GQhQ9iY3iffPQVJlEQ/vgzAeV//Xdu7PyMJMW1ceEp9ndkF1XSjDAq10kxEJW7Fd3iV
	RhowMJnEB6TerbLok/hb1yop+vsPb4xnaQK/M7TvZN9iq7D64zmBdFIEwWKYxWYQQS2hZtlwl20Rd
	8p+SA7HP2sm91ow9zAyUAe8HKx8d4uSRYJ/hKHyrSTVaE9Uh1hbKnOF+YOT6RyXpYmCqR9CdMKRru
	BVL9CZfeNCj9S1PAxNbebnamMCXg9fxF9Nt5xNe0kdeYitRlTclTOdPKIK0+rv4JjLPjifKVvPTv5
	mCnT2dlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAl-00000008Qsi-3TQX;
	Mon, 13 Jul 2026 07:33:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAj-00000008QrA-28kC
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:33:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nfhj469272
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aifJCenv1UQ5W+pu7DOQPFIw6v/9P9JnLq1j9kinOIE=; b=pf0kL74izOnTHn/+
	rGK7a1gJHwkjWGNHHcupWD25qECo2p2ma7bkecAEc87NGhdSTy9HflE84Q9sq6G2
	ETYsFWzznxAdYUagncLjRDylg7Zvy3Me89SKWaSsfo7X1ZfSmmg3gjg7J+/LVpr8
	JmgMRePxqQI1g1Op02zNJJ4Rob6M6KkBvPxfvymZMweHm31z+otkw0kFbLeEuEOi
	rHSTPBZ8myIg6fLOB8QkcmS8aNKrc5qK6zxnLs9pxhR1rvF85fcJ5KnTdrhUrNYQ
	w9H3/m043g5aQjnUnvZOBfGeM53CsM2s3LHVtLIMlbT/dkW2FVyTfoX8SfvVs224
	DNRnfQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf484y9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc86a9ef97so61955845ad.3
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928028; x=1784532828; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aifJCenv1UQ5W+pu7DOQPFIw6v/9P9JnLq1j9kinOIE=;
        b=ExK8QW2skajuOXMv2Ju+gI9I96FGbxoqU3ITnseHYg2UR3n5KMG/9dm5J/jGSdOUFH
         4/Gm4rsATaGlVAZjazP4GlbEhbVMSWtMgSVDMb4PXV0izWLspeIfoZUgaW3tvUH8WNq6
         odFh5Qj24G+QzxVWY54ASmMchBdQyh9FKFnJaafTE6gKIIVw8l4rJ1Pk1Wtw0Wjf1hnI
         uIzvrUmpUU4edNKe5GmGwxay2vmvtTnJuwvRLK6ZennA2ysjRPYIBTSXsK/MWdtiznn3
         CZxClKn9V+Q1JpSilhU2usw5wB/u36EQxRC5GqWcIFE88Hao890NMsNPQK5SCgqMq/Xj
         BGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928028; x=1784532828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aifJCenv1UQ5W+pu7DOQPFIw6v/9P9JnLq1j9kinOIE=;
        b=VgGrn5+FzKNBpf6eFfJmmREWH5XDXi9Kiynnats18GH8HFuvpYcXGu+Hsf/ufIYrAh
         CBxWTxX0QWdqQFINs3fwR4iIl+QcwunQaxrpGLUQSiZCkj04sa+xfbxxGXWBYcHQqxom
         musEHHZlUg9+/fHpHxqc2fSlkB+Kp5A/ztDfUMSMh+hA8K6JH/UvXrR2oCAdhLw8RHoG
         rAOdEi5VLZEWxtJ/NjC+mkPNKjoUmixoCNr5jG6x7u+0xh32meU2ULAwFskrsoEYXHks
         J/SgxjaFhRuJwS2rp9mBTomBZIB+O03Qpr5E5gsQ5ugeHm9YkXVv9WjZdYXK294OhRZe
         cG/w==
X-Forwarded-Encrypted: i=1; AHgh+RodnwrZ9s5yupZHKv5LQtd5iDBbZcJRTuFnG1hFXp0LXfZKmYvPmceYjiflNzm+xnMa4P9FwKw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXq/s5h98SDDrVVuUHGM1Bh07a6vnJiIoVtlvwJgDo4zOYxGMd
	Gx3WhycAvIZ78A0s60Lyb35JZHmSjlfSlL8jm2htq6Rzh/mIkTlnuTtCQM6vLxTafDyA9OEO9Mv
	bsF/+I56I/JnDb3pQOvBkCuKi4kvWiiI142Lt9/DKllLQkjLdQTdGVAJr8vE9Kmae
X-Gm-Gg: AfdE7clyJ4wS4UdXQ00mVWSHQL00vJdnOiIi3YiIgoEQpDN7tEle5+aKo4c7DrH6Vb8
	LP04MX7jsV4FQVHmTCZSaXdpkgqCYZnSrLm5fT2wCIAgtT9Acn663KqsfxxnmHUXB6wHYkYSujp
	Om0Sc9OO6ltzCz2xngplNTAXxMaztmpm7blQ/vcNGEox8ZySFGlpv2AssXUBM3N8v4ZgYGd+irz
	lq1ojDydhxnDfPCQvCwKNVvF8HBKAaIkN8j4I1muCk2stIdmiMNFGDMVQHyUQEFOKmrqc5g5SJw
	ZvonC8467PigfJKXnVb0TRduMwUCiq0Le8l/A/M8rHJhFPL75hvGeKUPOdoj5Q/QyF/DKQvfAPq
	DOzVyv4e4BRRRSTvE+76MHrR4IG9HL8MOxJ9zsdrBD3u+aXZJF8RxaRsRfMviqU5s
X-Received: by 2002:a17:902:e850:b0:2cc:f1e7:18c6 with SMTP id d9443c01a7336-2ce9e795628mr75156935ad.2.1783928028412;
        Mon, 13 Jul 2026 00:33:48 -0700 (PDT)
X-Received: by 2002:a17:902:e850:b0:2cc:f1e7:18c6 with SMTP id d9443c01a7336-2ce9e795628mr75156775ad.2.1783928027988;
        Mon, 13 Jul 2026 00:33:47 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm95073615ad.6.2026.07.13.00.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:33:47 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:33:19 +0800
Subject: [PATCH ath-current 4/8] wifi: ath12k: add support for
 HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v1-4-d0a2a1a519eb@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX+9IxCdCZGEBF
 w+AL+JZgtGw97US4ARDT99lm9B150Qw7L2In3anWsamZl0OP+MaUMZU8eFpUu5Bzjs4WQrc43Ux
 FM0e0Q0MedFKPyLCOE6Iu+wTDbBFRH0=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a5494dd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Z1Ge9yWUdzOQbrqXt3cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX4jSwhY0JyhUH
 qDskwp3U1Jdg6Q6rIjSVDj9UZguCgBDZz72ugq6LrclBxNmKh1sbOSt7ejbEcv31z8V7FlpX/sV
 spbH13YGeAzWtm0ZBCt1maVhtlOGgew9Y6/uB4xUUuneLE7aBa2UtN2qndfVNhd3bEb7FZSmaE0
 Ic4d4/fOGEnRzbg6js0Pe/xiJRnDjX4Bqdb6REZeRzgrZ1wxcBHS5gztk+r6qb95kjFoh9gisjK
 1HLBfsHTdQasRE8Ikd9vHNvKYXjbhyxTzNQhk+4xQpVMrvF6NrWO5f3tJ1FF2StBiWdBHXGuhG1
 xlVxDXhzZMWdWcyFxhAUvuqNFVoH1d1CD1eXIoTNVH9gZgSYipSZeml+ik/i5YCaxmhdHOteNRg
 r3udZsoLNHBCTeDkMeqzy7CDavJ2NVn43M06+xOF3wzz+tqNnnVIxzs98bxTKMyR9JJukpAc4sl
 TYq7ldJSIcpV/Nt1dyg==
X-Proofpoint-GUID: xrFGIzoTmuxu2zYgDchp4NeY1VajoJjj
X-Proofpoint-ORIG-GUID: xrFGIzoTmuxu2zYgDchp4NeY1VajoJjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003349_567268_F657E1A2 
X-CRM114-Status: GOOD (  14.58  )
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

Firmware on chips that allocate the MLD peer ID itself (WCN7850 and
QCC2072) reports the assignment back to the host through
HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP. The message carries the chosen
MLD peer id, the MLD MAC address etc.

Add the message type, the on-the-wire struct, the field masks and a
handler that parses them out. The host-side state update (publishing the
dp peer into ath12k_dp_hw::dp_peers[], propagating the ID to
ath12k_dp_link_peer::ml_id and ath12k_sta::ml_peer_id) is added in a
follow-up patch;

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_htt.c | 30 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/dp_htt.h | 12 ++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index 52e10059c6d5..150b190f9c7f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -575,6 +575,33 @@ static void ath12k_htt_mlo_offset_event_handler(struct ath12k_base *ab,
 	rcu_read_unlock();
 }
 
+static void ath12k_dp_htt_mlo_peer_map_handler(struct ath12k_base *ab,
+					       struct sk_buff *skb)
+{
+	struct htt_resp_msg *resp = (struct htt_resp_msg *)skb->data;
+	struct htt_t2h_mlo_peer_map_event *ev = &resp->mlo_peer_map_ev;
+	u16 raw_peer_id, peer_id, addr_h16;
+	u8 peer_addr[ETH_ALEN];
+
+	if (skb->len < sizeof(*ev)) {
+		ath12k_warn(ab, "unexpected htt mlo peer map event len %u\n",
+			    skb->len);
+		return;
+	}
+
+	raw_peer_id = le32_get_bits(ev->info0,
+				    HTT_T2H_MLO_PEER_MAP_INFO0_MLO_PEER_ID);
+	peer_id = raw_peer_id | ATH12K_PEER_ML_ID_VALID;
+
+	addr_h16 = le32_get_bits(ev->info1,
+				 HTT_T2H_MLO_PEER_MAP_INFO1_MAC_ADDR_H16);
+	ath12k_dp_get_mac_addr(le32_to_cpu(ev->mac_addr_l32), addr_h16,
+			       peer_addr);
+
+	ath12k_dbg(ab, ATH12K_DBG_DP_HTT, "htt mlo peer map peer %pM id %u\n",
+		   peer_addr, peer_id);
+}
+
 void ath12k_dp_htt_htc_t2h_msg_handler(struct ath12k_base *ab,
 				       struct sk_buff *skb)
 {
@@ -659,6 +686,9 @@ void ath12k_dp_htt_htc_t2h_msg_handler(struct ath12k_base *ab,
 	case HTT_T2H_MSG_TYPE_MLO_TIMESTAMP_OFFSET_IND:
 		ath12k_htt_mlo_offset_event_handler(ab, skb);
 		break;
+	case HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP:
+		ath12k_dp_htt_mlo_peer_map_handler(ab, skb);
+		break;
 	default:
 		ath12k_dbg(ab, ATH12K_DBG_DP_HTT, "dp_htt event %d not handled\n",
 			   type);
diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.h b/drivers/net/wireless/ath/ath12k/dp_htt.h
index 987689f11cda..2db7fb27c036 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.h
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.h
@@ -930,6 +930,7 @@ enum htt_t2h_msg_type {
 	HTT_T2H_MSG_TYPE_EXT_STATS_CONF = 0x1c,
 	HTT_T2H_MSG_TYPE_BKPRESSURE_EVENT_IND = 0x24,
 	HTT_T2H_MSG_TYPE_MLO_TIMESTAMP_OFFSET_IND = 0x28,
+	HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP = 0x29,
 	HTT_T2H_MSG_TYPE_PEER_MAP3	= 0x2b,
 	HTT_T2H_MSG_TYPE_VDEV_TXRX_STATS_PERIODIC_IND = 0x2c,
 };
@@ -974,11 +975,22 @@ struct htt_t2h_peer_unmap_event {
 	__le32 info1;
 } __packed;
 
+#define HTT_T2H_MLO_PEER_MAP_INFO0_MLO_PEER_ID		GENMASK(23, 8)
+#define HTT_T2H_MLO_PEER_MAP_INFO1_MAC_ADDR_H16		GENMASK(15, 0)
+
+struct htt_t2h_mlo_peer_map_event {
+	__le32 info0;
+	__le32 mac_addr_l32;
+	__le32 info1;
+	__le32 reserved[5];
+} __packed;
+
 struct htt_resp_msg {
 	union {
 		struct htt_t2h_version_conf_msg version_msg;
 		struct htt_t2h_peer_map_event peer_map_ev;
 		struct htt_t2h_peer_unmap_event peer_unmap_ev;
+		struct htt_t2h_mlo_peer_map_event mlo_peer_map_ev;
 	};
 } __packed;
 

-- 
2.25.1


