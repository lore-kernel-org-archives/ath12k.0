Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64ADF34C63
	for <ath12k@archiver.kernel.org>; Mon, 13 Apr 2026 15:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7x7Sag3p1W6KTCAxlSilDkanjEO722npmlRKN1tRFNk=; b=PnnHKzJq+EorRoLpFjf4FVzPwJ
	yOAMls2MJXJgUYyELMNzo13g9aBwVD0/l/MuFe8nZsuIvNF8mIOkxKJgz+bDTq5Js4gV5hU2Hoy1v
	taFg/+NBcoG0xERvrAMiBMjyHpFL16+iQf5b3W9E5ewDuyIqGIlB///UIbJEMCl7GzSpZeLwL5M2T
	3ia/MI8X6pNiCCoysulkCoAc0bwAZuQOhmib9eQSsR2MuKXn07mclphCNa22jpQM/rbiL5I/67DN1
	5dhxdvTMZHrqaV6zzR2Wg5DW4r15L01sd+EqKlD3RtqJvDfxA6pxH4GmLZvgN5rX8MFhNWCaNsFiR
	uRI5SKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJO9-0000000Fz4k-1EKZ;
	Mon, 13 Apr 2026 15:39:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJO6-0000000Fz2J-2GSy
	for ath12k@lists.infradead.org;
	Mon, 13 Apr 2026 15:39:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DEJUPo3539565
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 15:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7x7Sag3p1W6
	KTCAxlSilDkanjEO722npmlRKN1tRFNk=; b=PrNtyvOFXbomcgRYqtxDSzmPRG6
	h/cW+qbX5cS0whZ1/fjMcE81C3P9yO7FjAPSjZu7FxFBoi/Ss34Pr3Gv1Qj0IDs2
	+EdD0RMtaMMBZ79b4mzJ3mXPSGsG9yXcgvcOPQwKqzEts/Pl1DZiocitT1/kRBlv
	PfiJ3UYNr4hj91pHTECtqX7DVGIbuOXzwyGWSNxLh0DprAeQPgT9bUkz8j/Zy3t5
	yZKFuIn25p2djdBi0fkObKGxdsdAESNALykBa6qqRR4auT8OVE26PMpKAydRXFmf
	j4aAmc1roP0aD6GJfqYdypnhiaFmSWEh4V8S+BYvchHt6B+/Zf9BOZyiO+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh258r8p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 15:39:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso4633452a91.0
        for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 08:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776094784; x=1776699584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7x7Sag3p1W6KTCAxlSilDkanjEO722npmlRKN1tRFNk=;
        b=GLI1BvdUHozAVN3OGFqPVFNOVLdiTcFfdfskYI9yru4TO6oSQ2t9rk0T4quis5DIP6
         IJreaFtIe+Fhn9zkbPcfpJYRnqwlehLviq/8v1qOYLTyK7OP06+ixmHe89juRZlT9/UK
         C5AMoeMQ6PzMH1/bjc9MbBlwBYuuPj/YsYFmc3f14PWExb/tuSF/Kj1kU+9hpFHc/F5w
         HiI6xhkta/MLuVn9VugSx25otdRVPZofqRFgLeavN+Ib9JgqmDorAW/Qc9JEtTCFtBYV
         rHTsASzRjfNd1ujKGyJy1p7izppeWsOsIdcNzCrGhNvqNQMemz8lUza0zLFoXXZPvv/v
         qpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776094784; x=1776699584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7x7Sag3p1W6KTCAxlSilDkanjEO722npmlRKN1tRFNk=;
        b=K96FqoH+UTRJtKlnZpRJDFtvG8sHUkjSe7QmMGuvOxt8m+HsgjJywbwS9pYpG0+AWn
         dryGtrtf02xJ/lXFsh91GVtSM3QClmSUojACGlk7Gwl7CCixVuxbcDXdid0w3ALS5RXD
         0Zk/yNJVvpX55JY5A4EgE19zy37e5JxmUHQhbk9x/UzYwb1gJjKs2YXQ0yz2+FklbAo9
         y9AmiXuFz+tbWJpGOMaYdPKZieTMUSTpr4eNcnW0Lw5wWm2PvUKJytdefpuMCOCKOjFq
         e1y8+25GIk3S6+CfkgYYWaKXKZOfI5hWMe0v+DKHdtR4GG32gDk1gx6wt2TMi3814Q1H
         YW+Q==
X-Gm-Message-State: AOJu0YxU9wfdBxcj/G+528rMElOiYvULqqQxxbJZAO1iELq2DXaUWu3D
	zRMmuuDTTkpZ8QrydwZVKeK0KtUvJmRtGo7l/iGqk6DRH4LbhH2bwQT9yhWeBJu9mRUEp+y8kLa
	nSwdEeQLDTBBqgQ6YX44+Isw9msisPWUNRUUlavNsXli6E8WZ8Ita884EFg8kxrTwRu3G3pNQ
X-Gm-Gg: AeBDies7r8vozMCGwoRnzKRM14JU5YfaaE1prE/ZiypJaDADsDZwxaGWp2ytUXeKhxK
	l9nqF7xidG3UliHLNOBdwjPLGV9bGps5Mghb6VHk+HLnypIauSFwOcbDyW42SMl6rrCKOAs5riJ
	4dRqh8dIkwE010cup6d1xzS/3t4I2DMIk6rjQR2jRB3IhpnePsp0JloG9P8eVgMkLE78dD1XrzW
	9g3ytY927UzRnkAji4ivMOz/zDIFZlVgebSuoibPwdNSj/hRNFvKd5nESpOMjavdW+N6CEUp4o4
	bzS75crkTxv8KWqomoPZfF+kOx1BMv12LkCKvHT2u2ktk58xSSIYFrOLyBZVOiIC9ebzP5igAVH
	CHCSP/e1cNwiyWvto7dSzhS8zZGv8+2WLi4ee2j2G1w4tmAJpgZFAdWN6iGqJBL1jUsSVNhhGq6
	rXEzGF5x1chmJmQughwx2vOZvgeQ/HRUM6wPOteTQ/rwAMGlu77bs=
X-Received: by 2002:a17:90b:3950:b0:35b:e4f8:7cc5 with SMTP id 98e67ed59e1d1-35e4284c7e0mr13321525a91.25.1776094784328;
        Mon, 13 Apr 2026 08:39:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3950:b0:35b:e4f8:7cc5 with SMTP id 98e67ed59e1d1-35e4284c7e0mr13321510a91.25.1776094783816;
        Mon, 13 Apr 2026 08:39:43 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e411ff4e1sm13000123a91.3.2026.04.13.08.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:39:43 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 3/5] wifi: ath12k: refactor per-radio thermal hwmon setup and cleanup
Date: Mon, 13 Apr 2026 21:08:38 +0530
Message-Id: <20260413153840.1969931-4-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qVotOyMsE8I4NKiSdayz5SGVks2RNyHE
X-Authority-Analysis: v=2.4 cv=Vo4Txe2n c=1 sm=1 tr=0 ts=69dd0e41 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9zPADYYpdTKIp-S0na4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: qVotOyMsE8I4NKiSdayz5SGVks2RNyHE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE1MyBTYWx0ZWRfX0HxpGKAFSQ4m
 soSLt/ei2LzJMTl2J6GQzKgZSyQT+SJpFN3kp/Ghzzb+HW0tHQg5U3SYKGxHAXUopL9xq40iTZt
 2ohMEtFJp+ZoDQe0pF2Twvwy7vMnkvsvk9BtrSOrYnguHh0zGr1qZoGKcb0xU1SCSJjdRCQACRV
 Dl6T3krdjvOiCgoVCVY4tnFD0gOpvfrRWuBqocv7e2MeMpBWTqfcwwr1mm8ckLVGlc52k2Dg/XT
 O5wRABsAdQhXSl6yUXwCwah7NVrQNqQomh1L1ztw6F3DHVo8Y+sGg46frhcvUI2IF9ptNLBiJyW
 Imwy8MSqGSrKf9/NdnBv7mRrrimck61qaGs9SLgYb9t7GvKdGzmB6qn19eOh/WsVBi0IbyafzEp
 drOrLVrik1Ppr83+pJqokgXlOzrFN+DKwB823gc4Hm3x2Y0BrB4cHYOlIjG0pZrPB0vju4u7aC1
 0lpmtY/nGfVgGxAbVvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_083946_704411_85EC5A8C 
X-CRM114-Status: GOOD (  16.76  )
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

Both the error path in thermal registration and the normal thermal unregister
path performed the same hwmon device unregistration and pointer cleanup.
Consolidate this logic into a single helper to reduce code duplication and ensure
consistent cleanup across all paths. Add a helper to set up the hwmon registration
during thermal registration to keep symmetry with thermal cleanup.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/thermal.c | 83 +++++++++++++----------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/thermal.c b/drivers/net/wireless/ath/ath12k/thermal.c
index 4f76622e8117..6f70c11c1098 100644
--- a/drivers/net/wireless/ath/ath12k/thermal.c
+++ b/drivers/net/wireless/ath/ath12k/thermal.c
@@ -130,59 +130,70 @@ static struct attribute *ath12k_hwmon_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ath12k_hwmon);
 
-int ath12k_thermal_register(struct ath12k_base *ab)
+static int ath12k_thermal_setup_radio(struct ath12k_base *ab, int i)
+{
+	struct ath12k *ar;
+	int ret;
+
+	ar = ab->pdevs[i].ar;
+	if (!ar)
+		return 0;
+
+	ar->thermal.hwmon_dev =
+		hwmon_device_register_with_groups(&ar->ah->hw->wiphy->dev,
+						  "ath12k_hwmon", ar,
+						  ath12k_hwmon_groups);
+	if (IS_ERR(ar->thermal.hwmon_dev)) {
+		ret = PTR_ERR(ar->thermal.hwmon_dev);
+		ar->thermal.hwmon_dev = NULL;
+		ath12k_err(ar->ab, "failed to register hwmon device: %d\n",
+			   ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ath12k_thermal_cleanup_radio(struct ath12k_base *ab, int i)
 {
 	struct ath12k *ar;
-	int i, j, ret;
+
+	ar = ab->pdevs[i].ar;
+	if (!ar)
+		return;
+
+	hwmon_device_unregister(ar->thermal.hwmon_dev);
+	ar->thermal.hwmon_dev = NULL;
+}
+
+int ath12k_thermal_register(struct ath12k_base *ab)
+{
+	int i, ret;
 
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return 0;
 
 	for (i = 0; i < ab->num_radios; i++) {
-		ar = ab->pdevs[i].ar;
-		if (!ar)
-			continue;
-
-		ar->thermal.hwmon_dev =
-			hwmon_device_register_with_groups(&ar->ah->hw->wiphy->dev,
-							  "ath12k_hwmon", ar,
-							  ath12k_hwmon_groups);
-		if (IS_ERR(ar->thermal.hwmon_dev)) {
-			ret = PTR_ERR(ar->thermal.hwmon_dev);
-			ar->thermal.hwmon_dev = NULL;
-			ath12k_err(ar->ab, "failed to register hwmon device: %d\n",
-				   ret);
-			for (j = i - 1; j >= 0; j--) {
-				ar = ab->pdevs[j].ar;
-				if (!ar)
-					continue;
-
-				hwmon_device_unregister(ar->thermal.hwmon_dev);
-				ar->thermal.hwmon_dev = NULL;
-			}
-			return ret;
-		}
+		ret = ath12k_thermal_setup_radio(ab, i);
+		if (ret)
+			goto out;
 	}
 
 	return 0;
+out:
+	for (i--; i >= 0; i--)
+		ath12k_thermal_cleanup_radio(ab, i);
+
+	return ret;
 }
 
 void ath12k_thermal_unregister(struct ath12k_base *ab)
 {
-	struct ath12k *ar;
 	int i;
 
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return;
 
-	for (i = 0; i < ab->num_radios; i++) {
-		ar = ab->pdevs[i].ar;
-		if (!ar)
-			continue;
-
-		if (ar->thermal.hwmon_dev) {
-			hwmon_device_unregister(ar->thermal.hwmon_dev);
-			ar->thermal.hwmon_dev = NULL;
-		}
-	}
+	for (i = 0; i < ab->num_radios; i++)
+		ath12k_thermal_cleanup_radio(ab, i);
 }
-- 
2.34.1


