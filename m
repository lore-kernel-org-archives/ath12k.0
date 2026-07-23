Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED93C531CB
	for <ath12k@archiver.kernel.org>; Thu, 23 Jul 2026 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMcOCwt1ZvE9PJStXmqvrv1ScY/szDISa8XqOWErWi8=; b=K3gkU+UJ/JQQGGJfhXGUylR8uw
	z6UOE5FwijhKl+TM6onTxdYTkNxnLQ70CGw/awsLzSUNLeBHG2Mr6fPvO15K+sB/CFqNeM40tiBTv
	vbht+ZYbbvZPpMSwrISaAO35zO/HyQmTjrR7eTbA7cTF9gHVvwod+gnckecFbFG2KlBzZomj1ZVLd
	9tLXyRRlKFHyHG/5OW0jqkS+owQPwKGIT01mJeOwu8IwveAPIIo+fiV04UTnfiAzrppAZR30PjiQ9
	ftfgOQTByRypbnKWwvUWWWdKTy+48evd2BDR1Mt9dJkY6kgw/20MZoxXzGhWB5019fJSjO7RLTWgE
	lhMkoFeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxP-0000000EHiO-0HO5;
	Thu, 23 Jul 2026 12:55:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxM-0000000EHgX-1eTY
	for ath12k@lists.infradead.org;
	Thu, 23 Jul 2026 12:55:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qfh23045134
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tMcOCwt1ZvE
	9PJStXmqvrv1ScY/szDISa8XqOWErWi8=; b=BZ4FSeCOYcpJ763vhRrwrlDB0p3
	TlQSwQLFgI0kK7qwyInyFwylOachrZhvvfqPq4vO7jJi+2dMHlBGD37Ok2ozSpPo
	ZQzYq1zBoV0Pag7nk55LrlaGyZWbrZWp9ro9YfFaHj0RUlqI58Owl+KXwsKCrhcQ
	mwLQrVAOkQqAG0d7cSc6Kqip6ILSHQ9mlcMF4lC4rm0r3+j2BRDP4VnK/SVvZxg2
	ONveYph0/frneJ/1FtEpz9Vqv8MPas2+CYcA+u1bNWdZP2Z+gkESk2WlmnfB3fPc
	JSPel/Epog4xMjJuDrbiDu6f61rKqDRmUpz/4mYnrZn9FokW5jkvL3m4KYQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq970y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so8393635ad.0
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 05:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784811319; x=1785416119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMcOCwt1ZvE9PJStXmqvrv1ScY/szDISa8XqOWErWi8=;
        b=BuZZDJLI36xJRHE5pdaJ/SUQszHAkx3Y9Ci/yZktIdxe9z5CKw9CY+P5Kve5wV8+fL
         +gjrOOEM0kUV7NQzfHpvfWTGiCq1i4M79/rM1lWbbiEzR+bvxTqDXrHLFgyMTQogblCF
         Y3E17nPgfzaeAnJQgAePtRl3e0Qgpd10mX8CHp/3OsJXtIjQ/K3diqO5KhV3sqe98CdQ
         pOP684maZ0wTi+PqWFXs5fyHGFEJzrBLp9W+zHfSqDP19hcZVLUkrWI2njeqx9UQR40m
         lVDJLOKs4Ox0cWtAPfMgvxpIyj9LyljvvfJ1NQZTvvyN67tmXKpts0sRSdCl3BvScxUI
         AuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811319; x=1785416119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tMcOCwt1ZvE9PJStXmqvrv1ScY/szDISa8XqOWErWi8=;
        b=cEA4MuWfUj7KAXLc+VOHAnAcqOHTeubuH+oNBEaMc05+FK3MAD2ndWu/C3N8xVhfE8
         GHaOIraeEeKhYN6ndyvsz+jD01hDJ/98PrsXmKfmPpjrE7X4YLxAP70md/+azl2gQOAw
         GSXMMdBBuZE2TfZr6NcTsW29sDLod8C3Z5Nt2RA7xN7aoY8B9qtYhPuQ4aTZp1Km2QzS
         LowZlvH9ry/wVBcNVqkNuoDbVm5ZaWtNZkSAqXt0qePZCbHHrQYwoTZbCTIY/nSwuo/A
         bBgburpw7qjTX02IepVDKHLlybJ1JSqTrnf5guvjMBZj6U8WpPmhzSc7zPrVf0o1aXyJ
         CDyw==
X-Gm-Message-State: AOJu0YyJUA8Qkuc7anljdKPW4wAgjGnIbW9zWI9Zv/CQWYT8uYhbfiC2
	LTdvpfTvymO0r0jk09LI/+UaTY4UHYKtymds6t8fbiKV/jLJYgf3hgGpLUlc90rcboSU+h2YE2L
	d4zhukppH69AABFAWtaqTq/S9WS1zZUGRQMdTa6LyPxHbolBlIYKr+3m1B0zC7isEMOXovgtr
X-Gm-Gg: AR+sD12q+PGtTd8oAIrwZ/ceYIqlbp17R9pPiKruHMOWxStZ+oeQ9pGN3zWNPVemPTp
	hyGPdcnpcuJJLn9WEJ7scZFryrG9IX+CBTUKcMc9glX9+UAuvkmIk+dYdESn/KUd9pKafOZSWlp
	QiHMoMq+WcNJJ9ypzgAErd9ecWJiI5e/cdEl1K9CBagT66DYS03rr6AZeJ3EC2W6SngxdvcGMnR
	fMq382uwrhjlEuaRx9/inC1G5VzvY63Ll0+2ieARFrWfj9ZuAvr4nwgt8XWJwqwQ7uPFuxSzBK+
	QmwgTyu66bSTnR2QZZSzAOH9rUvIBRNHHf3njMtXPa4HrKrDn/LSWYbb5rSmzeQd/p5jlCyr0Ke
	ccdXPvHprgAKhLiEUSLDuvhsf7zzC+tNm5qlyoj5qzkATUU8zytb1
X-Received: by 2002:a17:902:e801:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2cfa6a54e47mr35342715ad.3.1784811319299;
        Thu, 23 Jul 2026 05:55:19 -0700 (PDT)
X-Received: by 2002:a17:902:e801:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2cfa6a54e47mr35342435ad.3.1784811318784;
        Thu, 23 Jul 2026 05:55:18 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f350475sm32998385ad.70.2026.07.23.05.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:55:18 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 6/8] wifi: ath12k: track per-ring RX sent-to-stack count
Date: Thu, 23 Jul 2026 18:24:46 +0530
Message-Id: <20260723125448.922361-7-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
References: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfX6uRU+WckCQf+
 oE+CVLBpluVMwaf4LU8S0RxvVWMt3mSNti+ujYrxX7vpHoWQXVBkvd8F7W2jSSv2BgkUrj23k1U
 Wx67mYTi+elHVwAOEFq4o0uibZ61xu0=
X-Proofpoint-ORIG-GUID: crr1T6CSYZi067x14LqG5UUYdQhiTZ4O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfXxgZwj+cZ6eUb
 PVolSLet9Ne51uDJ+QlqBkC3+xvrbnf5r/efIbQPAEQMDprtGdNTUPqZxoJobRCJxVkUgp82rRe
 XBUYwejdeY6V5ziJ2yz49Ehn+PRVEWRb703HJ3AHGKFBOcRpJG5/M5/5zQBp0CwNlEkGDnb2fNU
 +TKs8KGzWKBSsiuIHqvS5GEPDDOJWsA0lrylKiDDfvZSnVXHFheo2LTgQaHHbH9KupRE97fOzOU
 L1rD76Keb6C7ybeAMNbRn54Ttvm22JHppOh63qDL4I+w92qDDt7qNZ4Sr+Nvqm8NPSx3M4X2BGu
 Zyn/niJOAxLBK1kx4fDwcLC6hn+G36E6DU/WofLBojD9yWbPZ2cj61mHuh1IVuUi4Hz7KMz0F7F
 WOGvLITdTwZUlwIqLPj1rr8lrgsqTWXHl/aF6PG6rvuq0P6p9SE4W3vA6KpxGWElU7JWUFCX1Ou
 T7ZUUFMr9iN5/Ixaylg==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a620f37 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=p327RZGb0tc26PMrpC8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: crr1T6CSYZi067x14LqG5UUYdQhiTZ4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055520_444831_B5D857B6 
X-CRM114-Status: GOOD (  17.67  )
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

Add sent_to_stack[DP_REO_DST_RING_MAX] to ath12k_device_dp_stats to
track successful deliveries per REO ring. A per-device dimension is not
needed because partner_dp is already resolved at the increment point,
so the counter is incremented directly in partner_dp->device_stats,
attributing it to the correct device without an extra index.

Increment the counter just before each MSDU is handed off to the stack
via ath12k_dp_rx_deliver_msdu(). Add a likely()/WARN_ON_ONCE() bounds
check on ring_id before indexing sent_to_stack[], consistent with all
other new stat arrays in this series.

Expose the per-ring counts in the device_dp_stats debugfs file under a
new 'REO sent to stack' section.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c     | 5 +++++
 drivers/net/wireless/ath/ath12k/dp.h          | 1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 ++++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 5020d9608535..9a8d07bfb848 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1122,6 +1122,11 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 		len += scnprintf(buf + len, size - len, "%s: %u\n",
 				 wbm_rx_drop[i], device_stats->wbm_err.drop[i]);
 
+	len += scnprintf(buf + len, size - len, "\nREO sent to stack\n");
+	for (i = 0; i < DP_REO_DST_RING_MAX; i++)
+		len += scnprintf(buf + len, size - len, "ring%d: %u\n",
+				 i, device_stats->sent_to_stack[i]);
+
 	len += scnprintf(buf + len, size - len, "\nHAL REO errors:\n");
 
 	for (i = 0; i < DP_REO_DST_RING_MAX; i++)
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 563aa24ea55a..298b65142a0e 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -457,6 +457,7 @@ struct ath12k_device_dp_stats {
 	u32 tx_enqueued[DP_TCL_NUM_RING_MAX];
 	u32 tx_completed[DP_TCL_NUM_RING_MAX];
 	u32 reo_excep_msdu_buf_type;
+	u32 sent_to_stack[DP_REO_DST_RING_MAX];
 };
 
 struct ath12k_dp {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index b203513d63cc..33c4c89eefb5 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -651,7 +651,10 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 			dev_kfree_skb_any(msdu);
 			continue;
 		}
-
+		if (likely(ring_id < DP_REO_DST_RING_MAX))
+			partner_dp->device_stats.sent_to_stack[ring_id]++;
+		else
+			WARN_ON_ONCE(1);
 		ath12k_dp_rx_deliver_msdu(dp_pdev, napi, msdu, &rx_info);
 	}
 
-- 
2.34.1


