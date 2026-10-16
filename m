Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C39CCF2C1
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hCi0ui3NHwMAJmdO0y8zdttkG3wSqNgrdODmZuaJX4=; b=p3fgC41f++vhPwp/n64T6gXQ1D
	VHAPmKOhSzv8F+7nWgFmtH0/oGNDZw87BAhhSKJl5W547IofIKE2ctV5lyrtHZWGRW8SewvEOOIK3
	W5My7RIfq9MLywsm6PKTU2ivkupWw0g1ncI396MNMSia5REYl9tZwA1x7iKRrOT1jwytEcdxGoI2b
	XVAHy0fxhvxGGivHPJstJOciYipmCKySrPsz2L7KVS/3IFFUYdNR6bu5g1Tp1NLve6DxlBt1s297g
	DoZMlJIPXAh6dHILfN2mpyqxFJmNK1ZqxnUon074meJaqvc38PNqC//zQuwe8aNACz4mu9Q8Gi8Yr
	Rwd8E6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjfw-00000003Fnu-2yi1;
	Fri, 16 Oct 2026 15:16:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjfu-00000003FmM-07BY
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 15:16:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE65bx2154151
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 15:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hCi0ui3NHwMAJmdO0y8zdttkG3wSqNgrdODmZuaJX4=; b=h3I2Vinw4TzYKP6X
	3Th+/yM26fxNoVs5SMfEJuuK7jMkDAwBOlJhARvrk9RqX7RQwbNt+43aacyg7+ws
	Aw909K64hsuRvL2v0eERwuVLpgaeitrjgBn3G87nnYBJUdaX0cvGtd87za+nN3P6
	XYJ5Ja3TgS8jbgosavkjYPIplxY276i6AWy3NyClwGvdMfE2S1MY7fRXS6Gf/hZ7
	kHTPvNOCWxsHNvBlkAekYz/i/U/ktPKDTpsHcc+DC6CneJBVfyTxmOKnZ/CFFHtw
	vxXejV3AAm7zd+o5Zo/ZfwwCkLcvRGk8depzVRqCeZug+geCfX9QDg10qVtyQAkK
	282jWQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhums38h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 15:16:48 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5de9d3d00acso28604e0c.0
        for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792163808; x=1792768608; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hCi0ui3NHwMAJmdO0y8zdttkG3wSqNgrdODmZuaJX4=;
        b=ItAsw0n2jn8wznwWC4KhVWIavp6s9tQ3v1Bil1JYUOTKJ5krkzSSWBaSoxdFWa4WiD
         +6Jv1fwTMlKaEQbowB3ZcVykJvs1hfdrAlAhI1oklYd2rhEhUR16QSxPBvXIXcPJ9p21
         3iiR+ZRFHnUEzQ3NH6GetKfRsttGWJsb/1/0mlm93vK9HFN7gItu+VNIYFcY1Dre2ENh
         dz8hRyJbWGQrtP9MeKreoV/9tBql3jK6E2dnZk3MWjhTGc1+9oaAjZ8Z2S8ilPXZh3Gs
         n+YswLAi0wqT/q/HMklzDUuaI8iLvxY3z2I3Ub+nneTFURPpAdW7KrEpiglkw3THvOq7
         38Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163808; x=1792768608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hCi0ui3NHwMAJmdO0y8zdttkG3wSqNgrdODmZuaJX4=;
        b=BhLNBEdNnAsz/yXI5/PcwLOx50tL1kcGLmkNJEaIQf0HXDYQQ3WiyE7EXaSb3IsXMq
         U8jxXLax3aPIhDsgd29fzIN2fh3tYSjkIRsyaoZ9xu+W1TSKbk+DOHHbAgpufKGDm6Pa
         /Zp9XFgaCXs6401iPlg83sF0l58xEboVAOg5ocEhJqGElTYwnBeUz2FYspq1F6KDo+4d
         UESZC6iEPbjwk+BJ+23tkltqFqR0IfkouwXVIq899fOhMydWbxgO396Wbw4godU4dFOl
         YtyqiwR0T9GLMD5t/NXxSSvnw99+epfJMau4nnhfh24IjOG92+tGwvMhrpgOatlY9g1I
         A9Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwMpmRjSxaUtQSTwE+tpyB1/Jg9lxKQlK7KE3j3O3G71bp3/QvUQS0xbRIZMq9ruewgCCljuTA=@lists.infradead.org
X-Gm-Message-State: AFq9FYJeTztFFB4xiv34odhWQvaXjBUIV13GvYRO+CsD/v7zhfzkFVE2
	c9XZo5QpMN279SLO9rzN9mRgRGyUy/v/7nc+UYXXStqPFwCINxwRzVgAGWp2CFhjP9hkacF29mc
	DfnST3tvOjwh4qM0qTw/1/dYHt5Pa64yKVcdxVohdgkbmeuF8LJfGDmTxQqjNxwF5
X-Gm-Gg: AYBFou3bclZPkiFH2q2PzuL2dt00DptnNlmQ1WFnPStOoClwuDLZl8Ujsik8VgBEwQc
	55qYTtQBm5MCQthtg2+ukJMPSLZ8dJHLxsyff5gTcTor5O9XOz43479s1YRvJEZi8kGAg3vegRg
	VJemS04SZlyoVnvwI+11pYPSf7NfzoG0/HuNTbff5xx0SnW8T7RQtDUIRSQgOYGPUujyQxUXYk6
	G2E4cJZrQPO/zhtApa9Uu8lmNBALg479+EOrislGMVg17EpJQxS4AaIW2V26ior9DIbpvexl7du
	tN1xhFIvKkMsi2QPHsGkUn0ls42uQXPabjH6mQh98qshWOAOQ96WmhsutA0efMjR204w1beDf5W
	YuuVZCMUJumeorA==
X-Received: by 2002:a05:6122:30f1:b0:5e9:5e79:cdf with SMTP id 71dfb90a1353d-5eaaa90ff0amr196575e0c.12.1792163808227;
        Fri, 16 Oct 2026 08:16:48 -0700 (PDT)
X-Received: by 2002:a05:6122:30f1:b0:5e9:5e79:cdf with SMTP id 71dfb90a1353d-5eaaa90ff0amr196524e0c.12.1792163807638;
        Fri, 16 Oct 2026 08:16:47 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5957sm5538473f8f.9.2026.10.16.08.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:16:46 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:16:28 +0200
Subject: [PATCH ath-next 2/3] wifi: ath12k: rely on pskb_trim() to trim the
 received skb
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ath12k-rx-avoid-realloc-v1-2-0ce6cd99dd5f@oss.qualcomm.com>
References: <20261016-ath12k-rx-avoid-realloc-v1-0-0ce6cd99dd5f@oss.qualcomm.com>
In-Reply-To: <20261016-ath12k-rx-avoid-realloc-v1-0-0ce6cd99dd5f@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>, P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA2MCBTYWx0ZWRfX8Wd7p4wr3Wym
 FJic/GQPvMViAF7+PCs1ylwelP80TsqEqCSHYd9shcCV2iQtG2oYtQr1lpEQWfySTo9AIbJJvsJ
 PtgLwHUzguPtcpsvmf2NTeeYPvgqjf4=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad23fe0 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=PbDebaSGg_hcJSwW8RsA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: tvJmylkKRMAScOaC8FuHs_4YLOzt2tW3
X-Proofpoint-ORIG-GUID: tvJmylkKRMAScOaC8FuHs_4YLOzt2tW3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA2MCBTYWx0ZWRfXznA08Vpy5RGD
 5FspdZdy7Q01Xf9hQWcfwXb3LrbmkaDKbdcJBzmJJeO1E3+fnoMlgAJKnbGpCIfU8LIliA1PFPa
 w3IL5oUEFiODEi0QQ+sEg5iDSeN2iHm8MfhICVKdSSnHJTqan6924esJTXfrwLSUEAFPqx+CT31
 45mXuFPBB4PTtIDpTb6cvEVCg6Ejz1cdTA9fVkrPI0uEvFBKIz6jN8lcyGecctcV7kkSKRD2enS
 dGeMNh1vKPaL3i6AchmvuEgal3dZDFv3nr6WI10TkED0/qRB7QleWLK9+job/pNThTuBbvwDRgJ
 zRI+odNTM+JFfKo/g9mfTmkCgnuNr14U8PhQWy7WbBPPQtIfwH7wMrLacUu8vwTc6+b8a12804e
 fMvrYLyAbyp4oXHkz0nBpiPB8N0x4VHhS+D7WsiUHHeBfAK4EuuwPCLJZ8sQphLbmZLKPDL5ed/
 4JhbzDyD0aXFiQ1Vl3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_081650_206094_C20DF866 
X-CRM114-Status: GOOD (  14.31  )
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

Prepare the RX path for handling non-linear SKBs introduced by the
following RX batching change.

pskb_trim() can fail when trimming shared fragments, so propagate errors
from ath12k_dp_rx_h_undecap() and drop the affected frame instead of
delivering it with an untrimmed FCS, MIC, or ICV trailer.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 48 ++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 40b8da34268f..4f37ef12e40f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1010,6 +1010,7 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 	struct ieee80211_hdr *hdr;
 	size_t hdr_len;
 	size_t crypto_len;
+	int err;
 
 	if (!rxcb->is_first_msdu ||
 	    !(rxcb->is_first_msdu && rxcb->is_last_msdu)) {
@@ -1020,7 +1021,9 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 	if (msdu->len < FCS_LEN)
 		return -EINVAL;
 
-	skb_trim(msdu, msdu->len - FCS_LEN);
+	err = pskb_trim(msdu, msdu->len - FCS_LEN);
+	if (err)
+		return err;
 
 	if (!decrypted)
 		return 0;
@@ -1029,28 +1032,47 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 
 	/* Tail */
 	if (status->flag & RX_FLAG_IV_STRIPPED) {
-		skb_trim(msdu, msdu->len -
-			 ath12k_dp_rx_crypto_mic_len(dp, enctype));
+		err = pskb_trim(msdu,
+				msdu->len -
+				ath12k_dp_rx_crypto_mic_len(dp, enctype));
+		if (err)
+			return err;
 
-		skb_trim(msdu, msdu->len -
-			 ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype));
+		err = pskb_trim(msdu,
+				msdu->len -
+				ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype));
+		if (err)
+			return err;
 	} else {
 		/* MIC */
-		if (status->flag & RX_FLAG_MIC_STRIPPED)
-			skb_trim(msdu, msdu->len -
-				 ath12k_dp_rx_crypto_mic_len(dp, enctype));
+		if (status->flag & RX_FLAG_MIC_STRIPPED) {
+			err = pskb_trim(msdu,
+					msdu->len -
+					ath12k_dp_rx_crypto_mic_len(dp,
+								    enctype));
+			if (err)
+				return err;
+		}
 
 		/* ICV */
-		if (status->flag & RX_FLAG_ICV_STRIPPED)
-			skb_trim(msdu, msdu->len -
-				 ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype));
+		if (status->flag & RX_FLAG_ICV_STRIPPED) {
+			err = pskb_trim(msdu,
+					msdu->len -
+					ath12k_dp_rx_crypto_icv_len(dp_pdev,
+								    enctype));
+			if (err)
+				return err;
+		}
 	}
 
 	/* MMIC */
 	if ((status->flag & RX_FLAG_MMIC_STRIPPED) &&
 	    !ieee80211_has_morefrags(hdr->frame_control) &&
-	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC)
-		skb_trim(msdu, msdu->len - IEEE80211_CCMP_MIC_LEN);
+	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC) {
+		err = pskb_trim(msdu, msdu->len - MICHAEL_MIC_LEN);
+		if (err)
+			return err;
+	}
 
 	/* Head */
 	if (status->flag & RX_FLAG_IV_STRIPPED) {

-- 
2.56.0


