Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18299C5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 05:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/+Zy6EjiwFFGtfKs/1otK9rXi7W051TWzFmkxKv0e4=; b=dE/DTWCv8PR7KQuDkmONVO6Fej
	s6kAkmLjDEvXjTosw8/BiE5Z1B/f/g9sunklxL52GnV3JoI65a/OqkXMzIelWA5LYL91yEqHFFXnU
	YxkaLPvwcdukqpwG78kQi1PlQPjc2jc3sJiZNR6+GeMlD31PD4YbCXtluqs0hZBSwSv/yO+BTV05Q
	emuYpPa1rgPJE5FP6SQ8nMr35sb4E/cgwLG0BYxoaDXjU3UbD6609TwGoFOB3s4zk4GX0M+eKRp9V
	fFk0ySlqyzUb1DoxUP4PYNlRxT/iym1KFZZ3oSfrN9qLkJsUwq+m5jGOyibmB/vIAnQ8zsXIghcib
	LIihOzNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYvg-000000091GC-2RVT;
	Wed, 19 Aug 2026 05:33:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYvS-0000000918F-2eVs
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 05:33:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5I6IZ4049085
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P/+Zy6EjiwF
	FGtfKs/1otK9rXi7W051TWzFmkxKv0e4=; b=eZeCZd5MuBlAImSWnXdwH+TaRAl
	5tPoFZZ4JMT8aM3gXlfkV8HobdcbHpScc+QUsnqNZd3bTbozJsKntbMOiw7X2V/S
	D3mnNjnFMTUTXlQ+sgP5rtGepoueoDlG6ys1Dc02mpVASmg6QmT7gFvb/T4rfT1j
	ZdUcb0I/hlrBxWPvkDueK5gXLtkXkR5c+JzIlQDBsW1GePmbsUcvsrmWVzi5fb+y
	Jdb+i7QFwbEYjN8F+rYKjmiTFtQKc8xRVNMf2LiwTdGC1uB6h4fLKRU1CI4jJsha
	1AvCkJ3jw6HQ9Pugn+lT68u5SkpGhfn5NzQLmeJd/w/MG8q95fWoHB/FASg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpsf81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:33:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso861995a91.3
        for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 22:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787117601; x=1787722401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/+Zy6EjiwFFGtfKs/1otK9rXi7W051TWzFmkxKv0e4=;
        b=EEn93t2JJRydbxdpygHMzkZihcDtPvOfTNi9rGd5LZrjaWmnRXFk8CbFVEKLMXsAY4
         h074LHlfmntvRBsR9MbeINRTFEtMHq5AX77BKuH4esfptl9IwU3tMtHc3fQFBBDUdZHH
         fQgjlCIizoWDTBhLu4iP2WedthkJFLkPaMJOLR0GIAfi3ycIL35qgr5f4u0YewjgqXe6
         Wo4KVlbWRr1p5lSNaWx4la0wlQQevf9lPh6jI2ZoGV1VmA2XMUakIVaPqpnYD2UnUWJe
         U+9dB0ngQJgCAUXbluS40bULd0v4v4B2jxU5/DxicTHAAW7E31VC1ogb8Q+J7UMa14cL
         X34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117601; x=1787722401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P/+Zy6EjiwFFGtfKs/1otK9rXi7W051TWzFmkxKv0e4=;
        b=qsSXn4AKDS1M1FwGnDRZIc8kxVIg9jzHCTLJoxDRYo4uN+TNQLe+gNT+kn7eLGPOGO
         VdMe+W9/gcHyEsjmtW+OHBnhUnAf1LthsAKmMYps4ypHNtHdj2H9VwHf/Et36Zq61fYy
         0/MWXSig7ThPGt8g8jheZcNQoKHkYmNd4iGfY8ssddW11eYnlLtAVTY0y1jJza5PVaLP
         2jXOpmNVSfFNC9pq+B0R4BQFv52WWcwMWMmZB1FGK2PlnDH3qpZa1o7U/K5pXch2MuTr
         BlCw4WwjDe1wsc5VCfNYB8+E1vQGr1YmDK2tlUS0HZo/PMPL6pjKLRMRxMfkQ6frGaQq
         Gcjg==
X-Gm-Message-State: AOJu0Yy0x1gsk2U+o9FV3doghYSdGrhFTC5uQuFde305axWXzO4nAt7S
	P/uu7PbpNaGL1Y4Tse7G7damAF0IfM/5duxwBBZw6PbpByVTF2i3dAdOAZK/NTCcSQVXDro/M9D
	OGBot5MYiHQgGHif6e0dKo6HEK2tMdcWRkEYXh4XS0MQYu+3twt49bmDE8YveMKoCjnNdvuma
X-Gm-Gg: AR+sD12FgUu3E67N1cCpP0pe7SIhEG4vXzf0/sm8IQ33f5dVv1pTgaGBMg6D8DqSDAR
	NsA+P1leA1mBB5UVOsn0Q8FiTX1cEtonZPl62x2lhkgSneQ5ipldmzqa4lvXOxPiz6tCo1dl3Cr
	RZGBAWkfa9VYy3MBhWfNBTTd583Ln9U/UhGHEBh/HhEiq4CXNJW1jA2/69o15nvUHrQsJ5PiYse
	JFCqE2FtlBj/wHSxzsEvwmc5hIYBQToR2pg6qJk6zQdcr3hstrDQ2Nv2U3BcDr14Z1JzzYr0KOi
	5+fbcm/QvYsffdmF/8JEPW6VEz+Wj1q9Clw3z3XQLNx+vdID/btQvnUrtCPnekH1JJWotta48Su
	8quI3LSISe19x+/LZppNkrD+42/maJLnMvy784U7Vcd/F4ZzI0atc
X-Received: by 2002:a17:90b:1e53:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-39580ecefbemr3897057a91.1.1787117601159;
        Tue, 18 Aug 2026 22:33:21 -0700 (PDT)
X-Received: by 2002:a17:90b:1e53:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-39580ecefbemr3896986a91.1.1787117600661;
        Tue, 18 Aug 2026 22:33:20 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f4c9918sm404261a91.0.2026.08.18.22.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:33:20 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v4 6/8] wifi: ath12k: track per-ring RX sent-to-stack count
Date: Wed, 19 Aug 2026 11:02:45 +0530
Message-Id: <20260819053247.1420393-7-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
References: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hatl7Xn2FOAoyo3vUYCRoQ8DT8xgolJO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfXzFM2vQn2eLwd
 +9ywutSKpxmNtsKz0TTU5/PAqV97hPFiOzWHs5vjfW4zf1IKiBDnnd+U9bVEegu/R56ZOlF8FUn
 G29ESJKRn0OK0dAMEv7sIP34tn/X4CrGK0OH5zdpqb2HWN24hohWW8nWSyM56akJmtaTVDPJmvF
 iBpTOU8oMckMvzI+UMq4N3PlEVwphJPUyZm73i7vsweZ+1gqyj0XF71U4weWp6U+iDc3Qdyb7Fx
 9pt+8lW79wJ9Qoxhf1o/dmYWU79MDtC6p278Bzq+HOnZulJYsbi1gIRe4VyV0GUjF9GVZM4KuEw
 3UZPrkEFw1alnBFmphEiXdFytb3DlanfeQyyPu1ZDdtG+3Hc4dMrWuD6h2RR8Xm252T5AIBkV2O
 BNPbjRAP6iug4QtzPKbbmiM01Bgu1tSpd10r3UTslfj8i48KRv0XAN/V8RIkP2NKrNJdJwz/7xK
 3qw+XyOBfyXr7Kr4bfg==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a854021 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Ga8fF9AItmT7q7bL59kA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: hatl7Xn2FOAoyo3vUYCRoQ8DT8xgolJO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfXxmvyPJoPU4CF
 kww5sJpPfpq827Q+DRp98o0iAuK6oLs1ttpuLB6Wr3Us1J1O568OLzcvsCc3bfMU88xHqY+FOKx
 39M4jt4r5aIJaYplbR0btCbn61IOLJM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_223325_512693_F0CCB720 
X-CRM114-Status: GOOD (  15.99  )
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
file under a new 'REO sent to stack:' section.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c     | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/dp.h          |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  4 ++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 935da8d06450..5d5597d80417 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1122,6 +1122,16 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 		len += scnprintf(buf + len, size - len, "%s: %u\n",
 				 wbm_rx_drop[i], device_stats->wbm_err.drop[i]);
 
+	len += scnprintf(buf + len, size - len, "\nREO sent to stack:\n");
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
index abe461886a12..5325d271fd6a 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -651,6 +651,10 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 			dev_kfree_skb_any(msdu);
 			continue;
 		}
+		if (likely(ring_id < DP_REO_DST_RING_MAX))
+			dp->device_stats.sent_to_stack[ring_id][partner_dp->device_id]++;
+		else
+			WARN_ON_ONCE(1);
 		ath12k_dp_rx_deliver_msdu(dp_pdev, napi, msdu, &rx_info);
 	}
 
-- 
2.34.1


