Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A2DC53200
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 17:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wecc9XYEtzPaaAK3iaxwCXZmJUkkxuYPkwedmjWuTHA=; b=mfWuXbRXRHBAya2tZZV+qxFIJ4
	fCLFYxWsJCZJG/5ls3U/VyJEZWkwtnJ4jhQf8sRzUgoce2kyd/jDjoJFMCek1JitKOXg+WrPQlU+Z
	7ncQvQet7na3K2pvbE/vlQc0qv7eOoUGJvN0D4+HPF9dki2pYlvPPVfdduWC3hgZNfCgY+hTSZrzv
	QJo2TnG5bCdfmyJMOacbmH2TZmf/vyZxsLgmz47Cxm8mXrK9Ermp8rYSn+dRGxh+9yqgf1f7orqDz
	zJq1+u2XcgkD6DP+0OuLwNpUmmDW3nidTAdMJDvpI6WcO9V7CMvxhazMfiXXejKt+C62fkYZsJ5tz
	rditLAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7ud-00000008fhO-2a4n;
	Wed, 29 Jul 2026 17:17:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7ua-00000008fgv-2tgp
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 17:17:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2cwQ2357051
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 17:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wecc9XYEtzPaaAK3iaxwCXZmJUkkxuYPkwe
	dmjWuTHA=; b=NFUFNglxE5ytNLQXgiw++l+Oby5RXSzxpWUN+8gkXu35Q43sQNP
	TkJ1iwzT4JDhCe0kwYo72QT5uIuGX8aJtt9FxnfFSXPwugoJYsYIJEqRs9y+540M
	s69jrJAe3aJRbv1PdDwHPub2yNbKbDld3nQjuxWdMP0nq32pMKvqGVXdYGXtFynt
	YqVurC7ppJCmaJhdA3slH6G/mFoCUwGLvG64RvjWmVA35XmU++lpSNqqcqtMgSj6
	6cM8RLMDu/oaSiXStt8AYMEdW+Hahitc4VFGc+gN1jrc8nDBpaeV8FlSMztRPHJr
	LUixRP1T4sUWD8Ynstd4vF58dmhJVFEZZyw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhe99kex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 17:17:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1512487a91.3
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 10:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785345463; x=1785950263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wecc9XYEtzPaaAK3iaxwCXZmJUkkxuYPkwedmjWuTHA=;
        b=h7YmGw48eFZ2591CD2uz6sWToQD1PSH2wOcSPfgea85fQlncK4JLfiNp29X51Y28hf
         nSgbh/qYk/oRVPUjsNUkI2yH64eLJdzAIv1RAtyrGiaX0ce9JZ69SdelQG2nkJLcAM6K
         AQ9S7IzzS+RXRsSktkinKiMRNzKOgGfxSQTe8gygTR+WRVJ67LwO6qoMo4VzYzz0WfS5
         dCnoYYg16votyT5CmSnzpJjhPknNPZERJFGplsExC5UpV5/jtWNXhGvKTg4DssT6k/JO
         20qRTboZ15EEjti2dymjYV/Tcx8iwG+dfrJiWj4oKAcTCa0bjipxf5tZ/fO5sHSygPNh
         l+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785345463; x=1785950263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wecc9XYEtzPaaAK3iaxwCXZmJUkkxuYPkwedmjWuTHA=;
        b=IeVKeHh32ChexlxUsMdNiyV6+Q+5wqJA8emwCgnMzo2Z4YlH9gj2geoMxl72cPe80c
         O9oz6wex+kfh22hj6JPlOuSaJfj4TUzhCivqpFqtOFhmtvAisHY53Hkd8MIXHZrP615W
         5br9KF6YHfSOUsKJ36GpyBgr3lAZC44K3OPlmLsatZSkHyvI2dqPVU7r9603ASmu8SdB
         TArMtfcvVdId0Uvacc5R4nh9dd7PxsCLRGa9Eil2MtjPQ4P6qLCOoVWrh3upkw2b/PHl
         YFgFvIONp0mhJmuP31TcumgB+1piyCaDiYElJrp2AjrU+p+JV/whFYqch5Fk7okl1jxa
         w8KA==
X-Gm-Message-State: AOJu0Yy7NblPXqvXUJ6IydX40S6ic/0rXxCJm5AERHYMKPZC02S3dkQA
	XS8cHMA7QatmL3al7OZ6NjoMHPU/HPyYQKHB4zYOZNvQ6H9sdVrX7yoaST6woyXP7N/6d1b3OP+
	Dd7vXwE7JRh5NUjYh8QTunU8fPe38kg+gpFuQdCm+Q54DSc/NcyKT284gpXzbdQ6PbN5E/ezT
X-Gm-Gg: AR+sD12QTj1XqkxIy99PBYX7li5cy+8UVyoFIYDyruPMnvSbVnkqL8ohwtQz2tTPmxP
	aGFTtwV2E2cnHFRBe4ziF0f2elPlhAVq3QgMejDcP01/EH6/0peTYpzhksL/KFtfIcEliXA4Xva
	yS4dV1424KkYh8bPpS5MQIP87x43bfQNWufDlNjBFGnnI2yUgiugsyI0UT3m1O2OdJup6ll+uYO
	dPUU0Ysv2L2GzrmtJgd5+uGcDdLakLWm5DZJc5XMXURw6PnLL467IKgaRIj0Fyg6Pe79lLDXv8J
	f8UuFCC10r8QeoX1lK07eIRKaO9SXFzkf5M1ISiV72FuWQOJd6RvydaAmNtygN+HNm7K903IqE0
	tIqTzn4ojrIjds1ruU/o+DZsXizz5YeSOHYbqPjznYifcfCAisNuPe8CUPhk9orMPYIy5Q1tSPq
	FEpweGqsboAxvMsB+n8RCbgyp7
X-Received: by 2002:a17:90b:3c12:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38f6a44b7a8mr8239866a91.14.1785345462585;
        Wed, 29 Jul 2026 10:17:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3c12:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38f6a44b7a8mr8239822a91.14.1785345462141;
        Wed, 29 Jul 2026 10:17:42 -0700 (PDT)
Received: from hu-rrajkuma-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm17606696c88.5.2026.07.29.10.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:17:41 -0700 (PDT)
From: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: fix encrypted EAPOL TX in encap offload mode
Date: Wed, 29 Jul 2026 22:47:32 +0530
Message-Id: <20260729171732.668367-1-reshma.rajkumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEzNCBTYWx0ZWRfXzwW3B6K5Y5qq
 9Ly519aK5SBtBi+GyQxaCMfmQyFzxRKUZYPVBHaAmPk9w3ZnVz0a2wCwX690T0+Ipp0MCcyQqqF
 rLToiLNojSUE8ieIc+wJVaqv4CNcUUMyBYqqlL7vrIvNaNLylOAGNZ5gRmBPu9+U7fKyiRlOUHP
 QDf7V/WbxwYWe4mnfHk5/aaK4thlzZYw3inD3AEuNgwTMudxbukDp+n8h1pllXy5aXJI5XLBVkt
 CzTD8rimsaQ5/SJM5FEyYFCnRnFpZySmqMcbzp3/dMvfCWxSfj1FbvEbcM9/8AmbJuZS1UB0Wdo
 RL+WGYC0/GnlD0jdroOyE4GXAxsfyv/SODidYeYyPWdoIkx0EvHIzy7kExDm3OW8leCPjiGvlZ/
 VrMTA/ntgzqi1J1FgS3rDCSRQDUkGtjRY8RRBoMUlIGXQBZkuOkPTNyOOc76J7s9+WiMlyesJ0X
 NrqoWm4DcQct8eDyMEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEzNCBTYWx0ZWRfX5iEned/aLYfp
 yfAMSHn3FR8j1z7nmb+HxDnx87H9vmbSF/tsjDuG/AwjwDhfyWhyj4PfmkM7TbExTwoZSy3HOGP
 w+dQXIsW28HoYZcsHlUug0oM09ynv8c=
X-Proofpoint-ORIG-GUID: WzOXzu1Qy9Do1peUhiyaMpVcNnOlEz8o
X-Proofpoint-GUID: WzOXzu1Qy9Do1peUhiyaMpVcNnOlEz8o
X-Authority-Analysis: v=2.4 cv=EsriaycA c=1 sm=1 tr=0 ts=6a6a35b7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=8Q-BI5zzvDWikXiF7E0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_101744_742278_E779453B 
X-CRM114-Status: GOOD (  19.79  )
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

When a vif operates with IEEE80211_OFFLOAD_ENCAP_ENABLED,
mac80211 delivers EAPOL frames to ath12k in native-WiFi format.

Unencrypted EAPOL frames used during the initial 4-way
handshake are already handled through the existing
is_diff_encap path. However, EAPOL frames transmitted during
GTK rekeying carry ATH12K_SKB_CIPHER_SET and continue through
the normal native-WiFi transmit path.

Firmware encryption requires RAW frames with cipher-specific IV and ICV
fields correctly provisioned in the skb. Passing encrypted EAPOL frames
in native-WiFi format results in incorrect IV provisioning, leading to
an invalid ICV and frame drop.

Fix this by detecting the EAPOL frames that need HW encryption and
converting them to firmware-encrypted RAW frames before transmission.
Reserve IV space after the MAC header, append ICV space at the tail,
select the appropriate firmware encryption type and request
firmware-side encryption.

Introduce ath12k_dp_tx_crypto_iv_len() and ath12k_dp_tx_crypto_icv_len()
helpers in the TX path to obtain cipher-specific IV and ICV lengths.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01270-QCAHKSWPL_SILICONZ-1

Fixes: d29591d5b52e ("wifi: ath12k: Advertise encapsulation/decapsulation offload support to mac80211")
Signed-off-by: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c       | 46 +++++++++++++
 drivers/net/wireless/ath/ath12k/dp_tx.h       |  2 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 64 ++++++++++++++++++-
 3 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index c10da6195c9c..9644f9ef2c74 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -82,6 +82,52 @@ enum hal_encrypt_type ath12k_dp_tx_get_encrypt_type(u32 cipher)
 }
 EXPORT_SYMBOL(ath12k_dp_tx_get_encrypt_type);
 
+u8 ath12k_dp_tx_crypto_iv_len(enum hal_encrypt_type enc_type)
+{
+	switch (enc_type) {
+	case HAL_ENCRYPT_TYPE_TKIP_NO_MIC:
+	case HAL_ENCRYPT_TYPE_TKIP_MIC:
+		return IEEE80211_TKIP_IV_LEN;
+	case HAL_ENCRYPT_TYPE_CCMP_128:
+		return IEEE80211_CCMP_HDR_LEN;
+	case HAL_ENCRYPT_TYPE_CCMP_256:
+		return IEEE80211_CCMP_256_HDR_LEN;
+	case HAL_ENCRYPT_TYPE_GCMP_128:
+	case HAL_ENCRYPT_TYPE_AES_GCMP_256:
+		return IEEE80211_GCMP_HDR_LEN;
+	case HAL_ENCRYPT_TYPE_WEP_40:
+	case HAL_ENCRYPT_TYPE_WEP_104:
+	case HAL_ENCRYPT_TYPE_WEP_128:
+		return IEEE80211_WEP_IV_LEN;
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL(ath12k_dp_tx_crypto_iv_len);
+
+u8 ath12k_dp_tx_crypto_icv_len(enum hal_encrypt_type enc_type)
+{
+	switch (enc_type) {
+	case HAL_ENCRYPT_TYPE_CCMP_128:
+		return IEEE80211_CCMP_MIC_LEN;
+	case HAL_ENCRYPT_TYPE_CCMP_256:
+		return IEEE80211_CCMP_256_MIC_LEN;
+	case HAL_ENCRYPT_TYPE_GCMP_128:
+	case HAL_ENCRYPT_TYPE_AES_GCMP_256:
+		return IEEE80211_GCMP_MIC_LEN;
+	case HAL_ENCRYPT_TYPE_TKIP_NO_MIC:
+	case HAL_ENCRYPT_TYPE_TKIP_MIC:
+		return IEEE80211_TKIP_ICV_LEN;
+	case HAL_ENCRYPT_TYPE_WEP_40:
+	case HAL_ENCRYPT_TYPE_WEP_104:
+	case HAL_ENCRYPT_TYPE_WEP_128:
+		return IEEE80211_WEP_ICV_LEN;
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL(ath12k_dp_tx_crypto_icv_len);
+
 void ath12k_dp_tx_release_txbuf(struct ath12k_dp *dp,
 				struct ath12k_tx_desc_info *tx_desc,
 				u8 pool_id)
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.h b/drivers/net/wireless/ath/ath12k/dp_tx.h
index 7cef20540179..1af79af2ada2 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.h
@@ -19,6 +19,8 @@ enum hal_tcl_encap_type
 ath12k_dp_tx_get_encap_type(struct ath12k_base *ab, struct sk_buff *skb);
 void ath12k_dp_tx_encap_nwifi(struct sk_buff *skb);
 u8 ath12k_dp_tx_get_tid(struct sk_buff *skb);
+u8 ath12k_dp_tx_crypto_iv_len(enum hal_encrypt_type enc_type);
+u8 ath12k_dp_tx_crypto_icv_len(enum hal_encrypt_type enc_type);
 void *ath12k_dp_metadata_align_skb(struct sk_buff *skb, u8 tail_len);
 int ath12k_dp_tx_align_payload(struct ath12k_dp *dp, struct sk_buff **pskb);
 void ath12k_dp_tx_release_txbuf(struct ath12k_dp *dp,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index d2749de44553..306ab98d28dc 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -13,6 +13,49 @@
 #include "hal.h"
 #include "hal_tx.h"
 
+/*
+ * Convert an encrypted EAPOL frame from native-WiFi format to
+ * the layout expected by the firmware RAW encrypt pipeline:
+ *
+ *   [802.11 hdr][IV (zeroed)][LLC/SNAP][EAPOL payload][ICV (zeroed)]
+ *
+ * mac80211 delivers the frame as [802.11 hdr][LLC/SNAP][EAPOL payload].
+ * The MAC header length is read from the unmodified skb and is safe because
+ * ieee80211_hdrlen() only inspects the 2-byte frame_control field.
+ * pskb_expand_head() is used to grow both head (for the IV) and tail
+ * (for the ICV) in a single call and allocation.
+ */
+static int
+ath12k_wifi7_dp_tx_encap_eapol(struct sk_buff *skb,
+			       struct hal_tx_info *ti,
+			       struct ath12k_skb_cb *skb_cb)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	enum hal_encrypt_type enc_type =
+				ath12k_dp_tx_get_encrypt_type(skb_cb->cipher);
+	u16 mac_hdr_len = ieee80211_hdrlen(hdr->frame_control);
+	u8 iv_len = ath12k_dp_tx_crypto_iv_len(enc_type);
+	u8 icv_len = ath12k_dp_tx_crypto_icv_len(enc_type);
+
+	if (pskb_expand_head(skb, iv_len, icv_len, GFP_ATOMIC))
+		return -ENOMEM;
+
+	if (iv_len) {
+		skb_push(skb, iv_len);
+		memmove(skb->data, skb->data + iv_len, mac_hdr_len);
+		memset(skb->data + mac_hdr_len, 0, iv_len);
+	}
+
+	if (icv_len)
+		memset(skb_put(skb, icv_len), 0, icv_len);
+
+	ti->flags0 |= u32_encode_bits(1, HAL_TCL_DATA_CMD_INFO2_TO_FW);
+	ti->encap_type = HAL_TCL_ENCAP_TYPE_RAW;
+	ti->encrypt_type = enc_type;
+
+	return 0;
+}
+
 static void
 ath12k_wifi7_hal_tx_cmd_ext_desc_setup(struct ath12k_base *ab,
 				       struct hal_tx_msdu_ext_desc *tcl_ext_cmd,
@@ -91,6 +134,7 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
 	u32 iova_mask = dp->hw_params->iova_mask;
 	bool is_diff_encap = false;
 	bool is_null_frame = false;
+	bool eapol_encap_done = false;
 
 	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags))
 		return -ESHUTDOWN;
@@ -211,9 +255,27 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
 	case HAL_TCL_ENCAP_TYPE_NATIVE_WIFI:
 		is_null_frame = ieee80211_is_nullfunc(hdr->frame_control);
 		if (ahvif->vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED) {
-			if (skb->protocol == cpu_to_be16(ETH_P_PAE) || is_null_frame)
+			if ((skb->protocol == cpu_to_be16(ETH_P_PAE) &&
+			     !(skb_cb->flags & ATH12K_SKB_CIPHER_SET)) || is_null_frame)
 				is_diff_encap = true;
 
+			if (skb->protocol == cpu_to_be16(ETH_P_PAE) &&
+			    (skb_cb->flags & ATH12K_SKB_CIPHER_SET)) {
+				if (!eapol_encap_done) {
+					ret = ath12k_wifi7_dp_tx_encap_eapol(skb, &ti,
+									     skb_cb);
+					if (ret)
+						goto fail_remove_tx_buf;
+					hdr = (void *)skb->data;
+					eapol_encap_done = true;
+				} else {
+					ti.flags0 |= u32_encode_bits(1,
+							HAL_TCL_DATA_CMD_INFO2_TO_FW);
+					ti.encap_type = HAL_TCL_ENCAP_TYPE_RAW;
+					ti.encrypt_type =
+						ath12k_dp_tx_get_encrypt_type(skb_cb->cipher);
+				}
+			}
 			/* Firmware expects msdu ext descriptor for nwifi/raw packets
 			 * received in ETH mode. Without this, observed tx fail for
 			 * Multicast packets in ETH mode.

base-commit: ca27e3c2284a7a43ba390ed5ce0d68b3c869c0ce
-- 
2.34.1


