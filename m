Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE72606A883
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 14:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G+5ap9GK;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcX0Acdj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CtdB8pIb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b98aLYZY43BuAq3tdafwcAEgTbX2vEpfIRzzDU5rgR0=; b=G+5ap9GKgGgNf0
	E+CJEDtE4S5KcpYacyZ/hgOB77XlJbHj8JTzmV2WlvP7pKdnfh+frOaFV7hibgzY7nUldOhA8YGJA
	OlIaueLUTiBoG3YV62Im5uYIy/LIb81/vDyNmpt0OqHvl9cDQ05lreMqiXKsxcnSj+tMkU3DcUelb
	Ngqzjj6jZEwPr1d5TDfW0qhSBI8e9n8wb9y2FHd4D15wHsyDn8j6xEI1eAiuyLNb+i1d+mzyGzspP
	Mt8b8+XXvbhY6xSeBuqzg18xlJCleOfZvuCiZwrHXUVz0ugHRx39xycgOe6h7iRx0tkVP+UQgjkQ+
	vuzWOejzMgr1HRJSnoEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsdR-0000000DErI-0NSm;
	Fri, 13 Nov 2026 14:52:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsdN-0000000DEnz-18Ys
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 14:52:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKQMx3126274
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 14:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b98aLYZY43BuAq3tdafwcAEgTbX2vEpfIRzzDU5rgR0=; b=YcX0AcdjdfwPtCy+
	RVqptHAIcvexn0EXhWGA3Cu8tyGcqhdNsnO3sQVq29Z+1DQiBEyl9p/u0/mh4Kq+
	Huxf92+6w+u/CM7TfKBwp7jlkg35Iv7tt2UJP4zsX5Bik9XMSvhnuDL1b7KeIdgC
	jFCsX6jLwRYepVQG/Ey4RIAxv6HUn7yQPwvqumqdOb3NB3fQuHXWsSO/p/+QK2zK
	g19jObeuo+bjQP1UpYmlO4KQJMG+259tCtxk4voFA9ivJa+83bQzyxou4jqdDtfY
	I+xbijAB+kSzzv7Et82iWfIPPp26pIUreklixNbMfAt7L7fVJoL9Vt4ZRmMSylTl
	+VO3tg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bcgjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 14:52:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-947a607ec40so103581585a.3
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 06:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794581528; x=1795186328; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b98aLYZY43BuAq3tdafwcAEgTbX2vEpfIRzzDU5rgR0=;
        b=CtdB8pIbGIFmoE6bjB4OdHSu+dgzX54XMMmWk3Ss3KDuAas/OgWWB7jO21BorO+XgY
         gYJNu2XRkG59+Dp2zHwLHuj2N8oROuZnQVoqrloozLuZIhKp+h6bXgptpUGZfSNbWbg7
         RYkqr/sZvrfZULjjH9XdQSU4u4D9a/aLRQp48eldLdXixNX+IafUMhUPdFt0VqRfJ7A8
         KwrzHbYGK8cFRO3fK9qfFkKt3N061jaH5aZ+/0ozfVkMyxe1Ckg/cWQ/ilogNSgHB0yD
         pf5N1hHBTKjCZYT8VmFAkXhTL4MRXd6xURMz7i10JUhacaqbw4CslKQwkyNl56zt3wJu
         lwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581528; x=1795186328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b98aLYZY43BuAq3tdafwcAEgTbX2vEpfIRzzDU5rgR0=;
        b=uBdizBdTeLl6v8AL8MhcTCHAuDqjnCynt7CrHcUAILjg+AAdDN1EyC8C1usLYL1ZHE
         ZFjbdDzpoNLUrAEqCbGQkbvQO0/Sjjt3j/HhtiSk3xJhdTTAL4BNuUq7XGYgWY9fRcM1
         XJJLWBaoR9pvx/p9IXnxKxTm/GoWGh02FvqpQfbq3iZ7g2bECMrZjxJSnJkNHdMBm4Xe
         MmVhyICvaOJH1HrHO1HaJRn1hBgEJga7NqhcQ6CrLwUKpVu9M5s+Dc+97rkzEXMjua7P
         CJ8QDeBt/l7USau8Y9ROiiWfLBMv5gMe94wEC4R38NQJDThKwafBkvbHgy1tdaOp7yfD
         2oTA==
X-Forwarded-Encrypted: i=1; AL+hErF1U+ziHUx5zzIZhzLxav0p0AStX6eV5fp/TkeF+HHHJ+f6X6dsjTvUdb5buizINlgPtsPv4xE=@lists.infradead.org
X-Gm-Message-State: APuU4Z8NwFiwHCWEoYBYHhntch2bq/B1WJAeuX/HROzaq9f8fJMIj+TD
	f+rDzoVCU9+ntBugRobbZGY7OI5VcGfWIXidU4F5W1oEZNrjcSdXEcIvnHCg426ZTwt2rd/3JKW
	tZED469wMwAUZgiH7QRp6mFPeBtB4MLsIu7eYCvnImn+u5/VKXwpnJ9bMiqhGEC0y
X-Gm-Gg: AYBFou2O1AP7hVOVEpJRGk/be5uK2SBZK+Yn7q7NQ+W6THrhYSK6cdhKjpVvFAKbKHL
	sfyv8gVWcXrR/51zhskFhuRbNqsPZ8UYgs2RWMqB2IAL1mWdfZ0/wGwAZAg3n9wkrZ9/3rS252j
	zbUHntV45kPWTe2HK13N/AC9Ydkca6QoWkvdeiA488BQTRnKmk5cPFfRkm0vHGk1Lq1VXL6jM6u
	+7BUTiJA75atIrUP6BOVS8BYh+vkGZln9mBDscUfS48SqvF06Uzlzfd8yA8/lR7OwhfZcGpaj7S
	PQOLuYmARrC2UYKmlsd9MeW3/QDtGmFLLqD5yNq/cpJ9TUVV8KKSSLyvnfeaf0IVAkwgSyQIG+S
	gKO0GKOomvRjjSKRQtQJrb/COHxIba1kqcF+ztXcbJbnYFTHxuvKcCDfQF2jCFQ==
X-Received: by 2002:a05:620a:8904:b0:93c:c2f4:9182 with SMTP id af79cd13be357-9494bb8ab63mr407281685a.20.1794581527506;
        Fri, 13 Nov 2026 06:52:07 -0800 (PST)
X-Received: by 2002:a05:620a:8904:b0:93c:c2f4:9182 with SMTP id af79cd13be357-9494bb8ab63mr407276885a.20.1794581526838;
        Fri, 13 Nov 2026 06:52:06 -0800 (PST)
Received: from localhost ([93.66.91.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm5163364f8f.5.2026.11.13.06.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:06 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:51:44 +0100
Subject: [PATCH ath-next v2 3/4] wifi: ath12k: rely on pskb_trim() to trim
 the received skb
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-ath12k-rx-avoid-realloc-v2-3-46d186f8688b@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af72418 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=vJIuTH4p0ATK6gluz4evpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GhD-aHKe0MmzFVZlnzIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: RoGokZT-9XzESGXNdR9uzfRsZfgqNq_Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX13MpmKElzp1u
 7DQiv5iQxJEsd2L7MO8LWn6pn6dWfOzdbSptA+lIcKCDB18Vj1QI2vzfB6oQhU4TYD4oJR7w8Sv
 aBMuOr+O9tOkAWk3YCTFhhEFVEIzRuYWdNwZ6KHVRko0fKpWT6Z9mhtSpgO9C97+SC1uYcEG+FT
 yk2rajpD+BtWn8XYlhLolDvX1mDSO+GYn6fZHrnwhxbDigeaH/8N+2Kfc0lo+qzrOx9qI3vvPhb
 k2iaNfykckUgMpzkNcuA9Y1GrJCdOAEvaihextbmSWV+3WKz3915vjZnQEZFGzhOpKl4wchufD2
 CH/81oYvBMP4CJD5h5AkCXwe1em+HPvMdXBDknooTBWp0tOJxns66qpu52YEasxW8a4Vw2R3g2z
 nPlPrin8EL0evr9HzhRSYAntVdAY5D4sClkjmYaAKuM9sacy+jO4BJn+K2X/PX1q2hFYM/elGDr
 jCUBKKHHlsHgZYuqL3Q==
X-Proofpoint-ORIG-GUID: RoGokZT-9XzESGXNdR9uzfRsZfgqNq_Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX2fmLV4RCRtYO
 GTxlLEjFUDuW70dFCpY4cVUcrcEkku+mmW6gWJnfDCWq1fUA6oTQzbNXdB8NGHz0mqvOKyoY2Ab
 Seybm0T9zTOmbNFnebpRbf4O5TaCvVY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065210_278151_B8F99FA1 
X-CRM114-Status: GOOD (  17.24  )
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

Prepare the RX path for handling non-linear SKBs introduced by the
following RX batching change. skb_trim() cannot trim non-linear SKBs
(__skb_set_length() warns and leaves the length unchanged), so use
pskb_trim() instead.

pskb_trim() can fail if it needs to allocate while removing data, so
return its error from ath12k_dp_rx_h_undecap_raw(). The existing callers
then drop the frame instead of delivering it with an untrimmed FCS, MIC,
or ICV trailer.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 39 ++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 063bc3e58236..74c2d2affb0d 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1007,9 +1007,9 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 {
 	struct ath12k_dp *dp = dp_pdev->dp;
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
-	struct ieee80211_hdr *hdr;
 	size_t hdr_len;
 	size_t crypto_len;
+	int err;
 
 	if (!rxcb->is_first_msdu ||
 	    !(rxcb->is_first_msdu && rxcb->is_last_msdu)) {
@@ -1020,13 +1020,13 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 	if (msdu->len <= FCS_LEN)
 		return -EINVAL;
 
-	skb_trim(msdu, msdu->len - FCS_LEN);
+	err = pskb_trim(msdu, msdu->len - FCS_LEN);
+	if (err)
+		return err;
 
 	if (!decrypted)
 		return 0;
 
-	hdr = (void *)msdu->data;
-
 	/* Tail */
 	if (status->flag & RX_FLAG_IV_STRIPPED) {
 		int icv_len = ath12k_dp_rx_crypto_icv_len(dp_pdev, enctype);
@@ -1035,7 +1035,9 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 		if (msdu->len < mic_len + icv_len)
 			return -EINVAL;
 
-		skb_trim(msdu, msdu->len - (mic_len + icv_len));
+		err = pskb_trim(msdu, msdu->len - (mic_len + icv_len));
+		if (err)
+			return err;
 	} else {
 		/* MIC */
 		if (status->flag & RX_FLAG_MIC_STRIPPED) {
@@ -1044,7 +1046,9 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 			if (msdu->len < mic_len)
 				return -EINVAL;
 
-			skb_trim(msdu, msdu->len - mic_len);
+			err = pskb_trim(msdu, msdu->len - mic_len);
+			if (err)
+				return err;
 		}
 
 		/* ICV */
@@ -1056,22 +1060,31 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 			if (msdu->len < icv_len)
 				return -EINVAL;
 
-			skb_trim(msdu, msdu->len - icv_len);
+			err = pskb_trim(msdu, msdu->len - icv_len);
+			if (err)
+				return err;
 		}
 	}
 
 	/* MMIC */
-	if ((status->flag & RX_FLAG_MMIC_STRIPPED) &&
-	    !ieee80211_has_morefrags(hdr->frame_control) &&
-	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC) {
-		if (msdu->len < MICHAEL_MIC_LEN)
-			return -EINVAL;
+	if (status->flag & RX_FLAG_MMIC_STRIPPED) {
+		struct ieee80211_hdr *hdr = (void *)msdu->data;
 
-		skb_trim(msdu, msdu->len - MICHAEL_MIC_LEN);
+		if (enctype == HAL_ENCRYPT_TYPE_TKIP_MIC &&
+		    !ieee80211_has_morefrags(hdr->frame_control)) {
+			if (msdu->len < MICHAEL_MIC_LEN)
+				return -EINVAL;
+
+			err = pskb_trim(msdu, msdu->len - MICHAEL_MIC_LEN);
+			if (err)
+				return err;
+		}
 	}
 
 	/* Head */
 	if (status->flag & RX_FLAG_IV_STRIPPED) {
+		struct ieee80211_hdr *hdr = (void *)msdu->data;
+
 		hdr_len = ieee80211_hdrlen(hdr->frame_control);
 		crypto_len = ath12k_dp_rx_crypto_param_len(dp_pdev, enctype);
 

-- 
2.56.0


