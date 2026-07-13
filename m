Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFC6C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aifJCenv1UQ5W+pu7DOQPFIw6v/9P9JnLq1j9kinOIE=; b=rTpK1j3ZcvGBQNqPt08PC11zy2
	6eLJEdSuOr7POadBtcJymFiFzbqVb/S7FTjNKwqEKGkNnLSxt/gpyNWfZMPOZ3kn/KAlQW+JmVGlh
	ypMqeuZbdH2iy2lcVUCM38iclUJJ1QLeZ3az6FRHTnBTJieatTw2IMF0P56TPyqaZSWR/9gbuN7bo
	KNYL8C8ynHj97UZwp2NgHPUDpjh1b+WiCKdQ2gOeAvTH1qd5LF6eAdj2OJRG9YzrCvXQK/NdvhR0/
	e99qiPOpgDhJMjhsiDBJ7mQwilMzHKU7wyOYrArnDntwnPyiTwgowLNavcolpCMN5m/Nbg7lIJr8/
	0bGvXzEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7j-00000008Poc-3ydW;
	Mon, 13 Jul 2026 07:30:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7h-00000008PnC-2zSz
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:30:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O1tN507448
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aifJCenv1UQ5W+pu7DOQPFIw6v/9P9JnLq1j9kinOIE=; b=KrAKnSjZ1i5MYC/r
	1kn6AfSC2hAObTXJUP2PkiiijiqxuN+1D1K9AOsRByXlfaI1mY25DZ3+5/XpHdkY
	D4OXMiRYGaO1V0zrhEqypjU82bSql5T2dCe1QhH2+1TssPtMvcsVGCD8dHx0El6X
	iWVxZBCuBkcvyXDdkaQO2ebpKt7Stp3qN6LcQGiPGSXTE58p2hRgTvO9yyvA9HAw
	6ek5KfM8/wlJ2ddS4SJpkph+eePh4dYEll5fwmQK7xCBvm1gQz1Twu4G0iKbFKYc
	yepE9hUNl8tMK2m2HPU9oa/oJoUrZrlIkHMZ9ua6sAwwmB8MJm12wQkJzt+nzmaM
	pQ5eCg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8gcf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c892143db7fso2686298a12.1
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927840; x=1784532640; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aifJCenv1UQ5W+pu7DOQPFIw6v/9P9JnLq1j9kinOIE=;
        b=KHZGq57ywqyj3xh5DnfX8omWfU4P0cDOZsrffAxq726nNJ9avfWylETz+cQkcbn+6P
         y8STidWquVV0nIp6POvBUhME+U3SjpTH/I4qehcYMRzyStuD2jvS9cNIQ7SOrfHRcW45
         inI1CEqsEe1kURfyGel3WmLWulSBi6mrEhpwHE3Yqw/r9u3Kq96cT+U2zhQ74aSR+e0G
         eaXskRxdXpRwx1cwwfIfgyD73tDZ8/PGZyn+9VPZz6OymuDLd9X0gF5gvuLl3aJaQ5Uc
         v2q8iRuiAK3OZNoeyF6NTYfHNuBuU5oDS9wHcTS72Tqi7gWf5QKEdyXDsVJpqx7SFFN8
         JM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927840; x=1784532640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aifJCenv1UQ5W+pu7DOQPFIw6v/9P9JnLq1j9kinOIE=;
        b=F+ZhXVsG40k6ZiSUDiBdEHt8R5ePzRTgXWn2RvH+wf9V4HEiXQPN6/6Ewc80ta3H1u
         H1KkHOg3Oh5AVn8sRMquLjgXrT7ppCBemCheF+ARVzeiW1NxwCOJGHTgF1AsZ6yaPyA1
         dhl3R72Ea/4uMuLGompwZO/TsfOvJuxETN0XzfG3RWXs07LsQICzDWw6DkFOEPG20Wfm
         rEb8u2sr8szquI9T8rtNKTB4plz/otw7CUmgd34IwT/9w9XRT4iCI/UvyqDL1uQujzhy
         SAaNV1NHV4iE0hES8AP7Y33mRlt76EiudEOym7GtDMfCQGDMI/EPKqF9YOpVMRA5rXu3
         nmvg==
X-Forwarded-Encrypted: i=1; AHgh+RpTtPA6e/CDbVVoWuZzqkN4gsXiM2zWfh3U4aF3InMQ1+D6WDYAfOUtbHtY8JQdXxygWkkzZ1k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx77l0Y3abrkp/xgAoRUv4SmV5cg7k14cOt2V8FscSJ8uv0GeA6
	yhGpY1HcGFYw1/zUu1qEptmd5D39tEHp+ps8qLZDsUikVKsIDc0xDZTLxKn1yzG1xsDBMcJlI34
	lRFmu0rAjugvJfOY2oyUzwX9Jo/kjaO5LFQr5c08wjWyN4OAROcNCSmjyqRfDfpSO
X-Gm-Gg: AfdE7cmgdf0TgdAIC+nzQhKXKQIdvNtltCuawXUkVpyuJC4eOd4x00nN0UfB4Ko6bRd
	Da+1KkV8k841ZvzGi9d85ADQ6Tt9lGBeVH2YKJSELuCm0/pf73PD3lNu9M4AclVz7uRpX4eQvmJ
	hu63QEb6it2kBmEUjROhx4oh1XGpHZfWLSHX4QMBjRPUsRBcUAMQqISBWdJWw/Kcvqso/oJJf0p
	/s6iMQpElnGdlIROTgIZttYkN3xCNL+kr6JxqqRP3tuR64Zf41PRJmvEO1lmkEfot3uQjl+t66x
	bSzWZn5CD+och/DdGJOERztZnUEqc1A94HxiVwbizmT8fk7enXFH0XkPB8YHikagv2+r4f32PlQ
	99TcdHjz6htclpChi0w60syO0UOJ1d5mv1IOihmPyl86smVX+ZO82uofd8unR3YrZ
X-Received: by 2002:a05:6a21:6b18:b0:3b2:a8cd:ef4a with SMTP id adf61e73a8af0-3c110768b5dmr7896014637.30.1783927840532;
        Mon, 13 Jul 2026 00:30:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b18:b0:3b2:a8cd:ef4a with SMTP id adf61e73a8af0-3c110768b5dmr7895980637.30.1783927839979;
        Mon, 13 Jul 2026 00:30:39 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm7947252a12.19.2026.07.13.00.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:30:38 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:29:56 +0800
Subject: [PATCH ath-current v6 4/8] wifi: ath12k: add support for
 HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v6-4-20f6f212e413@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Bm6d49If7dz2j2SHyv_2bIZl2YdT8_Zj
X-Proofpoint-ORIG-GUID: Bm6d49If7dz2j2SHyv_2bIZl2YdT8_Zj
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a549421 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Z1Ge9yWUdzOQbrqXt3cA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfXyZhmisY3uu73
 QcqBvLaHphOdJyRhJ2EMjFgR/cju2bkPqo/acBQD0DklrQx5rQfp6kU8MHODoFzl2We30SWI1lL
 epZczStvqubda8xNi2LLzdV9Y4PhXaA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX6ZYBpkDRZ53w
 A0f7LBbpKAl/Q9tbtG26n90IjjFmpJ0k5nxxwLzJbog0WUKzu+7AGpZLgztWuz4/JLYxQHQ4HL9
 TlbSuk/MU14A3hjrWA/IzuCGaWOvdYwQMSvv36517eV8Y/a0YVJmnVL2zIGDQuiDXIx4OHGjy27
 1g2fxRciXzEoCzft8mIOcYdW+O9cNbRAwyJfT+TgrC/pBNn+Zq9KZSEDvh79/FT8Rle96bvP0qv
 acJEQGDUmhe4+ReS9t7ArrAp0d2c66IIB3GSP62xuBYZzZoHN5FZ5GoNR/0d+vXho8oXbRDUrIa
 VNqaPWWjEcRBfD5XcfZLiVs8eka+sS7+p2FrwdViCDFOUKRYxDN8sghqa0Yo/x94RBIHaHzPjE7
 lJ9kmTwpwmv48HmsKI3uOruWW02wsWoEeWQRDseyMa0jQwHGsRjge/i9uZ5rZQpSG5qbOSZmkeb
 swFnxuT7jCHf3JC/hxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003041_758916_A759CFCB 
X-CRM114-Status: GOOD (  14.55  )
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


