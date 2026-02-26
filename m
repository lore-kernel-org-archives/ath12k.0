Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE339FD461E
	for <ath12k@archiver.kernel.org>; Thu, 26 Feb 2026 05:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=svKc2yKqI93zPwfKetPppN6A0rp07ldcdPTid8RXixg=; b=Ajy+TiWzAPz1y7YKUr58PUH7/F
	cW0IHffFNzt9QOjNiJZCWPcTljPdacI9HiKIKSJ5PQz6PjU2mEo8raBTG0dtiJEiR+H5vNWsELV2u
	/R5SBzCFNFtU0lq7PWte/yz9cZ+6VGJRWmysNVhnzfBMy58ZuQDqJ4Hncz+2rFIr3N7SE7o4dX1Kt
	l5+wJj4MAkZSBWubEYKxcgYqYd7dblXfBvGayBvIlqi2yOklhOQsqjcSRYpHRys7z5TrzBKIQlpDf
	xtYhKK41Y0PJiK8c5TZ8gi8UoDOgtQ6bG6dJKjfBX7OMhbST8SU7L2wtlH0VhqMl4MYYNCsMjopsQ
	tQFhtxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTnV-00000005QNB-2Ejk;
	Thu, 26 Feb 2026 05:20:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTnR-00000005QMO-26kB
	for ath12k@lists.infradead.org;
	Thu, 26 Feb 2026 05:20:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4UtlV3493243
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 05:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=svKc2yKqI93zPwfKetPppN6A0rp07ldcdPT
	id8RXixg=; b=HwF4lrRdWKgAJglFLHA3bYij9aEGkM+EyqIkpQQp9iVnZIj4Y08
	GAdWHaY1YWbPJ1lksMc1E4pQWcwxyAKoxcg8n8PKkqEZ+/9NabpTgBgJVE4WV3vo
	xiLop2YCqXO8dDK1z8vGlpvVULSmzngVaYN2srC8brj3bmK6DCgpdgFsJ/NEe0gL
	ds1vaB+8sfzg3o79mlEtbSVXc0YHxELwYVavJ+VK/A6rtI8nxVmfcfEsYbocDzdT
	7ZyDivMx2tbypkQfuV75KG9CTRQ4cUYaOwo6U9qAOlsQD5xPu3WXJOAgSv7y4W5W
	AwucQYtHUIMWb3tBUhGLMaPVD/TqIRHK7ZA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj8bd959h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 05:20:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824b5637daaso228807b3a.3
        for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 21:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772083219; x=1772688019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=svKc2yKqI93zPwfKetPppN6A0rp07ldcdPTid8RXixg=;
        b=R35Blqx2pv8oqCqAYOPyat2AFP3AOi0u5RV7F0einwmgJikEmNGIwtjm+LzFKEAZIp
         lnZQMi+VEZpcaD1osKGZf4nWnT+MpNNOh3e6ZDb9I4IrCdFyeXl8aXc8EyWtBW2eWavn
         zGu5fcAbXojUOWkb/7rG97lg3DfAY6ahdJa/74mWNBw/h/xzb8bDPXpzhX1QvyRHFzUc
         6eGSxiarB6/mNZlTbe5Q4OZ4C+DWD33Qj/eFCIVfmTh2Ri6EerbjiBvOw1386LHSlCyX
         KV8NrUYRd1BclHOeMXNaihkzuw37bgpX2l0zCaTuF22MxzlQJlXNZ0PVGeDEjv2unIdL
         sdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772083219; x=1772688019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svKc2yKqI93zPwfKetPppN6A0rp07ldcdPTid8RXixg=;
        b=pa0/sfEdioT1XLQm/9exMcwGbnoFKiD3je99Fg7Lzjt/SOC1MZY4DDhXpn5b49hanw
         kqelOkLkzXcS/WJpwENbN9+tzdz6wRKEVYcw1GkSLOPOEMK1enE3ghzX2me6dOKjqIrM
         BHcX9V4WQr5j3jM2eeV9DZ9qleWh51cVA+/+zld3lEFHe50ezELssUJkTbXQM4AHtQFg
         lCT9m80pOO1se+P/lNCSHPaa6RSri2ISlwfR5XTcu//OBfMG6J3WlFd8uMv31vQhLP46
         xjUYulpenO71CJckNBGBI1mTp4ZHhLT4VDbeORXL10i24l6mZ/D8DAIZhCivgwQG2H9I
         N0gA==
X-Gm-Message-State: AOJu0YyLgqSjQWAoN4zmKFHqfohOzSRYRY2MLj5QDzX4L6r9RDcv89/X
	G/+83q8qbG1+mUyffEmC1+BguMUCtqO8xg+Q9osDL9FJugu7HbvnEPMO9cJ5dpUotW7nbnyqyly
	+Cr9pqUC9LpTZRm3yJsVpTo1DlFTuSzjrHWXMhW1VJHbm7siyoHjRbRfbqYZf3PGeRpCC6LEv
X-Gm-Gg: ATEYQzyPutzk6d7+upGUAJ5epzu/YxwXFMHP/vkgiTO/DFhWhhUkgOuJndq+oKSDCnb
	FTGWmQLoxWULs/gQtiBWmdsdFZRvUJ8bfhyWzqZ4xOfzfUZziFtdoQwnpIzeQTH6yssYDi4shVi
	6ZEjlAZjjVlwuooozNpkzVsZLYqHwvLPsAZSAIEugdG6/IP3Pqtara3jFa2lVzNkNCTrXDjF9vI
	fjS/lpfKEsKwb1+K5B05sdhv2S1ZMlccnofd+5R6h4O6TKbVzlZBi5BqvhQVDibJ+Ja4NQrMnvu
	mgYHuypjW5YQPpF2UTNIpNdET4lNAUoO93KJh2NKhFygg5xZEXTE+qp6eySNj2B+/qKl4daTf+B
	ZCMVJ59c/MOpVyrpoi5qPp0KbViFK8gQt0hQu5nTkrR2SHB4XG8RQz3LtnFoUoQ3s//LwgkgOHr
	efZdEWZ5vQ3veBXeUrFZaKRsXjoaoTFL6yGEp1E5vWhZg=
X-Received: by 2002:a05:6a00:cd0:b0:800:8fdf:1a54 with SMTP id d2e1a72fcca58-8273c0097b7mr1099812b3a.34.1772083218946;
        Wed, 25 Feb 2026 21:20:18 -0800 (PST)
X-Received: by 2002:a05:6a00:cd0:b0:800:8fdf:1a54 with SMTP id d2e1a72fcca58-8273c0097b7mr1099789b3a.34.1772083218443;
        Wed, 25 Feb 2026 21:20:18 -0800 (PST)
Received: from hu-sarishar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a059e89sm1028044b3a.60.2026.02.25.21.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 21:20:18 -0800 (PST)
From: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sarika Sharma <sarika.sharma@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: account TX stats only when ACK/BA status is present
Date: Thu, 26 Feb 2026 10:49:47 +0530
Message-Id: <20260226051947.1379716-1-sarika.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FKQWBuos c=1 sm=1 tr=0 ts=699fd813 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=CSDw-C9IAAAA:8 a=mqiZWBmUbcNKZznDjgcA:9 a=OpyuDcXvxspvyRM73sMx:22
 a=wzwtrm5WU4lM03trS8pa:22
X-Proofpoint-GUID: OZUeB5vpKHOLbEES-8mz_-uFZ7DL5uyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA0NSBTYWx0ZWRfX1DzY/ONi67Jk
 Gp5M0DDqR0l6J6+Ya5hX/8APuoBU7/rYaXOnrbQi/RcTYIjZBRq4oIprSc4yjtnNTXV/FC04Y5e
 a+A2bfYS0eXhy9HUwF4M7NqF2TB03pmE5vHV5la6j+kRIffYGXIJsJpf6jJBdF8w+AhRy0cbfw1
 eJCek92klbkh9gD5HBe1jSlNL5ptYoyabZ4hAAJq3bAqmxqn8vB4i/6AnpBMOp49wiO1JMgZREJ
 vzyFd/8avolGp5YI2Nl48nczfS0QeuHROvE6j/UYDg80u+NRYkvJWUmEyvH0wOCcFT1LHaCsEM1
 iSeNb81yobbXBYeQcwnuy+gTh3t8mnhprc7teSHY+TtOFvh2DHZ1saSrzuuT3JkQTWJOPZQj5L0
 fnYYx+8od2NpFJffJ6FTQFUmWdITCbYL1ZXEISbCHADDkacOiNRsXV43OmHNxv6r5lF/1pNJbkr
 JqK5eNnptknSmaPdiEA==
X-Proofpoint-ORIG-GUID: OZUeB5vpKHOLbEES-8mz_-uFZ7DL5uyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_212021_585019_C7BA6EE4 
X-CRM114-Status: GOOD (  13.55  )
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

The fields tx_retry_failed, tx_retry_count, and tx_duration are
currently updated outside the HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS
flag check. In certain scenarios, firmware delivers multiple PPDU
statistics for the same PPDU, first without BA/ACK information, and
later with BA/ACK status once it becomes available. As the same PPDU
is processed again, these counters are updated a second time,
resulting in duplicate TX statistics.

To address this, move the accounting of tx_retry_failed and
tx_retry_count under the ACK/BA status flag check, and similarly gate
tx_duration on the same path. This ensures that each PPDU contributes
to these counters exactly once, avoids double counting, and provides
consistent reporting in userspace tools such as station dump.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Fixes: a0b963e1da5b ("wifi: ath12k: fetch tx_retry and tx_failed from htt_ppdu_stats_user_cmpltn_common_tlv")
Signed-off-by: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_htt.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index cc71c5c5de5a..61c1c3b2350e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -205,16 +205,9 @@ ath12k_update_per_peer_tx_stats(struct ath12k_pdev_dp *dp_pdev,
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
 		return;
 
-	if (usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON)) {
+	if (usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON))
 		is_ampdu =
 			HTT_USR_CMPLTN_IS_AMPDU(usr_stats->cmpltn_cmn.flags);
-		tx_retry_failed =
-			__le16_to_cpu(usr_stats->cmpltn_cmn.mpdu_tried) -
-			__le16_to_cpu(usr_stats->cmpltn_cmn.mpdu_success);
-		tx_retry_count =
-			HTT_USR_CMPLTN_LONG_RETRY(usr_stats->cmpltn_cmn.flags) +
-			HTT_USR_CMPLTN_SHORT_RETRY(usr_stats->cmpltn_cmn.flags);
-	}
 
 	if (usr_stats->tlv_flags &
 	    BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS)) {
@@ -223,10 +216,19 @@ ath12k_update_per_peer_tx_stats(struct ath12k_pdev_dp *dp_pdev,
 					  HTT_PPDU_STATS_ACK_BA_INFO_NUM_MSDU_M);
 		tid = le32_get_bits(usr_stats->ack_ba.info,
 				    HTT_PPDU_STATS_ACK_BA_INFO_TID_NUM);
-	}
 
-	if (common->fes_duration_us)
-		tx_duration = le32_to_cpu(common->fes_duration_us);
+		if (usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON)) {
+			tx_retry_failed =
+				__le16_to_cpu(usr_stats->cmpltn_cmn.mpdu_tried) -
+				__le16_to_cpu(usr_stats->cmpltn_cmn.mpdu_success);
+			tx_retry_count =
+				HTT_USR_CMPLTN_LONG_RETRY(usr_stats->cmpltn_cmn.flags) +
+				HTT_USR_CMPLTN_SHORT_RETRY(usr_stats->cmpltn_cmn.flags);
+		}
+
+		if (common->fes_duration_us)
+			tx_duration = le32_to_cpu(common->fes_duration_us);
+	}
 
 	user_rate = &usr_stats->rate;
 	flags = HTT_USR_RATE_PREAMBLE(user_rate->rate_flags);

base-commit: 62f9b9b19939138c34ce0ac1e5d4969d617ecbb6
-- 
2.34.1


