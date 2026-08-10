Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69C5C5AD55
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 14:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDc+pb3v6MfSQtwl3l04JeLhGdo7Yuk7Oq1L+GHXJBo=; b=ZTTG7MWBXKucyGua1SvF3DNqEr
	/VZbaDyg52DWE1G2N0tr1u0Av8se6jBgCTSGiIUV/YLZOSvhPOszwbXwHIEd6Ppe9770/fdwX5CIE
	a+jmy3e4Z6nFZfJ/BQgQ4hUzJmzBX2fHt8A8yFGSdSragZZXokmIV48wBjGqRUe3WZdlXvFu3yQDv
	VMS2cgSGdjRX/jOcJWtOTilePvq35j8aNpblKnEeMCVEyTgAinN0g/+PH0TYjEIF4foju1bdoETkM
	Bacpx0MMTM97IVa7cGkFlJSCqaWagRYEZvDuyype0iSAAIJIRVk1tebFO4f5DUWEcXJiAzVuifaRc
	voQYkrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFP-0000000C3JQ-1bLL;
	Mon, 10 Aug 2026 14:45:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFM-0000000C3IM-3rXq
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 14:45:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjdEl2817074
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CDc+pb3v6Mf
	SQtwl3l04JeLhGdo7Yuk7Oq1L+GHXJBo=; b=lXo+dFY70GerCuZhjA0PoL46aFq
	lyM7FehEiRGvuTgjvdimzt0tLqQvAjH79H4zFIx0Wjh4r8jsCjNojMnv95rsob1w
	mcu0fsYJLuD7qLyO0w+lqc3lw7UwmLVA/DOqHd/j0YJ1pXWzV8xQ7QFFZcU4tjZm
	q9z7rkdG/NMLAqMRjADzq+NNpx95SjRECNCK9hhwBRBhDAQwBb2UvXbggtArpAGF
	DTd6oUyZTMjNxwFEPVmXbMQsHdcZwI6dRqgav4JX43/1TtI70o054WtQdtesIk0F
	Yu2068QLmB3sZ1ouwRXQ1CjcXJSOTGCXUPC1OSScGskvOgllUW58xS4FonQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy19kk2bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:45:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b10so2707490a12.2
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 07:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373100; x=1786977900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDc+pb3v6MfSQtwl3l04JeLhGdo7Yuk7Oq1L+GHXJBo=;
        b=eB0uALn/k3XVfVW76LxSYlBLBBEYdR8I5r44jqZNcePDqbcgqOaGUkBcu27PdOOcWI
         P2F3rp/G7i6oYDmQzbHy49JIyT+EyEnubJ5FrW+gy5lioQKUFT+VnmYE2q5O4qaYhUU7
         7BWzMklHMuQrU6yas+vvE8h/ixquImlnb39OSAPBJ9Jc8wtohL6Zpa0hVdvtpRYpaqMX
         wyP3ZskK5+GXav6+q+pSi+oIRUEw9z/0VAYLbjB6FUd1wJ8SomSqKzdd+2TDsIklgI32
         TcwfM58gYiTI6Djx0WfRyXnO10TREi3uu5ODgLP/rCmCldXMC95w32gjVzfXhe4GOMl8
         CRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373100; x=1786977900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDc+pb3v6MfSQtwl3l04JeLhGdo7Yuk7Oq1L+GHXJBo=;
        b=X3A2sNQUSICY38fR+gmM7s6vjRG5yTJg7jYBJATqwnbxihTtB78+/kf3cC+tJbDAh1
         iS7UA58uHL3oQMhS5cj6Khsy6yg5umZ2CNyr8fTDob+2oqZoyd2VvEbRSxVUYwoyXrm4
         2XdmYHRv6jN2kfd9kvVQ+DbQ1sxRg1K05pErgbdzUAl6kuB6vBEOjXmscmsgxY6MmjK0
         BdndBfY05jwUHhYqR7okmG8nZEFCpUUdW4eZRzYHojcKcbCXtAlqPOy+51NFpJFmXHrr
         ukGeLkY8v5bIZhmqaHzwVyfu+XUoWrO+zunZ8k2zlyr2jDM+T5E8yQZEctmRL+LJEPn7
         ukhw==
X-Gm-Message-State: AOJu0YyAyoKUMObathNlpWWT/XJFtnzTJBA2g8HzNujFezyDmbLb1aWb
	sr3Ih8Wee/UI0KcyrZl161KPG4MYmmXuB5cEX3ICMY7at7xV9INRU3zT6daV+ZcnIZhxD/5xEwH
	xe53/caCp9uuVQhyi/Jq8XV51RTolbNIO9aEQPyEGeTEPIvDY/JTrwPiDngi+1KB6QD+BiUbE
X-Gm-Gg: AR+sD12UCOsR+mcCXitZaTKHFqcbCx2/fTtVTPbHM4UmMp8LGTDuFlcGC5Lig5uPEC9
	sGMwmAi5JyLiMhCSkKeTM4SGjTBpsvqsacu06UiwLksqszieVaswebxGzWCr0zIoGTB0wgBo5eI
	iBp4q5u88JB6aO6qcNBWiAa9E69RclWPpU3o+XZrgim6CZafqbwyHLLfsixTBed8KdKb4iSF/sa
	Fse0opAObp1cjfuIQtkpxlu/iFKdrIYIz9+WLccv8+bmC6uhHtR1JCXzYW58VBXBTtBXug24Fgt
	cISWovGohBukxtIDO2gbg6aAjy1NN+evsxLxOY8INSYktIX3fnRagIVStr/Ow1PH1VrPw3p15me
	aBhrhxl06dYQEw4tdZ9y1nnLkU7loxRp7BD8TPul0p7JM4cia3gLZ
X-Received: by 2002:a17:90b:4a49:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-392cca41cc5mr1824394a91.18.1786373099592;
        Mon, 10 Aug 2026 07:44:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4a49:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-392cca41cc5mr1824344a91.18.1786373099138;
        Mon, 10 Aug 2026 07:44:59 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3926254ee45sm12797317a91.2.2026.08.10.07.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:44:58 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v3 3/8] wifi: ath12k: add TCL ring TX buffer allocation failure counter
Date: Mon, 10 Aug 2026 20:14:39 +0530
Message-Id: <20260810144444.2033607-4-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
References: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WHxe1sF0tP4s6eHJrUZPAMUe6_0G8jGP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfX2ob8Wf+Oh8xL
 sCc0TBPA30VKkzZnrfd2DpUJj/RRIFm4OAtz10YKcSyVnGmwCOkvYy9mA0OK7CGQGWUZ4dM1uB/
 qkSejzhF66ERq+TBkWntRUs/i12PBK5QpCeMqHvpRqbb62Z2nUBQRsT+JQWKeiACcmcHS7cmTFn
 5KCxtzTlRqMx/C7xoQSPzfp8QKOnBofmyVFet40PdbHPXmvBN6+xkZwNSMrYZCGl8rc0xaiqE99
 Xl4Q0rEoS+rdv1hJRjooVYTL4radQ7yV5wRix4oDm6fK7U+eETM4V5cGVbQ5R/OYIku0D99/QHC
 agzTs4uARmE66R2WwMDnOgZREJrnuoLZ8bk+NCET1ZdyM2Fptde6cQ/0TGRlVSVp3V/4b6Knsa3
 sPPlWkA9w2roRosE6VdYibb47vn2sbmvLx4hL5rBAUyyL8N3hvbhk/OvEBrMqmQWqlh+kAZ/h0y
 A2GULjbW3pPRx3li34A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfX5UDGFgtWZidh
 5b5/Mez/dns9zdhO3QGpyfKLmWZW3J3TY88EWz/f4WR+zD3RfRPrBl0QvbRzV6v8MqZ44siPlHn
 JZUVDR24LNcOSVOj2y2rKWZ/Yp1eHF4=
X-Proofpoint-GUID: WHxe1sF0tP4s6eHJrUZPAMUe6_0G8jGP
X-Authority-Analysis: v=2.4 cv=abxRWxot c=1 sm=1 tr=0 ts=6a79e3ec cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=vo2QL9yUnAtzEB9pKL0A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074500_969458_4BEB3A6B 
X-CRM114-Status: GOOD (  15.93  )
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

When ath12k_dp_tx_assign_buffer() fails, the TX path returns -ENOMEM
silently with no visibility into which traffic class is affected.
Without a counter, TX descriptor pool exhaustion is invisible during
debugging.

Add txbuf_na[] indexed by pool_id to ath12k_device_dp_tx_err_stats to
track TX descriptor pool allocation failures per traffic class and
increment it on assign failure in the TX path. Expose the per-pool
counts in debugfs under a new 'TX Descriptor Pool Alloc Failures'
section.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c     | 5 +++++
 drivers/net/wireless/ath/ath12k/dp.h          | 2 ++
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 4 +++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index d54995b7adb2..ec49692107a8 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1117,6 +1117,11 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 		len += scnprintf(buf + len, size - len, "ring%d: %u\n",
 				 i, device_stats->tx_err.desc_na[i]);
 
+	len += scnprintf(buf + len, size - len, "\nTX Descriptor Pool Alloc Failures:\n");
+	for (i = 0; i < ATH12K_HW_MAX_QUEUES; i++)
+		len += scnprintf(buf + len, size - len, "pool%d: %u\n",
+				 i, device_stats->tx_err.txbuf_na[i]);
+
 	len += scnprintf(buf + len, size - len,
 			 "\nMisc Transmit Failures: %d\n",
 			 atomic_read(&device_stats->tx_err.misc_fail));
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index bef0f2ba0560..16675210806a 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -429,6 +429,8 @@ struct ath12k_dp_arch_ops {
 struct ath12k_device_dp_tx_err_stats {
 	/* TCL Ring Descriptor unavailable */
 	u32 desc_na[DP_TCL_NUM_RING_MAX];
+	/* TX descriptor pool exhausted (per pool_id / traffic class) */
+	u32 txbuf_na[ATH12K_HW_MAX_QUEUES];
 	/* Other failures during dp_tx due to mem allocation failure
 	 * idr unavailable etc.
 	 */
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index a8afc1cb0712..11048c568331 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -167,8 +167,10 @@ int ath12k_wifi7_dp_tx(struct ath12k_pdev_dp *dp_pdev, struct ath12k_link_vif *a
 	tx_ring = &dp->tx_ring[ti.ring_id];
 
 	tx_desc = ath12k_dp_tx_assign_buffer(dp, pool_id);
-	if (!tx_desc)
+	if (!tx_desc) {
+		dp->device_stats.tx_err.txbuf_na[pool_id]++;
 		return -ENOMEM;
+	}
 
 	dp_link_vif = ath12k_dp_vif_to_dp_link_vif(&ahvif->dp_vif, arvif->link_id);
 
-- 
2.34.1


