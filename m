Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62A5C56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 13:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8D0xqCaj1qhJnCgSAj5wvNviOsbNbNACQ6aFLfQJJu4=; b=5G14PY8FCcTEdIWbzsRr6DVzA6
	2NA93dCBf/tzoGjW27khFh0lPHMmVsO6kKNIgR4hl/3FOvkIlr7gfUzJXWwTl/Lxyc3L50dC3lrTr
	5yVIWT/79YUIalMtv29v3340rBx3TTF9CVFamKvwKZgcHnslfYNW8VHA6wMi6eq+Cr1FCNWBGotd4
	jHyY9/8YWd0X9taedEHjjt6UQSNB4s3+KBPURaCfTUfPOc5lXgauKiYr/U4Y7QFLYgPrA1EP1dUsc
	okG73b4ry1NMP/WWcCAXpA15CxZoxxII3RSC7M0NU/mkwqplHnrmk1oNI0v+X0b2P40EEC2U1m3zd
	FyGiCKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5u-00000005sxs-1TT4;
	Thu, 06 Aug 2026 13:25:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5o-00000005srw-3y3S
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 13:25:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nfAg865629
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 13:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8D0xqCaj1qh
	JnCgSAj5wvNviOsbNbNACQ6aFLfQJJu4=; b=pkSxIwQJnxI/t7nCIlbu7+Kk6D+
	xvit1kFx8XxcBQCBPDDKvPmW7BSvLO684Qtgmg4scLEqfBI9hZv6GOz997tDfym8
	OX1I7v6XY8fq627y1OC3IwTlqX4zT6Ovx27ZXhvj0JNVW9+5vWbtd/kYEmIdRNjf
	gVXsLASc+lRVw2ZwneGFrCYgKI4V1BCpURp5pVrIcYdqXfOMIH03DCUAqKJzHMd0
	jdPDMZW4XYo7QdiA/LD4lQlqCG1nDr4dcRZrN6Q55vp7xVcbYFlj33bM4xk9dGXu
	k9HuYCAwXl/+lVdCIJHirdZ50ELpRjsJ3cdUi6sO70X0y+GQPYyNS70ZZqQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9f5cg83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 13:25:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1627497a12.1
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 06:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786022703; x=1786627503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8D0xqCaj1qhJnCgSAj5wvNviOsbNbNACQ6aFLfQJJu4=;
        b=kCVo4rSek9wnR8eeLwjSPN82UB+88kR42QVeCU+gboHsiijfZszOZTFZS0bYiEXAka
         NW8gj3/VVxYW9qQ89CZtAK+IgN2x/RnZ4Il+6CaWJrDi21PyTcRyITFnPtYdGPsg3or0
         oHB3L4mAW/X9Rjsv+4m0IUeZWuA/Trs661TVeZoZzMqxn3k0xd1veOnnlbPvgGkh+5Y+
         U2lg6d8wtonUDYnHwHV4Ob3NojALHHRqFO2ThJJyY2Px7Z3hK3Czi7G6aS9QTWy+Osj7
         Wl9h/G2TKfdalAD8+Xc1gUBSzib+fF8uFCtUT8K1ovV636CkXAdhDExW3uTxdiJ7hHd9
         KSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786022703; x=1786627503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8D0xqCaj1qhJnCgSAj5wvNviOsbNbNACQ6aFLfQJJu4=;
        b=KQMdRjapiGjG3/3S46gnY99nth4wxP7VVlhkSMIoqiuyEVT5x8Ts3sNmPgaJubsvzy
         waY85QctLEgnum2Hs+54SHLZFqvmnMP9B+eLcnRIcmU6cd2KtOQJ+8hdq8TPahLxB+3W
         T7Aw9Ky3HhFKV7x1FG764OgNYdh5WpOb4x8C2iWHBl4hhoIGVHvzdIT1bihsEPSc+HRj
         +5qI37PptGv/3LMlRSWbbKNqLQ6AQb8h1UzS5ecdwbMa2aEX0lUC+OSiTilE7Hnaz4Hs
         EBDj12tMQ+kMRvCvtT6JsQPfuIvCj9bsRDit6I1jpHkIR4rpW9RI95mEijsZ3jgWLBLr
         kWng==
X-Gm-Message-State: AOJu0YwymgjTJlhefj6TmDq910xYM3p7T5x8yjkKer5Road+LGKdQTwX
	kYbiJiGtpqeVql1Cw+z4Rg2wYwyRrwOgto0q1uGMN8j5R2OFIQdz3JAYsjdAciMPrHTuVDBI+W2
	sOSvL1TdhuJ3k5N41U4Awl4eCh00qKtxNwov9v0gzPVyWgZaB41R4W4Su+Hn3kIJPoINZsQds
X-Gm-Gg: AR+sD12v6GqFh1/HnQzdRUQ5XWuU8YWSf0DZ+H7+iq9dBEb09XiAxOaSVDFNVyw0pgO
	QzsWmi4ChnUHeluY2KH/cgMe7Htzfao5gOfqCjKWcFKBwDGYcBhAJxH765w8Oe0e2Igl9fOubGz
	zGGD5E/k87bUb/8R/u2hr75NWJMTAXo/Fbzv6zVt0xLyX9Qk+eZS8widyiUyTXp5/y4vEb8nkaa
	PcKQQhBBot/pGR8J6PWUvgLrDTjhiA789CkF7XWyiO1Tb9UNt+bGNdO/PKJlzkzhfGIlmIfqxUF
	pb5TQQuBhGqdLRv6PoVOjVneAWaxOOM5d3OdAiztD0w1NrJPOWGPpAEMokj0UOqovOgj6HVRqt5
	K5RsxIDDqKC/U+/oWalBqpu5R7LQlg96vcHkQnaKvJNveSfkI1W6i
X-Received: by 2002:a05:6a00:3026:b0:847:770f:da4c with SMTP id d2e1a72fcca58-84f2e04663emr16464782b3a.16.1786022703524;
        Thu, 06 Aug 2026 06:25:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:3026:b0:847:770f:da4c with SMTP id d2e1a72fcca58-84f2e04663emr16464711b3a.16.1786022702969;
        Thu, 06 Aug 2026 06:25:02 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b785dsm1411637b3a.36.2026.08.06.06.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:25:02 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 6/8] wifi: ath12k: track per-ring RX sent-to-stack count
Date: Thu,  6 Aug 2026 18:54:25 +0530
Message-Id: <20260806132427.3704828-7-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D1syl7AQVWcHpTW1H9-G0GjhNqRCPBT6
X-Proofpoint-ORIG-GUID: D1syl7AQVWcHpTW1H9-G0GjhNqRCPBT6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfX6rdbTscwuDs1
 kSz1+7GAa6vTYBcKH/mEeeSaFEutRxTe6P5EwrUphsDujFit10RbhjJSBgNgITGbt8uok0ogIp/
 U6KeTwPlnjRJ9RjJei0xCp2SYM6JsfQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfXxBpExLTUFAGB
 GgykL16uu7kGFxUoLe3ZBz6IN8sE7ZT6xymaLmYQdHHA1FKMxIirzr2axdGROFzZBgnBuZ1zOGo
 QCWZ0TjmqBVyItV+I1Wfxp/iYOHEubWhcvp7oAIo0e5r5Q+A9gEL6Fi5FjTbGrRnL02hdrJsZMy
 bNmt8qNo0Fn/xqf6V/any95Kx41ehWhat+Sf1ovIO2Z6ov+jZ5T2dKFngAorvLj46mIenS76jmw
 B7df2+asMHOMRwWEbglKSR7jjXMklFhqHWnFJZe+oLJ0/Z3vkyUyEi0FDzIWt2dH0ws2f5IF8H6
 1dnaQma6gg1rJ2x6FeX97uzi2LYRC806Ni6H1+2paf0sj4CmvCcvhVxvLt1DtngglsTJLqx3vjk
 xHRB8M2sC4oj6HiKR3eRXKe/7XlYm5h5h06tMAi1c54iP5LwuFFjZBnVeHTM95Wu1M7xKgzqk0n
 d5pBMzmqFZl7edA2RDg==
X-Authority-Analysis: v=2.4 cv=d4bFDxjE c=1 sm=1 tr=0 ts=6a748b30 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Ga8fF9AItmT7q7bL59kA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_062505_086862_20B8D5F7 
X-CRM114-Status: GOOD (  16.53  )
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


