Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBDBCCF9E3
	for <ath12k@archiver.kernel.org>; Fri, 24 Oct 2025 00:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cimsIyyYXBmnXwZwQUw2yhM/mZ0nyhp+xX2NvUPnJN0=; b=kMj75Et5DAgjhOjFm6g63xWxmD
	Uf1YGfZP4q1wiLOv/O9nDIi5aCQHIiJnoRx801K8sRqo7OXavpS7/9LFhXx5D1OBLOyATwnGJWeoa
	Lsd5OG1wUwifNef3OOynxhUIo+mUPxe3LWvMGathoVUpump4RiZz8ycshzhUFepM1WkKcb5HA8Np9
	dEEPYYp82Hx5ShsurbsYt/uufoa6WiE2Y2AkwajO07RN+K4lTZDntx1WIw5o19nBWdHOX9iplg/nz
	11cvNDQwZ+2JGnqIhIu3Bs1d4jILCAU44aqfVvTWhdcq+uxemFjpliBo8QxLfzax0zvuPy8Ogu7tA
	Rd9zr33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Wz-00000007tUA-2PQk;
	Fri, 24 Oct 2025 00:19:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Wy-00000007tT5-2z7s
	for ath12k@bombadil.infradead.org;
	Fri, 24 Oct 2025 00:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cimsIyyYXBmnXwZwQUw2yhM/mZ0nyhp+xX2NvUPnJN0=; b=nkkFn6iRz93GQO7XeL+f7oNmgs
	2v1TLL2QxO8AH4PuMUvCdHJT35m+SHG6Ame3wedAJQygLeAC+JzjkupVRQcVeHC4D9dcnmWBON0OP
	EtPs6j6rpoHjZLv4ANSCF30DvLVLDOfsAe5v6Cn+sN6PU5tYvUkIn9c4Fj72swDXeXXAp+Gcts0Ei
	QVGVSDIHYYNs6mAGJnrZ22WAzlBTRA1vIs3cwpQAaUk4ZTQFDniI9W3XJPsUBCzx6qzBWiMNokXOI
	GcsJL/bmslJBG3lhQctEnw17rOeeNZFLEl2bSr5XT1gFU26YHqTMlkmtbNJtYxjFkkG6f8XiqzJOv
	1l5uNekQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC4fG-00000001sdM-3KfZ
	for ath12k@lists.infradead.org;
	Thu, 23 Oct 2025 23:24:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEVJei004632
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cimsIyyYXBm
	nXwZwQUw2yhM/mZ0nyhp+xX2NvUPnJN0=; b=MyL6RLHbW/ya9CPnxX2TH2NgpY/
	rpE5nWb+DXUd2qBBSEXxfw+Pznjg1gwwH0QMq8HNrCXccJG8L+u6PPvvHd22CuAk
	urJORCfg4+4jdcoeq9hewT1RL2jyl5Gg3HZsgXbsGXM4M3zlVWQDN7lunILMsgnB
	ATPM/7l+uQwmTlW/dBdqqZsJQve1YI0FUtj7hqaGN71tDhHBppWKmIn6ZWmjul/F
	FjdsHaSKkvYXF/kBizDTb1L+CsCDzowqO40IUjPx23MNIWlWaILwlaTXlHkUf91s
	dahQGGwZaQHkqjC82rzIEfLg/v+VI7u0tpN+6my5cGvmF6rbBm4akAYkwnA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49yp6k1h8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471737e673so2060793a12.1
        for <ath12k@lists.infradead.org>; Thu, 23 Oct 2025 17:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761265175; x=1761869975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cimsIyyYXBmnXwZwQUw2yhM/mZ0nyhp+xX2NvUPnJN0=;
        b=WTmyRB0COTE0gkh4qBvaAbktz5fvx6b2IM8gbP71oHStyKRj4/QDMTaeQWjqs17b/2
         I5fOAIvPbWWfxBDDRKgJR6pHRsxSRYD8KkTJ3AVwBu5q01WwfQ+LrUq+nX8h0X2jZoLw
         tYmNpKaKmYkmhbqC8ulViD7sOmrdcsysvj3Cj5t3TRF5f1RnhD/8OuH+0s9aq/n32eXt
         HFl/99ogeZ+IvQMHFOBd8jcpPh5UM5bNK0kK7ryUgxbPAxZBzU0erNN+ozjGiH3o6DX7
         9A/o8OqWPqyS1QRqspRTZvZBtkwxmAvRf6AO18rDIdd8ZZZrtn3mmwk8t67bHKiBorxR
         TRRg==
X-Gm-Message-State: AOJu0YzB9uBdpYT1MNjgiWZu10UPPk8sWrVc2a7/NGK6eAXDWjlDwcnF
	+f6wNTGWcM1ne0geJCpg5XQRnJUQ979H+7BjtZwPP9NNieGIKrNvLzHPQ7K4g5vg7DGa+ysPtD1
	sngN69gtTuMZw5ngCVhCdnec9ap5bly5pl9Rr+yPnmW5sKQ2PKPHh1j8FwWPKvuwRnpbdGs+o
X-Gm-Gg: ASbGnctFNrhyEuTb9bD/hEbpYLj5Qdl2KCYt94PTVyLPExI0mDqC4eD9v4pv9T2H3rR
	tM8seePxRTuFxOrr0bgE8qf8h0IdMsQpIqH0vIuAmRuUt5HRLUWwXu45Y0b3a8sQPflftfTbaak
	PPu0bCU3Jr/hUpX11Mz30yoAQDef2h8LoY9Gudk1VqFnPI0fdiqbZ/mpCy+wmnwmR7LQt8ktD1G
	myh4Ms7QMOv5jcDsZwUoDIEU5dkxvIWoADJGtB3gFa4mvUA15erTv451FS1Ff67xTTzY+z/xgNX
	YkjoTc6rh44b6ItTX8qa36Gu0ZSq3Ox6PPDGYnGVGYlsbgFijUZoRtfN9K1DnPGeAz2VzSq83k3
	WGPdDyGtdT7e5TzN8RSLvYHehwKK39QIZgNBdKtzj3wU7uFazYYgehVk=
X-Received: by 2002:a05:6a21:3397:b0:33d:7c46:c4ed with SMTP id adf61e73a8af0-33d7c46c5bemr2159435637.53.1761265175544;
        Thu, 23 Oct 2025 17:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmXxr/9MA2sTRhVUBKY7trMwmIeVyL70IQbWUGvwfl3KeT2SpD/BHggDjAMI06M8uizDfeVg==
X-Received: by 2002:a05:6a21:3397:b0:33d:7c46:c4ed with SMTP id adf61e73a8af0-33d7c46c5bemr2159404637.53.1761265175021;
        Thu, 23 Oct 2025 17:19:35 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb65b3sm3296264a12.8.2025.10.23.17.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 17:19:34 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <muna.sinada@oss.qualcomm.com>
Subject: [PATCH ath-next 1/6] wifi: ath12k: generalize GI and LTF fixed rate functions
Date: Thu, 23 Oct 2025 17:19:23 -0700
Message-Id: <20251024001928.257356-2-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
References: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEzMSBTYWx0ZWRfX2jEIqz7tX/T6
 3uYvR7uLCffrZDen+UIXi/LPnkn8O4JnHxQdO+YRHYUDJkulDLbHRj1WaEWHNVXPW2Uzwf3vfiH
 O+tqD7f2nKtcsWYdYLrVkhVssq+sp4I07UsN2IOsvJl33jExypUehMUBS5t3Wft4Ja2ysHRpNrl
 8lg6H9URMkcqe1XcNlbG/N4MlT+HW1ya8iNc/bfNTsyWB6//kY2XpKuVmvRgUA3Xjm89zoKVkbN
 LJf2W92DyTjeNF3e/l4K6rhgCUW61Z/nE82PPGMyzsIN5KCS8QmUsiNRr2dMBA913i9ZwLgDtl7
 AB+lQcTHElb9TasRX/0N0OhsEquwfYlU8z+a71C+bkvPp3rytG4G4WDTnEKIIuR5BEdzTps47+p
 +sUilD1MyiHOfpLRYKK+5FRUjc2ukQ==
X-Proofpoint-GUID: -4h7P24gqqohnU43_JrbYSHc22k3q4Pm
X-Authority-Analysis: v=2.4 cv=bL8b4f+Z c=1 sm=1 tr=0 ts=68fac618 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=X7-uiFLsf3CQ3n4UTk4A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: -4h7P24gqqohnU43_JrbYSHc22k3q4Pm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_002415_366722_EFDB5973 
X-CRM114-Status: GOOD (  18.93  )
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

Currently, functions in mac.c for setting GI and LTF rates are
specifically for HE rates.

Remove any mention of "HE" in such functions in order to allow for
other modes to utilize the functions. The intention is to prepare for
the addition of EHT GI and LTF fixed rate settings.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 77 ++++++++++++++-------------
 drivers/net/wireless/ath/ath12k/mac.h | 14 ++++-
 drivers/net/wireless/ath/ath12k/wmi.h | 12 ++---
 3 files changed, 60 insertions(+), 43 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d7bc19cea2a6..fd49a0953470 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12043,55 +12043,57 @@ ath12k_mac_get_single_legacy_rate(struct ath12k *ar,
 }
 
 static int
-ath12k_mac_set_fixed_rate_gi_ltf(struct ath12k_link_vif *arvif, u8 he_gi, u8 he_ltf)
+ath12k_mac_set_fixed_rate_gi_ltf(struct ath12k_link_vif *arvif, u8 gi, u8 ltf)
 {
 	struct ath12k *ar = arvif->ar;
-	int ret;
+	int param, ret;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
 	/* 0.8 = 0, 1.6 = 2 and 3.2 = 3. */
-	if (he_gi && he_gi != 0xFF)
-		he_gi += 1;
+	if (gi && gi != 0xFF)
+		gi += 1;
 
 	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
-					    WMI_VDEV_PARAM_SGI, he_gi);
+					    WMI_VDEV_PARAM_SGI, gi);
 	if (ret) {
-		ath12k_warn(ar->ab, "failed to set HE GI:%d, error:%d\n",
-			    he_gi, ret);
+		ath12k_warn(ar->ab, "failed to set GI:%d, error:%d\n",
+			    gi, ret);
 		return ret;
 	}
 	/* start from 1 */
-	if (he_ltf != 0xFF)
-		he_ltf += 1;
+	if (ltf != 0xFF)
+		ltf += 1;
+
+	param = WMI_VDEV_PARAM_HE_LTF;
 
 	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
-					    WMI_VDEV_PARAM_HE_LTF, he_ltf);
+					    param, ltf);
 	if (ret) {
-		ath12k_warn(ar->ab, "failed to set HE LTF:%d, error:%d\n",
-			    he_ltf, ret);
+		ath12k_warn(ar->ab, "failed to set LTF:%d, error:%d\n",
+			    ltf, ret);
 		return ret;
 	}
 	return 0;
 }
 
 static int
-ath12k_mac_set_auto_rate_gi_ltf(struct ath12k_link_vif *arvif, u16 he_gi, u8 he_ltf)
+ath12k_mac_set_auto_rate_gi_ltf(struct ath12k_link_vif *arvif, u16 gi, u8 ltf)
 {
 	struct ath12k *ar = arvif->ar;
 	int ret;
-	u32 he_ar_gi_ltf;
+	u32 ar_gi_ltf;
 
-	if (he_gi != 0xFF) {
-		switch (he_gi) {
-		case NL80211_RATE_INFO_HE_GI_0_8:
-			he_gi = WMI_AUTORATE_800NS_GI;
+	if (gi != 0xFF) {
+		switch (gi) {
+		case ATH12K_RATE_INFO_GI_0_8:
+			gi = WMI_AUTORATE_800NS_GI;
 			break;
-		case NL80211_RATE_INFO_HE_GI_1_6:
-			he_gi = WMI_AUTORATE_1600NS_GI;
+		case ATH12K_RATE_INFO_GI_1_6:
+			gi = WMI_AUTORATE_1600NS_GI;
 			break;
-		case NL80211_RATE_INFO_HE_GI_3_2:
-			he_gi = WMI_AUTORATE_3200NS_GI;
+		case ATH12K_RATE_INFO_GI_3_2:
+			gi = WMI_AUTORATE_3200NS_GI;
 			break;
 		default:
 			ath12k_warn(ar->ab, "Invalid GI\n");
@@ -12099,16 +12101,16 @@ ath12k_mac_set_auto_rate_gi_ltf(struct ath12k_link_vif *arvif, u16 he_gi, u8 he_
 		}
 	}
 
-	if (he_ltf != 0xFF) {
-		switch (he_ltf) {
-		case NL80211_RATE_INFO_HE_1XLTF:
-			he_ltf = WMI_HE_AUTORATE_LTF_1X;
+	if (ltf != 0xFF) {
+		switch (ltf) {
+		case ATH12K_RATE_INFO_1XLTF:
+			ltf = WMI_AUTORATE_LTF_1X;
 			break;
-		case NL80211_RATE_INFO_HE_2XLTF:
-			he_ltf = WMI_HE_AUTORATE_LTF_2X;
+		case ATH12K_RATE_INFO_2XLTF:
+			ltf = WMI_AUTORATE_LTF_2X;
 			break;
-		case NL80211_RATE_INFO_HE_4XLTF:
-			he_ltf = WMI_HE_AUTORATE_LTF_4X;
+		case ATH12K_RATE_INFO_4XLTF:
+			ltf = WMI_AUTORATE_LTF_4X;
 			break;
 		default:
 			ath12k_warn(ar->ab, "Invalid LTF\n");
@@ -12116,15 +12118,15 @@ ath12k_mac_set_auto_rate_gi_ltf(struct ath12k_link_vif *arvif, u16 he_gi, u8 he_
 		}
 	}
 
-	he_ar_gi_ltf = he_gi | he_ltf;
+	ar_gi_ltf = gi | ltf;
 
 	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
 					    WMI_VDEV_PARAM_AUTORATE_MISC_CFG,
-					    he_ar_gi_ltf);
+					    ar_gi_ltf);
 	if (ret) {
 		ath12k_warn(ar->ab,
-			    "failed to set HE autorate GI:%u, LTF:%u params, error:%d\n",
-			    he_gi, he_ltf, ret);
+			    "failed to set autorate GI:%u, LTF:%u params, error:%d\n",
+			    gi, ltf, ret);
 		return ret;
 	}
 
@@ -12149,10 +12151,10 @@ static int ath12k_mac_set_rate_params(struct ath12k_link_vif *arvif,
 {
 	struct ieee80211_bss_conf *link_conf;
 	struct ath12k *ar = arvif->ar;
+	bool he_support, gi_ltf_set = false;
 	u32 vdev_param;
 	u32 param_value;
 	int ret;
-	bool he_support;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -12206,7 +12208,10 @@ static int ath12k_mac_set_rate_params(struct ath12k_link_vif *arvif,
 			ret = ath12k_mac_set_auto_rate_gi_ltf(arvif, he_gi, he_ltf);
 		if (ret)
 			return ret;
-	} else {
+		gi_ltf_set = true;
+	}
+
+	if (!gi_ltf_set) {
 		vdev_param = WMI_VDEV_PARAM_SGI;
 		param_value = ath12k_mac_nlgi_to_wmigi(sgi);
 		ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index c05af40bd7a2..1f689e367c8a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_MAC_H
@@ -84,6 +84,18 @@ enum ath12k_supported_bw {
 	ATH12K_BW_320   = 4,
 };
 
+enum ath12k_gi {
+	ATH12K_RATE_INFO_GI_0_8,
+	ATH12K_RATE_INFO_GI_1_6,
+	ATH12K_RATE_INFO_GI_3_2,
+};
+
+enum ath12k_ltf {
+	ATH12K_RATE_INFO_1XLTF,
+	ATH12K_RATE_INFO_2XLTF,
+	ATH12K_RATE_INFO_4XLTF,
+};
+
 struct ath12k_mac_get_any_chanctx_conf_arg {
 	struct ath12k *ar;
 	struct ieee80211_chanctx_conf *chanctx_conf;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 64bd968989c8..01b2a865f103 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -223,15 +223,15 @@ enum WMI_HOST_WLAN_BAND {
 };
 
 /* Parameters used for WMI_VDEV_PARAM_AUTORATE_MISC_CFG command.
- * Used only for HE auto rate mode.
+ * Used for HE and EHT auto rate mode.
  */
 enum {
-	/* HE LTF related configuration */
-	WMI_HE_AUTORATE_LTF_1X = BIT(0),
-	WMI_HE_AUTORATE_LTF_2X = BIT(1),
-	WMI_HE_AUTORATE_LTF_4X = BIT(2),
+	/* LTF related configuration */
+	WMI_AUTORATE_LTF_1X = BIT(0),
+	WMI_AUTORATE_LTF_2X = BIT(1),
+	WMI_AUTORATE_LTF_4X = BIT(2),
 
-	/* HE GI related configuration */
+	/* GI related configuration */
 	WMI_AUTORATE_400NS_GI = BIT(8),
 	WMI_AUTORATE_800NS_GI = BIT(9),
 	WMI_AUTORATE_1600NS_GI = BIT(10),
-- 
2.34.1


