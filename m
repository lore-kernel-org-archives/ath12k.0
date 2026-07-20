Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2320C44515
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 06:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aifJCenv1UQ5W+pu7DOQPFIw6v/9P9JnLq1j9kinOIE=; b=tyS/XG3196UC+qlimltjiSWotf
	fiDi8fwspH9pPJiS3R+9pdNG6yK6xNse/QacVMgm0z7exFXggv1t1JSKoJ3zNkW2flxHRwl4l7DEF
	GJN9N2qlcS/ByD42M6HEt7sdRAX9XOqzCWUY2pwybKPrdz9UziXfXkkEiNZpCAYnDo3s/+BveUJ7N
	g49/EIqe0ecdGp+fiOjpdySZysdEjrlwm+a5RPWbKon6di4rXRTXOcZI8MOIEF3fLyG8qRabIcPVC
	ttpk5FuLzIAOWwaTxn1KXzFd22LPn85+UcxdQL5z5go3IRW2KeOGTnJGFlpSsl9b7dRnQNta45E/l
	9rU5M5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhj5-00000005zIj-1TMA;
	Mon, 20 Jul 2026 06:43:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhj3-00000005zHT-0ZkV
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 06:43:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RZdX1506361
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aifJCenv1UQ5W+pu7DOQPFIw6v/9P9JnLq1j9kinOIE=; b=S1RWYam7TLFlME7d
	SL/KhYAJ3zzB7qL+bVkpwyrjnBgFyW/gfrW2bKgiCdp6oLYa+WNAiCDKL4e3Cl+7
	Mdm+tnIOhpbUO60sF6cyeVD1yhmcitqj3GOvRTmVv1vy/uZ+cfnbKVv/1Vx9KAOd
	zwj4JJlcvPCfzkjkstNhqEsUYvgwuntl4cvKDrusm2d05bvfSrwKEN+H4PyPo26S
	9QkHW726DNXHp1XwpViWXIhfSEe07BJGVKK69V+zSxRFWoQs0hlPTeaepwzdTfr+
	J7U3XI2wNYVayIcbiyu3Un4Vq2cav8abpHVTWAItiXHVhZsL8r4+siDeqc3fCas8
	ACkpAw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvvstf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8486ffba174so16249573b3a.1
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 23:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784529820; x=1785134620; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aifJCenv1UQ5W+pu7DOQPFIw6v/9P9JnLq1j9kinOIE=;
        b=ad8pRs3z/aBZd6+28jhHpD6hoY8IdyjTUgK+0LSuvaISDcQkc31TTBtKwiMD7wSq1I
         2QUcUhZImnRBUKmkSeIuFVobPu3k+85wNxigwmwG4kBSpjrn8GOiqj/xygHURnbLWIDj
         mecx0nYmnIenRaCEMTetPR7kkGsD0pH/izHnrKS3Jxicejj6Y/yb8Ibz54xvVJsG2/+b
         J05GiwI9aOir/TNwLAk2tJPkPbtkA6u2lUzbucLp2O8H6iV+RrDXVPrTtMJWFJl6lB8O
         QhOz7yFkEBOLZIvlPUGZLUYYET5U9afUI92HFgMfxKWGyvZGESj5uFXcOy+ZERYF7aV/
         c3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784529820; x=1785134620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aifJCenv1UQ5W+pu7DOQPFIw6v/9P9JnLq1j9kinOIE=;
        b=BA7xvhbZkK2xowLrDvW7mHbbC1fyZvGUfoj392Tizx+lUNMKjndR5YBT2ktocfgTLY
         wqAfcCz4zQoO1NBi6otpt644cZVtya7r1t/u0neg28ao1V9kMr/hWMmR0uRuw7aWKPo6
         Cd+A+CCt+9G0MywtFJBArxAzXCzheaCDOk6IoPnW4Mx8jBFvLG03cv+PJWwdQcQ9r2Jt
         /uwna0pj8oEBTX6naKtoY5dEH0x1dzAREFm67q2ZLOzznEDR8F7CasWdswYK5T2D+99r
         DIfF99FmoQaSDBM+EIbN6p9daBlMuPO0Z85hE5jz0lC0ZaXk4hSC9X8vq8XQQOkfASUY
         F+8w==
X-Forwarded-Encrypted: i=1; AHgh+Ro+KvbnDRT7HV7PsQQlRZeB5CqT7AG9u0IyjMjxVMSdRBqm6KfEBzVoz7L2Te7ut6OhP9KuVts=@lists.infradead.org
X-Gm-Message-State: AOJu0Yya0xoeNnG+mb4LgUatOghrcIqrhWLeBw9ZMHdZLa11mpgkdnOf
	B7XWPjGXUM1WLwj+Hrw381rp9wsaI1ao7sekQ01r20vAh6Mfghk8ugSDFS91AiOW4bfe2vqukjy
	M7fnHVTmI1Eh+aFviJlGHfBQ2EcGzubJWkKlNqSAEgTZ4BlHu84dwCf/RYXggDFlV
X-Gm-Gg: AfdE7ckCB5+XDXIRuwlAuUBHjout9JwaB4B9hQ43hj9QquC7vIaQDLbm8B2AHTUsahh
	fUiEdnP1IApIIi3xofhsvNdNoaQf8azytYDJfOkMRw/02q1dxJTUYDLWW1Z/Xh9OVkF5yowGxez
	Dg0U+zt4F7GTFmw6xLvVx2Y1HpJvNDqCso/Vm3I5ceRREeNnw6LdT2dG0KNXwhJ1ijbrnPDkkyz
	UYP2Psdy+Gme2h5ta68zpAhKjD1XgaMa3HQ10Hfwl2XHmkRMj8e6x6/NiBytwJ7g0+bGdPTQsIj
	P7JFuj0bG/fYx9W//VRtWm1SMQvHptsp71d8UfTZjmoSpwo87ZnV7KiQ1fCfOAysBpPSgjXKdR3
	D3eyZBJ9yb9vPfeXVnrfr7x/FHwQt982+z/SLBMdcRRmxE8xQ7REm/w==
X-Received: by 2002:a05:6a00:2e2a:b0:847:95a6:eb74 with SMTP id d2e1a72fcca58-84c2930f035mr13158122b3a.23.1784529819835;
        Sun, 19 Jul 2026 23:43:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e2a:b0:847:95a6:eb74 with SMTP id d2e1a72fcca58-84c2930f035mr13158104b3a.23.1784529819364;
        Sun, 19 Jul 2026 23:43:39 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c3793ec61sm3812097b3a.42.2026.07.19.23.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:43:37 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:43:25 +0800
Subject: [PATCH ath-current v2 4/8] wifi: ath12k: add support for
 HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-ath12k-fw-allocated-ml-peer-id-v2-4-630632758a80@oss.qualcomm.com>
References: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
In-Reply-To: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: WKuZatunCN5N3U62s5EHJxhy1QiU3S1g
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5dc39c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Z1Ge9yWUdzOQbrqXt3cA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfX0g2FvJ2l3THW
 hr5pr3ZRYGkF6vAXUL6GZsbsZqIOpHWZ0ETb2kWsrwJ8Fz9ou6cqsa4a00PzBptoAhWsVgONIxD
 rT8bbzUxxcAd5bEmqo2MweBvPryTbz99halavHl07Au2cZyMH3xIFFJ/GYfZK5ym3W9fkVTJyC2
 frN9/u0H7L6W4Ia0V8K0ol1s/P9I/wCuSwdwkSriD44opmJFinNpE5ANnmP3zs9v+IpAU0Zeo8y
 Zlt7/vb/EWSMhtp0ql5dlGSyVmdqJFmdQThOS+sEGDai1Grnv1hKt9mVrUqoV07sTt1L8jgauvn
 ow/p4MB5aGI4R0/bEYP2LBxtIKFl5VefdNlvEQsTWUNF+rae/UBWAuWJIAt9xE3GnKZYIwRjWIM
 /6KnkkbsYIh4Od5svAdyTCrbN98OWf/eJf+dCHChJP+DkFxpH/nKdU6U8ZUNhvPr4jp7rO7GL/3
 tQU0D1zp/TZJcb8S7Cg==
X-Proofpoint-ORIG-GUID: WKuZatunCN5N3U62s5EHJxhy1QiU3S1g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfX9QQ2UqW+32IK
 igoaLmCzfGYbJEixxBrHYhRMoVuVSZ4h832wV/MW2j8hYacgGQaDecz6+CltApwTWlUEqkKzpWb
 mb4P9VmcNHSMFTHVh5TdMnhT9dg5vxg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_234341_183832_2E41308B 
X-CRM114-Status: GOOD (  14.04  )
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


