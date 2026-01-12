Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327D1D25032
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TM3rjSfEe43fhT+aoVY7K+zVTC/c8MyJyzGFdi0Enm4=; b=4bYFLUp6V4Sirqx6kIKElDO2Sp
	y9zzNy2mtM9fkfYE+Y2bFApl7t9sTBiePsK+ToEcnXInf/WCrKUDdqpyzH2+Va6AAZloIqo9SA/NY
	gSHKSJbOi7seMfQqA6t1mDOerYB1o8Bi0mSRXU1ym0j+HIm6jF4QVzxGi5zrS5Y2IAuSzNZx54TSd
	hl4CJHPg77s4xIx//gLkP4wXGSgc9zsVyLJd/oxjXO2nGauNVQ5ZUECVfUyPnmlkkijJUtVD0wqc4
	15q7SQzbc16v2Kt/rh5scXC4piqtzmy0QNlPRrkdzDepGrvalVriY0o4JxyrWEas21qBmawnGpgXF
	3Aj21K7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCU8-00000004tPB-41QO;
	Mon, 12 Jan 2026 07:37:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCU6-00000004tNJ-1ZTI
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7OtH6556393
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TM3rjSfEe43fhT+aoVY7K+zVTC/c8MyJyzGFdi0Enm4=; b=oKKMdmrdeq98vXEe
	sbIJtTTjFHnelh9xyO7XC6AYWhwtrGJP8oXXHrBXV/eBw1mcIn2yaEVUcDufr4m+
	s31PDYthGjHtimCC7QoSRi+TlOYR5tmmBwHM8+L0E5jSNocV6zapOuq/zbT7BMUa
	WA1njIm4E29NllMTiUmnFsdFjVvDTbj8nxyj1iVVHM94jaA35uP9b2edsqPZFRvm
	65oxbePbZpYWT7i81BE8U37s4rJZNl48qnAwtFnZ46RC+lKuux/sjBKD0mkhxvAU
	sQGbYczPa032l6pRK4HvFERZijFRYtUZvEGtmcb52RYlASjWJkAm1GgKZNOnsLkt
	U3nkTQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw014n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f48cec0ccso722641b3a.0
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203425; x=1768808225; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TM3rjSfEe43fhT+aoVY7K+zVTC/c8MyJyzGFdi0Enm4=;
        b=Hv/neUGZ4+x0y9nNgU0/qGAfmjeyrI6XcnSsYMpeoGkVHnA8BoDDYCPUc7iccw3LQl
         7HTeA86mb7PkvS5FDIBLraTTTg078URQiZ+wxLwej6fL4HV5wdqYKPwJ9okBSrNoDGz5
         P+axos7RgGyjxgl56Z4r6e0QNHTj0e6ByRj+Guokq7MUGxa2/TxG3mTxTCl1AW680Mvj
         lkBFnHzw0Tg3Y0r/ALHcVHycbRAtWbPHiiW5roKGeUHoKXBy9wKhwrNUJXASbvP6QTgy
         eDpwWzzAN0mBJq8RbM1p6uhJQitTT1LCTFiTdahbIIDJ48009kGecXZMlFMFUmzzd+3K
         m5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203425; x=1768808225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TM3rjSfEe43fhT+aoVY7K+zVTC/c8MyJyzGFdi0Enm4=;
        b=eVuXqIVeA+RaetctXy4juvhPmO4GGanodssCx4JzdLDiRAJhLmnHUqvOR4dfi2A0jk
         /ENykkeBB+4Xk9lHFIua/9hfAG0ox+4hrDCT+FDyKxS19jUNBb72Ftq82mX2HiPnvyAs
         13uEfMQDN1A7dwE9JH9zVjiwvbaRSLMXLfmFOM2bLpTYutTiDXT1DQKV/QMAu84mR5ar
         TgkVtnfSQqhapLDkfHVF03+yzetfTcH6iJqSJT0opF2BW7fPMmCvA/qKoplvse+KIKti
         fhI3VUXgd9v0IbIOTOA12Mz+f+GNulobdrChto75YXO+Tg3fu94OyuugGe6KApWGTY3r
         5xsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYc1tN/vB/nPoUoE7sSgap6SdC38mStkdwLYAvm0alRuRX+Q+faWpGiFhxqk8DnMchXyn0Wq8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4R3CDTxGLeHo04Hx0dh04kfzhQLyjFFmNhJ8cop5te1zvHAWS
	hmUrOcmExVRT82w8SpNW5I7JzUNPGpx9cFVruACoXwmvLxvwdtb4zu2EHtrHOv8cr8Ywl1FKp8S
	nxwI6sRMoFXSVzk8hCpbI5R7Ck6JoJdvBzN8ZQ+U6w2Oqzm/DV8FUGezKSZR4+TaMMzCWUKGaGe
	Q=
X-Gm-Gg: AY/fxX53c/SHQmb2UDeHdC40/05j3H9V1BLlmCnkXKQDYTe3BG+1EyUFdZsYN4HCNmy
	Q3uzVGaUUjNdyrQR3Qg/RNK451h8gJhdxAC7KyD3MtifMdWFuol3WYbRVxkbW5XRNY/jDkqd2QU
	M293LA7RvgvJnYpeK1ExNQjUxfJKH8qLoBuCx7ignbvlmujsfVmhloWYHE8KvqTdj2A1iOr+HiK
	GDqXB5l0DJiIjEmp5cm5qLKZ8ttsDtMgjI72wv/CCKRuLsbv6NF0oW33zpXDINEM1ZRAqK+eXXS
	zuVuyKnW6fypaZPSA3T+Oop7k3PDxjRHB9XGG9svStWfnm7QXo0F1vlf+qsk8rBtsLf1jigN/pP
	lvmB+JgbFsqKTQJpJakKeQOjtUo+uRbji3Qo3If5XuvuJbaQuqL/w+9dmz32VoqA=
X-Received: by 2002:a05:6a00:8088:b0:7e8:450c:61b8 with SMTP id d2e1a72fcca58-81b806c8389mr15215729b3a.40.1768203424907;
        Sun, 11 Jan 2026 23:37:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3rWtugbYV4vAb6oMxXrmEG1FVXJtQzJwP+lPOmpG0tx+hpTUMmsprOniOQc8a4w1Sk2aLgg==
X-Received: by 2002:a05:6a00:8088:b0:7e8:450c:61b8 with SMTP id d2e1a72fcca58-81b806c8389mr15215711b3a.40.1768203424433;
        Sun, 11 Jan 2026 23:37:04 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:04 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:26 +0800
Subject: [PATCH ath-next v2 06/18] wifi: ath12k: fix mac phy capability
 parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-6-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX6VeKdGDIUBQs
 TDscDJErdLJH7Z7CzAVRx1NVAD3LWpIUXCH4dPiMEbqnhnQZiXvjl828DJVXsYEjebZCaYdDRqx
 jdb49xY20UoLR7qAh8sZqLHsyk2G6SjGfj9t8l3NBgViBXIl8DhMsxEw9d4wjbXYgie12f10XTo
 STMN+E8s5HS6LKsGw86VxJF+CVM7u9+aILER+rBo2WNEA2goK3NRoaYfLQ+KYk3N8fEohujWsDc
 fUAiCSDHX+NPHOc3RqZROGAl/ScXmwXfVBLU+TdIrkg/G8b2xGxZDzOJH8CiffiOsa/wIDu6XAz
 M5QTOXKbXvokO8y7vY8USG7JTtF9lpqC/WES2FNtSM/I1HOIYjzrbW+ESX57t4gSNPnhFWZCO9m
 FMhUHSE5Iw38gWAkV/cp4JiUom68calMj3WWkD7shqykYD3fUcfRxsnH5lSmvOwiOEG+S+vk9zU
 LLW2NbuwxeOMUa1SJcw==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964a4a1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=f0Wkw4mh0JH31tpTHZgA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: NYp8YGF6veRFVxqzv-0Giv155cQuyu2y
X-Proofpoint-ORIG-GUID: NYp8YGF6veRFVxqzv-0Giv155cQuyu2y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233706_431734_CDA5C406 
X-CRM114-Status: GOOD (  15.45  )
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

Currently ath12k_pull_mac_phy_cap_svc_ready_ext() assumes only one band
supported in each phy, hence it skips 5 GHz band if 2 GHz band support
is detected. This does not work for device which gets only one phy but
has both bands supported, such as QCC2072.

Change to check each band individually to fix this issue.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 248933eac061..79a26203afad 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -399,6 +399,7 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 	struct ath12k_band_cap *cap_band;
 	struct ath12k_pdev_cap *pdev_cap = &pdev->cap;
 	struct ath12k_fw_pdev *fw_pdev;
+	u32 supported_bands;
 	u32 phy_map;
 	u32 hw_idx, phy_idx = 0;
 	int i;
@@ -422,14 +423,19 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 		return -EINVAL;
 
 	mac_caps = wmi_mac_phy_caps + phy_idx;
+	supported_bands = le32_to_cpu(mac_caps->supported_bands);
+
+	if (!(supported_bands & WMI_HOST_WLAN_2GHZ_CAP) &&
+	    !(supported_bands & WMI_HOST_WLAN_5GHZ_CAP))
+		return -EINVAL;
 
 	pdev->pdev_id = ath12k_wmi_mac_phy_get_pdev_id(mac_caps);
 	pdev->hw_link_id = ath12k_wmi_mac_phy_get_hw_link_id(mac_caps);
-	pdev_cap->supported_bands |= le32_to_cpu(mac_caps->supported_bands);
+	pdev_cap->supported_bands |= supported_bands;
 	pdev_cap->ampdu_density = le32_to_cpu(mac_caps->ampdu_density);
 
 	fw_pdev = &ab->fw_pdev[ab->fw_pdev_count];
-	fw_pdev->supported_bands = le32_to_cpu(mac_caps->supported_bands);
+	fw_pdev->supported_bands = supported_bands;
 	fw_pdev->pdev_id = ath12k_wmi_mac_phy_get_pdev_id(mac_caps);
 	fw_pdev->phy_id = le32_to_cpu(mac_caps->phy_id);
 	ab->fw_pdev_count++;
@@ -438,10 +444,12 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 	 * band to band for a single radio, need to see how this should be
 	 * handled.
 	 */
-	if (le32_to_cpu(mac_caps->supported_bands) & WMI_HOST_WLAN_2GHZ_CAP) {
+	if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP) {
 		pdev_cap->tx_chain_mask = le32_to_cpu(mac_caps->tx_chain_mask_2g);
 		pdev_cap->rx_chain_mask = le32_to_cpu(mac_caps->rx_chain_mask_2g);
-	} else if (le32_to_cpu(mac_caps->supported_bands) & WMI_HOST_WLAN_5GHZ_CAP) {
+	}
+
+	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP) {
 		pdev_cap->vht_cap = le32_to_cpu(mac_caps->vht_cap_info_5g);
 		pdev_cap->vht_mcs = le32_to_cpu(mac_caps->vht_supp_mcs_5g);
 		pdev_cap->he_mcs = le32_to_cpu(mac_caps->he_supp_mcs_5g);
@@ -451,8 +459,6 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 			WMI_NSS_RATIO_EN_DIS_GET(mac_caps->nss_ratio);
 		pdev_cap->nss_ratio_info =
 			WMI_NSS_RATIO_INFO_GET(mac_caps->nss_ratio);
-	} else {
-		return -EINVAL;
 	}
 
 	/* tx/rx chainmask reported from fw depends on the actual hw chains used,
@@ -468,7 +474,7 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 	pdev_cap->rx_chain_mask_shift =
 			find_first_bit((unsigned long *)&pdev_cap->rx_chain_mask, 32);
 
-	if (le32_to_cpu(mac_caps->supported_bands) & WMI_HOST_WLAN_2GHZ_CAP) {
+	if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP) {
 		cap_band = &pdev_cap->band[NL80211_BAND_2GHZ];
 		cap_band->phy_id = le32_to_cpu(mac_caps->phy_id);
 		cap_band->max_bw_supported = le32_to_cpu(mac_caps->max_bw_supported_2g);
@@ -488,7 +494,7 @@ ath12k_pull_mac_phy_cap_svc_ready_ext(struct ath12k_wmi_pdev *wmi_handle,
 				le32_to_cpu(mac_caps->he_ppet2g.ppet16_ppet8_ru3_ru0[i]);
 	}
 
-	if (le32_to_cpu(mac_caps->supported_bands) & WMI_HOST_WLAN_5GHZ_CAP) {
+	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP) {
 		cap_band = &pdev_cap->band[NL80211_BAND_5GHZ];
 		cap_band->phy_id = le32_to_cpu(mac_caps->phy_id);
 		cap_band->max_bw_supported =

-- 
2.25.1


