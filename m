Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B2FD25043
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crijy/JfQgHYXn/804LQESxfgfEFdcgLFtKHH3i78UA=; b=CQFcP/Q5UrF4PwFSQ36MOZN5jR
	NKgNVyEX9eSdK6AEhzIMfG6FaIEwEsOpKkB5UGvp6jpe4GHxfIeYO6HE8SOCxZAsVzUDWX5No+uMa
	CacQK/jyBoWnBS36DbdrYEPIv12Ft/YEzQg5x4DKW3bTMiEc+NL66WneE/VcrDwvudgZuOfMOM4Oz
	gJButXsLN+J03J4YHwjHhWplaYg6M+nSQW/zLZ0LUzj2LV5C3g2PYi7a0qGtHIEkK47KMBq3NAlmV
	rTf9LFIoUX+SL1qGmTHGY0PtHoPW08ayNSNX11qjN3rasES+pO1H9PZABIqHv7lKWkZ+AVSZf5vLe
	9JaQE3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCU6-00000004tNm-2nFN;
	Mon, 12 Jan 2026 07:37:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCU4-00000004tLo-2c5Q
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7Oclu555251
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	crijy/JfQgHYXn/804LQESxfgfEFdcgLFtKHH3i78UA=; b=jhDTpCO58ZM3E5EI
	ru1VY8DFlvPyeK/2EHTgUE+U8L4oyG89EFgMlxYFdgHHCEOzReXk3xNMyvw52hFz
	z2H0iiz8KPoIP8orLl6b/sOOwG89cim5twxC2ti2nZvr0UKMhO5TW85rEYD0lE6t
	X3SxZ8YwTr7oLRIlU097q69RwskGoRoMeHr+xdAm7LIepVKL1EuoV5cqj1XEjDR/
	OLjv+AI4agRoL04YlF8A3pZ8JLcG3JaldT8eoDJ/FyromtLRzscDKluzxqnCdVdE
	dvZHRTF6f5NM0XOdoRxfIIdz91BQbRt9r/3+E3BwpmS+yBWkqvd/fdy8dQmzTP2I
	XWagEA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw014d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c52d37d346fso2024022a12.0
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203423; x=1768808223; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crijy/JfQgHYXn/804LQESxfgfEFdcgLFtKHH3i78UA=;
        b=a+NSkl7USd+OVk2mGhmea2byaMfSCIr2DI6K/E9YDTZ/PpkKDiGxcLbcktjZc2gTZT
         2xnAbcSogOnIhVDbmlPyH5nN1WXuyTdthpx+d4YUNnVEvaFGqqKWaZzityCvSj4ZfcQM
         o1FD2bOufwtjZZwGeY3o8PECRJ6Cs2HNVOhKIzg+QUeX41dy4oDYu75xL614MvRYAKvy
         cibKH2tQ/STudxQr6iUPm0Bpm80Urc3UDLwLajBdQpDQWPjet+YAyTQl868NiUMdlStZ
         VyUpvOy0urmmv0AVECfnjrB+9xsPcur+U03knjLYjoeb7xu4KdvvsDMBqvAJcr5FS+gl
         QIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203423; x=1768808223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=crijy/JfQgHYXn/804LQESxfgfEFdcgLFtKHH3i78UA=;
        b=KUbyO8BTxr929Vy1FGNqUuI1Is7ZFLli8Z3Xt5LJwGo/Q6qCi27HLDnAIPJrtsObFa
         LeRq39TZc0k0SGnQQBjoM1EUxF2GQ93msNiUzJZcpwWzYpYOMiZDTUJmTgmb/Es1BKaY
         HHwEXe4hbBya7OWxIIvIasD7KU+huJ4VmnfKzsbM0Njxw9uwaxWMnQu7PPnNzlypt9qw
         OK6pFZd44RacKFNaR3hNNx8eXKfiYFqnI3G7kpc7cC1Hv9w5tBCW6rNuqWl5meT6TtFw
         /nfo+3M4MyTv4/ybWRIwcWBXrGkjEVNZmNV0HiguiZA9q/RoWUSTXNG+eWl643/LWH9t
         8Ccw==
X-Forwarded-Encrypted: i=1; AJvYcCW1imK/hVrhi8x0+Kcw0E/OUpVl36yEDPqLmR9+xeiyRdsL2qB0+mB+77QIkvgOeeYW29zBK0U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmveaxVg1ctwLZZoKa86KgkAjpnZRF69C0ymLiXQnRxyiTYGkV
	9ZXWfC0m6BxB6/zDMHCk8V1ZmBNhGe1EFEci6UL+FYvzUCyQ3UUQOJ3a5LGvhYWF2k1i/Kx5mH3
	8miNEWA1zV/HpuooVdc654obyK0C61qrffYRc/fd6BWQppgEgHbkk+hgNwM1AyZ6WyWpuqlDJu5
	o=
X-Gm-Gg: AY/fxX4v6JanbORHmatrQm9obZ2JgqzcRJfa5t8s7tewO27JQuNYmod3dX6kNcmcJn1
	Q4WCCghCAMoDCHN463/4MdqYdkkpgA6pkP3uzOsKeCRYkOP/isGmOlhSa4BYh15NVRsErNo050b
	xJIJStTat2CXy1GNgrvagMCbNG/Y5fDHMYSBXyy5jzl1sjsjcgJOqNgxgiAPitqeyE7CjGv3MRk
	t5QcttX5Ar9FnEqojEj4V1PkPEBLzGBGMha/hcPJDvL/QhG2PdsUq/yeTE55/XZC8YI21EmI1e2
	aTjg55uCfGjYSN/IWSd44ZY9SG8+niYeHc6IxflViwrsXqLEtE6xm7/mHHE0iiXQdYXN3lIETXo
	SUIC2B6z72XHk1yID+5zusuYJZ5GhxnNKMrSTD44hGgJkqQFWQZu6apoZkwd41jo=
X-Received: by 2002:a05:6a20:748f:b0:342:2a1b:870f with SMTP id adf61e73a8af0-3898eaadd03mr17048275637.20.1768203423103;
        Sun, 11 Jan 2026 23:37:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDYnBEWa02oUYRMDUftjkmlUw+D3qC727crK+T/F8vrJ3a1geLv3RvJdq7Hu7TdHjN6YmKIQ==
X-Received: by 2002:a05:6a20:748f:b0:342:2a1b:870f with SMTP id adf61e73a8af0-3898eaadd03mr17048256637.20.1768203422595;
        Sun, 11 Jan 2026 23:37:02 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:02 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:25 +0800
Subject: [PATCH ath-next v2 05/18] wifi: ath12k: refactor 320 MHz bandwidth
 support parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-5-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX+WAOv/kfPe+R
 PMdOeqzygmPpETazSSWfOCgu7eb99zJ5RkQxReKLJycwV0FD9BgcbUNiqbQtEr58IA7XyGu0APs
 NQ60eTUMvAMfCn6hBSfFkhjCKuEpPikz669ijk4UBbVmVBvRpLouFj5aisCPnQas756oQCA0Wl/
 hthbDJWS0YXKN18bnhU9m+QcYqVuq89vDwg4pkV6AQLOgL0VwS3F6OD/mYagcbKJjW0qD2e4aY2
 scW40TchVgFktlSQC2CvOijz0FiiYaulU0uyLfDaQBOcyJDTSxBfl2DLGPlBrGxdfagFMYkPvzH
 HKZz2QCwyuDFoE9fucWtK90oGBP9aXYlvRuBkxb8pz/JPi9QSBilNmZ+fQOuQ/whM4gBi8GrjlC
 gmTu2ho/cVVdqWd9/NMsWJ2hpAGESMVnx7uMt39zL+A8qCkIYJSH6YCFp/+/XxK/cLfAn4GHUkf
 r5eRz1Fk82nmhH2CMeg==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964a49f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iGNyLxvpPC8n4FyEg3QA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: xgQbp7cFq68x6J8wF_bhDYJ8T6f_15hz
X-Proofpoint-ORIG-GUID: xgQbp7cFq68x6J8wF_bhDYJ8T6f_15hz
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
X-CRM114-CacheID: sfid-20260111_233704_692876_7F57016E 
X-CRM114-Status: GOOD (  16.99  )
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

For single pdev device, 320 MHz bandwidth support is reported only in
capability of WMI_HOST_HW_MODE_SINGLE mode, hence commit d4e244c85e45
("wifi: ath12k: enable 320 MHz bandwidth for 6 GHz band in EHT PHY
capability for WCN7850") relaxed the condition check in
ath12k_wmi_tlv_mac_phy_caps_ext() to allow SINGLE mode getting parsed in
ath12k_wmi_tlv_mac_phy_caps_ext_parse(). Since SINGLE mode is not assumed
to be preferred, the function returns unconditionally after parsing 320
MHz support.

This works for WCN7850 because it prefers another mode indeed, while it
breaks QCC2072 since it prefers SINGLE mode. Due to the unconditional
return, the subsequent EHT parsing is skipped. Consequently EHT related
features are disabled.

Refactor it by moving 320 MHz parsing to ath12k_wmi_tlv_mac_phy_caps_ext(),
before the mode checking. This makes the code more straightforward, and
work for both WCN7850 and QCC2072.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 32c4e7fe03c4..248933eac061 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4918,19 +4918,10 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 				      const struct ath12k_wmi_caps_ext_params *caps,
 				      struct ath12k_pdev *pdev)
 {
-	struct ath12k_band_cap *cap_band;
-	u32 bands, support_320mhz;
+	u32 bands;
 	int i;
 
 	if (ab->hw_params->single_pdev_only) {
-		if (caps->hw_mode_id == WMI_HOST_HW_MODE_SINGLE) {
-			support_320mhz = le32_to_cpu(caps->eht_cap_phy_info_5ghz[0]) &
-				IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
-			cap_band = &pdev->cap.band[NL80211_BAND_6GHZ];
-			cap_band->eht_cap_phy_info[0] |= support_320mhz;
-			return 0;
-		}
-
 		for (i = 0; i < ab->fw_pdev_count; i++) {
 			struct ath12k_fw_pdev *fw_pdev = &ab->fw_pdev[i];
 
@@ -4983,14 +4974,22 @@ static int ath12k_wmi_tlv_mac_phy_caps_ext(struct ath12k_base *ab, u16 tag,
 					   void *data)
 {
 	const struct ath12k_wmi_caps_ext_params *caps = ptr;
+	struct ath12k_band_cap *cap_band;
+	u32 support_320mhz;
 	int i = 0, ret;
 
 	if (tag != WMI_TAG_MAC_PHY_CAPABILITIES_EXT)
 		return -EPROTO;
 
 	if (ab->hw_params->single_pdev_only) {
-		if (ab->wmi_ab.preferred_hw_mode != le32_to_cpu(caps->hw_mode_id) &&
-		    caps->hw_mode_id != WMI_HOST_HW_MODE_SINGLE)
+		if (caps->hw_mode_id == WMI_HOST_HW_MODE_SINGLE) {
+			support_320mhz = le32_to_cpu(caps->eht_cap_phy_info_5ghz[0]) &
+					 IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
+			cap_band = &ab->pdevs[0].cap.band[NL80211_BAND_6GHZ];
+			cap_band->eht_cap_phy_info[0] |= support_320mhz;
+		}
+
+		if (ab->wmi_ab.preferred_hw_mode != le32_to_cpu(caps->hw_mode_id))
 			return 0;
 	} else {
 		for (i = 0; i < ab->num_radios; i++) {

-- 
2.25.1


