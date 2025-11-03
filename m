Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA327CCFA00
	for <ath12k@archiver.kernel.org>; Mon,  3 Nov 2025 02:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=St8TE2OHEhQyYwmvkJ5Xd48GZGKr1wvQZLaduJDmOAI=; b=bvTrZn72EDkYrhDc1qT55VQmQl
	1qsfu8Q7Fl/4MOcdZrrUA8dRYzgmM8nLpLQEkSufSgy8s9accPjSFmAFInT7Aj4e7qra+3brFr/46
	/Wt89+eDNFb9h0JDwsQ2zpreQGX2PF323MLGWvVGXJEa8AU129ZzjONwXCM6KTU1lziAiz9GJOxlY
	KZqgpezZ6GSP4sU73cTLHDMpkPInzXDOMo5U8GnpvrmmEPw04cLW+omWorDBlQ3t/a/+K6Gyos3Tb
	srCTpzOCE1gjUEI+0m+y1G8WnCZEQoBIrQve9XUxdwfh3HoilT3C9oAdFwUx/xwSS1FQ3clLEO28K
	uEJFZHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFkZX-000000094vc-1mpq;
	Mon, 03 Nov 2025 02:45:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFkZT-000000094ur-3CbG
	for ath12k@lists.infradead.org;
	Mon, 03 Nov 2025 02:45:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2LkBcn1345846
	for <ath12k@lists.infradead.org>; Mon, 3 Nov 2025 02:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=St8TE2OHEhQyYwmvkJ5Xd4
	8GZGKr1wvQZLaduJDmOAI=; b=ZGEiX191X3WSDkct2flOnE6onMKRdsnQTon+YU
	qaBqQ9G504MK7JvTAP04ZMYI/wkRmBem7YjBNsTxvEgZVOr7XTaNN6qxbjhzPwGz
	BaEzek2qAyEeND5Q65mIxpAr7rxR42MOQN91/lPQasUV7LD//qIX+3AUz5B2TusS
	BmfbfQuybBTgzFLNMtSx3mfPAnnOtirOmPyY4yr7saIz3+izmx1pH+HVsVAVGKs9
	tKqu/Zxbe+H+fO00aRz76svAjsexqXfVeYPjUEEKI2K9sGxHnbq7QSD8gxBwAvr0
	zxTykJrzGze+14aLbbkDKQjWMF9vbO7qRcOlhfOuP5Hezbog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57jn38xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Nov 2025 02:45:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2953deecdaeso52734965ad.2
        for <ath12k@lists.infradead.org>; Sun, 02 Nov 2025 18:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762137924; x=1762742724; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=St8TE2OHEhQyYwmvkJ5Xd48GZGKr1wvQZLaduJDmOAI=;
        b=MLo0W/Gz3exQOwz7JsKNgQjVDcx1w9f6HSc80sv8dEXCHl9ie/2orLpKRXlZV0DIMK
         DUar8yyQF2AOCFn5KrZBZQ0yuEJ7ACAFu1LiwxX2IG6Puq9Hw+a0GtEbQgZcIVGSX5jo
         YwZBDfPye+ijgIACf4hCZ8m+hLso38VeQAElua7xd8AB26kxxaO/Lfxg++fyVJ23p/vo
         lejAjTvFWVOduR1aKut953lCJU1CugVP2Oj1ATiWo2/5zql6KQqEcBfJWu9Y3swFpi+v
         imx+D+BJd/DwXWM8K+mTzFgs3rMSHuXjlztYxz1Lr1XEXtMmBlrGOriXGDqZUY0IU1CD
         vCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762137924; x=1762742724;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=St8TE2OHEhQyYwmvkJ5Xd48GZGKr1wvQZLaduJDmOAI=;
        b=W+wWckLpUlezthOKpMa8VzO3lVZEbniwbuXZNSYfJ1yAnQFcJtLV2vbv/5n5IWMpxM
         f5TNJp/tBnxzLswj9UiYx6QD5mORTkcKaMSRgV4K2BpIw1em1nJgve1DczB5gBve15F4
         jxu28LAO/ySrZT8Lw8jw3xrk3GI23tIJ1fgd0JMHx/XGQiZ4mh18C4IkxQAJJTJ71GKn
         +fj6eU/S2MsI+LeH7p2DY6fBlBREiFape5EaoKJs5VcrM/zoURDoNyNt4wVuQmJifmxF
         OH7aKaH5jYe0WEixzjP9ZeQ5fhkbstAj8pQucxedqNLjb1vYWDOuW1MNod7i606cueJo
         zxfA==
X-Forwarded-Encrypted: i=1; AJvYcCWtqIpzF0F5TaH1rmO2g7gaLaxeXUOH9PkvSOQJRoMxHYCC7rXQC1KTasu+VazICW7o4AkAr6I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWIyok2BAGWy4cGejUd+fFGmeF0aa5SVzHJIgDRq3DsbcmCAN1
	La8aX1SnOQBFfjritEh2adPWxnqygck49TAHm7KR8BKBQgFkd8DBEaYMM1U7X7jnNVWd2/H6ShU
	LjUShd1LMXkNPOWz0OzXMiw/lfcW3h1UqM3pikIIsqP/CvSAnlYm+NTvCoGIToYNKXW2Y0pus8n
	4=
X-Gm-Gg: ASbGncuuqNSUqzTWRKnE8v1NqrPjQmt3Os9dP1l7BiiFNwALcmpr0k523/7fjanKhi/
	5YO/OJGTkaGJWsOseGVn7kp7D4eiGSzwzVnyihIHahjtOgB4dtFP+XxUszHNYS7gdaQZzuFg8gH
	6sF1dVA8cqNyWj+nMThIErnW9G9S75X5YElJJq0AE48ocm22k9/7czrLW4oNxqPefPhI27xxQM3
	414GYtOD9ZbbZcBjy9XmdmGS70/OI70KULR1pzFTGLUG9ICNqy7T8YyFmKQANkahZrgDwlkWcqh
	OCocWF2SNYVmAlDpQ3kwsRtlP8OaO9DeJ6yCdC+mZY470PToyJwQizy/+ukZ2A+uJLCiYs/Zj33
	dJXS1yFW87WBv4s/dVj2X5846JdrPBmSWHkQFlS9gbswm7ovcd3cC
X-Received: by 2002:a17:902:ea06:b0:28d:18d3:46ca with SMTP id d9443c01a7336-2951a5449aemr134563215ad.49.1762137923744;
        Sun, 02 Nov 2025 18:45:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnqS0lDCyYdmp1X/MWQ5lHj0npVE6nLXW+QGXfUcuIxpZz6RlxM8UYVjLshPY8NExVC2fDsQ==
X-Received: by 2002:a17:902:ea06:b0:28d:18d3:46ca with SMTP id d9443c01a7336-2951a5449aemr134563055ad.49.1762137923221;
        Sun, 02 Nov 2025 18:45:23 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8c8cdc0sm8746759a12.13.2025.11.02.18.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 18:45:22 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 10:44:49 +0800
Subject: [PATCH ath-next] wifi: ath12k: do WoW offloads only on primary
 link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-ath12-primary-link-wow-v1-1-3cf523dc09f0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACEXCGkC/x3MQQqDMBBA0avIrDvgJKkVr1K6iDrWQY0ykaqId
 zd0+RfvnxBZhSNU2QnKP4kyhxT0yKDpffgySpsaTG6eRLlFv/ZkcFGZvB44ShhwmzesHRcluVf
 ROQsJL8qd7P/xG5LBwPsKn+u6ASArxJdyAAAA
X-Change-ID: 20251103-ath12-primary-link-wow-b4e681476f43
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=StidKfO0 c=1 sm=1 tr=0 ts=69081744 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LP1QxI6-xhCX3emMPfsA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: JaegtTiv46A5GANsyx4pNJrTp0pxh5ZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDAyMiBTYWx0ZWRfX7UN6ya35/mFM
 +9sWE3hgaQ1j/fmpqepdroGbqaylpRHu1ZayGi8eAFEZSdDcuSt/A05V1QYhMfx5oWs97+PUPNG
 m3gjHfhGEhhmjgtwQTpal6aVopXjH9iCDKLAHQz2FNsf5c8GPyFrn/g7EFaG+Dl17lk/q1lE1JZ
 Ea8tPRARSIRIkowUAG9diY7qKanZM/xKwKq9Eo1r+1tMQw4oPVoE/5UNI2CO/LXSj21DK42xx9t
 XdO2w1EW7F5v6Lev/8A5NFeouRwOthNf++j0yGN4HDrDDx7qiHMzkRI5X8tWrAI+VGV6N6zq0PI
 Gh5QNpSTzGCHUP+/yBZaNdl8NhJuN7nSgXiX5+wykhYyf2TN80rpK2YtPTTT4SjsVk4VSpdLijm
 f7HJjBcpKN7WwcVu9M0C34waodS8Lw==
X-Proofpoint-ORIG-GUID: JaegtTiv46A5GANsyx4pNJrTp0pxh5ZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_184527_943584_B07C9626 
X-CRM114-Status: GOOD (  14.25  )
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

In case of multi-link connection, WCN7850 firmware crashes due to WoW
offloads enabled on both primary and secondary links.

Change to do it only on primary link to fix it.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: 32f7b19668bd ("wifi: ath12k: support MLO as well if single_chip_mlo_support flag is set")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wow.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
index e8481626f194040cf0728597272801dfd1f8fda4..6448378d85141c5a77c55565ccff1908014e2005 100644
--- a/drivers/net/wireless/ath/ath12k/wow.c
+++ b/drivers/net/wireless/ath/ath12k/wow.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/delay.h>
@@ -135,6 +135,9 @@ static int ath12k_wow_cleanup(struct ath12k *ar)
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
 	list_for_each_entry(arvif, &ar->arvifs, list) {
+		if (arvif != &arvif->ahvif->deflink)
+			continue;
+
 		ret = ath12k_wow_vif_cleanup(arvif);
 		if (ret) {
 			ath12k_warn(ar->ab, "failed to clean wow wakeups on vdev %i: %d\n",
@@ -479,8 +482,12 @@ static int ath12k_wow_set_wakeups(struct ath12k *ar,
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
 	list_for_each_entry(arvif, &ar->arvifs, list) {
+		if (arvif != &arvif->ahvif->deflink)
+			continue;
+
 		if (ath12k_wow_is_p2p_vdev(arvif->ahvif))
 			continue;
+
 		ret = ath12k_wow_vif_set_wakeups(arvif, wowlan);
 		if (ret) {
 			ath12k_warn(ar->ab, "failed to set wow wakeups on vdev %i: %d\n",
@@ -538,6 +545,9 @@ static int ath12k_wow_nlo_cleanup(struct ath12k *ar)
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
 	list_for_each_entry(arvif, &ar->arvifs, list) {
+		if (arvif != &arvif->ahvif->deflink)
+			continue;
+
 		if (ath12k_wow_is_p2p_vdev(arvif->ahvif))
 			continue;
 
@@ -745,6 +755,9 @@ static int ath12k_wow_arp_ns_offload(struct ath12k *ar, bool enable)
 	list_for_each_entry(arvif, &ar->arvifs, list) {
 		ahvif = arvif->ahvif;
 
+		if (arvif != &ahvif->deflink)
+			continue;
+
 		if (ahvif->vdev_type != WMI_VDEV_TYPE_STA)
 			continue;
 
@@ -776,6 +789,9 @@ static int ath12k_gtk_rekey_offload(struct ath12k *ar, bool enable)
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
 	list_for_each_entry(arvif, &ar->arvifs, list) {
+		if (arvif != &arvif->ahvif->deflink)
+			continue;
+
 		if (arvif->ahvif->vdev_type != WMI_VDEV_TYPE_STA ||
 		    !arvif->is_up ||
 		    !arvif->rekey_data.enable_offload)

---
base-commit: 6a5812e1623723adb18e6217d512274ef0d84015
change-id: 20251103-ath12-primary-link-wow-b4e681476f43

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


