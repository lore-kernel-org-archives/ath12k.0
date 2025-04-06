Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BACC369A2
	for <ath12k@archiver.kernel.org>; Sun,  6 Apr 2025 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXzWxT+oGKXJZx0o2xs/CWZOfNKSx1HUdMCvVeJWg34=; b=aZly12wvK4aYKnZZcV77wrOR9r
	0vvxNv6n9V4zcng4Rp1Y6IOp4VwtXVR+53XQ5TJRj1PYxTek5vKRgvQHygXpQhrxeKXLEqOz2pNl8
	ri3Wfd8G04NQ0/+ZnaSE4p9GG87O2hrD1/kTE0DHMEVnQv5a1zDe6OwBD17JjSO0dAoOMjftvJT2w
	k0BGQGmTxzWH8i6tT5tLpfFOD01r4Kqe2/wX/H5zjvsEtDhuSxCdCIMXjZjT1+w5r7MpueptRm1z3
	H8pLeKjMsRfeW3SoRCzbgBgJieb7rVLH6VHnvOSxkZgMUGwsphMyJ0tNeHNklpVFOI/QvkYM5GWCr
	GHgC0xkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1MCx-0000000F791-1twM
	for ath12k@archiver.kernel.org;
	Sun, 06 Apr 2025 09:22:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1MCv-0000000F77u-0eh1
	for ath12k@lists.infradead.org;
	Sun, 06 Apr 2025 09:22:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5365s5aT018553
	for <ath12k@lists.infradead.org>; Sun, 6 Apr 2025 09:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xXzWxT+oGKX
	JZx0o2xs/CWZOfNKSx1HUdMCvVeJWg34=; b=nQ7mBmdThXxutPkKSTu74iNGDRn
	4DZAoX41fmSYlaPTdCXjJxyRr5AP2XX/+V5efYuXwzff+Sn3dF16eriPJOlWq9Ky
	haqnu6/40F/suz42ZrkyWGZQqK5VpU1sk30lSB81ljF7TqNoEZdQviGno6tdnLZy
	6AKJtjcwecyJRlSuXxBK+WjgUukrzIqvNuoqhZ+WuzKUX0xS2CqkHo5NYvvRUQ0i
	QWcpANhhW2Hp9QxUsV9kfINJvNa7kL8Ch08sPEmKQbq7+xWaF/8i9BLFWoo4V5sZ
	Ov+ZklXB5Q49zHg/z+IO3GgIx86MV3F3BnuIgPcBpkf6niOrIjRuBeG3U8Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdg9nd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 06 Apr 2025 09:22:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff6943febeso2530655a91.0
        for <ath12k@lists.infradead.org>; Sun, 06 Apr 2025 02:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743931342; x=1744536142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXzWxT+oGKXJZx0o2xs/CWZOfNKSx1HUdMCvVeJWg34=;
        b=W7aguASptjG8NWJNSnRVcH6G2m0zK3tlGYSKrd8Fgk8YqqY5DTyPB1p/zhZ058EdSL
         RYo458wT8DTV5zFabBRZdh5558cHi60r9+SAHDglONzmsXGl194pYIwYR3VT09cA+ovB
         cYo6LdkoqLPk0MRrsmwYjiLct91QzToIahI9Ngjf74bHI1lR/6wN5TZ8i+CxaHijLhTu
         GYVAFpVjpq8/SXZgooGnolyDRNaGoTu5AkwxX3wOGE8jgT0G93G6sO8pGZDtGXIYimVq
         /J3FCdZBsfGPOcBxMo1Y4Th5f8/pZy2sU5+qaltx3scDo22yZJvoMG/KQ4UV31EyYTKZ
         tAtg==
X-Gm-Message-State: AOJu0YzUShqbjQsktcHg6LjSJigbpC8/PRsFLTEQoZdYx/OSa4W9I4uF
	VfJs6m59uDuvAjLSMm/WZp1jtDi53xWKzqSN8C9I82Caz+wOi2PkDYy5VLmM+Lipe4lcKpW7EzH
	B1dP+mjCJ4E7AQqrF3+wMwqPmFwBWLF1Ae5eBxAJlKtZGnyz8t/P8+qOn8KVLSG1ArdIm
X-Gm-Gg: ASbGncvRUTDhI8iU4xuIRvpMQNRPQCWcnCCB3hM+Fr8rENP9dcsUv7tOt43YluqTl4n
	EIWbSiO5HhEeNQZwCsxzxkBWqUZUKsuuQuLZLZs5BDdfp+jSqd2whUH9suYXCn2PvYOaoq4ialg
	l/Gx5qitO9mctLBuWw9kN6anGzqGqMR0lNbr4deRbnSiFvPFXetd87f4wx5Nb/s1ViSXDtskcQr
	DZPv49ViqO+4waFcqdwMVw10Cw0GXQREWOM/7mLXD64TUCAjH8p2SbV0nvsVzh/jb5ToaV5m9H6
	BufkI93XDcVcu4pVZaugPz2x4F/WYYJQ/10nd8vuw+C60inaL4hUTRsraWUK3UkQ7Xfof4b6i36
	dFEJUW9GAD4Y5wGuNCw0qAFPbIgZruzellueG7ssV9YGD
X-Received: by 2002:a17:90b:5690:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-306a4dad016mr13562481a91.0.1743931342127;
        Sun, 06 Apr 2025 02:22:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr8nbRF2ZQZkdpKUsWLl6DTYywkCD18h7PoYYmapHbtyKrTk5yFQyxwumygYfBk8LRW8Geug==
X-Received: by 2002:a17:90b:5690:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-306a4dad016mr13562462a91.0.1743931341716;
        Sun, 06 Apr 2025 02:22:21 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5e75asm6857311a91.37.2025.04.06.02.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 02:22:21 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 1/2] wifi: ath12k: fix wrong handling of CCMP256 and GCMP ciphers
Date: Sun,  6 Apr 2025 14:52:13 +0530
Message-Id: <20250406092214.3602182-2-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250406092214.3602182-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250406092214.3602182-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f247cf cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=gym03wjq6zcI6pFnTcYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: qbaCnF-LIFAO81tGeeSrmFP8xxE_FL8y
X-Proofpoint-GUID: qbaCnF-LIFAO81tGeeSrmFP8xxE_FL8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_022225_315874_D99A0688 
X-CRM114-Status: GOOD (  16.11  )
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
---
 drivers/net/wireless/ath/ath12k/dp_rx.c |  3 +--
 drivers/net/wireless/ath/ath12k/dp_rx.h |  2 ++
 drivers/net/wireless/ath/ath12k/mac.c   | 16 ++++++++++------
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 48d907a400b3..db477f047c32 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1928,8 +1928,7 @@ static void ath12k_dp_rx_h_csum_offload(struct ath12k *ar, struct sk_buff *msdu)
 			  CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
 }
 
-static int ath12k_dp_rx_crypto_mic_len(struct ath12k *ar,
-				       enum hal_encrypt_type enctype)
+int ath12k_dp_rx_crypto_mic_len(struct ath12k *ar, enum hal_encrypt_type enctype)
 {
 	switch (enctype) {
 	case HAL_ENCRYPT_TYPE_OPEN:
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 88e42365a9d8..78c0800e06aa 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -145,4 +145,6 @@ int ath12k_dp_htt_tlv_iter(struct ath12k_base *ab, const void *ptr, size_t len,
 			   int (*iter)(struct ath12k_base *ar, u16 tag, u16 len,
 				       const void *ptr, void *data),
 			   void *data);
+int ath12k_dp_rx_crypto_mic_len(struct ath12k *ar, enum hal_encrypt_type enctype);
+
 #endif /* ATH12K_DP_RX_H */
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b19e30d95560..a1e5d94b400d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4677,8 +4677,8 @@ static int ath12k_install_key(struct ath12k_link_vif *arvif,
 
 	switch (key->cipher) {
 	case WLAN_CIPHER_SUITE_CCMP:
+	case WLAN_CIPHER_SUITE_CCMP_256:
 		arg.key_cipher = WMI_CIPHER_AES_CCM;
-		/* TODO: Re-check if flag is valid */
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV_MGMT;
 		break;
 	case WLAN_CIPHER_SUITE_TKIP:
@@ -4686,12 +4686,10 @@ static int ath12k_install_key(struct ath12k_link_vif *arvif,
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
@@ -7098,6 +7096,8 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
 	struct ath12k_base *ab = ar->ab;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	struct ieee80211_tx_info *info;
+	enum hal_encrypt_type enctype;
+	unsigned int mic_len;
 	dma_addr_t paddr;
 	int buf_id;
 	int ret;
@@ -7113,12 +7113,16 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
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


