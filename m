Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C01C55ABF
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8D0xqCaj1qhJnCgSAj5wvNviOsbNbNACQ6aFLfQJJu4=; b=TxRuWfLnhA+FUnqCi1afILNdCv
	qX870Edebso/waQJUcIM6rOZmIWqPDgD7DuAAP9iN8oR3EgMtUN/7q2QCWIQoXktYQPCpPhTv0PkN
	deKdcLE4aI8bDXkfJ87pbx9H9EWVUsrioX6eAFuzWpcZ3/0Vst2ac0ncx6W5oWzhE5Z6LUKHeA207
	tKu9T39BK+dJlexy/T5xOiD+y/7brd9BCr1a5FMu5M/YoLabf6wDYqbFRnjS90DItDjJrSQJ1vGnD
	0mYuAXPMacJSPsBUtDzc3SmZ/4JnCsLhiZNkX+pksyifjgzv7kT6tegTsO8cf+1xFiLhuxdrBAKPd
	SwILnjvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv0u-00000005VQZ-3FNK;
	Thu, 06 Aug 2026 10:07:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv0q-00000005VMR-1STs
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 10:07:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769oCPN1877166
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 10:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8D0xqCaj1qh
	JnCgSAj5wvNviOsbNbNACQ6aFLfQJJu4=; b=LL5AlIloCHPBy1V9E2uc6ik4Fio
	TDIRDemnapTj9gew9WuQjpZM+eugIO4fp9rAg+At/0df2JmpO+e13vccPjOa20O0
	ioLYDMI4cJ5pRzhBUMPOIrZTibDx3mrDQdwOBP7Qepzw3g5UjJNr+BstsQdxAaEo
	gICvAI5s1KQIcrocMlK/UwzfIoaQwXJuI0n7XCd114KYsrWIeb4cgIIPBZCqw24n
	CVn8bbc5t86b3BHYwZeUxhDG5/VEuslATQRLj9rOnC4Jgj0Hjir/OvUUtyuHXg2/
	hU1JYIO4p21iT0XBJvEA9qP6TZfwM+/TTlMgvIfWnaGsImDnvrNe2zi8BTQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuchftj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 10:07:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca124bf0189so692176a12.0
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 03:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010862; x=1786615662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8D0xqCaj1qhJnCgSAj5wvNviOsbNbNACQ6aFLfQJJu4=;
        b=iS1J2cYNuxCocAfgIetmf5dfu6A97pfe3h4nQTrYy987L20OHmylLwfpxeRkWOz8ze
         J4NWCiV3B+IpEdu3pSKe5Kx7zX8n8YHOORCx+4q8kkgXS6xLPqyKEAKGOD4X1RYnLhTx
         WwTu1T20TtIvIgBghNMg/rJ+1mMj7aAItn8A5HhZBK5bZ2XCgZ0vv2RlO2UeimJRWXiT
         i5k3oWva5nclLz3ElIfO0UMWYknnDm77nh5JvKBAyNn21t0jRToy4WukK0caSNJUAKsf
         skgTHkR8UPaNeRkL8pvYmclf/mSxmUJMiQ4+TBsRbTWetmFxyqIMrGI1NwEbKAzuhdLO
         wK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010862; x=1786615662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8D0xqCaj1qhJnCgSAj5wvNviOsbNbNACQ6aFLfQJJu4=;
        b=g9ll2MLj2bjHRaUFRSD0y5fAoAJUwrfpViY10WUO1r/JvDRwlKOD9HYHspS9TvQv+/
         wYZAZOX+04OAGgI9m+suK0wm5TTKVgtZl3oaxcaK8PsYM5J5/NPDCsMb2IydldslRff5
         4/5VQDiU4qOW07vJAecxsJ9TfvkkmMT5MrzD2T8y6kMWQvqanBmKAUCR9URHvKKYYIQp
         LcxWyOgO/799mxabwUlXm1Q93MhQ31K+wxRr/XYFPs9i0/QztaDnhpGkNbT7z2+9W7XX
         1eX3G5D6cEGUc+Rw5nHhMJo7+h1X3apiP16D6nS9KL3OEjtoHWyZlTYY2SXmp7wmTbxg
         LNqA==
X-Gm-Message-State: AOJu0Yz95mMePj4l3+XlnMbJGo4RDASo0ZxoA3feXGprM5dGLNsmO9BZ
	jIGeuqxN3K0GW/ZY3NRmwFxqPaFg0VF1J5AAF60vTmb5YM6576TRSuAnBe13Use/TUAA6wNRMIr
	ABhDxmfVUy6ZMf5fOyzAnEbU03s6nuqrxXCLIiwTtYOlfkDoSguu6BMpcAMsOEeUd5tHUnUgW
X-Gm-Gg: AR+sD12yqZGVgHEqV5O5JZ1NJ31XzmYIHbGSUdhHLd9PGBpHs+BIN7FkFWg3VtZN4mS
	vaESCv5EZzS7hCJQDaUggGe8f2PLBvvoA4xhFdKxK6Ci7dG5YtvxUeJBVWDYK+ZRM6Jmla1XTK5
	9ZZP2iyfVUMbKTfCvs5s4564teohoXFUYIPaUuo/YHF1XbXPOzA/r11bkdGXFY6FOTI+NgpGV7u
	aKhhxpAoRBSCuxNfrrXHWrfLhUwknoT0+ysVjUg0yo+iVXCuvIog6NX/yTfxmNOCUjbmXCXQjVh
	AoBq8I5poA1drItw9elISf/SFqtJo7ibNh18jmBAJXC1JUmYilTZypUi4XCralG+VmtpyPy3nl4
	CohZnfpgiq9SjjwG+xPfhFeAJNbjxCiiz7WfvPZV82veD913TDuUR
X-Received: by 2002:a17:903:38c4:b0:2ce:a6a4:451b with SMTP id d9443c01a7336-2d0f1c130bamr65827905ad.11.1786010862329;
        Thu, 06 Aug 2026 03:07:42 -0700 (PDT)
X-Received: by 2002:a17:903:38c4:b0:2ce:a6a4:451b with SMTP id d9443c01a7336-2d0f1c130bamr65827485ad.11.1786010861910;
        Thu, 06 Aug 2026 03:07:41 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0b6fbf2c6sm24027115ad.34.2026.08.06.03.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:07:41 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 6/8] wifi: ath12k: track per-ring RX sent-to-stack count
Date: Thu,  6 Aug 2026 15:37:00 +0530
Message-Id: <20260806100702.3479326-7-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX4MxFHJytuqaM
 J6as/3Bpo7TeG6zwR4VZecHmaJkRo5BdHguFmCwbNz2fUOBndJwYeoFbyaueeylpN7sjT7TKOo+
 zQpRi3SdEW3/wMQRGxlP8Zsyrj+nGcc=
X-Proofpoint-GUID: UPTR5Z7NneKVIKx9YZL2ctRTU1Es2IuW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX/7G2qlgKAUuD
 Q/lm3bupi+gBICPy9rzDn54mwPV2TXCyUXJ98LNiAGtn6Oya/6uZoxzcTVFHZNmNi1VmXS7jO2Z
 FVZlAmoJdWcrowiNRIbuFh4ulplcCLVMRjEb29UhZORprUL7OTDp9rNKPjrR1I0QE3YMowA5/sH
 RUl2gcHvDeWfrR3yCdL2P17W7nGvZjTsZYdD4hGdlPqZ6t2fHxw3xffgSAOoP4YO9vOYQjOA0pr
 gEzeXU7iEXACw5QFNxME/KAh1K+5VGWcFfs9+WQj37GZSXfA1yK6Jed3K63dEZrAEo3mjzgO2jf
 xMBdINJMya0lokM2m5oCwX8qX/Jn2MCR33xLcatL0gN1A6yByZM+xUEWqag9XBet2iwYgp8yZcg
 SulpMD3pF4JTcoKH5iIf917Qshqst+7yrDNXkt3rhqhLS/BGGjuXwVh4vDkquABrM63MJCQp/bc
 eYxxK3UfJYElKLWpuRA==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a745cef cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Ga8fF9AItmT7q7bL59kA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: UPTR5Z7NneKVIKx9YZL2ctRTU1Es2IuW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_030744_511768_4F4B07EB 
X-CRM114-Status: GOOD (  16.62  )
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

The device DP stats provide visibility into RX errors and drops but
lack a counter for successfully delivered packets. Without this, it is
difficult to correlate REO ring activity with actual stack delivery
during debugging or performance analysis.

Add sent_to_stack[DP_REO_DST_RING_MAX][ATH12K_MAX_DEVICES] to
ath12k_device_dp_stats to track successful deliveries per REO ring per
device. The counter is attributed to the ring owner's dp and indexed by
partner_dp->device_id, keeping it in the same debugfs file as reo_rx[]
for direct comparison in MLO configurations.

Increment the counter just before each MSDU is handed off to the stack
via ath12k_dp_rx_deliver_msdu(). Add a likely()/WARN_ON_ONCE() bounds
check on ring_id before indexing sent_to_stack[], consistent with all
other new stat arrays in this series.

Expose the per-ring per-device counts in the device_dp_stats debugfs
file under a new 'REO sent to stack' section.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c     | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/dp.h          |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  5 ++++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index f9653fb7b038..216a1af22898 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1122,6 +1122,16 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 		len += scnprintf(buf + len, size - len, "%s: %u\n",
 				 wbm_rx_drop[i], device_stats->wbm_err.drop[i]);
 
+	len += scnprintf(buf + len, size - len, "\nREO sent to stack\n");
+	for (i = 0; i < DP_REO_DST_RING_MAX; i++) {
+		len += scnprintf(buf + len, size - len, "ring%d:", i);
+		for (j = 0; j < ab->ag->num_devices; j++)
+			len += scnprintf(buf + len, size - len,
+					 "\t%d:%u", j,
+					 device_stats->sent_to_stack[i][j]);
+		len += scnprintf(buf + len, size - len, "\n");
+	}
+
 	len += scnprintf(buf + len, size - len, "\nHAL REO errors:\n");
 
 	for (i = 0; i < DP_REO_DST_RING_MAX; i++)
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 9b57b2170b60..5cfe2096c633 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -458,6 +458,7 @@ struct ath12k_device_dp_stats {
 	u32 tx_enqueued[DP_TCL_NUM_RING_MAX];
 	u32 tx_completed[DP_TCL_NUM_RING_MAX];
 	u32 reo_excep_msdu_buf_type;
+	u32 sent_to_stack[DP_REO_DST_RING_MAX][ATH12K_MAX_DEVICES];
 };
 
 struct ath12k_dp {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index b203513d63cc..60489cfd4e54 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -651,7 +651,10 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 			dev_kfree_skb_any(msdu);
 			continue;
 		}
-
+		if (likely(ring_id < DP_REO_DST_RING_MAX))
+			dp->device_stats.sent_to_stack[ring_id][partner_dp->device_id]++;
+		else
+			WARN_ON_ONCE(1);
 		ath12k_dp_rx_deliver_msdu(dp_pdev, napi, msdu, &rx_info);
 	}
 
-- 
2.34.1


