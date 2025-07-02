Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658CBC83F03
	for <ath12k@archiver.kernel.org>; Wed,  2 Jul 2025 21:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QAMUxNTMudJ0u2WdFXC4VNsJOM9BJjWzohjBXdkzFms=; b=S2dUVgUAqfaLRe8EWRejrwJKsS
	XdfpXK6EbcWEjMFoeV74PV6PQ5bHHVxbe8cYb9Z8/IowQLnIHtWsQDc9aBBClizCaqjbsYPEs9/2u
	9Om5Tj5pdDmjiObfVrhfk0mtb16FxgLhKU+bNNAsRomIxCxHPXSYRp53kEEoWlzx/VQP+qRuBZ1Mk
	CBKbJWvH+Jik37XSRCG+PjZ6/aivfTcZXDQIAKZR/gWd1uDaIBikUzhuEGc4WalND50Q9paM98LOB
	vbd6aze/TKd63DIRs+8DDH+P+xhGtnCyDYrohMdHgQlBZbYdDJftnlJ0ZaJGl4Kryhk6ys/jwkkIo
	6cgFuAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX519-00000009agh-01oc;
	Wed, 02 Jul 2025 21:29:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX516-00000009agJ-195Y
	for ath12k@lists.infradead.org;
	Wed, 02 Jul 2025 21:29:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562EXgd8002484
	for <ath12k@lists.infradead.org>; Wed, 2 Jul 2025 21:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QAMUxNTMudJ0u2WdFXC4VN
	sJOM9BJjWzohjBXdkzFms=; b=Ptp18aqn6XyQBoOs9ViAMe7T2Sp72K6D9XFt+T
	sDfznSvZDxPu2RqKT+KPYald9dUBiX+SYZm+h/8dBJbvo3yy9ibH1sVFrC1icMU0
	BvT+NTU6UAXI1xWxS3D6ACsW4K0s3E3mJfgQNuaAcXLFGrQ9gJx0s0mny5XKmZQr
	IdrYJjMq8tzSdKAl45h0mtlphThZHMjj0sTaKlXtiTl9y0hGq/BmBEmDLSHse72U
	oDNs9bvoRP9pIwHcIIe5rOrVHKzMDNwK44bQWxud6suY05QJkCI7Bshi5xsSC30B
	13SDjKKQNsQn5Op75uw6lToYnNFR/m5VKMv0NVG54NJna0HQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63keang-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Jul 2025 21:29:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b362d101243so1569057a12.0
        for <ath12k@lists.infradead.org>; Wed, 02 Jul 2025 14:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751491758; x=1752096558;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAMUxNTMudJ0u2WdFXC4VNsJOM9BJjWzohjBXdkzFms=;
        b=qXZy2AXUVebn9pWCUstCNVkKdQmALUqjunMdEtjetmiIzhVo4nuxO6Vg1w0F9N1hHA
         y/J6n2Fvei079pF4dAe6hNQ/G5z5Wyjwkh9xycpriKqHItT6FFQbOj2J7ru3N8xY7v5K
         zFz0Rk99W048ZozSgsDTJbEOLTj6amUHiEvHvW1cr9QJ9x5GsaLN7MyUvaOPqKJ3lnsT
         AdKiPuU14aNOeBnotyHRne+Jgi8c9G2x5Cd5q427hH1jTPz76zWooW6XCSmfeTAwkZH7
         We7GoYcjBeDjjwtt/SG9BZCdI/b+cVHbJxLubFDmmchVcnxQqXyIWqlobEl/dmTOaCDf
         TIlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaFbtpUBCA2GX/xGIizK15h+3Y5YdSqzC704uWxKjD7wcTyFrsvsTepghYDglROJLWi9hXwm8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx2uuKH5B2QqannGbBbJQloTYqQkpOM2tSDKQ71PSGUL7D5/cd
	lecKO8MJ08iNJJhC0CYWeOjZjteXNA5BESiKcgJYQebHIDOu+wkfshJgijSH0D1Rv7hdg5mSeWE
	NpKzuisJgzP4w0gP8+HGOMt7rGXo0EiMNt0/F1w7qQoPi+qOVxWbCGOwAs3hIf81F
X-Gm-Gg: ASbGncvlFCte+s4fe+dPA3kqvva3X49LXcM+4z9k8QdZYb4Nzs3hAFU3PvqfW/uIvwT
	p4ob7Hu2ClH3AfKGYchz3WIVXVTlHbaKmDue2dVnWP5Ovk/7SXcVOe4TfLStftiTUmx3MsVSh2B
	pmWOrzOiebzkEn6KUwO+3sMpLOauwANRDQ0t8QUWX7LYCDXlanSzjmYAYX5TFsTJcYDOWvewEiR
	P1yVtE79Kovw99AM9Cs1Upf6pkw7FZO+P7R2+kaynFOPr1bpNvF1nx5sBVzrq0n2I9j6CuTlHYm
	Rt/Z3SfnMQScxcRoobgeWpWlFNPLcQHZe/mndanuMhfaVtSUUB0wAwlYvlw=
X-Received: by 2002:a05:6a20:4328:b0:220:2d0f:f8e1 with SMTP id adf61e73a8af0-222d7daa53emr8016849637.3.1751491757717;
        Wed, 02 Jul 2025 14:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEmyEvM038J3qLY65BE/Fi+fMTyDd0sD3BGBXcQD/A4mIsv9ZpGlW6A9zozkpoV7Ns/MnkpA==
X-Received: by 2002:a05:6a20:4328:b0:220:2d0f:f8e1 with SMTP id adf61e73a8af0-222d7daa53emr8016824637.3.1751491757335;
        Wed, 02 Jul 2025 14:29:17 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56cd84csm15732466b3a.132.2025.07.02.14.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:29:16 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 14:29:12 -0700
Subject: [PATCH ath-next] wifi: ath12k: pack HTT pdev rate stats structs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-debugfs_htt_packed-v1-1-07bd18b31e79@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKekZWgC/22NQQ6DIBREr9L8dTEgtWhXvUdjDIWvkFaxgMbGe
 PcS1t1M8jKZNzsE9BYD3E47eFxtsG5KwM4nUEZOAxKrE0NJy4peOSUan8vQh87E2M1SvVCTXl8
 kFY2oK8UhDWePvd2y9AEyGjLhFqFNjbEhOv/NbyvLfRYLyv6JV0YYkbXivFSNrAS7uxCKzyLfy
 o1jkQLa4zh+ZVl2dMUAAAA=
X-Change-ID: 20250630-debugfs_htt_packed-fd4a079785c3
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Lingbo Kong <quic_lingbok@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6865a4ae cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=x3mXCiuBoapq5SUTYUMA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE3OCBTYWx0ZWRfXy++cnUL5MN13
 Vx+X2tmeHsei99w/UzZFwfyDkMgb25TgGt7R9wGOwOdNUQU47kUBRtr332BX3YLrAzc3dgQr7rd
 BMk36j0GHlJX2c34RybnZ3ahjtZmhCop8zTEM5ZbwUzqQop9Gse77CBJk/V2/Rqt3SAzpEaA8Cb
 EuzH+opNOX7IZ3FiEYESbvRV8q9gW+ZCLFdruVbqubBa27/Hu0gIXAEUtL9o7fAtmQajoenUJ3C
 45SvBR+ihlyFvxWfG0a9acgorsFHOn7sIKEK/aE2LTAQe5EB78/7k/VQSiQ9n/mWbpgidBNsLEO
 8LhYoZvpDmr6qxYHOIjGar/7XvWx0CmTA79ia11Igy0JDHK2bSrMJQHLpsoEXU+FQofW7i4X+u6
 nWe/N2oO1Ak0jjo5nALmmAZvCtYuku9B9IO/hgQOGyK6DEaRRRDkLFqcFm2psobALDO32FVm
X-Proofpoint-ORIG-GUID: apuW3bEPpUStyl22Si2sGLnxLrRiLfFY
X-Proofpoint-GUID: apuW3bEPpUStyl22Si2sGLnxLrRiLfFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_142920_336709_8519F494 
X-CRM114-Status: GOOD (  11.46  )
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

In order to ensure the HTT DebugFS structs shared with firmware have
matching alignment, the structs should be packed. Most of the structs
are correctly packed, however the following are not:

ath12k_htt_tx_pdev_rate_stats_tlv
ath12k_htt_rx_pdev_rate_stats_tlv
ath12k_htt_rx_pdev_rate_ext_stats_tlv

So pack those structs.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: ba42b22aa336 ("wifi: ath12k: Dump PDEV transmit rate HTT stats")
Fixes: a24cd7583003 ("wifi: ath12k: Dump PDEV receive rate HTT stats")
Fixes: 7a3e8eec8d18 ("wifi: ath12k: Dump additional PDEV receive rate HTT stats")
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
index 13fbfb069ead4062487e40bfb17ef0f423f33b3f..9bd3a632b002d02db6c1f7fb173635b6119cc62c 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
@@ -490,7 +490,7 @@ struct ath12k_htt_tx_pdev_rate_stats_tlv {
 			   [ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA_MCS_COUNTERS];
 	__le32 tx_mcs_ext_2[ATH12K_HTT_TX_PDEV_STATS_NUM_EXTRA2_MCS_COUNTERS];
 	__le32 tx_bw_320mhz;
-};
+} __packed;
 
 struct ath12k_htt_tx_histogram_stats_tlv {
 	__le32 rate_retry_mcs_drop_cnt;
@@ -579,7 +579,7 @@ struct ath12k_htt_rx_pdev_rate_stats_tlv {
 	__le32 rx_ulofdma_non_data_nusers[ATH12K_HTT_RX_PDEV_MAX_OFDMA_NUM_USER];
 	__le32 rx_ulofdma_data_nusers[ATH12K_HTT_RX_PDEV_MAX_OFDMA_NUM_USER];
 	__le32 rx_mcs_ext[ATH12K_HTT_RX_PDEV_STATS_NUM_EXTRA_MCS_COUNTERS];
-};
+} __packed;
 
 #define ATH12K_HTT_RX_PDEV_STATS_NUM_BW_EXT_COUNTERS		4
 #define ATH12K_HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT		14
@@ -609,7 +609,7 @@ struct ath12k_htt_rx_pdev_rate_ext_stats_tlv {
 	__le32 rx_gi_ext_2[ATH12K_HTT_RX_PDEV_STATS_NUM_GI_COUNTERS]
 		[ATH12K_HTT_RX_PDEV_STATS_NUM_EXTRA2_MCS_COUNTERS];
 	__le32 rx_su_punctured_mode[ATH12K_HTT_RX_PDEV_STATS_NUM_PUNCTURED_MODE_COUNTERS];
-};
+} __packed;
 
 #define ATH12K_HTT_TX_PDEV_STATS_SCHED_PER_TXQ_MAC_ID	GENMASK(7, 0)
 #define ATH12K_HTT_TX_PDEV_STATS_SCHED_PER_TXQ_ID	GENMASK(15, 8)

---
base-commit: 0339e1433e228fbbbb106d9284dcc8b35ae6c4e6
change-id: 20250630-debugfs_htt_packed-fd4a079785c3


