Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C2CC5AD49
	for <ath12k@archiver.kernel.org>; Fri, 30 May 2025 18:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sstKLTdJ5BaTm9UV2XH0pQlooV2LCRq6As4GQjiQtMw=; b=dhmwDtaX04G3hLJu1gxIs4l0WS
	DTy+HFxhilruIMgewGiUnL6eAeMIabpPOZMgn3zbseef2nUy0lH2w/R0N8Q5ygo32dA/VPHeWVs2v
	VNrP3aqRnvz0DhKBEyOwPOu3OOQcynuXvTlp3COm3K9KxB9Bra8E2UrGApVaMIol6xlIvKiWkRTyP
	8CvPgYKYVEG8XPjS1ZRUAU++VjymruyFpXYaAiaB0Nb7OOkWQyUnR7x+prKHifAqRDa5/qjwGcGuh
	o7muGSdhdynl4SGelAoSdyCZ5dNwoi1epAPsf30CREh6HHMTybIWnnjg103uuP51Uvl9dbXvYWcK6
	vKAkf+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL44O-00000001Trb-3kpQ;
	Fri, 30 May 2025 18:03:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL44M-00000001Tq7-0LPG
	for ath12k@lists.infradead.org;
	Fri, 30 May 2025 18:03:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBoT8X018216
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 18:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=sstKLTdJ5BaTm9UV2XH0pQlooV2LCRq6As4GQjiQtMw=; b=Ab
	WYpKVvW/oN2CBFQ0WE4/b9ek2/DdjFL9c9zYYwLTn+LumzF4OmrD/1TQXK32nhNS
	Yb4+lrVjlahZSj+n1b7yZIjLDRWCrbixd2r4sTrTVvr7Jy7rkKr9s0SevZqgIG6F
	x9u1ppZZzjIhWh4R8r362cVMOB6xBDt6kQ3BMGfS7nd9hYqb1rQtEoSMvKq5MmBI
	Rdr+zvKbCshAGWs1oc/3jgPS48TIGJS/6KFldupnkclbqP+IoWv82mjXzL/xc3T1
	FNeo6gb2I9MeD6Hgc65lTFrVIXiEA9KEN7hrx8AlFT01aAHgTmmZcMdK+qECYaQU
	ApaylMltH63D+18A099g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4ys57w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 18:03:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23446aa30d1so24487255ad.3
        for <ath12k@lists.infradead.org>; Fri, 30 May 2025 11:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748628180; x=1749232980;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sstKLTdJ5BaTm9UV2XH0pQlooV2LCRq6As4GQjiQtMw=;
        b=NtRgkASkVEn1oDxSTdNVoqxs093iFxVdaNZFvnfWfMtJUXkTxjSo+umiK7C7CScxfc
         GzfEi38bJVnL708pNdYoNim6yspP5zZSFnEufnzO1JGzlv0PtlmAAn+R7Yav2Pe5qNRV
         SfJ/SoqJPju+/JdopiCazNB+6ceQyMSezEUbahaSksH6ZAmPSo/62EPAnRv1jX9AymYa
         uVIuTdWnmk67SbOwdmaDGARO9GZ3v0+YoQyHQ99vhlgYvJLou+Wt5zaXaahZVhUq7aBa
         jitzllmnliBGLE9S3GFQKwR2+qqMIvd5Egq6wsYuXQcaaCpLXM7kBp59ZCw3idYJdQsi
         8s2g==
X-Gm-Message-State: AOJu0YxX1XS/d/U7TdcCICXVkpoBZgNXCC/0m0YfWrfLf0yEYBG4phQ+
	f35K00nfVpSY37dfWwvnWgOhr8hkbOeqA+76M4rJWqJKpFqYz163jzXzk3mwRZaY8ip3Du7qryz
	XU6HqsIW9ELb1sfEadUC2P0aaB4gvS85khZkJqA3sWgk6dS7VnoFnmKC/rP+Z245Zz1rCadAF
X-Gm-Gg: ASbGnctVKK/V65u12ILPUc90V9LdHs8v1CcBReNAyPKaY9zaxi4MtqllgiwXQSoTW+r
	gZktQe531jFNmbDzuuCKhlZrlXO/Ea3f0+Z4bFek+0scVICubYXBdKO94pSe8wjvCWIX+w6/AS+
	28D9XtPh41iX1j7/fyvCiC/CPAd+a8kLQ2vmybWw897rXizB4TO9hlhlP//7nOiXkGvRPbx4U3l
	CKblSU/USsVgui45617QeDHPEpoePmXdZRjjEtfqHiWos4rTHEqNYh2802GxOdnbrCmmEgfa9R4
	YZKOO29AW09Esz6J3hYOJA7Uwfi2LOmwoNxgiXzkP0kHAXfKHqLbbzqEfwUA0CJL3VihIC8SEy9
	HYQCO4LcMrGwD6sm/UfZPn3QDooyoFJZf9ZPEuebb+s5vUg==
X-Received: by 2002:a17:902:ccd0:b0:210:f706:dc4b with SMTP id d9443c01a7336-23528eedce3mr58333545ad.13.1748628180522;
        Fri, 30 May 2025 11:03:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYSn7RJx8pQlzjYzD7CT51JjXLrU9rnBJj3YSg0fptYM04zJkSIIg9GZtrfFTyLWbhkm72UQ==
X-Received: by 2002:a17:902:ccd0:b0:210:f706:dc4b with SMTP id d9443c01a7336-23528eedce3mr58333025ad.13.1748628179953;
        Fri, 30 May 2025 11:02:59 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc868asm31374435ad.31.2025.05.30.11.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 11:02:59 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next 2/3] wifi: ath12k: Fix TX status reporting to mac80211 when offload is enabled
Date: Fri, 30 May 2025 23:32:46 +0530
Message-Id: <20250530180247.424349-3-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250530180247.424349-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250530180247.424349-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1OSBTYWx0ZWRfX1Dtm28dOSYGq
 BxTyd4mdkJr6M833gakIqvt2j86q1MVW+w7nqZ7D46XWFlw3NxYtwb9inaGq1FF7FUoh+w/OKED
 zosVrhdW7YhAqnUcXKwRtdAiXvL55xg/mzScrVfpmpOCFL3LuSw3FxtrDugxzAGjrevEh7YWnv+
 Tl8Sm3lWx00XT5s5kP1UWO5A+zQ3GIYprxwidwr2TK6K7tJJ3+F9P+wYUHfgZbPk1GFyb0l82Kq
 mbHmjmyTqW7ZlUU+bIC5XpMqBuL5GrzL0wU1AjzUG3tXSwY3H8q4dXu+UbivPFZdPIRjx2vJihz
 9HtmjVAR54t/6SPDzNmb3GbE1M4jHcv3bCqKoo9M7OUSZ1/4+VIzb6WmxUrxxyLgEan1Y1kpmVU
 X+/LBuw8EOxcP4p+CCbniLWhEl38HYP0tNsFJRTJxIqgz+G7XiFBZk7XseatUkA6MwDGfi/C
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=6839f2d5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=5RRWBY4WAAAA:8 a=9wRqoZsPHZivbfTNylsA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=drtMOSl5Q_Tsf-UZi3mY:22
X-Proofpoint-GUID: KSolANwjI1TgK9pchgR7pkAsgy1u7axr
X-Proofpoint-ORIG-GUID: KSolANwjI1TgK9pchgR7pkAsgy1u7axr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=942 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_110302_126073_D618F561 
X-CRM114-Status: GOOD (  17.22  )
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

Currently, the ath12k driver supports only the native Wi-Fi
frame format. In this mode, the ieee80211_tx_status() function
works correctly to report transmission status to mac80211, as
it retrieves station information using sta_info_get_by_addrs().

However, this method is not applicable for Ethernet-converted
packets, since sta_info_get_by_addrs() cannot extract station
information from such formats.

To support all frame formats-including native Wi-Fi, raw, and
Ethernet-station information should instead be retrieved using
ath12k_peer_find_by_id(), and transmission status should be
reported using ieee80211_tx_status_ext().

Additionally, ensure that rate information is included in the
datapath TX status report sent to mac80211.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00217-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 63 +++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 189c742f2a00..7de545c16d1f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -569,7 +569,8 @@ static void
 ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 				 struct ath12k_tx_desc_params *desc_params,
 				 struct dp_tx_ring *tx_ring,
-				 struct ath12k_dp_htt_wbm_tx_status *ts)
+				 struct ath12k_dp_htt_wbm_tx_status *ts,
+				 u16 peer_id)
 {
 	struct ieee80211_tx_info *info;
 	struct ath12k_link_vif *arvif;
@@ -578,6 +579,8 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 	struct ath12k_vif *ahvif;
 	struct ath12k *ar;
 	struct sk_buff *msdu = desc_params->skb;
+	struct ieee80211_tx_status status = { 0 };
+	struct ath12k_peer *peer;
 
 	skb_cb = ATH12K_SKB_CB(msdu);
 	info = IEEE80211_SKB_CB(msdu);
@@ -624,8 +627,24 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 			info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
 		}
 	}
+	rcu_read_lock();
+	spin_lock_bh(&ab->base_lock);
+	peer = ath12k_peer_find_by_id(ab, peer_id);
+	if (!peer || !peer->sta) {
+		ath12k_dbg(ab, ATH12K_DBG_DATA,
+			   "dp_tx: failed to find the peer with peer_id %d\n", peer_id);
+		spin_unlock_bh(&ab->base_lock);
+		goto exit;
+	} else {
+		status.sta = peer->sta;
+	}
+	spin_unlock_bh(&ab->base_lock);
 
-	ieee80211_tx_status_skb(ath12k_ar_to_hw(ar), msdu);
+	status.info = info;
+	status.skb = msdu;
+	ieee80211_tx_status_ext(ath12k_ar_to_hw(ar), &status);
+exit:
+	rcu_read_unlock();
 }
 
 static void
@@ -636,6 +655,7 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab, void *desc,
 	struct htt_tx_wbm_completion *status_desc;
 	struct ath12k_dp_htt_wbm_tx_status ts = {0};
 	enum hal_wbm_htt_tx_comp_status wbm_status;
+	u16 peer_id;
 
 	status_desc = desc;
 
@@ -648,7 +668,11 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab, void *desc,
 		ts.acked = (wbm_status == HAL_WBM_REL_HTT_TX_COMP_STATUS_OK);
 		ts.ack_rssi = le32_get_bits(status_desc->info2,
 					    HTT_TX_WBM_COMP_INFO2_ACK_RSSI);
-		ath12k_dp_tx_htt_tx_complete_buf(ab, desc_params, tx_ring, &ts);
+
+		peer_id = le32_get_bits(((struct hal_wbm_completion_ring_tx *)desc)->
+				info3, HAL_WBM_COMPL_TX_INFO3_PEER_ID);
+
+		ath12k_dp_tx_htt_tx_complete_buf(ab, desc_params, tx_ring, &ts, peer_id);
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_DROP:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_TTL:
@@ -799,6 +823,12 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 	struct ieee80211_vif *vif;
 	struct ath12k_vif *ahvif;
 	struct sk_buff *msdu = desc_params->skb;
+	struct ieee80211_tx_status status = { 0 };
+	struct ieee80211_rate_status status_rate = { 0 };
+	struct ath12k_peer *peer;
+	struct ath12k_link_sta *arsta;
+	struct ath12k_sta *ahsta;
+	struct rate_info rate;
 
 	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
 		/* Must not happen */
@@ -885,7 +915,32 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 
 	ath12k_dp_tx_update_txcompl(ar, ts);
 
-	ieee80211_tx_status_skb(ath12k_ar_to_hw(ar), msdu);
+	spin_lock_bh(&ab->base_lock);
+	peer = ath12k_peer_find_by_id(ab, ts->peer_id);
+	if (!peer || !peer->sta) {
+		ath12k_err(ab,
+			   "dp_tx: failed to find the peer with peer_id %d\n",
+			   ts->peer_id);
+		spin_unlock_bh(&ab->base_lock);
+		ieee80211_free_txskb(ath12k_ar_to_hw(ar), msdu);
+		goto exit;
+	}
+	ahsta = ath12k_sta_to_ahsta(peer->sta);
+	arsta = &ahsta->deflink;
+
+	spin_unlock_bh(&ab->base_lock);
+
+	status.sta = peer->sta;
+	status.info = info;
+	status.skb = msdu;
+	rate = arsta->last_txrate;
+
+	status_rate.rate_idx = rate;
+	status_rate.try_count = 1;
+
+	status.rates = &status_rate;
+	status.n_rates = 1;
+	ieee80211_tx_status_ext(ath12k_ar_to_hw(ar), &status);
 
 exit:
 	rcu_read_unlock();
-- 
2.17.1


