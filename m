Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73CB109B479
	for <ath12k@archiver.kernel.org>; Tue, 31 Mar 2026 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXiHakN9Z7RGr+m11/kq2CxIF3O6rm9l4+o6TN0VXjw=; b=eKZUn2sl6g5a0AlOnklhxAcgly
	u/1iuAnMDh8E18XlsBMm4P0pb0ugAOk9/twpA2GCvONOmH6nHT1V4co8Goz32/2PUQBi/E2bzLpKX
	pFzMXwqKlRkhp3Rlo8EsBBcDLrSxoKKqoZTfInlNx4KLQuI0pkqejVBwmPub+3L7csN+kwq3uxvE2
	NTcSml1PCJIVVI2C91mUHc2uoGMgmlFKN7Nw5E9dN9JweaDGv2TUbS7MSlr+2bRECrvlx/P2DuKFq
	B5VZh2usbZvJcEJMlC3zqR2PimFaC4NXeh2csZdSuKE6Qo7U9Vm1WtyYG6/qYtJg5cpbfNkIWkDIK
	rUoCHbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1x-0000000D5V3-0hgj;
	Tue, 31 Mar 2026 14:25:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1q-0000000D5PY-02bM
	for ath12k@lists.infradead.org;
	Tue, 31 Mar 2026 14:25:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VDCw0u2465280
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EXiHakN9Z7R
	Gr+m11/kq2CxIF3O6rm9l4+o6TN0VXjw=; b=DmJbY5LTMQ7fz5QiD7YPotLi6PF
	DdUCbY1V96qd066yNeCP+GAGqJ+x8YIzXpo6C9JU2audWzeFh4wvlEcN0hR8YNDX
	PP6Umy245LkVNXrIXiU8oT/zEUhOWngc1zjiAZuGseLn/l4H4qZcNk9BHnf5mVEC
	HTDJOlSKUZ6oPqC1opeoX9l2hVmOkKeINcPmwFo3YOJSMkUtDu6tOTw2VxU5mB1S
	0pmTHKfz0crJNNnO+Kg4ZbFGaJi36shIv2oAXOhLJQ/Y/UleIMe6RViMp2j5/nFS
	Rlq43sjoPcu5kRds5ZlmRiehKQqFFmreooXDvwozVGCsiQSUMs3yaF72TuQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ut9sts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:25:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0cf396c45so53749495ad.1
        for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774967112; x=1775571912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXiHakN9Z7RGr+m11/kq2CxIF3O6rm9l4+o6TN0VXjw=;
        b=h+vKrGoBeCkkIOXtJ765fsS5MR02CQ7ZaCBvV9atbGHEjrIeaw5zeg9c4WCf5o9XxH
         kd2k/o8Kbvsx77/nmNTEl/FpgSrUZdoBf2Sl1FNLSym9qoXhMeSGgXZ5VkNRYT+34QZQ
         yvwH84dVFqVUPpsVQVk46bHIK6ezXaRJRtRxv8LnFCMXoPnWoGJlereEw6ZI9vLO+PbD
         yP4+Fv9r+bQ/HUMSTRgBKLJRJaHTVDbf4L4Exf8yT1mcbc7pchjmcpAP+WchDdEAJSUP
         IHJNDN2l6hJxpLLp+bxKme3VdgK0XCSh3EADqjq4DLMx9iVMnXREMh+9vaJEItP15VaZ
         6kSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774967112; x=1775571912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EXiHakN9Z7RGr+m11/kq2CxIF3O6rm9l4+o6TN0VXjw=;
        b=KOfIs+mPSEjnkL4E9W8c0c6Dn/Qtx40OdV4JGvfafHDGGG29+bK1d7SxVceuwH53MS
         4cUV0GXBBCXfI1UoiYcRnc4K46uvtwPvwKkHMKXS+NMfk8qjakOwois1KXamj0bx540w
         WxDN68hhX/UUsMcL4L/pWQD6fZvWdmJqU3cikNEjbg2zyNO1uHDSQAQ7c5N2yKqbZjuc
         TNfnM5veEn1bJ4tR2hn3UnNEw8QKwQYPyD73WZmL//m2dt/xwpefWCKhqK/tgnPyZQzX
         L+MLbodxF+9O/XrGGjQicsnl3J1yYq9PsxX+31hV47TiXTgqE7GSeg3SC4GSAnGgs/s0
         hXdg==
X-Gm-Message-State: AOJu0Yz314OpkHI2jRFzSE9HgSdfGlhqD1YkVBvx6da/iDUaptJhUAwG
	MFg1w9mLLWvTjNsgiugHDhdlxuC/PSugqRD8FFtQ9RegWG+WJyvqYQD34a/lXV5XnOMHpmQezhn
	CJGtc79zros6noCr/FjttSJMTSxnDFpaImiAFJFH2oncFIU/1SVsHmipl955hjaErYDlG6hLG
X-Gm-Gg: ATEYQzzQx7QhP5rKUy5TN890+qxLixVfOgwiWDnXBn7LHuzlnLMsUY1h7nWxhZoSHxO
	ngEIgkXxWRfYlhsx25/1K+taP9+ExnSikM8TWPj89JVtDA19D8E4fyD6pl3whK+c+KX9tjwNQNb
	at3POPKMKZ2bblgg4TA+tTA1JFnzQa8iTtZgsJWXEpxPbptRVbwxfUp/DJvgo8se6/jNhhFwRbf
	KCEApze1NTMy9vjgQMOZ3GmxHtm01vVfzyfNpVhR1MTxUws5e1O7Z42/1dH/ZBVBiVgbCaqE+HD
	b9y34RxgC47s/DviyGcSBkQoeFX2UweYGOmnYYDK5rQSsM+KU4wh16Z3nFIYbsws6DbbIFkfsh6
	V57kqllE536alQsUkU54aNO5+/6b5QrkKOKjCEJmyPhqR3/laKTg53gbgd3uSXZsF+Rb78yIBY7
	t1ZiTKN22QRYlfYGoVh+yP1tbPfC/o5iXq47jM9UzrYrCddaPKmsk=
X-Received: by 2002:a17:903:2405:b0:2b0:afbe:4e14 with SMTP id d9443c01a7336-2b0cdcf7f99mr161106945ad.40.1774967111867;
        Tue, 31 Mar 2026 07:25:11 -0700 (PDT)
X-Received: by 2002:a17:903:2405:b0:2b0:afbe:4e14 with SMTP id d9443c01a7336-2b0cdcf7f99mr161106495ad.40.1774967111332;
        Tue, 31 Mar 2026 07:25:11 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24276689asm112030225ad.38.2026.03.31.07.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:25:11 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next 4/5] wifi: ath12k: reorder group start/stop for safe thermal sysfs cleanup
Date: Tue, 31 Mar 2026 19:54:45 +0530
Message-Id: <20260331142446.2951809-5-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CJX6XMXx7DRc3ZsyjF1dAvkzJX6EqmwS
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cbd949 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2ln3ysbViG1LyOe46xYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: CJX6XMXx7DRc3ZsyjF1dAvkzJX6EqmwS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0MCBTYWx0ZWRfXwzgCx1/p21eR
 w1IxAwQMmy5xQ9G4esBzpGN4H5rWTNYcEmd+p54Vjjf4deUTiEpt4uJKPIcMLeD7S9vkIN6NMPR
 GmaRVA8SSk5bP3Kqau+uSSne6fIPbNLMWWot99j8PgBjPp5f+rs8SYWU305GlaDNsNuty78as6u
 m6Y6E1kZoNzrwa+p5W7uUU0g8+FqhRQlO0ZJ5MiU+bA13aY/RvEwpc/GxMDPsopTLz5fBOVvZQ/
 4+EFY0fZiqbKxBuzNeEdFYemsxn3kLDbbHPtif/Ql+CoEsiy99/1HNW9KjGaOtUIdR+IyxC9r73
 Cm9ORb1IG8Ztm7rHAL9cUqo8vjy+CnGp6VLbeNOx/zoYAfLDT7OS2fBrhHdCcAHdUlV3IYJJBtT
 kL1ckSqQUlb3JF37iSbc51JBCHHNKyc/t4mlMG86OE66I9vIwc34QFInrc633neeBVadxsGdNlD
 Xp6oLHu3A7Ess1asasQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_072516_914596_D6A684B0 
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

A later change adds thermal cooling device sysfs under the wiphy device kobject.
With the current teardown order, MAC/wiphy are unregistered before per-device
cleanup, so any subsequent thermal sysfs removal would run after the wiphy kobject
is gone. That ordering is asymmetric with setup and would risk kernfs issues during
removal.

This change also adjusts the position of ath12k_mac_mlo_teardown(). Previously
it ran before per-device cleanup/MAC unregister. MLO teardown issues WMI to teardown
multi-link state and is part of the MAC teardown sequence. Placing it alongside
MAC unregister (after per-device cleanup) preserves setup/teardown symmetry and
avoids racing with remaining netdev/wiphy state.

Reorder hw_group_stop() so per-device cleanup (including thermal/hwmon sysfs
removal) runs while the wiphy still exists. After per-device cleanup completes,
unregister the MAC (dropping wiphys), run ath12k_mac_mlo_teardown(), and finally
destroy the MAC. This mirrors the setup sequence and keeps sysfs cleanup safe
when introduced in a later patch.

To keep start/stop symmetry, add ath12k_core_device_setup() to encapsulate the
per-device bring-up steps (pdev create, IRQ enable, rfkill config) that were
previously open-coded in hw_group_start(). Use this helper in hw_group_start()
to match the existing per-device cleanup helper used by hw_group_stop().

Note that set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags) is now executed outside
the ab->core_lock critical section. The core_lock has not provided protection for
the REGISTERED flag, readers do not rely on core_lock for this bit, and the flag
is only toggled in the serialized group start/stop path using atomic bitops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 50 +++++++++++++++-----------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index c31c47fb5a73..d21db889794a 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1006,6 +1006,27 @@ static void ath12k_core_device_cleanup(struct ath12k_base *ab)
 	mutex_unlock(&ab->core_lock);
 }
 
+static int ath12k_core_device_setup(struct ath12k_base *ab)
+{
+	int ret;
+
+	guard(mutex)(&ab->core_lock);
+
+	ret = ath12k_core_pdev_create(ab);
+	if (ret) {
+		ath12k_err(ab, "failed to create pdev core %d\n", ret);
+		return ret;
+	}
+
+	ath12k_hif_irq_enable(ab);
+
+	ret = ath12k_core_rfkill_config(ab);
+	if (ret && ret != -EOPNOTSUPP)
+		return ret;
+
+	return 0;
+}
+
 static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
 {
 	struct ath12k_base *ab;
@@ -1015,10 +1036,6 @@ static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
 
 	clear_bit(ATH12K_GROUP_FLAG_REGISTERED, &ag->flags);
 
-	ath12k_mac_unregister(ag);
-
-	ath12k_mac_mlo_teardown(ag);
-
 	for (i = ag->num_devices - 1; i >= 0; i--) {
 		ab = ag->ab[i];
 		if (!ab)
@@ -1029,6 +1046,12 @@ static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
 		ath12k_core_device_cleanup(ab);
 	}
 
+	/* Unregister MAC (drops wiphys) only after per-device cleanup */
+	ath12k_mac_unregister(ag);
+
+	/* Teardown MLO state after MAC unregister for symmetry */
+	ath12k_mac_mlo_teardown(ag);
+
 	ath12k_mac_destroy(ag);
 }
 
@@ -1165,26 +1188,11 @@ static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
 		if (!ab)
 			continue;
 
-		mutex_lock(&ab->core_lock);
-
 		set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
 
-		ret = ath12k_core_pdev_create(ab);
-		if (ret) {
-			ath12k_err(ab, "failed to create pdev core %d\n", ret);
-			mutex_unlock(&ab->core_lock);
-			goto err;
-		}
-
-		ath12k_hif_irq_enable(ab);
-
-		ret = ath12k_core_rfkill_config(ab);
-		if (ret && ret != -EOPNOTSUPP) {
-			mutex_unlock(&ab->core_lock);
+		ret = ath12k_core_device_setup(ab);
+		if (ret)
 			goto err;
-		}
-
-		mutex_unlock(&ab->core_lock);
 	}
 
 	return 0;
-- 
2.34.1


