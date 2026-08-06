Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31CAC55ABF
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8D0xqCaj1qhJnCgSAj5wvNviOsbNbNACQ6aFLfQJJu4=; b=zx5gqOjSe9HDJaZZPpBv1X94GY
	h0LX4Lk4qSimvrsEuxTn+U2UE1hdYwyQ0eAEKTxuSXe0sJODsZnJ/0u/uLyRwHpcM1l3yw42hw8vN
	HxxyYeJMAEODcjDjDDkAeELLX2ateX18pCVANeq8lNOZqFhVNwQgiqTFWb1UijxDtK0ho/bPhf1Kk
	SS/q4qPA7yQcmcHdTrbFNX4iHbxKuB5gY8npWQOFpa83rGAZ7cYN9srWbTE2lzQ+4QX0kECQewVkc
	6CdqSmziTQMdpiImg/0wcM/UzoDtkX/i/BVbEaxATclCtTAcZNdu5LXeyqt+5dXtkOgEAir9yIMeG
	EMCOS2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwvG-00000005iWg-1iJH;
	Thu, 06 Aug 2026 12:10:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwvD-00000005iVB-2Uy9
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 12:10:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nhXA1871348
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 12:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8D0xqCaj1qh
	JnCgSAj5wvNviOsbNbNACQ6aFLfQJJu4=; b=JF2Yfd862DEkF/WYRf1efAxJ9CX
	ORF4lmwhbZ6rw/7+rb9kP3TUOKF58CaXowZjTmoUi7RvRdO0wKTwpD4r6X+qxlvb
	Hd140p5Y0wlx2t7wgia9al1T/jT5mvFfMVB0US52p/X49QJz+qi5Ded+Mly1j0To
	cQSxSXczjsO8PdHkHQwW3Abva1CEHuDt0UqbKWZu4RA9Ecs4uQbWptlGS9tuebQU
	BhPGkIGRIUlSeDlwZJi7Vq3ty7koWcZ8JVlJBMwEus6UtotB6AzUcKcWCZGu9q3b
	7+2Ot6ngLXN858VpH0FVz+5AxlYTnvatgCTleP2rntfBGMBHDswZKJ1p1lw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud2026-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 12:10:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so2327609a91.0
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 05:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018201; x=1786623001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8D0xqCaj1qhJnCgSAj5wvNviOsbNbNACQ6aFLfQJJu4=;
        b=jECJZ/H7SeyLDeOyBLPHMOM8kas5up6DGI+zt6xY+m1ci4vi3exSEeBt++I/SiF7rM
         o3oiPXVTJF5l47HPPUnZApetNOIVJ+ACRjxIPYU/4Tj9PM0PywVjZ5hMNg6xHmDoZ/i2
         SiqudtgTlNPL+2PzJ5AxsVqF/zhIWvuYhl/0XEIAXIWFGYHd3blpNW+AbLp7Ytk1mgpk
         +IlKXGwl+j3bJYqT4UDG508fLmnPm0/B4s52WyIDufd7iCzfcBN5BDpBXbLZ5oByLtUL
         LG22RkKpBP/1meXXsDqCdUqeLXGPDPY8KkzI4JIlvIleI4fU7pvUyYpZQbcTZM9QtFjc
         EOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018201; x=1786623001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8D0xqCaj1qhJnCgSAj5wvNviOsbNbNACQ6aFLfQJJu4=;
        b=SduF/sE8T0C6YgiOpaMgqn4u0RrCpBzvf0qfXyhzUTHcK1L6dE0y30m8GFAsHA3Vno
         fdPNGj14Y0WEmeQPQffRy6OjwlsASToLnh2YQq9MVs1eke25zNF0G8dOLWNyefNJNLJU
         Fml/GDgemeEP+c6Eo4MpN1I5F7vtSxVsTA5OQ0M75I1gzmkvUicg5XegFclwEVNaj8KS
         wvmtWl8RVe3wHa6Q+4KU06lDJPWFaUwEBh7RuTJ37M/JCOEdeZh2vW3mlZFmneZYc+09
         pEmtN5gMZ/iuLk3P0NRKGhexf09s4jmw0TXtJShVTVo/2zHCYshVUSuVA+rk/E5W1Mo+
         fNgA==
X-Gm-Message-State: AOJu0YwkVl75zfAOeUZZgz8ZIpdJ3cnX4+X7YDdoPJY5w1PUNS4/Wqv1
	kczegL3cdcscBjFvF+xOPSo6cwvmQvmHh3JdoEQ8nNhMYwAJh9CtEZh2D7EKKD8TSQ/ZIHuovSy
	kle8M/laMAhRli1shPr9AQr1PHzEFtFaRN23VdJSxlVuX/Ri/M8Hsg9ajNWgc8xdvsDAVJgTG
X-Gm-Gg: AR+sD11V5TCsXm4N/lPnL6v2f5FaG9qulyfQuCM3WmOU1U9YA4xFdARfERnvtijZJXd
	eY4Z4NxHY0+sAaLnDWi8aRoz0+ZOLme2ahuwc8U2QUYFIfiJx8pyGPuMOHKTyzxD84KnWiUq9kN
	+YlHqOQlbW0pEDYvUtZT5Yqel2IDmc6BYubg3ym/NuX7AFFVhVzaCY2dzLGx0mqfExJ/yT6E1/H
	b5mTApR1QaUBG1ieL7MSSKhzytzdVFraHDRIY/1a8l4muAkEfeRD+sYwE9TkC05tbIAOfe1A+rb
	WBXXwUqt43z6h6LFO6NrAvCkufrycI/G0vPU4e1YNYuOIq5x5sgYLf37YUaNuAEVul90KrDawgI
	nI/rVw2BfbTz2sVLSM6rBLwEhqzrjw02b8Npd4iMXI06RGKiR+WVF
X-Received: by 2002:a17:90b:5251:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3903c595143mr13898546a91.11.1786018201396;
        Thu, 06 Aug 2026 05:10:01 -0700 (PDT)
X-Received: by 2002:a17:90b:5251:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3903c595143mr13898471a91.11.1786018200879;
        Thu, 06 Aug 2026 05:10:00 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085db4a6csm1469079a91.3.2026.08.06.05.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:10:00 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 6/8] wifi: ath12k: track per-ring RX sent-to-stack count
Date: Thu,  6 Aug 2026 17:39:25 +0530
Message-Id: <20260806120927.3607733-7-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806120927.3607733-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806120927.3607733-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX6GVNGvfPp6Zs
 jF57uZUY8bRrtjngE20q5WL+WmTlJvJkq5BrfKk9DwechtBvlcmcrug+iZgWKCkCuB4LdmgGdp4
 QkicqqArXEpyQaR0RJBPWXNe1/Dqy8oAL00spg16rI3o6bREjwQNfl06oPoknIwyfE9K9WxE9q/
 gIOQygMTCYnUuUnJEFiTBwcyXKy9vUM5ztWqs+pCNbcbJfi5cACXX9S2F7PtjkLutq6ycNekmN3
 COm5QK+lK7CIoh+VEOeR5IhdLysWpomoNGeuvqPxJwm/B/EnWCQedCKl7jjw/gOMtZLjw2DUG0F
 h8v1GuIVzRVSt6bHqYpFAB+ObaLiMLFHenqsFgn1gJ7qryKoiAOxeWYWCH1I+iu3p3VdbzeHzwh
 /UKj4o2sdHNrEZSXCSBlgoxr2dnsuGOjZeooIrv58ODvdQDjh9Sogixg1PLXWgUWBgI1+J7YTuQ
 KqLsdkhE/RT3+i2LBPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX2qAS7kn7agVs
 qHRn+gEfKSONR2XSWEom70JwxFq3sv7rsvevW4bfm8mEgfRQYTgwxR7axUDeHQN+yVzBbgQs54t
 TI+ga/Zjar00uaJQ+rx4Cty6w62MODA=
X-Proofpoint-GUID: lgw5ql72Y4PBWp8ELtuXKbLgD0nDmAj-
X-Proofpoint-ORIG-GUID: lgw5ql72Y4PBWp8ELtuXKbLgD0nDmAj-
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a74799a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Ga8fF9AItmT7q7bL59kA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_051003_752134_7638E81A 
X-CRM114-Status: GOOD (  16.31  )
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


