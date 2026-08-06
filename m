Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC6AC56205
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA8MWFLnRkH6OIWjAyG2+978gj5PqzR5yRejjiikDww=; b=S3i/KCtIA62gs4VkyU4/eGayiQ
	V1AEBFEwvPC5W2/3aK+xRRZfR5MSHJgm6cwhLtplOHLpyMWzSLkOjR5Dc5JumRe7/VDzkm7wAR1Jc
	U00mXdb83avj6wuL2G1Q4tUFS+mJx9RiepW7I0caoEwKhziOLER0bFJstDz2ecq/b/1D2YpBYihxv
	v8NyKBg2F3ABjd+T2HP1RlV2Ownkms+KA7jlT9HZgekQ+HbfktWKjqlbihBB5JkefNWxi6fx8IrG8
	+LIv5M/pgnegl2ZBSMGvK96BrG8WzHjNYDzQoulhFsXdlyE4yXYD9ui1Vpf1TdGn8QN+PPZvsoMFS
	asLOWmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwv7-00000005iR1-3anR;
	Thu, 06 Aug 2026 12:09:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwv5-00000005iPG-0ClD
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 12:09:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769netp1625703
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 12:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NA8MWFLnRkH
	6OIWjAyG2+978gj5PqzR5yRejjiikDww=; b=OGSEjlJJPvOtbfa+y9KmupCVLeU
	aUxUv4DGcjvUX0Hj71hHlo18SxlnHTIlhIBj4kGR/HM2zTVlDxqKb0avQ0pc/T75
	zkkz5Afx8bCoa4xUOuto+UyTAHF4q7SlfrTCixvVgUahBeHKf/3xivw68yve+oL4
	MgLSBZCSVR3efr/aJZbGT3J9f+nTnTrE2o/mX2sx+Lo708zoUu8Sj5acB+lc+Ch8
	7fPVyRufbWXIFhglWdb75xugH0gJ8lwsrqAyNcIesr4qixE8brSSYyb9pJjnRK7x
	8liQRFwq7bqwWWqy7C+CNj48GmAqKs9ik872wYCB2UJEno14O5+EZc/yJ9g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntnh785-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 12:09:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso2671109a91.3
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 05:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018188; x=1786622988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NA8MWFLnRkH6OIWjAyG2+978gj5PqzR5yRejjiikDww=;
        b=PvzeaQHxZk3c/WXtE3vkxu+9PTGPZPiBWMPaZx+RRUiU/cOKVenGJBzV5UXXtW5lnC
         ZINRW9EKPvrqJAc0oKZ+HVDnEkUiXLAu5ToWagAu/Lz0wQnbJyz9iW4rB4a0J3M4OiH9
         MTaTrckFquvPoOOxA5C8fZYEiFgGVM0G4hal0I3T3yepJbulpr4ehC547T8UP3OyS8jZ
         UHV+esAqm0UAxcOcM/T7ns9qEIbp7hxv0PSOsvfdpOZDOrEGwNB+IZxs4NiLecwCk07Y
         UJhHlprhIMjRm+6k9hLirzmzOtromqeARm8BUJVR3NGutV7FKqpvFW9GLRwSBebK1dj1
         EsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018188; x=1786622988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NA8MWFLnRkH6OIWjAyG2+978gj5PqzR5yRejjiikDww=;
        b=KozryU63JP6E9Ah3YEoiDZuTov5CvVU8jCVFJhSMUHu/SVtrKdQ/lhnacoXfjPci7v
         kgxZ+tp6kYwqUnr1aMw0zWiHP5DSwwuBP6CxTo9ZlPbXWmB3gc6gGvLiq3qGQpaOlss0
         zdVT0QDYt1BzGHeGfG/mt5qi5W3t0MzDTIgBWWALDRz3YnzSWY8JS9VCQszvK27UFWwp
         lbBjLwcGjgNZfGdN67iqK/XNvpL5KY2hwoWUux59AvRaJVj+5a2z2ZMUBniPsTgLGfDY
         fN3o+xRlqxR93HfOEKuB2Ghl9XwOGoDqwfCEjQYkBefkuWeE4kimR7kgoWxvOz8LDhuu
         iiXg==
X-Gm-Message-State: AOJu0YwJnaBEP/fx/OsQBlxapLAFgaq7OYikNLSu+1Qn2MMRv020uy/O
	XgJvd8RgraIDmBZS6PbxqphiQ+e4urzf1rzBEYk821Ssb8KgO9dKRPwqPIBe9jJ1YSFKRRhoiBw
	Qm1qEhIW/OxnTc3M39QJOgG4sHLw8yN7+/McVlswO3UGbkGKjtmbklPsQaK/xkMnPvm+FhBaI
X-Gm-Gg: AR+sD12xu5K74wuuAbpWGVUacSbGepUvBwNCf/ky6O1sedhldMyHoLvUvmyOfd6wpce
	FQzeLQ42jkQGQZxjHgq0UIfeVmFCXMBdWoxR9piVb9WcSPDZGrN1ROqnLY18FIA0/6pb8ZZn7Rw
	fnCz6N1/KyfmVqLXimGHiiuoYOogglPNHxAaSxU+BijcdMEMLdjI20lIl+XAR13kbc66ZeJoeBq
	RSDHJFFL9MwLOheGcxFIVUzBzelwa4gLi7xMbpSzsSy7BkgKnkoptbWz/jHTgIbAJLV3FmB3Dg4
	Q0HqUENBdAWlSfWOKCJ3uKfV84dgdNO9O8q0tGKZv7KtHtgmO1w7YLrYtuUnCvm6ltXL3Tj0i9h
	UH08IPRkz28tRFo+yutPKwTAV59yErLCKanDzGBgBlinLu2e+uM7s
X-Received: by 2002:a17:90a:da83:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-3903c5d2f8bmr14359576a91.11.1786018187860;
        Thu, 06 Aug 2026 05:09:47 -0700 (PDT)
X-Received: by 2002:a17:90a:da83:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-3903c5d2f8bmr14359467a91.11.1786018187388;
        Thu, 06 Aug 2026 05:09:47 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085db4a6csm1469079a91.3.2026.08.06.05.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:09:46 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/8] wifi: ath12k: rename wbm_status to htt_status in HTT TX completion
Date: Thu,  6 Aug 2026 17:39:21 +0530
Message-Id: <20260806120927.3607733-3-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806120927.3607733-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806120927.3607733-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX6ZpPe7UrzkgC
 x+Arvhy28+wTA1dxMquVcbEi/rFlk58Pq5qXE76fi0KppYB+yAzKU01kGQ08yuHyhJ+5VGvaOhU
 z90FwUj3u/jK7/VB1AQS0r+PpIiWAZIPrhEL+r6l0h7CcN1cdIhTzKaD3RdZmD3cCkfmhZ/ynaz
 XBZzvwmlFq3/lIRMPNywK4hz5NxTLYCvCy+b1mBwzqEG0oZHWX1hoe1WOWwaI++42ZRGPCWucmx
 wIuS0nYmr3SPXDpq+ibRsE8TH68NKnkBaDrzluIw8ad0/AVtMzhZW2U2f6ix2Y3BajkqRKk9MOE
 bACej68oMd2qRZcFIMr2vkbKTjcupaA+xoRmlvRZUoFyqIaei612sm5n7//vqnCrVvHs8UyLUvX
 qCuLGaXMC2uB4a4AqqeCUZ9FOL8bmNYHz18S6VRo60ZKpt6nT/SpUqcy73Ozzw3m1etQZ5mkjmr
 +7iUrVkGGeNxdJPBiBw==
X-Proofpoint-ORIG-GUID: vKh3tAoqPWGHlPQ51GQoBMwkK2xn7yPg
X-Proofpoint-GUID: vKh3tAoqPWGHlPQ51GQoBMwkK2xn7yPg
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a747991 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=RuwI03aZ9ZQFnXGR-2kA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX/sgSlvxniaLQ
 uPp0Zuj3Zl5G4g85KJCoV1kaXpwmFOOsuidwwJW1gRLouu7iQ3r7Oql+yGeM+J3OaCv3oE2KXTX
 /6eBUnoBZ5dsJ5l13ka9I+hoXsRBtpE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_050955_091928_26E67628 
X-CRM114-Status: GOOD (  12.03  )
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

From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>

The variable wbm_status in ath12k_dp_tx_process_htt_tx_complete()
holds a value from the HTT TX WBM completion status field, not a
generic WBM status. Rename it to htt_status to accurately reflect
the field origin and improve code clarity.

Also fix ts.acked assignment inside the HAL_WBM_REL_HTT_TX_COMP_STATUS_OK
case to use true directly since the condition is always true within
that case branch.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 632230e77802..d46a3d14f018 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -575,21 +575,21 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 {
 	struct htt_tx_wbm_completion *status_desc;
 	struct ath12k_dp_htt_wbm_tx_status ts = {};
-	enum hal_wbm_htt_tx_comp_status wbm_status;
+	enum hal_wbm_htt_tx_comp_status htt_status;
 	u16 peer_id;
 
 	status_desc = desc;
 
-	wbm_status = le32_get_bits(status_desc->info0,
+	htt_status = le32_get_bits(status_desc->info0,
 				   HTT_TX_WBM_COMP_INFO0_STATUS);
-	if (likely(wbm_status < MAX_FW_TX_STATUS))
-		dp->device_stats.fw_tx_status[wbm_status]++;
+	if (likely(htt_status < MAX_FW_TX_STATUS))
+		dp->device_stats.fw_tx_status[htt_status]++;
 	else
 		WARN_ON_ONCE(1);
 
-	switch (wbm_status) {
+	switch (htt_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
-		ts.acked = (wbm_status == HAL_WBM_REL_HTT_TX_COMP_STATUS_OK);
+		ts.acked = true;
 		ts.ack_rssi = le32_get_bits(status_desc->info2,
 					    HTT_TX_WBM_COMP_INFO2_ACK_RSSI);
 
@@ -611,7 +611,7 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 		 */
 		break;
 	default:
-		ath12k_warn(dp->ab, "Unknown htt wbm tx status %d\n", wbm_status);
+		ath12k_warn(dp->ab, "Unknown htt tx status %d\n", htt_status);
 		break;
 	}
 }
-- 
2.34.1


