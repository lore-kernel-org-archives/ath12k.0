Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE39109E549
	for <ath12k@archiver.kernel.org>; Thu, 26 Mar 2026 05:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sIOTdj/aFHn/N8qdhQJVWiK9jhfEsHg2Ob4OUCYolXM=; b=jsWVtSz4RK3anjgH2jqzr/zqf2
	6Lo/zD+CeAZFpR/EGAjGqrU4jYc4kMSzzqJ0CjvPL4a8/uRusYUGNuKmCJBPBZl8fCcccKcM7xDUY
	TA42RQMpZWHrsSVPUTHrXwhkubItVQ974tJHqzAWIcC0lbNSTJmTm7jlWpJvgcXvWpol1A7DMp71R
	NLEUC0gciaBVARkYsmK9ls7kGd7JyRnsQnhJXy6Zy7ZNf8Y7O7x12i1Wbrc6ToQwi3Et1AmSF7S81
	kg5z6nWfS0dDaDK3TVWhDVkLqgdz18LR6BA8bdUWTt0dheEYGec84nf3mfZg7WQSQ81B9V7Fl4JAh
	NNmBJozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cvq-00000004iA3-3Pft;
	Thu, 26 Mar 2026 05:06:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cvo-00000004i9h-1vAO
	for ath12k@lists.infradead.org;
	Thu, 26 Mar 2026 05:06:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0kjNi3957914
	for <ath12k@lists.infradead.org>; Thu, 26 Mar 2026 05:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sIOTdj/aFHn/N8qdhQJVWiK9jhfEsHg2Ob4
	OUCYolXM=; b=WYJv1lOtWZ6OkBuhuTkdA1txGfXRt2C8iDu2+U/YbE9cLK7I/KA
	YX9tBqfhSObAd2TnjK4RuLEsKPQCvO9+4giww09nFnWpUrKKS8wWbdMUrB62gZcz
	UUlX0Yx2AeImi1Jw6OwToVx+Bua1U1FS1jvrQNmkOz24ZFK2ZJDaYgg1kQs2UvER
	M5BJFMecVe6kkDFu4q66aEdufxUEvBraV7sDPgj49u9uURfRDnLJLtQXqqkJ4Hh3
	+vDDKbHLW9SGJMlxunjfNiNH0QVhN5q0ri/thFodX6HpArQDL/pgH0xtkbh6OfEr
	bTD8BjepZvQwgHYZrA70S7TRmZP2wVOs1vA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjagn9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Mar 2026 05:06:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso11252995ad.2
        for <ath12k@lists.infradead.org>; Wed, 25 Mar 2026 22:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774501614; x=1775106414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sIOTdj/aFHn/N8qdhQJVWiK9jhfEsHg2Ob4OUCYolXM=;
        b=ePTwmtx4N+LYBt4LzximkhRo0OrV9C/P0Y/jo0K+Vhr3l2DNb1ztgu+9E8beGfPKQr
         cTzSgMiz3jx7/07mTvXKX+jk2KKhmq2E4v62rQEwajc7y9mXiGSOGemz5xT15Y4Qg7KR
         jdx5n/7fpES5GtF0s3+1DEU964VirNz2AUS5XnuD9JWQ9KGP00e5+ymb8dqOeQaRcf6J
         g6CSYsAMizSGMV9tMBUmYyG5+erpGzCXJKyn+512jCWF2otNdsayjUAXlq3uMYt/nZMd
         UcJkVLD4h4mY71uWs4DdPkqqRQb+4g3f011ikGqhfQxjpK4rRKBdTOk51VTX01XoFFi1
         kyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774501614; x=1775106414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIOTdj/aFHn/N8qdhQJVWiK9jhfEsHg2Ob4OUCYolXM=;
        b=Otspkx4LAlm2mP6aWyL2V6mTPs/IeeNdzOiMOtnUM6KHsKXEuSt3XgrGnGA9xACF5m
         NDi6alPi6fwGcgIi8zrDbNpj4hjgFnQqcbusCnXhL7tHv/yVKOKmHBSEMfmmi0nZYHmM
         Ha0J/vmai5hY4Kq+cJomoyXqJ6jFaafwcBd1QrPXxABE8y53nPWLa662w2oFUWXhr7pz
         VhDYtNIOeM8OT22qp3ZQ7+m0uW7rE4n8IqkflNOOCh8qFgiM20h5W67tTDfPLfRMO3VU
         YvelYDNEBQ5XrGDY22Y3lX1OFpaYnb7AMynIEearDTDjm6SbixX7h4n++uwnxs1jBvFf
         vDVA==
X-Gm-Message-State: AOJu0YyuqIsWjZNF3Ar4eH6oqsd2pw+PqoVdmHfr94jDscIBAKMWeiv8
	gnXbVcs3tKvpx3qQxP/BNrA0l4VMjm76Homa/ghbHbzO+cIeLDwVbQ3PIBfe0ZnbBovAUJDbKsa
	1+1HXLvFdTga47BB3t9OPoOumyJgTfngltucqndQAybkJ1DnxSCv86qeyGeQHROHU3a5q/Esj
X-Gm-Gg: ATEYQzyHegep+EdL3pR188TA/4VkkLnAK8w4SDcqHB4vFSYMwmkRVEP6VN4/9Sdw34P
	gBxhy07iJqr4sOLkecbEVZjgrHJR16YdsqjLlE0bbu1xA3/pxMbuXEKzumWBOxlYCxrfygXtfRp
	hMSJtNmlsTr7aQzIJvyJfqoR/r2/rURsJP3XKo+laiLqPHO+X6bdSB3HhB84PsTj9RX3mE02dio
	VzJ4kNoyEjbkqdlMPTxQhzA8nwSkFngjYAnWBZCNoO3YLCXCeJjMzXoSVhnAKmW0GyYvTsf8E3M
	VesqvTJWOIkgfQnqA6QNJOa5dpuCHY4uxpzsbDkJtiMKSsyFPgjK4KfADC9xfp4xBxnsbgxTz51
	M2OzsjPSDkYuduAp1fWTSoeAVK5KC6uc9wuUgMa4jr4sznWL0+Ef9D5kl694+f0/5bITiLMg3HP
	behvHfCLWcqRKLtlDx7cvLwmwmj79dtPOr1D3opuIYqwVNFqlg
X-Received: by 2002:a17:903:3c4e:b0:2aa:e3c7:6048 with SMTP id d9443c01a7336-2b0b0a42d45mr71320995ad.23.1774501613714;
        Wed, 25 Mar 2026 22:06:53 -0700 (PDT)
X-Received: by 2002:a17:903:3c4e:b0:2aa:e3c7:6048 with SMTP id d9443c01a7336-2b0b0a42d45mr71320675ad.23.1774501613210;
        Wed, 25 Mar 2026 22:06:53 -0700 (PDT)
Received: from hu-rdevanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8fac97sm15259845ad.71.2026.03.25.22.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 22:06:52 -0700 (PDT)
From: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Harish Rachakonda <quic_rachakon@quicinc.com>,
        Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Support channel change stats
Date: Thu, 26 Mar 2026 10:36:41 +0530
Message-Id: <20260326050641.3066562-1-roopni.devanathan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Xmf5AYNKmFMGpeK3-SMBlWo2Noy5920B
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c4beee cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=8HdXM4_gyVcZDa-Q9oUA:9 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Xmf5AYNKmFMGpeK3-SMBlWo2Noy5920B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzNyBTYWx0ZWRfX9JSSbN0uVYe6
 CWFJBPCFqGxJa4dwsBBYaloLCp0CgFyYGSjSdUPNqYdRbIK9BtVvCqMZk39JQ55NOwl0UH612ku
 iInFcRHRYGDXgnrwR/7U5ZPVbEfYYIpIPkQcDLyTtj6T0R1GucDkH6ADpRJvUlQxX01GB8EMsC0
 2CnlYL3N7xCUyYA16jJVsLCMmZ3USa1W+B4xVs4Y4oJD1/zQjtn4BHrMPja5kfpLB8mip5Ubbtk
 9u9tttyxVopqToggnDWUJtS3Dkolg2JxgNNbbjKlS5KtHewUqQHrEBcbxbm4iPq3NeKHYzHgZZP
 zAKbAuIvtQwm1CcXpQ5HuL8g6G3tiB5UeQnzBmxaHQ9CUx4Ts+mBFirX8hIm1zHm/schhS+jhBz
 bwyO8q32hPFFGcnYFC/Lo8X0/WdGaXfv86A4jSbU1dg9DOnQeYju5F9otnPZeoQ5Tu5v7Zqvk8z
 /bNyEA1GL8J9745aDvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_220656_619096_F6EDCE59 
X-CRM114-Status: GOOD (  15.73  )
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

From: Harish Rachakonda <quic_rachakon@quicinc.com>

Add support to request channel change stats from the firmware through
HTT stats type 76. These stats give channel switch details like the
channel that the radio changed to, its center frequency, time taken
for the switch, chainmask details, etc.

Sample output:
echo 76 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
Channel Change Timings:
|PRIMARY CHANNEL FREQ|BANDWIDTH CENTER FREQ|PHYMODE|TX_CHAINMASK|RX_CHAINMASK|SWITCH TIME(us)|INI(us)|TPC+CTL(us)|CAL(us)|MISC(us)|CTL(us)|SW PROFILE|
|                5200|                 5200|     24|          15|          15|         448850|   2410|      10546| 434593|    1071|   1100|         4|
|                5240|                 5240|     24|          15|          15|         450730|   4106|      10524| 434528|    1306|   1150|         4|
|                5180|                 5210|     26|          15|          15|         467894|   4764|      10438| 451101|    1337|   1508|         4|
|                5200|                 5200|      0|          15|          15|          13838|   2692|       1736|   8558|     686|    802|         6|
|                5180|                 5180|      0|          15|          15|          13465|   3207|        855|   8579|     578|    760|         6|
|                5200|                 5200|     24|          15|          15|         570321|   2441|      10439| 555661|    1574|    949|         4|

Note: WCN7850 firmware does not support HTT stats type 76.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1

Signed-off-by: Harish Rachakonda <quic_rachakon@quicinc.com>
Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
---
 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 72 +++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 26 +++++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 7f6ca07fb335..b772181a496e 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -5722,6 +5722,75 @@ ath12k_htt_print_tx_hwq_stats_cmn_tlv(const void *tag_buf, u16 tag_len,
 	stats_req->buf_len = len;
 }
 
+static void
+ath12k_htt_print_chan_switch_stats_tlv(const void *tag_buf, u16 tag_len,
+				       struct debug_htt_stats_req *stats_req)
+{
+	const struct ath12k_htt_chan_switch_stats_tlv *sbuf = tag_buf;
+	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
+	u32 switch_freq, switch_profile;
+	u32 len = stats_req->buf_len;
+	u8 *buf = stats_req->buf;
+	u8 i;
+
+	if (tag_len < sizeof(*sbuf))
+		return;
+
+	i = min(le32_to_cpu(sbuf->switch_count), ATH12K_HTT_CHAN_SWITCH_STATS_BUF_LEN);
+	if (!i)
+		return;
+
+	len += scnprintf(buf + len, buf_len - len, "Channel Change Timings:\n");
+	len += scnprintf(buf + len, buf_len - len,
+			 "|%-20s|%-21s|%-7s|%-12s|%-12s|%-15s|",
+			 "PRIMARY CHANNEL FREQ", "BANDWIDTH CENTER FREQ", "PHYMODE",
+			 "TX_CHAINMASK", "RX_CHAINMASK", "SWITCH TIME(us)");
+	len += scnprintf(buf + len, buf_len - len,
+			 "%-7s|%-11s|%-7s|%-8s|%-7s|%-10s|\n",
+			 "INI(us)", "TPC+CTL(us)", "CAL(us)", "MISC(us)", "CTL(us)",
+			 "SW PROFILE");
+
+	/*
+	 * sbuf->switch_count has the number of successful channel changes. The firmware
+	 * sends the record of channel change in such a way that sbuf->chan_stats[0] will
+	 * point to the channel change that occurred first and the recent channel change
+	 * records will be stored in sbuf->chan_stats[9]. As and when new channel change
+	 * occurs, sbuf->chan_stats[0] will be replaced by records from the next index,
+	 * sbuf->chan_stats[1]. While printing the records, reverse chronological order
+	 * is followed, i.e., the most recent channel change records are printed first
+	 * and the oldest one, last.
+	 */
+	while (i--) {
+		switch_freq = le32_to_cpu(sbuf->chan_stats[i].chan_switch_freq);
+		switch_profile = le32_to_cpu(sbuf->chan_stats[i].chan_switch_profile);
+
+		len += scnprintf(buf + len, buf_len - len,
+				 "|%20u|%21u|%7u|%12u|%12u|%15u|",
+				 u32_get_bits(switch_freq,
+					      ATH12K_HTT_STATS_CHAN_SWITCH_BW_MHZ),
+				 u32_get_bits(switch_freq,
+					      ATH12K_HTT_STATS_CHAN_SWITCH_BAND_FREQ),
+				 u32_get_bits(switch_profile,
+					      ATH12K_HTT_STATS_CHAN_SWITCH_PHY_MODE),
+				 u32_get_bits(switch_profile,
+					      ATH12K_HTT_STATS_CHAN_SWITCH_TX_CHAINMASK),
+				 u32_get_bits(switch_profile,
+					      ATH12K_HTT_STATS_CHAN_SWITCH_RX_CHAINMASK),
+				 le32_to_cpu(sbuf->chan_stats[i].chan_switch_time));
+		len += scnprintf(buf + len, buf_len - len,
+				 "%7u|%11u|%7u|%8u|%7u|%10u|\n",
+				 le32_to_cpu(sbuf->chan_stats[i].ini_module_time),
+				 le32_to_cpu(sbuf->chan_stats[i].tpc_module_time),
+				 le32_to_cpu(sbuf->chan_stats[i].cal_module_time),
+				 le32_to_cpu(sbuf->chan_stats[i].misc_module_time),
+				 le32_to_cpu(sbuf->chan_stats[i].ctl_module_time),
+				 u32_get_bits(switch_profile,
+					      ATH12K_HTT_STATS_CHAN_SWITCH_SW_PROFILE));
+	}
+
+	stats_req->buf_len = len;
+}
+
 static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 					  u16 tag, u16 len, const void *tag_buf,
 					  void *user_data)
@@ -6024,6 +6093,9 @@ static int ath12k_dbg_htt_ext_stats_parse(struct ath12k_base *ab,
 	case HTT_STATS_TX_HWQ_CMN_TAG:
 		ath12k_htt_print_tx_hwq_stats_cmn_tlv(tag_buf, len, stats_req);
 		break;
+	case HTT_STATS_CHAN_SWITCH_STATS_TAG:
+		ath12k_htt_print_chan_switch_stats_tlv(tag_buf, len, stats_req);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index bfabe6500d44..82ab7b9e4db9 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -164,6 +164,7 @@ enum ath12k_dbg_htt_ext_stats_type {
 	ATH12K_DBG_HTT_PDEV_MLO_IPC_STATS			= 64,
 	ATH12K_DBG_HTT_EXT_PDEV_RTT_RESP_STATS			= 65,
 	ATH12K_DBG_HTT_EXT_PDEV_RTT_INITIATOR_STATS		= 66,
+	ATH12K_DBG_HTT_EXT_CHAN_SWITCH_STATS			= 76,
 
 	/* keep this last */
 	ATH12K_DBG_HTT_NUM_EXT_STATS,
@@ -267,6 +268,7 @@ enum ath12k_dbg_htt_tlv_tag {
 	HTT_STATS_PDEV_RTT_HW_STATS_TAG			= 196,
 	HTT_STATS_PDEV_RTT_TBR_SELFGEN_QUEUED_STATS_TAG	= 197,
 	HTT_STATS_PDEV_RTT_TBR_CMD_RESULT_STATS_TAG	= 198,
+	HTT_STATS_CHAN_SWITCH_STATS_TAG			= 213,
 
 	HTT_STATS_MAX_TAG,
 };
@@ -2156,4 +2158,28 @@ struct htt_tx_hwq_stats_cmn_tlv {
 	__le32 txq_timeout;
 } __packed;
 
+#define ATH12K_HTT_CHAN_SWITCH_STATS_BUF_LEN	10
+
+#define ATH12K_HTT_STATS_CHAN_SWITCH_BW_MHZ		GENMASK(15, 0)
+#define ATH12K_HTT_STATS_CHAN_SWITCH_BAND_FREQ		GENMASK(31, 16)
+#define ATH12K_HTT_STATS_CHAN_SWITCH_PHY_MODE		GENMASK(7, 0)
+#define ATH12K_HTT_STATS_CHAN_SWITCH_TX_CHAINMASK	GENMASK(15, 8)
+#define ATH12K_HTT_STATS_CHAN_SWITCH_RX_CHAINMASK	GENMASK(23, 16)
+#define ATH12K_HTT_STATS_CHAN_SWITCH_SW_PROFILE		GENMASK(31, 24)
+
+struct ath12k_htt_chan_switch_stats_tlv {
+	struct {
+		__le32 chan_switch_freq;
+		__le32 chan_switch_profile;
+		__le32 chan_switch_time;
+		__le32 cal_module_time;
+		__le32 ini_module_time;
+		__le32 tpc_module_time;
+		__le32 misc_module_time;
+		__le32 ctl_module_time;
+		__le32 reserved;
+	} chan_stats[ATH12K_HTT_CHAN_SWITCH_STATS_BUF_LEN];
+	__le32 switch_count; /* shows how many channel changes have occurred */
+} __packed;
+
 #endif

base-commit: 37538641dac955f6690372f0ebb94e5e14a23418
-- 
2.43.0


