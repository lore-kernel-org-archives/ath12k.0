Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FD2C56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 13:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwGMP9ynsxKlI/ohrLuFqx2UZfFwtRO5rMgbVYv71W8=; b=ya7MtPrv+QobevKu5jq3OAqB3h
	K5U3DkHKRPAldnM6yyMT0PzLHlhIdFkOuasuALQIgssvLGyvnOyfjOqq7P3mWu1hgz1CYYkRpXWVP
	X80WddkR7pmYWixrEvZeAQMgzl/zUkbhBH0pSsDjDaogEp02oP+71VE6J+s6T7DJWCcVbsf5qc7zN
	PMKBFrr7J0T/9fk9VnqQ4PSCdCwX23GqzUIzmgWG0lNUX9Jn6HpL8MKdwixVoSfDfwRCQu2lJA5Hl
	PSCm3Xdr7rzutqkh5GkhOePIPM5r9wcbsUBvkfGAoTYuH5UL4NynqulK4z2SOmBz8KffDkyH38D9W
	KQli5S+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5V-00000005sfs-2M1r;
	Thu, 06 Aug 2026 13:24:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5T-00000005seq-0RJK
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 13:24:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ne7k1876435
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 13:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YwGMP9ynsxK
	lI/ohrLuFqx2UZfFwtRO5rMgbVYv71W8=; b=QlLPuz25pb7dBvilhlqbTWoNFdw
	6UbIbSmWEu5bzuVti/PdgMs49FAIaLzW31whpW1lxzbAYuYyC2D7lGt3u4Xmi04A
	2I3Ln9XT4sJ0MyG65MgD4SkL4WpZlOOv4gL0GzTs1mLcM6OpHePfe947Atmr6F5u
	E/QPswEt4KwNds5CboXQLVwq06aq5lwi774ncAN9R8VfTJplMzRChqIB7kVOC0dW
	9FEu6hfdVEHkP7+T+uotRWFADljr+J0SrN79D1bnBOAM+yPhnzXIFR9mWFTVIsuZ
	23Ehek208RgpOHgGBUGaTvJh7q3C/3orO8tMtpSSHu72v8VLV5JeS7tKcpg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjucjb6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 13:24:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so1448641a12.0
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 06:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786022681; x=1786627481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwGMP9ynsxKlI/ohrLuFqx2UZfFwtRO5rMgbVYv71W8=;
        b=UtDoI3V+GGXaJUpXZyRo11NraDTGvivKEG5WhIZm1jpMnXledFJt8Ydu1Vz9sh0thl
         HlOGh6pqfnvI4UuEXwyRdLObvHiOVkdQRsCzlxVZRP7+sJswl+dNvNv8jIkYFHR0cZso
         2GTPE7qzOGSkvSim8DpqXnJexi3rw6uTFkn3nR1OU2n6kYDu41YpUphYasqR8Ic6FRYe
         /2HPSUEo73uqzYr+w8Pdp5LXANof0pTiAkbXEQA3LZpxq78+jI2Djpq64+UhVpe5wmiA
         rKL/zy7TbPp+chAoXeXttZInab3ffdHi8pq5k4VCg60ig4/5w24uTB1r1jcyXhyOu6Eo
         h3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786022681; x=1786627481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YwGMP9ynsxKlI/ohrLuFqx2UZfFwtRO5rMgbVYv71W8=;
        b=Ygd9D+QlVWGmvGNdfJfHL1q/UaISOxT7wMhTuF4+GO1UVkES0V5WPYQnevNr0EvgLt
         PQY0t20ofecJBxE0koef309IqOxfj20ScC4Ms05EgLx6jzw+6WA304FGFomEWDHawAFx
         oCgPU69YlVYHETKNh42DlzI000/KlMWf4KQVHioLh7jIVGrFWv3WAP2fO5chmktF06/g
         bqIUgNNZVwqdABq6eTkB6SHc5BWX0ETorz+R9cy5VLmO2dKjhUIc+rCqEODInlbGetgQ
         lZ7u+Zn+i9aqHyPXUYU6z/IfHe7SkWT48k0nZDYZTGrEhb2gN/kRJLjuBYz0KlWUAkyO
         OSBA==
X-Gm-Message-State: AOJu0Ywew0TLKk1z9BmS6BXwTQk0rmN9JcL/5Q3/cKT1t3ScXG+Ae06C
	hS9tIf2h+3/wolPEF62FE0aHJBjhMn4V2RzFh79SmHAd9cyg4qdi6ZNGr3Yo3tL21spU7hPtDWN
	lL8jnSehEza2/mj2a8iGdQ/3OQJN/SW3O1dmXGvdRP8hU+uhlzCZBInCLdIb2nZCWJOMYlSyL
X-Gm-Gg: AR+sD138El4aB9p2vSEyozT85k5XEhCuZ8zS7mIKEgQwbnSsK4kcnAy3DQJV2+ykReh
	PliWfbxx7IzEXybxHIYjLKHz8GWL0umP8iMFziDzjSXcWRVOTNaj5mnBZO7kp970FVnqWY5sR6O
	oMr9dHySIyr+jjJIfHUhYWWESUlQCHMQNzy4cqwA2GLRh5zOqj+tONajolAh39ogl1g/DVT4iFy
	tujCKLWlUDTC1tjnxA0LqMIa01rFZaCPsf8JAJ21iYBe1GihjC9uc6wdysFQiATK47f1nyVmmBX
	0sdGHXSpKwxjS2Io4VAatn4HvajoiMN6JJSfsfy/74V/vAgJ/cK9h9yEfv+WQFnDu/1ofe+Rpiu
	SYGq2ULIjW2qxzAzlx8F1eUNoz3tSVk7aYY4jixZcKwSVuriJwr2o
X-Received: by 2002:a05:6a00:44cd:b0:84e:216d:7e4e with SMTP id d2e1a72fcca58-84f2e031748mr17884412b3a.1.1786022681066;
        Thu, 06 Aug 2026 06:24:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:44cd:b0:84e:216d:7e4e with SMTP id d2e1a72fcca58-84f2e031748mr17884349b3a.1.1786022680601;
        Thu, 06 Aug 2026 06:24:40 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b785dsm1411637b3a.36.2026.08.06.06.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:24:40 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/8] wifi: ath12k: fix out-of-bounds access on TX stats arrays
Date: Thu,  6 Aug 2026 18:54:20 +0530
Message-Id: <20260806132427.3704828-2-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfX95YQtBrGULe5
 DyH2qt+ay9LdU8IKnEgTiMNajNoXO3LGzNwX5y1kkio7VgcnA+sTjRzDMVdFwpS27lmIk4VXcFr
 MpYTOZd1Nq4zKiZBf9oqSHDti6lPtZk=
X-Proofpoint-GUID: X_nIGHBlK6V3s7a6AE_G-85AEkt6A2KR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfX98+2ntRVpMS2
 PfbsiDvo/f9cRum7sisM8PwQat3ANd4/2PLtX0vyIy5VnbvZbnu43z0aazFWGWOZzYTxapMdp7L
 FiioWAuKfcfJp0WhjVXrgc6X2Q4DoTOV6FQAVj2ei/Ku7sgfMsxPpVSlEOdfnxyCeEXt0tCTJWv
 kRyLMQQrrISpEnzVp23P/p/V00DI9dKdXdG1t+f2ci6asqXO+ers4Z5M42I04Fm2k2b3KbLpZku
 VjHCHZTMhSgJ6h4ib9B0T887EBHvVDuFPQWjGjQWgU+1diDdPXH1+/nO+8LgfUWB3m613Arvg2m
 MiGJe0fb0I2QdJO0DFKpaDg6jOwDbSRK9bizN4SrhdZYaLzYp0VqoA5HqX4M731qX6aAiaPudOJ
 0Du2tkJqaOwdhMJQUyIHNyL1a/Pl+jbwQwB1qIbw20Dn81tInar5POUZqCVp9eMaQHxwVqaEg6S
 yswELcMWk6H0jw+vKZw==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a748b1a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=QbJcohpuGl3nbjs-xDYA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: X_nIGHBlK6V3s7a6AE_G-85AEkt6A2KR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_062443_253092_375D94BC 
X-CRM114-Status: GOOD (  11.95  )
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

From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>

The fw_tx_status[], tx_wbm_rel_source[], and tqm_rel_reason[] arrays
are indexed directly by values read from hardware without bounds checks.
Values at or beyond MAX_FW_TX_STATUS, HAL_WBM_REL_SRC_MODULE_MAX, or
MAX_TQM_RELEASE_REASON respectively would write past the end of the
arrays causing memory corruption.

Add bounds checks using likely() and WARN_ON_ONCE() before incrementing
each counter, consistent with the existing pattern used elsewhere in
the ath12k codebase.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Fixes: c5c62287e690 ("wifi: ath12k: Add device dp stats support")
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 587d58eeccfa..632230e77802 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -582,7 +582,10 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 
 	wbm_status = le32_get_bits(status_desc->info0,
 				   HTT_TX_WBM_COMP_INFO0_STATUS);
-	dp->device_stats.fw_tx_status[wbm_status]++;
+	if (likely(wbm_status < MAX_FW_TX_STATUS))
+		dp->device_stats.fw_tx_status[wbm_status]++;
+	else
+		WARN_ON_ONCE(1);
 
 	switch (wbm_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
@@ -984,11 +987,17 @@ void ath12k_wifi7_dp_tx_completion_handler(struct ath12k_dp *dp, int ring_id)
 		/* Find the HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE value */
 		buf_rel_source = le32_get_bits(tx_status->info0,
 					       HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE);
-		dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
+		if (likely(buf_rel_source < HAL_WBM_REL_SRC_MODULE_MAX))
+			dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
+		else
+			WARN_ON_ONCE(1);
 
 		rel_status = le32_get_bits(tx_status->info0,
 					   HAL_WBM_COMPL_TX_INFO0_TQM_RELEASE_REASON);
-		dp->device_stats.tqm_rel_reason[rel_status]++;
+		if (likely(rel_status < MAX_TQM_RELEASE_REASON))
+			dp->device_stats.tqm_rel_reason[rel_status]++;
+		else
+			WARN_ON_ONCE(1);
 
 		/* Release descriptor as soon as extracting necessary info
 		 * to reduce contention
base-commit: 691e5e43b2aa
--
2.34.1


