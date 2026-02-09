Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B34CEF06FF
	for <ath12k@archiver.kernel.org>; Mon,  9 Feb 2026 05:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UbViPxpX1XKSB+nOZnAN6/+UQrnqoUbMH6WXsor8KYw=; b=0m31IJl0ry4TpUjLMr/lSZSJh2
	B+x2nWZrykDplm7a4BEPPef11MjowG8axehLSyqiT4ONpIUKeConFiNUk/u6+jzoG1blOLpEvCaq7
	gwbI5/nii7VvAhjW6l9rd/JOfYB9f13n5TSn9RcoUgwK5LEME1kH3lXvUMebE8t8QAbWVmsvY44Sp
	RP/GRTSK4AJnTDII0ZQjktHsy17ooTnJypYL9qii9YAkLQU2/4cdosOOdsALN8RYHvevBNtqKXlfo
	DCS3pQPb5cLGh3b0AdpzeU8kzzwhBxtfYeMr7ZK0UnshCYRrMrslg7pMP1Yc187KggDpBqWU5DCRM
	mycHI4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpK9h-0000000Es0d-346i;
	Mon, 09 Feb 2026 05:49:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpK9f-0000000Es01-1Loy
	for ath12k@lists.infradead.org;
	Mon, 09 Feb 2026 05:49:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61952g9k2586862
	for <ath12k@lists.infradead.org>; Mon, 9 Feb 2026 05:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UbViPxpX1XKSB+nOZnAN6/+UQrnqoUbMH6W
	Xsor8KYw=; b=ZZJP2aVtl9boV0eFTInkitplKk54SzEmhEeRLgNN4YT0vNvfxYY
	a1BS5+MnHEv/OVoH20I2hVAp3kuZPpPJXWwvPPyj350yFAlUuil04k9gv6I4s0bJ
	z+zkSUuBBopElafKd5L+QisV/Uck9zWByZx9LOxMPBieSzfMrYfYmYz7pg1M1epO
	LSrszXYvLUhKr0Qi3bMWvUxqp9GbfqY+gYhfmFqhavYSeLQQNuM9R+SQQHNBwwZ1
	c+mfTvbr3QU7yjOl8wedAjCycdIdCh6PxKtPwKSL2ya4obsV2IBNLo2wQYQMpewi
	3Su2rzSOQsEpkyUUuq6Qq8El8XdD4rDqhgw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c793bg3yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Feb 2026 05:49:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35621cea097so934508a91.1
        for <ath12k@lists.infradead.org>; Sun, 08 Feb 2026 21:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770616186; x=1771220986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UbViPxpX1XKSB+nOZnAN6/+UQrnqoUbMH6WXsor8KYw=;
        b=d/T1loGMjpB+jV7vnJoQhWaYazNet68SkIiCKweNp2Syxzk6Boy/b/q131oJlb9O3h
         wY+5p+qDRaKoZFuKGKyC+uR7AyvAO4OT8DNfCtxL6ZBkKJORyqDV2GQar4hyWaDSmL5x
         loR8dKtPeVddMLPDJVPtdflLk4ulHKml5aaciGLdmPB+pA8TKVJMtIowUVs/IigCxx06
         UGPtKRmRFH6KNwBqrIyllmKCP/x0eaI1Z0+CuonZRgBQdXclrtjYbEbIzUGrV+xtytqB
         p3RKIyvgSnqpAeCU9ExSWMSFfvnwFHkoSQ0MpeM73aJmCv5iF4sF9QjcJoa5Pu5Vz/RO
         UOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770616186; x=1771220986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbViPxpX1XKSB+nOZnAN6/+UQrnqoUbMH6WXsor8KYw=;
        b=TYbjMjE8H7lol0pxDLvPFb1GVh3vANFPeGRfDQs3p5qyMIK6n+sO1rGisHhcGN58pA
         AbeDj48pOICD3Ne9bxIPEsdbUqCj32EYikqxQZ2DtAgEZGfTbU7zSzqyHMnoeqzlXbJn
         6N38IlFrhoN7bxbXhz2am6WcquM5Yl2w6hm4upWJ/iuu2eRGTu2210avDmQYqMrIhfSj
         NLovHlB9KJ5XA/MB/nfkbOCf+28+et1HH1uqz/v03cKMhuGvaq7yuW2M1UQxFTSLjj4n
         LRec6wIEUF3/C0OpFecqtzQ4O3kJI6GMFljkCDI4G6/1yot4W19uOwwo06GvhrRycU8B
         xkow==
X-Gm-Message-State: AOJu0Yy2M7nhXid3OaRJkn2H8g+FFaoBoPZ9eWLtFJ/KFPjDG8Kfq7vj
	eXdqVGBnk5NYgoKE+OQn3OqzTMiN0ghkwOGSnHAdUHkQnwnlWoasiy3zWpSgTrBErkWSO/hyEsw
	CsULcFEzCeAsDRTCNZIWXJxS+xHdhD5CLiqKDbsBvPD6VgsjiSNBnkNAeXdqXar05lPbc0Oy/
X-Gm-Gg: AZuq6aLveG2auHV8A3pWOzut2dWHxfH0lCNXjwMU0RswAB/GM7AzqJpi1fU9uV5JLIg
	nWaGlTyJRhpjG/k+zBHYmRpN9Z6o0AzqzpdpPgjyswumZVCRYdNCocFo74KFV9dwhoY0F5TS0JA
	SsugMivn7pR/UhoXZ+NkUeQowmpO4f/8cMkT77DWJ4xxmMkCO8Aez2unoCsUE5q3qEb7XFVASTj
	WQyvyhRTcPQY7FDDJsdcuq00zQ1uiGOsRSc0AcLjV3b3FSlkRs/JCSW1hMhNVKWHK2zAjAKEXkw
	o9I55gnTql6pjPw+VE6g1I8I24i8w8LEaJ3Ck3cSm9abn9IRLnxInV4YWtXy5Ee4BuCXCoVRYxS
	z3Q3Wg6gKgF9/lsFQZitU8kPiWbV6/9fVvH6J23nvRaTMPFSFoKJV/yJ9h83yaRGOa6ycdSf7er
	xVv27dcihnpjEYX+tf5T/eIeT+j5UTfbvrQ5eIn976tA==
X-Received: by 2002:a17:90b:268b:b0:34f:63b7:a1f5 with SMTP id 98e67ed59e1d1-354b3e2f135mr8769362a91.21.1770616185890;
        Sun, 08 Feb 2026 21:49:45 -0800 (PST)
X-Received: by 2002:a17:90b:268b:b0:34f:63b7:a1f5 with SMTP id 98e67ed59e1d1-354b3e2f135mr8769347a91.21.1770616185369;
        Sun, 08 Feb 2026 21:49:45 -0800 (PST)
Received: from hu-tmariyap-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb4fbd26sm8599371a12.1.2026.02.08.21.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 21:49:44 -0800 (PST)
From: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <praneesh.p@oss.qualcomm.com>,
        Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Fix legacy rate mapping for monitor mode capture
Date: Mon,  9 Feb 2026 11:19:24 +0530
Message-Id: <20260209054924.2713072-1-thiraviyam.mariyappan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ctOWUl4i c=1 sm=1 tr=0 ts=6989757b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=EAQaFSq_8DWymkYZqBMA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 7H-f-O5GF_RVIgcOTvjM23Yo_fVg4s2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA0NiBTYWx0ZWRfX1tQ2NiLqfNIS
 yDdxhI5ksnEfCoA2Mgjof+znwDpn+/FEfzpVGzEm6LsJqDJGZqT7nMrQL3ONHEQDMcY9tNBcdA6
 W6kR9Wn0RKezvdiXuKmMkyGRz0gwaqHfvezBfIKiKC3hPLmHCq1y/alkvVHE+9dTl/WiovKHiX6
 nKFnO2noc1wkvJiU/nAt6heXrbJ678TJhTUiLlOKMs34vOxemA0x7LZWwUn9AsRVmfMWvZAxsXE
 EBRetaTseleonm36EY5VIm9bcVuWi+jCKRoO3fhlk1MP+hZK6r4rPOO+UjcgHwJEu2O2XIAnGlO
 TMxC9wo6TyoXttB7RFKfc64hWY8RQjLOCnhkDvlAflBF1BICgoY1l1BwtyjL/svLUs1SAntTjAC
 GjgkpRKRjUHNKUzfe4X3TlqsMigbEghSux+FB4LuvEWoTkZ5f89Tn8Ri9VxssRKuXrlLU7rUHJ0
 xjXj0ZF35g/DgvtoxxA==
X-Proofpoint-GUID: 7H-f-O5GF_RVIgcOTvjM23Yo_fVg4s2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_214951_528129_E4B847FB 
X-CRM114-Status: GOOD (  20.58  )
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

From: P Praneesh <praneesh.p@oss.qualcomm.com>

The current implementation incorrectly reports legacy CCK and OFDM rates
in monitor mode radiotap headers. The rate field displays wrong values,
for example showing 11 Mbps when the actual rate is 1 Mbps. This occurs
because the HAL layer uses a unified enum for both CCK and OFDM rates
without distinguishing between long/short preamble variants and proper
rate mapping to hardware rate indices.

The root cause is threefold:

1. The hal_rx_legacy_rate enum conflates CCK and OFDM rates into a
   single enumeration, making it impossible to differentiate between
   802.11b CCK rates (with long/short preamble variants) and 802.11a/g
   OFDM rates.

2. The L-SIG-B parsing function maps hardware rate values to the wrong
   enum values. For CCK rates, it incorrectly combines long and short
   preamble cases (e.g., cases 2 and 5 both map to 2 Mbps), losing
   preamble information critical for proper rate identification.

3. The mac layer's rate-to-index conversion function does not properly
   handle the precedence between long preamble, short preamble, and
   OFDM rates when matching hardware rate values.

Split the hal_rx_legacy_rate enum into two separate enumerations:
hal_rx_legacy_rate for CCK rates with explicit long preamble (LP) and
short preamble (SP) variants, and hal_rx_legacy_rates_ofdm for OFDM
rates. This separation allows proper identification of rate types and
preamble modes.

Introduce a new mapping ath12k_wifi7_hal_mon_map_legacy_rate_to_hw_rate()
that converts HAL CCK rate enums to hardware rate indices defined in
ath12k_hw_rate_cck. This ensures the rate field in ppdu_info contains
the correct hardware rate index that matches the mac layer's expectations.

Update the L-SIG-B parsing to map each hardware rate value (1-7) to its
corresponding CCK rate enum with proper preamble designation:
- Cases 1-4: Long preamble (1, 2, 5.5, 11 Mbps)
- Cases 5-7: Short preamble (2, 5.5, 11 Mbps)

Update the L-SIG-A parsing to use the new OFDM-specific enum values,
maintaining the existing rate mapping for 802.11a/g OFDM rates.

Refactor the mac layer's ath12k_mac_hw_rate_to_idx() function to
implement proper matching precedence:
1. First match OFDM rates using the IEEE80211_RATE_MANDATORY_A flag
2. Then match CCK short preamble rates
3. Finally match CCK long preamble rates as fallback

Add helper macros ATH12K_MAC_RATE_A_M and ATH12K_MAC_RATE_B to improve
readability of the rate table initialization and ensure the mandatory
flag is set for OFDM rates.

This fix ensures monitor mode captures display accurate rate information
in the radiotap header, correctly distinguishing between 1 Mbps and
11 Mbps, and properly identifying preamble types for CCK rates.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
Signed-off-by: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h         | 31 +++++---
 drivers/net/wireless/ath/ath12k/mac.c         | 51 +++++++------
 .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 76 +++++++++++++++----
 3 files changed, 108 insertions(+), 50 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 43e3880f8257..bf4f7dbae866 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -268,21 +268,28 @@ enum hal_rx_reception_type {
 };
 
 enum hal_rx_legacy_rate {
-	HAL_RX_LEGACY_RATE_1_MBPS,
-	HAL_RX_LEGACY_RATE_2_MBPS,
-	HAL_RX_LEGACY_RATE_5_5_MBPS,
-	HAL_RX_LEGACY_RATE_6_MBPS,
-	HAL_RX_LEGACY_RATE_9_MBPS,
-	HAL_RX_LEGACY_RATE_11_MBPS,
-	HAL_RX_LEGACY_RATE_12_MBPS,
-	HAL_RX_LEGACY_RATE_18_MBPS,
-	HAL_RX_LEGACY_RATE_24_MBPS,
-	HAL_RX_LEGACY_RATE_36_MBPS,
-	HAL_RX_LEGACY_RATE_48_MBPS,
-	HAL_RX_LEGACY_RATE_54_MBPS,
+	HAL_RX_LEGACY_RATE_LP_1_MBPS,
+	HAL_RX_LEGACY_RATE_LP_2_MBPS,
+	HAL_RX_LEGACY_RATE_LP_5_5_MBPS,
+	HAL_RX_LEGACY_RATE_LP_11_MBPS,
+	HAL_RX_LEGACY_RATE_SP_2_MBPS,
+	HAL_RX_LEGACY_RATE_SP_5_5_MBPS,
+	HAL_RX_LEGACY_RATE_SP_11_MBPS,
 	HAL_RX_LEGACY_RATE_INVALID,
 };
 
+enum hal_rx_legacy_rates_ofdm {
+	HAL_RX_LEGACY_RATE_OFDM_48_MBPS,
+	HAL_RX_LEGACY_RATE_OFDM_24_MBPS,
+	HAL_RX_LEGACY_RATE_OFDM_12_MBPS,
+	HAL_RX_LEGACY_RATE_OFDM_6_MBPS,
+	HAL_RX_LEGACY_RATE_OFDM_54_MBPS,
+	HAL_RX_LEGACY_RATE_OFDM_36_MBPS,
+	HAL_RX_LEGACY_RATE_OFDM_18_MBPS,
+	HAL_RX_LEGACY_RATE_OFDM_9_MBPS,
+	HAL_RX_LEGACY_RATE_OFDM_INVALID,
+};
+
 enum hal_ring_type {
 	HAL_REO_DST,
 	HAL_REO_EXCEPTION,
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 6c534f0d59ce..035937dde5c6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -164,30 +164,31 @@ static const struct ieee80211_channel ath12k_6ghz_channels[] = {
 	CHAN6G(233, 7115, 0),
 };
 
+#define ATH12K_MAC_RATE_A_M(bps, code) \
+	{ .bitrate = (bps), .hw_value = (code),\
+	  .flags = IEEE80211_RATE_MANDATORY_A }
+
+#define ATH12K_MAC_RATE_B(bps, code, code_short) \
+	{ .bitrate = (bps), .hw_value = (code), .hw_value_short = (code_short),\
+	  .flags = IEEE80211_RATE_SHORT_PREAMBLE }
+
 static struct ieee80211_rate ath12k_legacy_rates[] = {
 	{ .bitrate = 10,
 	  .hw_value = ATH12K_HW_RATE_CCK_LP_1M },
-	{ .bitrate = 20,
-	  .hw_value = ATH12K_HW_RATE_CCK_LP_2M,
-	  .hw_value_short = ATH12K_HW_RATE_CCK_SP_2M,
-	  .flags = IEEE80211_RATE_SHORT_PREAMBLE },
-	{ .bitrate = 55,
-	  .hw_value = ATH12K_HW_RATE_CCK_LP_5_5M,
-	  .hw_value_short = ATH12K_HW_RATE_CCK_SP_5_5M,
-	  .flags = IEEE80211_RATE_SHORT_PREAMBLE },
-	{ .bitrate = 110,
-	  .hw_value = ATH12K_HW_RATE_CCK_LP_11M,
-	  .hw_value_short = ATH12K_HW_RATE_CCK_SP_11M,
-	  .flags = IEEE80211_RATE_SHORT_PREAMBLE },
-
-	{ .bitrate = 60, .hw_value = ATH12K_HW_RATE_OFDM_6M },
-	{ .bitrate = 90, .hw_value = ATH12K_HW_RATE_OFDM_9M },
-	{ .bitrate = 120, .hw_value = ATH12K_HW_RATE_OFDM_12M },
-	{ .bitrate = 180, .hw_value = ATH12K_HW_RATE_OFDM_18M },
-	{ .bitrate = 240, .hw_value = ATH12K_HW_RATE_OFDM_24M },
-	{ .bitrate = 360, .hw_value = ATH12K_HW_RATE_OFDM_36M },
-	{ .bitrate = 480, .hw_value = ATH12K_HW_RATE_OFDM_48M },
-	{ .bitrate = 540, .hw_value = ATH12K_HW_RATE_OFDM_54M },
+	ATH12K_MAC_RATE_B(20, ATH12K_HW_RATE_CCK_LP_2M,
+			  ATH12K_HW_RATE_CCK_SP_2M),
+	ATH12K_MAC_RATE_B(55, ATH12K_HW_RATE_CCK_LP_5_5M,
+			  ATH12K_HW_RATE_CCK_SP_5_5M),
+	ATH12K_MAC_RATE_B(110, ATH12K_HW_RATE_CCK_LP_11M,
+			  ATH12K_HW_RATE_CCK_SP_11M),
+	ATH12K_MAC_RATE_A_M(60, ATH12K_HW_RATE_OFDM_6M),
+	ATH12K_MAC_RATE_A_M(90, ATH12K_HW_RATE_OFDM_9M),
+	ATH12K_MAC_RATE_A_M(120, ATH12K_HW_RATE_OFDM_12M),
+	ATH12K_MAC_RATE_A_M(180, ATH12K_HW_RATE_OFDM_18M),
+	ATH12K_MAC_RATE_A_M(240, ATH12K_HW_RATE_OFDM_24M),
+	ATH12K_MAC_RATE_A_M(360, ATH12K_HW_RATE_OFDM_36M),
+	ATH12K_MAC_RATE_A_M(480, ATH12K_HW_RATE_OFDM_48M),
+	ATH12K_MAC_RATE_A_M(540, ATH12K_HW_RATE_OFDM_54M),
 };
 
 static const int
@@ -732,11 +733,17 @@ u8 ath12k_mac_hw_rate_to_idx(const struct ieee80211_supported_band *sband,
 		if (ath12k_mac_bitrate_is_cck(rate->bitrate) != cck)
 			continue;
 
-		if (rate->hw_value == hw_rate)
+		/* To handle 802.11a PPDU type */
+		if ((!cck) && (rate->hw_value == hw_rate) &&
+		    (rate->flags & IEEE80211_RATE_MANDATORY_A))
 			return i;
+		/* To handle 802.11b short PPDU type */
 		else if (rate->flags & IEEE80211_RATE_SHORT_PREAMBLE &&
 			 rate->hw_value_short == hw_rate)
 			return i;
+		/* To handle 802.11b long PPDU type */
+		else if (rate->hw_value == hw_rate)
+			return i;
 	}
 
 	return 0;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index bd741532b7dc..074df2ab6bbf 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -405,6 +405,42 @@ ath12k_wifi7_dp_mon_hal_rx_parse_user_info(const struct hal_receive_user_info *r
 	}
 }
 
+static __always_inline u8
+ath12k_wifi7_hal_mon_map_legacy_rate_to_hw_rate(u8 rate)
+{
+	u8 ath12k_rate;
+
+	/* Map hal_rx_legacy_rate to ath12k_hw_rate_cck */
+	switch (rate) {
+	case HAL_RX_LEGACY_RATE_LP_1_MBPS:
+		ath12k_rate = ATH12K_HW_RATE_CCK_LP_1M;
+		break;
+	case HAL_RX_LEGACY_RATE_LP_2_MBPS:
+		ath12k_rate = ATH12K_HW_RATE_CCK_LP_2M;
+		break;
+	case HAL_RX_LEGACY_RATE_LP_5_5_MBPS:
+		ath12k_rate = ATH12K_HW_RATE_CCK_LP_5_5M;
+		break;
+	case HAL_RX_LEGACY_RATE_LP_11_MBPS:
+		ath12k_rate = ATH12K_HW_RATE_CCK_LP_11M;
+		break;
+	case HAL_RX_LEGACY_RATE_SP_2_MBPS:
+		ath12k_rate = ATH12K_HW_RATE_CCK_SP_2M;
+		break;
+	case HAL_RX_LEGACY_RATE_SP_5_5_MBPS:
+		ath12k_rate = ATH12K_HW_RATE_CCK_SP_5_5M;
+		break;
+	case HAL_RX_LEGACY_RATE_SP_11_MBPS:
+		ath12k_rate = ATH12K_HW_RATE_CCK_SP_11M;
+		break;
+	default:
+		ath12k_rate = rate;
+		break;
+	}
+
+	return ath12k_rate;
+}
+
 static void
 ath12k_wifi7_dp_mon_parse_l_sig_b(const struct hal_rx_lsig_b_info *lsigb,
 				  struct hal_rx_mon_ppdu_info *ppdu_info)
@@ -415,25 +451,32 @@ ath12k_wifi7_dp_mon_parse_l_sig_b(const struct hal_rx_lsig_b_info *lsigb,
 	rate = u32_get_bits(info0, HAL_RX_LSIG_B_INFO_INFO0_RATE);
 	switch (rate) {
 	case 1:
-		rate = HAL_RX_LEGACY_RATE_1_MBPS;
+		rate = HAL_RX_LEGACY_RATE_LP_1_MBPS;
 		break;
 	case 2:
-	case 5:
-		rate = HAL_RX_LEGACY_RATE_2_MBPS;
+		rate = HAL_RX_LEGACY_RATE_LP_2_MBPS;
 		break;
 	case 3:
-	case 6:
-		rate = HAL_RX_LEGACY_RATE_5_5_MBPS;
+		rate = HAL_RX_LEGACY_RATE_LP_5_5_MBPS;
 		break;
 	case 4:
+		rate = HAL_RX_LEGACY_RATE_LP_11_MBPS;
+		break;
+	case 5:
+		rate = HAL_RX_LEGACY_RATE_SP_2_MBPS;
+		break;
+	case 6:
+		rate = HAL_RX_LEGACY_RATE_SP_5_5_MBPS;
+		break;
 	case 7:
-		rate = HAL_RX_LEGACY_RATE_11_MBPS;
+		rate = HAL_RX_LEGACY_RATE_SP_11_MBPS;
 		break;
 	default:
 		rate = HAL_RX_LEGACY_RATE_INVALID;
+		break;
 	}
 
-	ppdu_info->rate = rate;
+	ppdu_info->rate = ath12k_wifi7_hal_mon_map_legacy_rate_to_hw_rate(rate);
 	ppdu_info->cck_flag = 1;
 }
 
@@ -447,31 +490,32 @@ ath12k_wifi7_dp_mon_parse_l_sig_a(const struct hal_rx_lsig_a_info *lsiga,
 	rate = u32_get_bits(info0, HAL_RX_LSIG_A_INFO_INFO0_RATE);
 	switch (rate) {
 	case 8:
-		rate = HAL_RX_LEGACY_RATE_48_MBPS;
+		rate = HAL_RX_LEGACY_RATE_OFDM_48_MBPS;
 		break;
 	case 9:
-		rate = HAL_RX_LEGACY_RATE_24_MBPS;
+		rate = HAL_RX_LEGACY_RATE_OFDM_24_MBPS;
 		break;
 	case 10:
-		rate = HAL_RX_LEGACY_RATE_12_MBPS;
+		rate = HAL_RX_LEGACY_RATE_OFDM_12_MBPS;
 		break;
 	case 11:
-		rate = HAL_RX_LEGACY_RATE_6_MBPS;
+		rate = HAL_RX_LEGACY_RATE_OFDM_6_MBPS;
 		break;
 	case 12:
-		rate = HAL_RX_LEGACY_RATE_54_MBPS;
+		rate = HAL_RX_LEGACY_RATE_OFDM_54_MBPS;
 		break;
 	case 13:
-		rate = HAL_RX_LEGACY_RATE_36_MBPS;
+		rate = HAL_RX_LEGACY_RATE_OFDM_36_MBPS;
 		break;
 	case 14:
-		rate = HAL_RX_LEGACY_RATE_18_MBPS;
+		rate = HAL_RX_LEGACY_RATE_OFDM_18_MBPS;
 		break;
 	case 15:
-		rate = HAL_RX_LEGACY_RATE_9_MBPS;
+		rate = HAL_RX_LEGACY_RATE_OFDM_9_MBPS;
 		break;
 	default:
-		rate = HAL_RX_LEGACY_RATE_INVALID;
+		rate = HAL_RX_LEGACY_RATE_OFDM_INVALID;
+		break;
 	}
 
 	ppdu_info->rate = rate;

base-commit: 2c1ba9c2adf0fda96eaaebd8799268a7506a8fc9
-- 
2.34.1


