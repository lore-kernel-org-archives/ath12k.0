Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BC3C369AB
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 19:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08yO9bZX4ip/nKeL9Yu+eSgLY0HMzS6FnQY5A6qKGIg=; b=Id6tl5xibb1XW2iS2PKrqEB0jF
	PIm0D3aqn/J3C+8xzKw8OQvCzokVeda9U9uXei+hOzbu9siwmXRI3WjW9LwOzTWhq45ZMQLn4Bzzf
	wbfOjMOjCNRn7KKKUmhn8dpD2EB52rQeufvAP545kwXVRcdF4S0svaLebm0Vdu1MAIUNlXGuVKjjI
	y53j8s7iHSaGtYyYY+37wZGIiK3V6P58ydSVnZINCOXfr1I4WVcgXl9xea4FYMsiSWPTD6jVndF+b
	cw/PZ7qvrbDCFCVVCQ5r7Fp0oS2cBQzDaYuE7CYag8Un4KVa6C+pR6W8S00PHLcbPlHECdwaEdlib
	m1ErQ5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4mRr-00000006yB2-12SR;
	Tue, 15 Apr 2025 19:59:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4mQi-00000006y3M-1I0q
	for ath12k@lists.infradead.org;
	Tue, 15 Apr 2025 19:59:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FJBRmq002173
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 19:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=08yO9bZX4ip
	/nKeL9Yu+eSgLY0HMzS6FnQY5A6qKGIg=; b=U6XGGY0tFwBKeMoPUlnC9f/BVla
	GraO6nbzbHGBPMUqZa9i1jx5aWdxEvfM/yWMFnZU77w1zK37wmZOgOceE7Q7NB6W
	zKdkicjygp8PzkwFIs5na4gF7FcjIZmN5SrlSgLRln5Sei0Qgmggk/1Yrab3qQ+O
	jm+FsSzI75G+rbup8xybWxT5JvfBdaHr3JNJA+1m5oUooraqR+3Rj7NcEM8pDKl0
	WWS4MwgxXW1503oPU4imRsVyXElUY53MymS2KutSVlQsu7ZqwclHwUcHMgiXUNZL
	haZJvqHC7VjqhYmSbOXJgLj8sPxR/07D4CkYUvi9cfCAV1hGvOGhudWAfRQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vhctm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 19:58:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so5633303a91.1
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 12:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744747127; x=1745351927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08yO9bZX4ip/nKeL9Yu+eSgLY0HMzS6FnQY5A6qKGIg=;
        b=wdSziUFaqjN9KkE7HNfD0F+MBdNLfHV3fTl+j7geRN900vhBfu6icrXlTzIdatykyF
         JD31ZrVh5qaVLuuQmnO0pxqaxeniRjuLwXgJvUwai7YnyaUK9vP33tsBr9TxxRaqBH9w
         hyvGkvoB5Rynfquk1ZASJRu4/F56W3QI8zMaDsEYytWsRjU5u20bHCP54lj2wq4ktGbE
         J888MkffcKCn4Y1hUgiNiHOqvMALISbNaY4yd61ZXh6Qq4wnHKasNXBxI9aM9SxGQ95+
         3pohUm59Ki6mbBQgKWoB6kPzcc9tB5HolOY/RIiynGSAQJpHtAwAFrTlwHl4lmn8DkLa
         OwMA==
X-Gm-Message-State: AOJu0YwhKGwWIGVCVDTdhwC3JiszvpY1TsjdQRh5mTCM5Y4VAhJSUddB
	C+aQbn1stBiPTVGerZnW2yQH8DE3Dykx5CFroO38nYxW0nx7K8uGNwKlpKK5aUtKbsurJkVabx9
	efGavAZpeyqgO5zIqlIIXlRcMMDFHGxyujVQS4JBt0zDhoWB1URXxMunHC9UZzMyCUbAO
X-Gm-Gg: ASbGncsBZu6Tgaib7R2UBsrOFZuo/RczVXrMpv49DBvMVEfcuABQAjYAshqwcUDBOsI
	xo8sVDHcEtx50HJ2IIQDNpCJVvGrUWlK2yAuwEKcIacmkFyHnxWFRbqLZ0hPIL7uMET+s+uVS0f
	RQ114HJP69KACatnvpT0gBk1dajLmzznLpIULWSJMLZTdvAYE11gXWhzpZhRSXYyvu7NCmLqDK8
	9DKmH95GBsWY0/mHeyvdfJpTHGRV8GK1HMPAyWAGHnKrk7ZfY7rFXjt8fUNq6PblZLUOnwBMZ49
	8ha3oHt3RfpKUc7rZ8TENzg6D82Pl0/px+r6vGaeCOaHLSlOLUhGuVrtr8CJEsDOUqaVtrkDwIn
	Hi2Tv2F6OVCT/YpH67C41aUgCPT51/nfzgxDUrygH
X-Received: by 2002:a17:90b:4c43:b0:301:a0e9:66f with SMTP id 98e67ed59e1d1-3085ef1dbbamr766730a91.14.1744747126786;
        Tue, 15 Apr 2025 12:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfEZT644CddK0S5AW+e5KbHsbVh4dlSq52bTMb7pvWhPv9+0RgO5exJW8T0cN+4dbMmnUEAw==
X-Received: by 2002:a17:90b:4c43:b0:301:a0e9:66f with SMTP id 98e67ed59e1d1-3085ef1dbbamr766687a91.14.1744747126396;
        Tue, 15 Apr 2025 12:58:46 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8ea61sm121626265ad.103.2025.04.15.12.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:58:46 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: fix wrong handling of CCMP256 and GCMP ciphers
Date: Wed, 16 Apr 2025 01:28:11 +0530
Message-Id: <20250415195812.2633923-2-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415195812.2633923-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250415195812.2633923-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: j_2rKEpLgDc_LZe6BxRMIercpmZTDQGQ
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67feba77 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=hR7Trk4nSUdV9dTI32cA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: j_2rKEpLgDc_LZe6BxRMIercpmZTDQGQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_125848_349664_F6A20196 
X-CRM114-Status: GOOD (  16.41  )
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

Currently for CCMP256, GCMP128 and GCMP256 ciphers, in
ath12k_install_key() IEEE80211_KEY_FLAG_GENERATE_IV_MGMT is not set and
in ath12k_mac_mgmt_tx_wmi() a length of IEEE80211_CCMP_MIC_LEN is reserved
for all ciphers.

This results in unexpected drop of protected management frames in case
either of above 3 ciphers is used. The reason is, without
IEEE80211_KEY_FLAG_GENERATE_IV_MGMT set, mac80211 will not generate
CCMP/GCMP headers in TX frame for ath12k.
Also MIC length reserved is wrong and such frames are dropped by hardware.

Fix this by setting IEEE80211_KEY_FLAG_GENERATE_IV_MGMT flag for above
ciphers and by reserving proper MIC length for those ciphers.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c |  3 +--
 drivers/net/wireless/ath/ath12k/dp_rx.h |  3 +++
 drivers/net/wireless/ath/ath12k/mac.c   | 16 ++++++++++------
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 96785d60d671..f7cb1a17d6f1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1939,8 +1939,7 @@ static void ath12k_dp_rx_h_csum_offload(struct sk_buff *msdu,
 			   CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
 }
 
-static int ath12k_dp_rx_crypto_mic_len(struct ath12k *ar,
-				       enum hal_encrypt_type enctype)
+int ath12k_dp_rx_crypto_mic_len(struct ath12k *ar, enum hal_encrypt_type enctype)
 {
 	switch (enctype) {
 	case HAL_ENCRYPT_TYPE_OPEN:
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 19fb41e1c32b..f5c05f17813b 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -163,4 +163,7 @@ int ath12k_dp_htt_tlv_iter(struct ath12k_base *ab, const void *ptr, size_t len,
 			   void *data);
 void ath12k_dp_rx_h_fetch_info(struct ath12k_base *ab,  struct hal_rx_desc *rx_desc,
 			       struct ath12k_dp_rx_info *rx_info);
+
+int ath12k_dp_rx_crypto_mic_len(struct ath12k *ar, enum hal_encrypt_type enctype);
+
 #endif /* ATH12K_DP_RX_H */
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index dfc803879028..aaa02d3d0f95 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4719,8 +4719,8 @@ static int ath12k_install_key(struct ath12k_link_vif *arvif,
 
 	switch (key->cipher) {
 	case WLAN_CIPHER_SUITE_CCMP:
+	case WLAN_CIPHER_SUITE_CCMP_256:
 		arg.key_cipher = WMI_CIPHER_AES_CCM;
-		/* TODO: Re-check if flag is valid */
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV_MGMT;
 		break;
 	case WLAN_CIPHER_SUITE_TKIP:
@@ -4728,12 +4728,10 @@ static int ath12k_install_key(struct ath12k_link_vif *arvif,
 		arg.key_txmic_len = 8;
 		arg.key_rxmic_len = 8;
 		break;
-	case WLAN_CIPHER_SUITE_CCMP_256:
-		arg.key_cipher = WMI_CIPHER_AES_CCM;
-		break;
 	case WLAN_CIPHER_SUITE_GCMP:
 	case WLAN_CIPHER_SUITE_GCMP_256:
 		arg.key_cipher = WMI_CIPHER_AES_GCM;
+		key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV_MGMT;
 		break;
 	default:
 		ath12k_warn(ar->ab, "cipher %d is not supported\n", key->cipher);
@@ -7153,6 +7151,8 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 	struct ath12k_base *ab = ar->ab;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	struct ieee80211_tx_info *info;
+	enum hal_encrypt_type enctype;
+	unsigned int mic_len;
 	dma_addr_t paddr;
 	int buf_id;
 	int ret;
@@ -7168,12 +7168,16 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 		return -ENOSPC;
 
 	info = IEEE80211_SKB_CB(skb);
-	if (!(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP)) {
+	if ((ATH12K_SKB_CB(skb)->flags & ATH12K_SKB_CIPHER_SET) &&
+	    !(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP)) {
 		if ((ieee80211_is_action(hdr->frame_control) ||
 		     ieee80211_is_deauth(hdr->frame_control) ||
 		     ieee80211_is_disassoc(hdr->frame_control)) &&
 		     ieee80211_has_protected(hdr->frame_control)) {
-			skb_put(skb, IEEE80211_CCMP_MIC_LEN);
+			enctype =
+			    ath12k_dp_tx_get_encrypt_type(ATH12K_SKB_CB(skb)->cipher);
+			mic_len = ath12k_dp_rx_crypto_mic_len(ar, enctype);
+			skb_put(skb, mic_len);
 		}
 	}
 
-- 
2.34.1


