Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C00606A883
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uy5659F4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jp118GJp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RKhDNxsm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=axNjYOJZ6KTE3EderpD2lkwXQ/fTsDMZjnCrdMH86MU=; b=uy5659F4b1WMDp
	/LVbA6eKWSh7YvTs1IzDQwW+wQNWIhlA3z/AATbUCa4W1dztu+q2g4M9jHbHVi89SNoH4J6k868YH
	M4kaZc7CuqhJgKnlEcmdCAoDNYlGWL4enIakiduVRQr9a6B2+wzuPKteKUoWXoGIfHQB4MDvtUYSz
	3k8u/7XdmdORS6kVUDULgpWh54Z9lKx5TMuaqGGdHDxhc7e9ZEh1OnqN7BiZS71lkJK00MQpF+Ohz
	OK6auLpMDNB3g6ZBm7+cw0PorqGpX1wFGRONr0opkrRt0gbLp7mnNOWN0Ag7gEHf8aQcONZW/EGav
	V+URGHfEP7gcBZw7Uvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsdM-0000000DEnm-36S3;
	Fri, 13 Nov 2026 14:52:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsdJ-0000000DEmQ-49LC
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 14:52:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJSjB2796577
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 14:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	axNjYOJZ6KTE3EderpD2lkwXQ/fTsDMZjnCrdMH86MU=; b=jp118GJpgNfPNp3A
	l7nU9YD2tLO5swXKa6jmp9V+9JeHkmSefVLKcraWsTLj6BZIwYZf1P3pJiuUJ7cG
	SPVB2q9mT3hXSiqAXunK+LYm1YO4zzbi5AllJN05baW+0IpPgFGKlGuy6oBQs/xM
	772DjEr2tEfoXbacSR8W4ZuuKQ30jhZkdYrzDwqB+P7glGDPborBaHgeTyI/7ZlQ
	uWe59dsOSKROhhXjHHkfg0JImHbucUelWL/BG+xjlCbcNKQRwf2krBvb8osk2+Jn
	1f3c7v+bV8+A4w/KLWNOZqeYu4aeuc/IY/iyuxp2L8qeZBRplOxHy2CePQ+R0XYx
	F9mYbQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6ssyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 14:52:04 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99062be02ddso176658241.3
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 06:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794581524; x=1795186324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axNjYOJZ6KTE3EderpD2lkwXQ/fTsDMZjnCrdMH86MU=;
        b=RKhDNxsmtBLhKCNheZVxGSxKdcRYm6PVza1daogCHmmJkLBKDaEXDTQPeybrimMay0
         mshQ6RB7LiqTxQkVGxVi0U+kJNSTndWat4iM444GW4srPyo0V0t4Gaa6JHPl1N5nEP9b
         0POeaypWP4cRCYiNhePL8mxzCzn1oWPEqh42I8NwqMQo2u8B1vmfDe9o2IEE7m9cGonc
         K7hQCNkpDxweD4TrajXCoaDeI7xQZCEDGVSf410EtI013E8QlPw+U+K78nxaJoAhRXD2
         snqbTzAdXBTaDdwg9R1PmaW5oD0Zjq3dTpMBoWmcEpa19ueudhXA9PW/QE59vf+2Sooa
         +VwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581524; x=1795186324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axNjYOJZ6KTE3EderpD2lkwXQ/fTsDMZjnCrdMH86MU=;
        b=EDu3JRFCBV5xxyLpqHCDVhNBNvpSkC+7YDSFZfXyuu+RzBv6C6RNMXpxQObPcQ5aXL
         r3UDKmIwfPJPt5tQ1rYR1kR7qp/cmzPcBdk+/gnYh1Gt0VoqprY6+EUiphOa0ZdPrZaH
         DvqkzxX6QhYysSQeadYslFEKE4XmaxmFr5LtO2sPGUScGZQ8y1yfs4LF0ZGMlX2rzEbF
         pBPBnv1Ie9bayeCNyVZHdEdya9s7iZTC1EIAs2RO1yUvFiGXVlMrnvrANTp2Cl3Vgspo
         JIauARD+0Q10sAyyhTo6AjYGldziNp2j9kwlxP4Fc5ps+pKCLzvx6f/Ermv6Dp0x+uOR
         JmNA==
X-Forwarded-Encrypted: i=1; AL+hErHV7r1Yia4eRJVATSWgQaYPNRKQPC8Bq7s1cpa1vzn4EZamjMcuzyrTqL/S+VKSkGER6mcC/fY=@lists.infradead.org
X-Gm-Message-State: APuU4Z/AqI7BBobVGwxcAc6YOAcUlNhbgx+E0WoO4pDfljH9anaU46Xl
	09bBamrN1Ei6VLs/Ux1mmGku3fJNBRyfeuBprdZdyaNX+VFJVBXDckM1hJI1u7WHMExtoOG16Tu
	Cnm4UMYysF7x0XJgfA3nySk6/J9lKouOq0HdGcOoUxaatpXJga88GG//i2rEwDlnG
X-Gm-Gg: AYBFou37WXpSDJZ0I0KuSFtwLAa3su8eNEQDJqGwq+9NDjWWU/1A4CkVuA9xRIKlKwz
	zXR7jumKGEmZGdAXbeO7DL9M35asNN+pKVt1E0hfD6tI4hhZHqOp9fE0nUINRnyhsuXdwVOnWZO
	xfeB6DRbR4U0rTe7L2gPGshjBcp2zUJqOpp1uZNneG1gzPf+jxaoVrJVpW5w8I4HezHGyxyJCnI
	l9HW4LA1uAP8xiyfIraiT7WhvgMnAfUgxVAU57d9amTVXz/a5/jleUXYuZ6csL3p0B7ozv7rGdI
	c83PscT5z/UQ9/e2GjvwQMatkrb7k2LELI7gk6/gZHlh5gH8YMbpkyB4UsW6Z5Y/fPYL4oZhse+
	b9PlobRB37FDPUGeP2HRD3aBkJevmzKG/FA105ubpr7cSy0iXtpNNJo71cwT2VA==
X-Received: by 2002:a67:e111:0:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d64d47dc72mr655909137.1.1794581524051;
        Fri, 13 Nov 2026 06:52:04 -0800 (PST)
X-Received: by 2002:a67:e111:0:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d64d47dc72mr655891137.1.1794581523456;
        Fri, 13 Nov 2026 06:52:03 -0800 (PST)
Received: from localhost ([93.66.91.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm64680265e9.13.2026.11.13.06.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:02 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:51:42 +0100
Subject: [PATCH ath-next v2 1/4] wifi: ath12k: validate RX frame length
 before undecapsulation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-ath12k-rx-avoid-realloc-v2-1-46d186f8688b@oss.qualcomm.com>
References: <20261113-ath12k-rx-avoid-realloc-v2-0-46d186f8688b@oss.qualcomm.com>
In-Reply-To: <20261113-ath12k-rx-avoid-realloc-v2-0-46d186f8688b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>, P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX5YF+8aoSt/oK
 4kMTt/sGJiJhfLtAB+u3hNoztFxuzKHK8MooxDijbs0/gVfc8YmpcfeMTWgjFdWzP5m9uPrpami
 e1HL2YiEb4Cm/9oAfEUraeoZceKb8fdZiyFXXgUX4VFd1CsZL2Wnup+fzEbWgD9QaAxZ+UAgjsH
 VtVcmXOsSZtDlIIQnfYOC6jP0OLBWp8Hy01w4Vf1GPPKcy3mINp1WIDnHx11MRPB+pz0Bms/+Os
 e5JnUAvWFgQ32Iq1ju8UqDiurS8zuUPUb7bexG8FbkNf++9McYSbB9D8bk/jrEv59aoh55+L0Ou
 rHC9pgxUfAga5ttl3hIEDZi0tHt3niwzk0Jjx2JDhU7HhmlJJ56ps6gOJTgU2QEjJgxrxeYUO/M
 Dc5+xIf6amO04o7fKb3anIHevU72iiGfywpKdwHeKxzkwEWN7o5b96bTLN+JMJqfABgFMKRQaJ+
 OGmnL+0EbrIxoebIC6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX2JvygpeluS+O
 2KscfVKw6q2EcDQe4vhvJdixi3c0tkVSjCQrz3Gje+nstqURX3Zt6yeOi/4QwKrmN4q0LMDolXx
 uCgB8O2/ua67kTHNzk8tOFcfV7DpqFc=
X-Proofpoint-GUID: R1RgfXXY-xOOc3Fr-0bBihY9OTiBQscM
X-Proofpoint-ORIG-GUID: R1RgfXXY-xOOc3Fr-0bBihY9OTiBQscM
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af72415 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=vJIuTH4p0ATK6gluz4evpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nTyYClWBY-Pg7gOM_m0A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065206_174007_39344AA0 
X-CRM114-Status: GOOD (  20.70  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reject raw frames that are not longer than the FCS trailer before removing
it. For an skb shorter than FCS_LEN the unsigned length subtraction wraps,
so the skb_trim() length check turns the trim into a no-op and the FCS is
left in the frame.

Also verify that the frame is long enough for the crypto header and the
MIC, ICV and MMIC trailers before using the corresponding lengths, and
that the 802.11 header fits in the frame before moving it.

In the TKIP MIC verification path, reject frames too short to hold the
RX descriptor, the 802.11 header, the TKIP IV and the MIC, ICV and FCS
trailers before computing the MIC input length, avoiding an unsigned
underflow before michael_mic().

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c       | 86 +++++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp_rx.h       | 10 ++--
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 27 ++++++---
 3 files changed, 85 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 52838ade1b1d..6003ca901208 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -999,11 +999,11 @@ static void ath12k_dp_rx_h_undecap_nwifi(struct ath12k_pdev_dp *dp_pdev,
 	memcpy(skb_push(msdu, hdr_len), decap_hdr, hdr_len);
 }
 
-static void ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
-				       struct sk_buff *msdu,
-				       enum hal_encrypt_type enctype,
-				       struct ieee80211_rx_status *status,
-				       bool decrypted)
+static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
+				      struct sk_buff *msdu,
+				      enum hal_encrypt_type enctype,
+				      struct ieee80211_rx_status *status,
+				      bool decrypted)
 {
 	struct ath12k_dp *dp = dp_pdev->dp;
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
@@ -1014,49 +1014,75 @@ static void ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 	if (!rxcb->is_first_msdu ||
 	    !(rxcb->is_first_msdu && rxcb->is_last_msdu)) {
 		WARN_ON_ONCE(1);
-		return;
+		return 0;
 	}
 
+	if (msdu->len <= FCS_LEN)
+		return -EINVAL;
+
 	skb_trim(msdu, msdu->len - FCS_LEN);
 
 	if (!decrypted)
-		return;
+		return 0;
 
 	hdr = (void *)msdu->data;
 
 	/* Tail */
 	if (status->flag & RX_FLAG_IV_STRIPPED) {
-		skb_trim(msdu, msdu->len -
-			 ath12k_dp_rx_crypto_mic_len(dp, enctype));
+		int icv_len = ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype);
+		int mic_len = ath12k_dp_rx_crypto_mic_len(dp, enctype);
 
-		skb_trim(msdu, msdu->len -
-			 ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype));
+		if (msdu->len < mic_len + icv_len)
+			return -EINVAL;
+
+		skb_trim(msdu, msdu->len - (mic_len + icv_len));
 	} else {
 		/* MIC */
-		if (status->flag & RX_FLAG_MIC_STRIPPED)
-			skb_trim(msdu, msdu->len -
-				 ath12k_dp_rx_crypto_mic_len(dp, enctype));
+		if (status->flag & RX_FLAG_MIC_STRIPPED) {
+			int mic_len = ath12k_dp_rx_crypto_mic_len(dp, enctype);
+
+			if (msdu->len < mic_len)
+				return -EINVAL;
+
+			skb_trim(msdu, msdu->len - mic_len);
+		}
 
 		/* ICV */
-		if (status->flag & RX_FLAG_ICV_STRIPPED)
-			skb_trim(msdu, msdu->len -
-				 ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype));
+		if (status->flag & RX_FLAG_ICV_STRIPPED) {
+			int icv_len;
+
+			icv_len = ath12k_dp_rx_crypto_icv_len(dp_pdev,
+							      enctype);
+			if (msdu->len < icv_len)
+				return -EINVAL;
+
+			skb_trim(msdu, msdu->len - icv_len);
+		}
 	}
 
 	/* MMIC */
 	if ((status->flag & RX_FLAG_MMIC_STRIPPED) &&
 	    !ieee80211_has_morefrags(hdr->frame_control) &&
-	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC)
+	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC) {
+		if (msdu->len < IEEE80211_CCMP_MIC_LEN)
+			return -EINVAL;
+
 		skb_trim(msdu, msdu->len - IEEE80211_CCMP_MIC_LEN);
+	}
 
 	/* Head */
 	if (status->flag & RX_FLAG_IV_STRIPPED) {
 		hdr_len = ieee80211_hdrlen(hdr->frame_control);
 		crypto_len = ath12k_dp_rx_crypto_param_len(dp_pdev, enctype);
 
+		if (msdu->len < hdr_len + crypto_len)
+			return -EINVAL;
+
 		memmove(msdu->data + crypto_len, msdu->data, hdr_len);
 		skb_pull(msdu, crypto_len);
 	}
+
+	return 0;
 }
 
 static void ath12k_get_dot11_hdr_from_rx_desc(struct ath12k_pdev_dp *dp_pdev,
@@ -1143,11 +1169,11 @@ static void ath12k_dp_rx_h_undecap_eth(struct ath12k_pdev_dp *dp_pdev,
 	ether_addr_copy(ieee80211_get_SA(hdr), sa);
 }
 
-void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
-			    enum hal_encrypt_type enctype,
-			    bool decrypted,
-			    struct hal_rx_desc_data *rx_info,
-			    struct ath12k_dp_peer *peer)
+int ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
+			   enum hal_encrypt_type enctype,
+			   bool decrypted,
+			   struct hal_rx_desc_data *rx_info,
+			   struct ath12k_dp_peer *peer)
 {
 	enum ath12k_dp_rx_decap_type decap_type = rx_info->decap_type;
 	struct ethhdr *ehdr;
@@ -1156,10 +1182,16 @@ void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu
 	case DP_RX_DECAP_TYPE_NATIVE_WIFI:
 		ath12k_dp_rx_h_undecap_nwifi(dp_pdev, msdu, enctype, rx_info);
 		break;
-	case DP_RX_DECAP_TYPE_RAW:
-		ath12k_dp_rx_h_undecap_raw(dp_pdev, msdu, enctype, rx_info->rx_status,
-					   decrypted);
+	case DP_RX_DECAP_TYPE_RAW: {
+		int err;
+
+		err = ath12k_dp_rx_h_undecap_raw(dp_pdev, msdu, enctype,
+						 rx_info->rx_status,
+						 decrypted);
+		if (err)
+			return err;
 		break;
+	}
 	case DP_RX_DECAP_TYPE_ETHERNET2_DIX:
 		ehdr = (struct ethhdr *)msdu->data;
 
@@ -1201,6 +1233,8 @@ void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu
 		}
 		rx_info->rx_status->flag |= RX_FLAG_8023;
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL(ath12k_dp_rx_h_undecap);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index a78efa1d9569..5bc5b28670b7 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -197,11 +197,11 @@ void ath12k_dp_extract_rx_desc_data(struct ath12k_hal *hal,
 	hal->ops->extract_rx_desc_data(rx_info, rx_desc, ldesc);
 }
 
-void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
-			    enum hal_encrypt_type enctype,
-			    bool decrypted,
-			    struct hal_rx_desc_data *rx_info,
-			    struct ath12k_dp_peer *peer);
+int ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
+			   enum hal_encrypt_type enctype,
+			   bool decrypted,
+			   struct hal_rx_desc_data *rx_info,
+			   struct ath12k_dp_peer *peer);
 void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struct *napi,
 			       struct sk_buff *msdu,
 			       struct hal_rx_desc_data *rx_info);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 473887ed4bb1..429f826923b2 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -359,6 +359,7 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 	struct ath12k_dp_peer *peer;
 	struct ieee80211_rx_status *rx_status = rx_info->rx_status;
 	u32 err_bitmap = rx_info->err_bitmap;
+	int err;
 
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
 			 "dp_rx_h_mpdu called without rcu lock");
@@ -424,8 +425,10 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 	}
 
 	ath12k_wifi7_dp_rx_h_csum_offload(msdu, rx_info);
-	ath12k_dp_rx_h_undecap(dp_pdev, msdu, enctype, is_decrypted, rx_info,
-			       peer);
+	err = ath12k_dp_rx_h_undecap(dp_pdev, msdu, enctype, is_decrypted,
+				     rx_info, peer);
+	if (err)
+		return err;
 
 	if (!is_decrypted || rx_info->is_mcbc)
 		return 0;
@@ -1059,6 +1062,11 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 
 	key_conf = peer->keys[key_idx];
 
+	if (msdu->len < head_len + tail_len) {
+		dev_kfree_skb_any(msdu);
+		return -EINVAL;
+	}
+
 	data = msdu->data + head_len;
 	data_len = msdu->len - head_len - tail_len;
 	key = &key_conf->key[NL80211_TKIP_DATA_OFFSET_RX_MIC_KEY];
@@ -1086,9 +1094,12 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 	}
 
 	ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
-	ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC, true,
-			       rx_info, NULL);
-	ieee80211_rx(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
+	if (!ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC,
+				    true, rx_info, NULL))
+		ieee80211_rx(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
+	else
+		dev_kfree_skb_any(msdu);
+
 	return -EINVAL;
 }
 
@@ -1741,8 +1752,10 @@ static bool ath12k_wifi7_dp_rx_h_tkip_mic_err(struct ath12k_pdev_dp *dp_pdev,
 	rx_info->rx_status->flag |= (RX_FLAG_MMIC_STRIPPED | RX_FLAG_MMIC_ERROR |
 				     RX_FLAG_DECRYPTED);
 
-	ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC, false,
-			       rx_info, NULL);
+	if (ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC,
+				   false, rx_info, NULL))
+		return true;
+
 	return false;
 }
 

-- 
2.56.0


