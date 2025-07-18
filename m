Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B58C83F34
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 02:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5aF3Y37Htuj50hi/E4OxlWZ1R2rw2wLXQRFj5kpMY4=; b=HIFJFdwUph6Yr5mjkb5TXjaq/l
	DcZ+HrGszUVrLMcqyV/gwGC3lHMdyDpiJbs4ufVwdtxKdpfT1NwblA/fFIPl7Ka6wD0ysrqiiv12w
	JG3SDJ9wMinUj/fOk4KFORMh+2KcBkzouuQxHTBecuw0PMEzRLJAflWAlA49/7hVoXhgElWmLT5yP
	HB8YJEL4UfNgFylo7cQZwx7S4BrHjDnnVo3F+lJiZt590ZA9PUHgFucQ1++QaJ8NXY0tH71Oz5Mnd
	XDsenSSRJRJxUblbHD4wWMLG6cE2UjYo0GudbPFIqe5vm1/Wtirx3nLaozWsEPiZ7jmXS8zTRcbkE
	yi6UfMSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucbG3-0000000BZA6-1Ffw;
	Fri, 18 Jul 2025 02:55:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucbG0-0000000BZ8x-2BgH
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 02:55:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HKbH7L008701
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 02:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=/5aF3Y37Htuj50hi/E4OxlWZ1R2rw2wLXQRFj5kpMY4=; b=O2
	aqXrSi8MbHoCHXGew/F6650weLr9a7MWTG9hE+wjDOwJ1FjXFHxLmm3n0FWBLT2q
	+UCtR9H+iiSXzirHnGPchdKmBa6wNYnCuCg141UsOE6FGWL84GVGDwSC1T9Co0Bo
	/f0x346m+s3MfumCUIe7YM4gFgkmeaDLGlcmwg69DR3sDFdmY6SvlukGTWVigPJ5
	HbR8q2bUyYa00bUiCbaXUqk8nLpHtIRmoOA3s6qP08hNC8WCe1A5KHtAMiEAqvP1
	xmF3w3MV/CuEaRhjLjIiAFu02PnTdqTdrsMZqWhAZ9CNu05RwNZGMzQSEsbT+bUP
	kwZPlq6SY1p5yNRO6P1g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb9wsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 02:55:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso2437163b3a.3
        for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 19:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752807330; x=1753412130;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5aF3Y37Htuj50hi/E4OxlWZ1R2rw2wLXQRFj5kpMY4=;
        b=TyTQN2+boMuZFK10/v9VgxjZAutyejhiCTvSWwPPjKNFnqzOBgZUHNnqnVqq+ijIPR
         AJkiw+bMtfU9hFjdu3Mj4ORqmSpcI/hACC90VSaMSTBd6mpPM6LyIh5hk5A024GC9kkZ
         4sSn1FBzpJ97ULgbezgoFUXcpCd/0BcnxzbFJbZt6MQOXbTSeGDH4kLUafbOyU67TNz2
         HAgzjzjEqvM218LD/WNy/AOuRisyOVesfYUlSN013Pqgfa6SbvbFtq2jCAMrkdrbbThV
         /A1gWhovNuktAjJcN/Mons5BCaltyyevyELI1r3QbKhNlK0i/1QfehjJ2NLh5I86FIen
         63tA==
X-Gm-Message-State: AOJu0YwCtyEq4Ym4Jr5r8c2blrkxiJIuNpVPqGGs3J3FunXBiQbM/cwm
	UDLl26o3BOmf7idZgCdiVkCJ0hO9byusZMVGvQWXFEZ9kZfyCf3aHX41TrLX30TPjMEO1QevWlg
	3o1VwB2FW3Wk42INy/+feEtpt00RgFCMB2zPhETOppU4WpC8AVef3g+RLp4WxpP3/vLSNfM8S
X-Gm-Gg: ASbGncupSyB8zbmrCGr96+uraK0fHVDKG7f3oZbeVISFYEygTdOIgmZXto2BjlgQfC7
	MkMJbLa/sDW3MM9cRZBynj+wVV4W5RJujAP7cOBnAuIaIFxtRkdh0+0HuHOIy9ZcJwykMA2bXGJ
	l2jHvnQc60EDFluRomuj7KCZfHlD24pDmnqf4Wkwn1pDFbY6K34x0Ev5J/R+khNqFTwzEhTeo2q
	A5RGt+AaTUrKuHzfr44ZYG5RbFh6cykXkAMtd9EbaHmp5kzM+uz55LEmV3VBRHgCRgX0TBrPZFs
	vWqnUxmZqk2TsVvn1uZKS0T2mTSppTzXlZcpOB7EJtv9oXo5TY9BHNhSQc97mpZUP/qCAWGOA1j
	MeQ84EclLoKXNvQhSXmYy7I6EMyGEf8RzIocullt/HBWLETNtILVwZkt01/K46VM2q4psF2i+rA
	==
X-Received: by 2002:a05:6a20:7283:b0:232:6040:ccf0 with SMTP id adf61e73a8af0-23812a5a2fcmr16205604637.27.1752807330180;
        Thu, 17 Jul 2025 19:55:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMlFUJ9wB3L8riEPr4ZMca+vA531Ehwcd3n/RHw/Jkh5QtXvrRfjltD1uhm3u1ecDqWdc4Cg==
X-Received: by 2002:a05:6a20:7283:b0:232:6040:ccf0 with SMTP id adf61e73a8af0-23812a5a2fcmr16205567637.27.1752807329725;
        Thu, 17 Jul 2025 19:55:29 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc68095sm255334b3a.139.2025.07.17.19.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 19:55:29 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/3] wifi: ath12k: Fix TX status reporting to mac80211 when offload is enabled
Date: Fri, 18 Jul 2025 08:25:12 +0530
Message-Id: <20250718025513.32982-3-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Proofpoint-GUID: -RdpTdVZwu9ZkJ5b0WaZ6XGUKnWgGok4
X-Proofpoint-ORIG-GUID: -RdpTdVZwu9ZkJ5b0WaZ6XGUKnWgGok4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDAyMiBTYWx0ZWRfXzFoREyc/59B+
 3xMEGB24yUwmTiKDNAB11ythJtjwPGH/t/XBhDHbzcaoUX0If9d85h+/x8hb2OhAmm7zn2UZnJV
 JhwHt2+mvXZTo4yKUXw0+chnLk4g1dXoLBRYML3pIS/wlmFMEcjgvFmGp/C2KRdAWfsZouAOF2T
 OdbR7Fqt95EUTBdIQaQTCB5fxRdlVcV/V4JfvxwLMMmJQBXaytMe6Lvv9NQPEgJiK26ZwdmbdcW
 uvPByRjRX5iHUjKgJ3+ayw3q5XTFbGIpA1P1kgghnrKMS4c0PNg3RtmiUFafqbwb5uG0pbt3hqW
 RYmwApR4e8cKltFKvzHFJK7KcxkVWqZN3WSM0XZxZ3TLMpg2cEMsaK6maMyqKhHN+4SnivuKGzj
 lh3I8XHOi9nbcWtpcg0OQ3mBkaqs8vIlAmOs92Ng8UONIB8x07u2XQiCWqXtRfxbRYPdmmxi
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6879b7a3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5RRWBY4WAAAA:8 a=9wRqoZsPHZivbfTNylsA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=drtMOSl5Q_Tsf-UZi3mY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=903
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_195532_677294_F65D0347 
X-CRM114-Status: GOOD (  16.25  )
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

Retrieve station information using ath12k_peer_find_by_id() to
support all frame formats, including native Wi-Fi, raw, and Ethernet.
Report transmission status using ieee80211_tx_status_ext(), and
include rate information as part of the datapath TX status report.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00217-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 64 +++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index e8d3bcc90a2d..c102628c2e5f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -568,7 +568,8 @@ static void
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
 	struct ath12k *ar;
 	struct sk_buff *msdu = desc_params->skb;
 	s32 noise_floor;
+	struct ieee80211_tx_status status = { 0 };
+	struct ath12k_peer *peer;
 
 	skb_cb = ATH12K_SKB_CB(msdu);
 	info = IEEE80211_SKB_CB(msdu);
@@ -629,8 +632,25 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
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
+		ieee80211_free_txskb(ath12k_ar_to_hw(ar), msdu);
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
@@ -641,6 +661,7 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab, void *desc,
 	struct htt_tx_wbm_completion *status_desc;
 	struct ath12k_dp_htt_wbm_tx_status ts = {0};
 	enum hal_wbm_htt_tx_comp_status wbm_status;
+	u16 peer_id;
 
 	status_desc = desc;
 
@@ -653,7 +674,11 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab, void *desc,
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
@@ -805,6 +830,12 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 	struct ath12k_vif *ahvif;
 	struct sk_buff *msdu = desc_params->skb;
 	s32 noise_floor;
+	struct ieee80211_tx_status status = { 0 };
+	struct ieee80211_rate_status status_rate = { 0 };
+	struct ath12k_peer *peer;
+	struct ath12k_link_sta *arsta;
+	struct ath12k_sta *ahsta;
+	struct rate_info rate;
 
 	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
 		/* Must not happen */
@@ -896,7 +927,32 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 
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


