Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C55C982C1
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 06:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jltbE1hVtVVdIn3MjmvnG+LBfhowYYbfh3rA9HqHXg=; b=ZsKgaUD2uLBprPN1YNSin5oSlw
	B55SQ32LtZhXgt9g0kXdhoxevymYB8A0LDqQPPxYIiZW1ncjgbmcnxqdLid49MqQauW3yoBUl13+F
	KiFre45l50+lJzDZTAP8/492rkyYj6eb8SGFK/CHSYaFjr6YfT+U9o6hhOr4wZpE9w70o4j0T3jkS
	PgBc1Mnc8O84owWWCW60cy39va3eFaZqzA1ELBktGEBhUGwzyhXLv/P5x/2Qnyox927U43J5a3i5P
	NtU7GRCc3gM9oND7KQzfGKkAIu5X213DmlNz3yQg0KWeUvndpSOgWaHXOBGoPhyuSv690UxcvCmos
	bvAa3TiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ikr-00000008RfT-2DhD;
	Wed, 16 Sep 2026 06:04:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ikm-00000008Rc6-17gP
	for ath12k@lists.infradead.org;
	Wed, 16 Sep 2026 06:04:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G5nZhS3680431
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6jltbE1hVtV
	VdIn3MjmvnG+LBfhowYYbfh3rA9HqHXg=; b=ExzoRywmGt8cz7B261rdmnvvuvA
	CIfje0gLFiwkUce+z1ghf/sJb8zyGgjdEibRTqpM3+Zazqo+LJwhJv8EGARqWihR
	0k183cOXpybg4KxAxHqgTJvyLk3DFKff0Wn0YzC/3wuX4WWSgQNsXf2SVVtwTpSO
	Yhpifnw56SgxgrKJeFC7XFESe0eAZvJviJ0dN7PMfCCQPvkLlp9ZONYlDmZ81bSn
	XzM9EwspSEiSs1xDyPUgBMG8zpe87nR8YvxoOE3BYsnlVz7yfSZo+b58VsBQkMtK
	5HyK+xWKpCQQSJNtzM5jp2RnZ2z714ZkELIuRCZIh3i51Zf1GIDHznteuPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqe1r9m8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so6136218a91.0
        for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 23:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789538659; x=1790143459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jltbE1hVtVVdIn3MjmvnG+LBfhowYYbfh3rA9HqHXg=;
        b=BoeHwmj96UHsV8E1izA9IXQHAukVwR/k2YhZVuIfpelWs2+SjMoHzxXz/DkTPBKZA+
         eBmpTtzklU/jm54af4OncGDGDRGxz93fGS2hJrysQfHH452WJf0VQgwNSiiEH8Iq6r2a
         Hn+7dQrGccncGoO9I9Of4ENj/ifBqVjy6BlffxIorMtMzmkfzxGtMlVehICJmoJ/FA1J
         7Kjm2KDwCOASoRObvCKMUTfiNBXp6WLrnSAbdyfoc/aIctmsx8Y7SXKPptiiOxNPq7GR
         KVTtzhmFZjJVP/FlyQd10c4iZ6/PrIKxpA9mwiUthHBiHNJb4SWzCBvAoyfIYFumelBG
         5xAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538659; x=1790143459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jltbE1hVtVVdIn3MjmvnG+LBfhowYYbfh3rA9HqHXg=;
        b=z6nWeoaTHzu0LslucChlk93pz9LIZpJ6yarRE0ZkuEBAT7UjYbPTPdrPjL51+AGQaR
         FE8jnz9/i9hx/Sd/WXba0VKJS5bhw6oYqIPP57dP+zQPEtR4oGUrT84zTg0AQ7JaHn04
         Vf5tjrFU5q1F6X/sWvB4+PPpSxRWgU2q9cCKT0OqcuGJ8yf0uI7B4viaT1WQtfmOoe1x
         Edr+2qcEUiY1x64d1HIJZHjKAHHxwGA2yJeSFfiz7C/299S99UaVABiCltNUIjw/DpdD
         5vFVe4Y7jp5cUwJNdspB/e6fTAC8Yye9Z+rfdAMQVoptI9uPTqdKOn9uX9mohr3N7VGZ
         NfPA==
X-Gm-Message-State: AFuF++kZ2iojaHg8yq5HrRs6NthPFrIWDEUV518qMQmEEdNfeY0WydPS
	AKAKWq5rZ3FXt2MUJ7lOotcu1TmZ1kEh86rHmOOEMi51aXiLoIATPiqCwGesBuqUEk84DyKprv4
	fdCiOkJWjVsO8pKnb4sZ5GV//5fpP4twDqsPfEDxrtPALPbBnW1GLsYpS+4uKldqa+T1m7JMj
X-Gm-Gg: AYBFou3RjU2f1hJKS7AX08b8VbOVJfZTQTadQMqqX6xKpEW/DfyWBhn13ekhcLnnVfk
	+7Eypos4djBtsf4kBYpA7BFFOixH4moXsD9x2pjOvCASv3IkHmsGC4Cvpj0fkINPJfULYgqfTaf
	4UtIr+vcLeQOAXsHrkY2iBfHB3aC+1jH41jGcUQUgSFRbYBBAzDNl48DpflJBed3B1STN2sAh+g
	MCJRshynEUTgvISTCuvdfg7ePTlc55/jbWLVOaHmpWuaJ5nSIlnuR3z1eVhM6PiFYn5dUX+qvA2
	bkYYATrc8zuubPvWWABnaJPgUTQZTcT9Dj4w5SPYY6HQmPM8M3DuTvZYWvV9asIkbMYKzuabZon
	SkRWA+WCHVq6SaixnHRUNmtaBSLLpVJi134su3qaEts3P7V5W/US+oXPrYnK+QLVi1t+FWJxdUo
	iinzl8EqFIUoB+LQ==
X-Received: by 2002:a17:90b:4a8c:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39e1e27df3amr3289242a91.3.1789538658727;
        Tue, 15 Sep 2026 23:04:18 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8c:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39e1e27df3amr3289196a91.3.1789538658229;
        Tue, 15 Sep 2026 23:04:18 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a7a1csm2661491a91.15.2026.09.15.23.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:04:17 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 5/6] wifi: ath12k: fix skb leak on monitor PPDU ID wraparound
Date: Wed, 16 Sep 2026 14:03:24 +0800
Message-ID: <20260916060325.854-6-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
References: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX+gSA1EZ6NaTt
 J6SPoQh7VDAeDJ1br1QXxTiq5rcgwEbAc5RlGEeLBqM038Jzk3Ea3Z4jd0HPKKQB4IsjM2tfE7U
 RTvBaH5H+XC2jVIgBTOhR/wcMX8m/SQ=
X-Proofpoint-GUID: tdZCfnMW41rAQMBZrvDpxm8bhsxDVPls
X-Proofpoint-ORIG-GUID: tdZCfnMW41rAQMBZrvDpxm8bhsxDVPls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX6wW8klVIkKm9
 Kx5P3DmsUSvU7QEVYXYy8cz2j6/2chaEVwXN4o4wvDtcdx1anRRWZ+VD54bfFog9SGqyBHinHT+
 tYSY7qrlgBa9AGl2B1Yajuo0Ww1nLD4dZeAy4L/TbioGFxc9x1PFvrBAV77UoMt90P64OtS3V+o
 8ZMLKNomEqnGIO1BaZ9rsL/mz5o9Jh/IkMSSOhbsjTEc7+7zbSZRw5RmM6iPihIilB2Lu5vDIvu
 p7EEGM3KQq3C7c4fQDPZXqjw3qKgREidkha4LQevrNhNqApGiyQyhuYP/LMI2rBa7vXsF32VQ6g
 nN1MhlNfyrAA45lPBLT2lxgqNLen2BBbp0zyG5IcbKsbKVk7HhqD8PEn+r1YdNHoxiJVHQpfYe5
 vWzwwjUPwoVjIhz+N8AphwuZJInSvn+k5u4KVX+L43BIgt5Uw50DtaSUQH+J5dGblQt/lCEtcqH
 bwJgf6lytJElElvPDEQ==
X-Authority-Analysis: v=2.4 cv=ZIhCCn7b c=1 sm=1 tr=0 ts=6aaa3163 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=R2i7fhb4lMgSbN6yfxMA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_230421_413758_0DB187D4 
X-CRM114-Status: GOOD (  15.06  )
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

ath12k_dp_mon_comp_ppduid() updates *ppdu_id and returns
msdu_ppdu_id to indicate that a PPDU transition was detected.

When PPDU IDs wrap around, msdu_ppdu_id can be 0. In that case
the function updates *ppdu_id but returns 0, causing
ath12k_wifi7_dp_rx_mon_mpdu_pop() to interpret the result as
"no PPDU update" and continue processing the MPDU.

The MSDUs are then linked into head_msdu while their RX
descriptors have already been detached. Later,
ath12k_wifi7_dp_rx_mon_dest_process() detects the PPDU
mismatch and exits with the partially built MSDU chain,
leaking the SKBs.

kmemleak reports the leak through:
  kmemleak_alloc()
  __netdev_alloc_skb()
  ath12k_dp_rx_bufs_replenish()
  ath12k_wifi7_dp_rx_mon_dest_process()

Fix this by returning a boolean value from
ath12k_dp_mon_comp_ppduid() so the update notification is
independent of the actual PPDU ID value.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 72bfbf19b7da ("wifi: ath12k: add support to reap and process mon dest ring")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 15 +++++++--------
 drivers/net/wireless/ath/ath12k/dp_mon.h |  2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 7d5be77b081f..db20d27b6333 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -81,24 +81,23 @@ struct sk_buff
 }
 EXPORT_SYMBOL(ath12k_dp_rx_alloc_mon_status_buf);
 
-u32 ath12k_dp_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id)
+bool ath12k_dp_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id)
 {
-	u32 ret = 0;
-
 	if ((*ppdu_id < msdu_ppdu_id) &&
 	    ((msdu_ppdu_id - *ppdu_id) < DP_NOT_PPDU_ID_WRAP_AROUND)) {
 		/* Hold on mon dest ring, and reap mon status ring. */
 		*ppdu_id = msdu_ppdu_id;
-		ret = msdu_ppdu_id;
-	} else if ((*ppdu_id > msdu_ppdu_id) &&
-		((*ppdu_id - msdu_ppdu_id) > DP_NOT_PPDU_ID_WRAP_AROUND)) {
+		return true;
+	}
+	if ((*ppdu_id > msdu_ppdu_id) &&
+	    ((*ppdu_id - msdu_ppdu_id) > DP_NOT_PPDU_ID_WRAP_AROUND)) {
 		/* PPDU ID has exceeded the maximum value and will
 		 * restart from 0.
 		 */
 		*ppdu_id = msdu_ppdu_id;
-		ret = msdu_ppdu_id;
+		return true;
 	}
-	return ret;
+	return false;
 }
 EXPORT_SYMBOL(ath12k_dp_mon_comp_ppduid);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.h b/drivers/net/wireless/ath/ath12k/dp_mon.h
index 162cdcaa57a7..f352655eae9d 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.h
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.h
@@ -100,7 +100,7 @@ struct sk_buff
 *ath12k_dp_rx_alloc_mon_status_buf(struct ath12k_base *ab,
 				   struct dp_rxdma_mon_ring *rx_ring,
 				   int *buf_id);
-u32 ath12k_dp_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id);
+bool ath12k_dp_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id);
 int
 ath12k_dp_mon_parse_status_buf(struct ath12k_pdev_dp *dp_pdev,
 			       struct ath12k_mon_data *pmon,
-- 
2.34.1


