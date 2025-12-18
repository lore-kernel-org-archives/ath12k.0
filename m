Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB62D68BCA
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USK9gTegbFUVTqdlXJ3G4I84U5jaASDFB+zUUzmxWHU=; b=X/JF5ALvlcMJkjfljXraDRgf6g
	5zGsI2yaAXUFQVh82QtK1y45Tzd+gjpVk0X/JXaUDsTpO/qpZN2aBh4pvPo8UcvuJc/oYnf8GbGiP
	9NQq6LjDdF6EU8D/Fzmb4PAzT6+Tx3k6Neh7PsBhT8plDD53BpgQzv3gbyZSkxCwJDgXXz3t2K6lO
	5eJjJiMsPsBKu96ozO+zllQLsT8lCZSIRBOhVwMZTfevJfQ0KxSq4fymu8GPYdDb7WwL8pXAovEzW
	j7oD57+6mdI6gH5+5dzl7XVb0Iz3LkulvQeqFsUEfXbJ8wcT5bFp3CU2Bj8KCw1yEj+rCcOwxkKvC
	g3Whxutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Ef-00000007fs8-2LvY;
	Thu, 18 Dec 2025 01:55:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Ec-00000007fpv-43KK
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YnNI493164
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USK9gTegbFUVTqdlXJ3G4I84U5jaASDFB+zUUzmxWHU=; b=g1/6/G47T8ktb4vf
	w2jX+F7m5FidKDodsnNKaoldgskHjFUVYGs7NhX6/jJ+VJWNvFo+7illlLPUDlHv
	vrXA1CusoUG/cokbhNP1C/ZaAGY94u+0TBACH81lEjU853fIaPbScN0BGgAs+Vxr
	+7w1OO0gjYc4wQHUFz/Tzhva6vepUFk+jNFYn49Uj05dF9Sq6RCh+0jObeCqh08H
	8y7TKUCsG+KcMaws2Ml4vYP4h4vmxTFBfV5N/2IrThCgNTx630zJ8gHU3Ofx8D3U
	uvxeHG592qycSRS4vOePOvc1is1bTzwqNnA8a69NieN5P3BNtXEtmQkuOUypilRo
	G3738g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n333qxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso3685475ad.3
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022917; x=1766627717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USK9gTegbFUVTqdlXJ3G4I84U5jaASDFB+zUUzmxWHU=;
        b=hXYb19+4pBSKrkKuJlEjr25+pejSdTt+YTD/TieOfdRZFC6eyBhNvQ1x8tryzvgauT
         A5NkHZ69zh2/PjYLKyI4ZLY3zjkWUwYrnL4Cg1egcPaueReJtPkxFo1FRfE/Gh12dCcr
         aQxpUkUDqan0gVgyL2YshDAsLer+2vMUSahBnDaV2CoyGCuXjC89OuOVG3zDHXFnxUqX
         AqSCY+CftXa5MPjkYJ0ZMlBWiloebeYXnt8nbp+sGc5iGlscZycZa+D/Ug0tyGx7EY7q
         7WQcM9gA+RiTKLO5OJ51oVFbWMEabcQgF7uqw8OBBqNMUhMzv2kjwWRVGcIgV0oweTvR
         hp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022917; x=1766627717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=USK9gTegbFUVTqdlXJ3G4I84U5jaASDFB+zUUzmxWHU=;
        b=qGHL2sOL4pfF4jlGCm0CMOQ2+JMp6ayiJw8ZeuHpeO4SgsQtYTx9iAJ/JaENKNZTrY
         82n34B2rvGm8+PYvb/lic6j5JII1d6jEpXw3zQtpOn+xaE0hik6OcCrPd90DCHc7mYrk
         cTZUq08UDVUhEGZ82Zv1U5oHPUp8B3bPAts38UzdouuU+8DZGL3mezA8X9yCkJ4TQs6D
         QzL/IKWsEV9/EQl3bCsRb7qZv1aN65GTaJ7zRfi2C1Q7ZdUADG9/x4PjQ05x+usCaBve
         fl4F+im5lzOH/cxChUbFvw3h/tfR9hmHwJwNuJPI2orr4+7hLAaAGQudjOS/Ew6418Kc
         pykA==
X-Forwarded-Encrypted: i=1; AJvYcCW0f7jm+PNJIry5H+UvjTE/J2YVAaEedBGR99DDx7IQZLLdR6VKYDgggGeU7AKD3zyon5axxBc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/BNOac/J/7V7V7zS9Gd6vT5BGI4nMwk7tJNzxqlTjbZbOYoAr
	1LanUIRKZuvTLjp3Y35pPbC1dKMcZxuHOA6JZe9YYNuKFqGquJr8qIuufSrcO73D/Z74mKpt9DQ
	3r7b3DNm/jKFxJYC74lCmLa+baYQSWDTb4vqS/kMuToNaFKbz6b6he99acr0RiWVwEQ1HiurqLT
	o=
X-Gm-Gg: AY/fxX5g4ZeCS1ITr7vKJcTmaDaK/hmQGLQG7sHG9LpIBByMO4zUHC/7ApG0B1I0F96
	HteIf2ryLJYh8X2mPN9B4ali4zbXXpHFe6nMqss9KSzjoJRQjBY7JbxPwOv0wE+dmXE2DQRHaB5
	m3gBSmozPyyvSHd6FxpQhJHNcPbU6AVt/kCWyIDsZGCrODD4HjdHQm4GJ5Aso98Y78IL0H9PEgD
	hiYpo47NSBS5Qy2U2KtK7MaESQFmpKpf/Ne0N2Z7g8Nmsr3q6r4oyOvbvdTpX9qPVMxCCEJGcnG
	0bs5JfoRUIsMwhmcSLnWblHoUy2gmwpR+4HCdqzoAcd/MLeieNVISTwRITn6MtJDq4FjNwpBMFG
	kgXrovs5Y2UYqOMRLE5eXj0zf3kXEYQfvpHZURnFwMZIiesdPHVeO6nPFzppFP3Y=
X-Received: by 2002:a17:903:2281:b0:2a1:e19:ff5 with SMTP id d9443c01a7336-2a10e191134mr108647705ad.38.1766022916702;
        Wed, 17 Dec 2025 17:55:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb0WFeuaNdUD/muzLE3WY+H/ZJqp6xvlEcEEd6Q6rMJCQWUxIQzQfOq5WEEMx3ea7LYeXVjA==
X-Received: by 2002:a17:903:2281:b0:2a1:e19:ff5 with SMTP id d9443c01a7336-2a10e191134mr108647595ad.38.1766022916249;
        Wed, 17 Dec 2025 17:55:16 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:15 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:20 +0800
Subject: [PATCH ath-next 06/19] wifi: ath12k: fix mac phy capability
 parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-6-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfXz9TNcYuHh87A
 xvT9Us7Ky7BXySZTVebp+FHP85lbQhRqsnqYHC587c2jVdwEq541CsIUQC7Z6i71KxLgWfV5+pV
 AkIl/geoCfdYdiN12gxURCCkxRtS0h0f8DUNSJki2V/uG5FYDNIUKPtaVI2ocvZKBhHDkYwnhML
 vkEZglru4TmkYn1Qh3s3QnD2PcUQ4nq3MhX4Iz4YojlDI9dRTgTkSDMeVDihhJ+wBZNCJngnFEF
 jpdIwx1mDw4b5EfX0zdaVp+biBj11AdpfAMK+R91Z+hCEolZpp2pJ4STDekCMLNJsNtlC/X6oUG
 QREAFfktHQlmUFrGi+9TiR5MJG64dqDEUR13oyC+KGFqV6rSo2ENDFKhH04QR3HgQiJ0/nuIOm5
 PCc0gFlFGgRzqUQ7BEKxkt/7DYQfmg==
X-Proofpoint-GUID: x-gzn1sqV8Sfbqi-A0v6tSSb7MMpQ83F
X-Proofpoint-ORIG-GUID: x-gzn1sqV8Sfbqi-A0v6tSSb7MMpQ83F
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=69435f06 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=f0Wkw4mh0JH31tpTHZgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175519_202084_198ED9C7 
X-CRM114-Status: GOOD (  15.07  )
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
index dd643af892c2..ef7690f829ca 100644
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


