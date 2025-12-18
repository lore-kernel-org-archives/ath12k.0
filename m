Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8488ED68BC9
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zd+NHgHkqU0xZFONcwzOTfX+5HAIkhCqXr0ctxebxrQ=; b=TkvDxNPMD+jQBYtbM0mYuIiLVH
	40uImFcF4ASvTFRgus8fASvipLzTo88VEVnJNrGUW1razjocH/COrQFinZ09F3dWaeRqRaNMgFb8x
	6zGKwTFgwFfMC5TPh4qwHlHoQiw7Y1JY2jncYeOedv04F0TkV237ln3jqlSRSAsLzs/PNU9ZNl5Fb
	kqcdJRZ7GFBOye5UAX+Jv1XZ8ArAZneARl0KcvGvqrH9DXSSWC5wooCq2P8hMrCZFilvSS9XRwiel
	peoFVnY9utZeEXEywv4wg2+OhPUMegOBrP85xfL0/g2Qtu0oB2g1V7RQoHkt0vwWtU7aqcN23slG1
	MgAKHzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Ee-00000007fr8-10j2;
	Thu, 18 Dec 2025 01:55:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Eb-00000007fod-0T8l
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YYaU237507
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zd+NHgHkqU0xZFONcwzOTfX+5HAIkhCqXr0ctxebxrQ=; b=nbejb0kYg0Pdxjwi
	sVApRzAKFIje2UiJsuW3+f9MBCLgNXaUXJRPn5mqQDuwgo/7aA3XC2BF2WAbaKYL
	QjwXeYibG15JTh0zQdCh7aeI5I8pWPFIfWC1OrQIZmxDHM7H03fG7JKKDBvCRZKX
	ujtep9c6X/tWXwySM9O0D5aED4i+6MwJ34XCcdQ5Rjq0mCnKuJ+skAz530ZQ69t7
	mu3/IvYMJmiqj0Ca/OBGmpIK1x/toB/yAT8WxcAJO3CFMlLeQ0We8kgdq29wmnsp
	+hfcvzRsf91vzTJC3ap4vQvMnxEbh/Jf3NTtfELxVL37wR2reMLpe6qy6QDXkg2/
	2tuETg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3gg01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0bb1192cbso3322375ad.1
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022915; x=1766627715; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zd+NHgHkqU0xZFONcwzOTfX+5HAIkhCqXr0ctxebxrQ=;
        b=AAawc8sAOOirD52ehOT/j/XGzT9txnOtxgRl4J3k1JJMgwY6ZecWzN4ZoPX/CfDTDz
         Mch+V6zOrvfxuFxps3k2MONDq96KA+y+0eWqQZZgBTlIclMMN6aPxAT3nbOB6R57xAYy
         MXaAZrAEMvr5pRkdWsbsTgnVMRL287dHSkazgFKiOlHENm2Nl2T4B/sP1k4Plleroz8d
         2LszjpqCVaam/TDFZHMuzvJW58uc9bb3otf7M4XNU94AoMe3GvowNtiReZbWUAu6unvg
         79Bvc/NoCjk9ZKEiRa4mYDfb/hBuNzWeYEfnRPpK01fU1P3Zbay7DOsMXRxah5n30MI5
         uEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022915; x=1766627715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zd+NHgHkqU0xZFONcwzOTfX+5HAIkhCqXr0ctxebxrQ=;
        b=G05udaJPaDPTs+COiaQBjgoPZ/OumuwIFXinBBm1KUs6uou3yoS0iRP+VIZvKumiYw
         qTqOrr82nSI9KkoCo6HFE9H6sVHe+ZNpH5HdJxEuaViybMRAHfpLNZoNhJcNePT5O+Og
         dF7tCqBXUKonKtO+fs9DNGfFqA8uhesVQvJiIgpwePi5v0MlcF2y8wUnpXM3MR3g4Z+k
         KCCXzo34Cq3qZ/6M2ycxV5NPqS0TbFFPpFhXidTFbH8+ihAaKO30hnYwqNvKnoEoUH2t
         kSZdltZ9xr0Va8j/8/FdQuHiyHbuJLdee1njNDaKW2At2DzVO1TZLdSto/tagEy1reu3
         N/VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlBjqHItwv/iTfABfn7X1uPbOyjW2faJ7hs2gswM958KfrJlWvpnPAAovD7rsbFbqaSBw0oak=@lists.infradead.org
X-Gm-Message-State: AOJu0YyY5DXkEBdDL1GGKyGNI/R0kIRCha1GODktPQdWJUSuq2fdtTCi
	mmSWA+G6LLnXh7APs9D7uLZDNYUMqaM72kTK+36eJEXXzBUXOgKATCQReBoIVdHgF/WRmB9a9Bu
	JCfbfI2DjyZaXXTcFdpNSWvvxby4t5ok+3jFYQdF2t1nFsdUyxiJuPnTQrBFhAtbvDELSIC0HBP
	g=
X-Gm-Gg: AY/fxX5QLr0z8VrWMHI/sTFADJH+RhrFtY0Kyx9aDPyOdAelIxvqkja4DAZFv8PKKMM
	Hu88vXh/PENfOOohsfF1QpHO737YLPCmCDq7RDpX2rv+m0TqdLdPyF3YdMkniqycLixP6qnC8/h
	P5XR6vCKo9c84LSlHQGdNaEiwMwWhY8dtr61/hgLvrskAGCAvkb3R3H/eeSMcyDlL9hhrodPYqf
	jUzM4O+ZX8zpnymK2MmNI35OdwFxvjb1Tj+vbNpsQaDaDwoCw/vUxu4uzqTCvW2YI6z4acVPeDH
	aywrlGx9pPVU2esw+Oa2Zwz3HoU16YcSh19sybTyLCKzIRvviI1w5fKXjoksxURfP3g2MuhjYL7
	wp0mLq9x4isxUYojDIizrdvEVXP8gwIlwHI5OQuY/E5lSZeHrJ/XiYO5cljZI5D8=
X-Received: by 2002:a17:902:f543:b0:2a1:10f6:3c1 with SMTP id d9443c01a7336-2a110f60540mr103365935ad.26.1766022914817;
        Wed, 17 Dec 2025 17:55:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH177bhFNjFnWpSYngylfEmZufcf0R7/t06C3AIQcL+52h/fq5RiUjFCICcoChSsdjzSVkkjA==
X-Received: by 2002:a17:902:f543:b0:2a1:10f6:3c1 with SMTP id d9443c01a7336-2a110f60540mr103365785ad.26.1766022914343;
        Wed, 17 Dec 2025 17:55:14 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:14 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:19 +0800
Subject: [PATCH ath-next 05/19] wifi: ath12k: refactor 320 MHz bandwidth
 support parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-5-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfXzuMXGVQ5yzFl
 ZoaZSYUHVSGf8Mr2sFU6QjLK9aA6QWp4nJ1XXmohCm6vMjCsXIILjkxnxBpaoyeaF6p0zyQyFNA
 xXueiDOMuIe1qm3SKzMHgAa32SKlH20VHvIC2fPYkMfSiIts5nHxr0iX6RKrjX+PmrquacqxI1c
 5J6OYWyYmMDEeCjwuThCTG9kxchwDUkRmPjSXpNV9va6vNYe2CtfSmP9pBsnwojfGOyrNKjCtgs
 mVPczJg1ZBshPvmklbyA/bnv7PWC1FW0ebJDUeOMtqxb8ZnbVqbtlip+7LhqApnJ+cLwq1esAnO
 tW+IzflJJr3Z3FCINw1wxwppMPvXnKiluKtznIHsaDz5/HqNDN0rgI+LLtUjL6c2AKMsGbTq9aG
 S3VPI0zjRXM+0rbRPhrzD2DsUQAO5A==
X-Proofpoint-GUID: -lc6-VjNW4Rw1FRgAbpsxIR_JFFcppnj
X-Proofpoint-ORIG-GUID: -lc6-VjNW4Rw1FRgAbpsxIR_JFFcppnj
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=69435f04 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iGNyLxvpPC8n4FyEg3QA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175517_281534_A290751B 
X-CRM114-Status: GOOD (  17.03  )
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
index ce2bbf6acb4a..dd643af892c2 100644
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


