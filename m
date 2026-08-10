Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FEBC5AE49
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljCy5O5Q13zJ0R0deOdY6rUGXlXk5toVBCxTqHElnkE=; b=PlE9VYigf3WQtYWGOiIKIK7HY4
	OztMf3hG6gH7e4VdqWEv3jP+GOWJCiT8rDV/y79ImCfJ3L4hd+t+2Ch/7jEh9pSdkrybggBgblcMH
	B/KvrgNMAI5QzQMAQaX6/bWnlK5/+7AyLemHlLXkXW+pEBY+IJgrPJhM5kOxVFCqmwa6lWmftmvpZ
	eW58owNLJuqdB7MgypdWilR3J/c6CccMndrFaqt000pnFgKI/D2/IwqMUbkwhXR3YIX76Xo7ByAbF
	C3WkPeIKSI63FHk2ld/Q5aMaFW6Gth8RRhZuutOTyr6VC0Qltgcdc8ahw7dT9spoVGl3XWSJAjR7h
	HAilanCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFM-0000000C3IA-1GJl;
	Mon, 10 Aug 2026 14:45:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFK-0000000C3HG-0nth
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 14:44:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjAPQ1367882
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ljCy5O5Q13z
	J0R0deOdY6rUGXlXk5toVBCxTqHElnkE=; b=ae9yOzJcBn5YASfu5dXsTCBiLm5
	hGDOJW4ObionaZQx/vzSKunv+6d4QzCGWYkGJNbZS661ft8+EjOfO8eQKc4BZPHM
	W73CYDHBr7DZaJIED/EG9ZGNCy/Krnc6YTvgmaIsEEKVQVYxOxBk5SrcD49n3fnS
	GLCmWfZpXe/WzeDohARWCZRzGJIeEQL12dVGuxsxRGVEtI8tf+wEHkqNXUDybRmz
	LpnR9DazuXZs507Hhh47LCabK7WOCr0BuarlC9t/PzNnzSYd2UkOM4FlTIFJ2Phe
	ujgu6ewxukDHCKQwGGeXCsichUO9LqZaQNTjOsDrw8pAU0GYAzK4mmWmPlw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v4a1b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:44:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so2291455a91.2
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 07:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373096; x=1786977896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljCy5O5Q13zJ0R0deOdY6rUGXlXk5toVBCxTqHElnkE=;
        b=kcaKh1+KDOa4dkom3fHHDMyArL2wz59dNkdTVI1qI+s3CInkBGQgIfpe0bbYmqlt2X
         slphjNlkkDuXezh7qUBz6XslwN4eNCbVTjAm7IbOHDZSmHXfFk58RLIwzHplDgtm5MZB
         zeEwjp0z5CZynH+mrU6H3imMRhcubxKfJsAs9cWXcKDluiJZ7vz85uW7y5RkZWnFJwlu
         z5lPYxlhTuP4DnrBD9GqObIZpZo7dk/qcYGSEoj08vbDSm+9pKbvH6S7JVuk22klxMSO
         PTQwBajpfw0vMYeorGdlihLiirWPzjJGN+weUx4ydJdlxz5dhjsXUIxTuLhDWUaJzzgu
         EUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373096; x=1786977896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ljCy5O5Q13zJ0R0deOdY6rUGXlXk5toVBCxTqHElnkE=;
        b=EPhkujP8K5YDBrz4N26DBhpzBiZzVkNIdIOrYgdqQHmrEagHaNqSqbZhk7uI2ExTmy
         QKPVLiihXP8/AsXc2aM1x2JBJqOaNSWiFmJY/m5WOi160S0HqfZMyXWoSBXLzGocHTMx
         mlbEZ5Jw05g5Bm7vcjxqgkJy8nRtQ7uaBdJlo4xHnmxwXtmfvbxYEnSvOEyfJQxpPJr7
         9iJYBA7LZg8rOP87Tw6yyyXxrimH2GYRz7iqNMD2Cq049zyFVE+G5TE6zOxnbFWT/GtX
         zOhouRUIGWAayeSMRhwyQWp9fvjGBq1UtrOPDMkXP50gInkegG7Qk9HGDZCuAvHe3rEH
         26xA==
X-Gm-Message-State: AOJu0YyUyBuR5E0lnlnQVyR2SpaKp5+eGWPuAJxZX9u0rmCLV9PxmSxF
	n9JnXYvL2qluuxJ9aT8spL8QH0hSNxEDfcsPPXGZcgBhNNv4Am9ygJKmk3cWhKMjfHQfM+EbWoh
	L8xRARPZKwmtESWXCtcRJLn3dTK6YyFHSZdFFNr4VeBZsJEyKBXh2vgq/YumwwlvsSADYfauz
X-Gm-Gg: AR+sD13vxhzfaWpxLy3sBcIRIUJtm4cDFnUXmR8m5xSskzQEuEbhihd3l4N5KNLJHj7
	yeeinnqGlX7YXB+476AIxHv/HKhZxISyEz2VtDVAb3OyKULQ7ODrTtE8xh0qJhY04CtjZv3R69K
	ij41iXd9g7EeChxugofs5qWdYFtFxSFtC+rYL1NYw9SbTuMZDWipaZ9uMSnOEhos7ZgX5zdsyQm
	pvLr/pSoZq3nzY/QTD7reMib4DY893LikDjNrow3ZY3JZR3APqKU5TDLF/fuhWMQo6Bc/LlQZRC
	AaCD1mJ8mKGOr3q4wyRA5Qt99WOIA8q6X2thkoHi9kQ0J6/FiioA6FRGTg5iKlnUdowiOSPOKmK
	HVD9DToqSiT3EaCA69AZ4lh9vznNtDo7gw5hH3VjNKA2bL5u1SMhF
X-Received: by 2002:a17:90b:4ace:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-3928246545amr19902499a91.20.1786373096228;
        Mon, 10 Aug 2026 07:44:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4ace:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-3928246545amr19902434a91.20.1786373095725;
        Mon, 10 Aug 2026 07:44:55 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3926254ee45sm12797317a91.2.2026.08.10.07.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:44:55 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v3 2/8] wifi: ath12k: rename wbm_status to htt_status in HTT TX completion
Date: Mon, 10 Aug 2026 20:14:38 +0530
Message-Id: <20260810144444.2033607-3-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
References: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Q-l-ArFq_rsslzFB7DKSy7SJ3OgNa545
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfXz6VUS3pnCF68
 D5VgYeSUq0ND+isJ5CjZFCmmyPb3Hwae2Iv+TqmYpmFc6i8MYoTBS+2vsTgU17Oy2nmX6G7PzaB
 3hnaBhsGZcR1rOevx4hIrKBpDimu8EU=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79e3e9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=RuwI03aZ9ZQFnXGR-2kA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfX7ZcK3bW/qlo3
 I5X1nmzFsvUJMF0BO4KEJTkFPk5pKwDAXOOZXcjM5vEqYFbRPOvNmtsOD6we1HWg1ViZ0j7isXV
 R8SyeGGqi419d2YRYStsKQW+PsF+zQJOiEiEFsyO0uqbcb44qXX9Rme5MJ4v39PXd4t+DN8IYWo
 gRFjae1mI6lM4GOVjYDtJxFerlS2mPw0qI5P2CMbmQFoK+7WUKlKIW3/LTLxVHWJvRko1V4luL6
 wwmJ2Z31rSRjZn3fc804aV+tFW4XsBXewkqZUppEl7+HbxabcYUb+Pnufx9lkBcnoiDaTkwZSjC
 tZ1AEi6lhBvsGRKbjrlljQsa6Usys3OsFe3FWuvFe54iGYxnfgortMky3I7B+Q+vgSzsMwA1AlU
 /sEQP82VvlJQYjDV25V+jEq4wRKU9FRRMKpgJBSqpiNnu+bTD1mOCP48BTqWHBVorg7Zdt+p2Qk
 QnCsXPyJwEYSmc/zrdg==
X-Proofpoint-GUID: Q-l-ArFq_rsslzFB7DKSy7SJ3OgNa545
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074458_348588_0304CD1A 
X-CRM114-Status: GOOD (  12.28  )
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
index 3d635cac8f8c..a8afc1cb0712 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -575,19 +575,19 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
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
 
-	switch (wbm_status) {
+	switch (htt_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
-		ts.acked = (wbm_status == HAL_WBM_REL_HTT_TX_COMP_STATUS_OK);
+		ts.acked = true;
 		ts.ack_rssi = le32_get_bits(status_desc->info2,
 					    HTT_TX_WBM_COMP_INFO2_ACK_RSSI);
 
@@ -609,7 +609,7 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
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


