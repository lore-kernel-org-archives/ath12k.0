Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A704C5B56A
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 14:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nN23UYXuMIWN30eL3QTIWDdE+NArLTWZ45CYHM8qis4=; b=1h9DH3OC4rDeg5614C+djdOV6k
	pOJige5TMNgYQd5MKuTR8MgY/DuVGm1CP532Hgh1Bs1/XmLB9IuZLH00ULAzrVlKypv+mXcqVfmic
	h1tv5AQ9ob2rCXxU2L20KKwfhDGjD+jollj/bgMQzVODKtqqtT7wOlMh9uWJ7QhAflgGtTzvVCSe1
	pVB+f41fitTfPhy8QURoz0btS5lkHPLcVck/eZZatXzi5QY7L4lGmbac+xCcadqrDsJHH0uiA0ohj
	a/85/I9qjZ3U+Xd01Cn4b9gIz8FKuJQ5snbR03zRBltfgMEntOIQxvJuXS80nECn4lDDvT2uEhBw1
	Mg54H9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFa-0000000C3On-3GuW;
	Mon, 10 Aug 2026 14:45:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFW-0000000C3MN-2rpI
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 14:45:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj4AY1343182
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nN23UYXuMIW
	N30eL3QTIWDdE+NArLTWZ45CYHM8qis4=; b=ezHTsuouuu23K6V+vfCFUgyGEtq
	rPbW9bX/ehdY06lEKd3IvMSObg7b8AhF786TQ39g5kyo9XbY+ODxkT5cGW9/6jDl
	AjxktgcM1e0MvNbwLIwVmvG3abxIQmLIVXW6tokkfvUiHAzSt5nLlWFrywSAHHcR
	KpLx6nXkejOF4ymcdK6neDs1OWG1tjNq37ftpGItbU3q1ZWUogRGdEjJPvkNi7ND
	d/bylAP7vlx54O1KYTb8g/OXJBeMSAyjllel6OvnFn8EXraqOF/1o34GjMJq7jr2
	sfv7ovLqTU1nu5vL72jfS0+d+ysaUgblSjNL65luZVYzgf1xUcvI9vHdfGA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v5a06t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:45:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so2586455a12.1
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 07:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373109; x=1786977909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nN23UYXuMIWN30eL3QTIWDdE+NArLTWZ45CYHM8qis4=;
        b=OUJKcxLLJ/oobs/IVcdbpcvPaFY2vafnuWtu2BFvbaRjKHD9tL20GlW5NebvBz6KXa
         HxGqbVxL2Es0jBVuMf45tq6lVbf7i5rGA2gZERnKyrZ1u5cnpUVpqC4ULKdxvivNiKDq
         2bcGZblbypAepSAvFtIESKQjku/N/23a1jelmpGzliMmZZiS/5XBwgM1srt+38OQ7CdG
         qpfx3cjPaX2+lMkHuo6HAH4nctuPKouy8GZvi30PEAwQuDJ5wi/QTfTYzYq8luYGx2YO
         oDkAteX++iq2sOYNWCJjlRVQAJYxroYcV5EBCWnd+2dYSyYnjadeg+rw/qbrONqR+pOH
         XaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373109; x=1786977909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nN23UYXuMIWN30eL3QTIWDdE+NArLTWZ45CYHM8qis4=;
        b=K98yKopgy7V3JV02TIBBytP0T0sP8TDYKl1AYiMizqfALuRF77CN1tKtW3oR1lwyh9
         MYnUV7jmZH4+iCgz+23noQe4yoNZ9shI/uOhq6OVpThJrDzYG3H+mOG0XfeUsJVpbgIH
         EmCL/W21D//bgVwg9EdBmOH83W/qKtioQAZl45HGV6nbCPIK+r6OXobHBaMXJrHobVHe
         YamXyTKzhuan7MWChj21sMuwuico7QVGFELTjGTnR9jsZ0FIahXbLhGlmDk1GQOKU6CA
         86prRpS79ywGbfhA2JJy5GYg/7zgUK7Ir15Vrfi9udajUMmBwUP+rZPP1rUPIT8qsX5T
         kRdQ==
X-Gm-Message-State: AOJu0YznSgqgx9qeblKJ9UW05XlkBAH32xNHtNDDi/ZNNQMXrZdhBQN9
	NNebhNf0nrCz8SerVc08bPVSRAE519lFWE1Dj1C/9WiXQVxBlhp9Rv4h+j7AIHNoO8e53HXlPza
	oZJOJRZeZkTT8drzg/gAqZDih4u/Ou6+B3kdW18I+cP9hBaRCHXl/5XSDEXc1/XZSbeKtEpQc
X-Gm-Gg: AR+sD13N43cqQGLDf6+8At8rbex9J15s5yyDTJKVXuByUA8U8Un8CRZIBiTNUPtI0h4
	hCwvoNUR0Kco7I9LVfldL8M4alCZAUw8SniO7PK1E0bmQRJHgKsXZvQ1NZaT3UIz5gpri3oBDgd
	k+i0oCJlL13C4U4fTCETGI34cKPNldVz9VKl+uIh9F8hvuQDn6F/V5AvRtdx/rJTh/GKVtrRNxJ
	FmlW2VVm0WL3WqAPY1zBkn6wqXR8r6SlgRHZM6yQeIaabMz63W5q6UNJItnBN3971EaAccBEFEU
	8Sl3yFuG2yMHee93k8tTo6JnAdbDuF8wCZAtugsVUryhOun3u7/J0HBPl2foOPhTOZpFdBIQnxu
	8CvuCyn2OEf3ghh5zFJFZlVxnGgYob/CaUCcNeAbMO/+pL68Ao8a8
X-Received: by 2002:a17:90b:2649:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-392cc937909mr2366394a91.9.1786373109197;
        Mon, 10 Aug 2026 07:45:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2649:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-392cc937909mr2366331a91.9.1786373108725;
        Mon, 10 Aug 2026 07:45:08 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3926254ee45sm12797317a91.2.2026.08.10.07.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:45:08 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v3 6/8] wifi: ath12k: track per-ring RX sent-to-stack count
Date: Mon, 10 Aug 2026 20:14:42 +0530
Message-Id: <20260810144444.2033607-7-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
References: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfX/wh5ytB6oifS
 GzWxcqzh36TULI10efsnQjH0ah6pTuaeCrJHAWFeQbXM0rQFjf+ucozo28jqCyUqaskyiBu2Zze
 pYbR9b5IMrSfBvTJJq5y6n86YUF9yxw=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79e3f5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Ga8fF9AItmT7q7bL59kA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: kpy_bypZ5lud-bpYXpvYVF3T8P-Pdr2N
X-Proofpoint-ORIG-GUID: kpy_bypZ5lud-bpYXpvYVF3T8P-Pdr2N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfX6Csw834INqoh
 D6m+owj0JozzfSjj5UDGBhGyrVtHyIFw9x0DTgfeI3LT4rV/skslp2oFoJXr5tIDDFSgQ2esuSi
 xPkaEzm3w9HV9B6rw1JeKk7lGD26UA2tp5AezXnQmj7rRawmMmiBNnwiao8h62BPP+yIW2y8FaN
 8pfiqEV+IwjCGsDdqp59vhPsl2UaIQ+JUVEz+2wgiHS3kpIPFiapxc/8MoRKREflQyYqE/H6B72
 37QO6Qki6Bov7BeaYldH6Z7qfD0zXQo+ait5kWYCjZHfqBUzeltorzxnh36EL6wKMh7JkOA2ZH7
 k+Ucib8Nwa2o/2k3gwJ1vgH5iL31kfG5EsGQqHfb+C4W6dWQ49rxtUjejxcTzG/gprjiBQHBYSG
 AY5BR8D8ko7vtV6GR+FR3Y05D1w639R4h8LhESZa1eYmKA/D6gnNfAw1l/jL96U6zhmKygRQtrX
 bHzHWYQVykQonl0u7Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074510_729537_DC5CA7B7 
X-CRM114-Status: GOOD (  16.22  )
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
index 34c605b609cb..55e3b411d108 100644
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


