Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCD5C56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 10:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA8MWFLnRkH6OIWjAyG2+978gj5PqzR5yRejjiikDww=; b=q5AST1/pePUxW5kXOqiORMcS2m
	tWrAss2rKFR0lJS/1CO/RwVjEBWFI62ynpGq2zda0X/mmgbAN+V94YMdv9kx/sAHq4j+db578MiHY
	PEdrByUfkizIBXL1pgE0uL/BETx8Bi/0Ujg/cWjkjOnMz1dsmaEluM4286aoIrFk9d47M/7Qf48It
	VhWrNtsr7fhAGKux3sWNGZUkT7oMcOLS79u4cbx3TeDEkUIMaiXTWR42K4vKexhYboGizQ5WE0F1m
	bJ/w3nKyFp/KLo3BTrWJ3OyGovZL+XRiJ3Da1YjiL5x6FRQ6FhHzGw9e6dx5RnZm9Llin1P5jm3To
	tjesc/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv0Z-00000005VBV-0utj;
	Thu, 06 Aug 2026 10:07:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv0W-00000005VAT-2Tj6
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 10:07:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nqF41579434
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 10:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NA8MWFLnRkH
	6OIWjAyG2+978gj5PqzR5yRejjiikDww=; b=QFfOvukjNMVxOIuIQofvBCBa45+
	HGKkd5XpEcRvwi7ZhbvhySTiCkWqWvk7l/YQ8YbZclgZF5ei5jW+dhkIW6PrRKAH
	vmWIUN2YHKt0vhyu2jCixgZVnwVyw7f0e0wiJqyfht+IECPLM2vkY3MbhcpZi5ll
	03xdnrZbdoKGuzSYJJaspTRGoRg+95yhq2c1UfNT6VhnVClVIUCHUtZiEhh1c6Vp
	1fVPXSIqg9ZKGEBa3P1hANFX3yUICMexPVGAqAgnf7Ins91GXcydvmAaHzsxWc98
	WK4H6ebolhUOa54855D47IIIu0dt47RisesN+6FReb2kK1ksQezTSzbegBA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8hfee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 10:07:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa55c9430so20367795ad.0
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 03:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010843; x=1786615643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NA8MWFLnRkH6OIWjAyG2+978gj5PqzR5yRejjiikDww=;
        b=Co1g8ToLv1QuflLV/V6j2ipyAr9Gy2tNdjQrRbDDhLaf2wOCMaowAWjT1YW5WUdLqM
         NNs1Vlr4StYYvRw5EK8N+vKlkJLVYroPP6m7EaPEfqAAwEBaq4z4/6LXKd9g0u23VS1p
         4feq0fWCSNvUuY1Du42txUST675tZmTaVfiZ9K40D/hvfZ8Eab/vmCQAZP0G/lwdK4Op
         xjePPaWw7STflhRGG1C2E3Qk8Mm0JLU05pf/l0Guzph06Fjk60RTD3QBIzBXRTNz+Hz9
         MALnd+HPQZ379GZKyKU8rLs0DaBkqw6k1xWUznGWvpYmorjLB4mma9r80xTv2LHjEqQ1
         nvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010843; x=1786615643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NA8MWFLnRkH6OIWjAyG2+978gj5PqzR5yRejjiikDww=;
        b=fM8bahvbe3Py/k5xQ6woJ6rHw+SFO1jtao5lzPacm1sV7WLcAbTD7rz/V8KtL0YdZV
         u8+swu2Qlkq25+8ePFrNArSRyTMlKpD21Zd6QMbHrmpLtWfFQqk6XyGoKcOWJVy+XHV3
         1f92Q7WS/f9/+5lDYWACPMXqpV6C9ee//wu4SFdrfjifYJcyCC/WGOmIMge1qKKUNrcQ
         5u3Q5+fi1LBQxuYII2Pt1Oxuln2wJjVl0LvugYln+xILSHnifBO4h8BCQSuXee3HGHbF
         nc9VLLyNme3a73TNmW+/jvhCFpOboOhuDABJQoAArWHWjHQC9E/yAPVBVz4Io9Txvl7h
         IR9g==
X-Gm-Message-State: AOJu0YwJpQv6Cu69A7GVUH9cyhwXOr8FrEdIBSqQB0RsbkWlqdGIayyb
	YfjEkOVKmLAsjk/hjhxbb4ofBCdK9T6yL4Gg+sZi8oqOQPnuVyVs2LYaL66jYKnDgJMIcwXmfGi
	QOl74/NzexLokAg0kdpiaES/uPRuCHG9nCUMAjQsN+eaeyHYNxYzZjGeU4reQuY9Pz9fb2621
X-Gm-Gg: AR+sD123OLk4u/yI3+MXVG/ujDH6YbxxAd0oh11wOAf5FIqMoRl0NUCtNWFnZctmqJK
	N+gF07ouhx+mUU1cFwgM461EdrRHMGDVf9w5kKFP/eUPQNIbN+1k8E2XOnWbyEQnzmzOMO1PLE/
	VbcVbt/QsU+UB+nECrijZhzNpVLRzgDEa6Rbpxu2ox0/PFDPkE0rfGnkb7zmQ0hF/6J7/w9Rzhn
	UV9svLihnwujVchvUNmAed1+pjtjt+E7Yio510CgBd15mv22Hl8xQBLSbU37oBJhPEU6hnxKTkW
	IGRo7RxiYVIB0WmvyJcFj6LnocFX6Fxj99SAJQm2+b+1FAp5y2WgqS47Q/06nnzguJKGLdpTrQv
	62ZRhG/LbUw9HK2Rwxe4om5wyKAgb4jrOaz2jRS7LkqtsIzG5bshM
X-Received: by 2002:a17:902:d548:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2d0ca15a0bcmr166585535ad.0.1786010842462;
        Thu, 06 Aug 2026 03:07:22 -0700 (PDT)
X-Received: by 2002:a17:902:d548:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2d0ca15a0bcmr166584825ad.0.1786010841983;
        Thu, 06 Aug 2026 03:07:21 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0b6fbf2c6sm24027115ad.34.2026.08.06.03.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:07:21 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 2/8] wifi: ath12k: rename wbm_status to htt_status in HTT TX completion
Date: Thu,  6 Aug 2026 15:36:56 +0530
Message-Id: <20260806100702.3479326-3-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6F8FzWN39M1slWQDP9B-AKGoFSWIFfIF
X-Proofpoint-ORIG-GUID: 6F8FzWN39M1slWQDP9B-AKGoFSWIFfIF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfXyDYvav2a7DdC
 8C4T9rv3eu2KKR69hs3ntKImaLZmCKPr7GbtgU6cOTr0eURB28wsYApfYWR/6Oh+UzQjOyvNn9x
 YxOFUScYDBo3a1z3n3JoGRtzSnRCVALicMnGjftqSCMxT+iU2nrcRUuaKyc5AAUGZSK28nJFbXn
 W8WBQT1fBa7NSvfRAw+UhGx3QhcNv3x8jIHGwHNCgzci+I/jcTcmAEWm4F5clg6q4Ofy37fbWx8
 9BORE7jZMdeLHzUsT53yFh6LZ+kP03dyr4qw6dGesYGVVPRHguYFO0UCYBhM0VFyvte3rP3dTCF
 2nnNcobD2kKSJo9Cw0U2WMlMeGpFb1imV8yJAvNPx7IxU4MAHW3ppYTP/YWJpS474jZO325gJds
 T3qFWGvT231B5tGAqs361pc9a09Xt1wdThzB7dTPi6KiRpo2q5EDWW8vGCUDDOAwTRB+tbYPvAW
 FuRf7YTr3IXLzKM3Iag==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a745cdb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=RuwI03aZ9ZQFnXGR-2kA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfXwuEXDBQp6WvM
 G6aVDg+qz+1FByXrqke8ddLiYHTZ3KhYCi0vFxt+QmB/yi0WwDTTupegTSUshVAI55svdmP9SGA
 4WR9TWKE3FLrIGy60ThC8OAez/EOmdU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_030724_748498_546A5C98 
X-CRM114-Status: GOOD (  12.29  )
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


