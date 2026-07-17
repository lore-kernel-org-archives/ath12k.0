Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72EAC4450A
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 01:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lgYtWm8u7UuQscHOeb+mbfETys0daizIPafnM922E4M=; b=NbhKd8shaZ9UbNdZtIowJ5TxDn
	LswWvTlAGKdx1uImJUAeNuyuFn+K1foYwC3vtXIFYTpVLrWXEvUSs/m5AuM3kMp12rl3TUrikk0nK
	/d1eV5nfrMIrn7Sz6dHGqJKG3gnhu7jl8tDGN/zAbDA9+tZslK9xyesRagE1x8YW5ucws3KYjzNwK
	+F0F1qx9g6KuZviUwauMzRuyomAPdWRcKsID/MiJPYKKwIU25wHUG1k7gBPqI0XZG5EGAKfhmtTWb
	t2O0VtEygBwHfaRGTa0TKBaguaV/0mI/n/pjdrzBQIOfzT32qVBps6MZIRqstrfen3p7tlkqfZ5j4
	tPyszARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXbd-00000000uz8-1qRQ;
	Fri, 17 Jul 2026 01:43:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXba-00000000uyg-3kEG
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 01:43:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNICOJ092734
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 01:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lgYtWm8u7UuQscHOeb+mbfETys0daizIPaf
	nM922E4M=; b=jlh4gPsrLWIhH0ukZ6RWhPa5x0Qu3EZeqSTMRLTf7bJlxkdhE8O
	RplMDymr+kECc27DwCL5AzcjxjrilfOXo5D0JeXWYeKegca+ogaKDZEKOTnDSdIl
	MjCkqIh1DEbQaANScv+KBg9qqkxY9Pc/pqGKwSDJzUA5V4C88JCot+2bTFVxPD1j
	oW0Owm3SisZPsTnDnnyd8ixlsosGqgBtwuYqjRmumDQFxRDNAjH34aMzCiHsPxET
	CppzoSIfx+wUTPtfF7/LT2IBBcn1DZU8zNCbqU9CDVuLqmyJ9B5mymgntBfC2XwB
	kVnpHTKuDHxu2hk5JnshYJbPDPl93dfTqJQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u81g39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 01:43:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so770754a91.0
        for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 18:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784252588; x=1784857388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lgYtWm8u7UuQscHOeb+mbfETys0daizIPafnM922E4M=;
        b=MCXuawWxCUIrO8rsEvPWHEIXz8MGa8WwUn3c1f3EvDTUgdOo2FMeacw266NOkTcHK9
         89TxDMmyYeI5NKrWjDrKwCavKkTnAP+9LbXLWo3rmsikkaUWjITEbODBwq1SrK3jVcMJ
         hASq2Anw9a9rIjrqRoLk/UC8dOT5ZLWYzN4hWFKjcLWAIRq9uhLI5zSMWrrY2y9Hbf6h
         qxT+NEqLkU8MoRVCc95BN7eKlWD8TsOQBMVII4SQRHex7todRFmYnRA0y8D0VANaoi/3
         xBafpl59uHMhWoX62FjW63yu/M2n3ahUeHD0WaZeokGq6J75XfhsOQ11aJrig+81RiC8
         Q1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784252588; x=1784857388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgYtWm8u7UuQscHOeb+mbfETys0daizIPafnM922E4M=;
        b=soVYHFPytiwBugnft1xphxW1Tip90gM0kq7zWnxtyJHPTIuG9lsNmyvMBltEpf4654
         PCM6w4Jw4jEj8EV036f/hmTJXBIu9VR+XK8E9+IgCmuj82DFxEoQuMH/Mg+7e2/pu3De
         4TzB+VAGOeF8S37V6cAOeYB9I/bLixWj0Q4IAhSZcLNMUmMD1BUqtuyKYXWMJ+3KHwYa
         SekXStRr2MwF+UXpqR8UmTveWskjPFfj19PKfPBRdjrCQsBlmQGiF/UkLMA4LDqSUYPF
         Fw6FmKONAwhpzu/vCUENzT/oJGgBzFtmTmOT2ypORAt3nTkUavC9rH9+HCjZCy4NoW2E
         ehZw==
X-Gm-Message-State: AOJu0YwPBjZhUAaCa0IAyYxK9X/ErBUYKUDXNlIGRXSoKLVMwKWL89qR
	RGX7Olc8O5MXPb0seJo2dggr3e2QEMWFKxfJmOEuWLz8pNUp1g+1IX9ncMjrJ4YuLJoHNxSYqPs
	zlbrYE6rvBk5jLW/X1zWWEy/yUUTGbDm6lag9phvQX8avIBR/ZgHvsA6EHuV4ZJq6
X-Gm-Gg: AfdE7clJp8vy/Hwx7uUbkf7+zYh2TR5zNSJTaNtQz3YGu3u5M1z5L2l4Vpda4tAUoGQ
	JKMyg2jMRk15KbBAbI6Q7S3EDEIZR0GqX2qA3Qhel1ua2h8rrwlts9H98FYbMmYG3TfEoLwJvqk
	JI0aR8pKSQfKIa+ynQ2GHd43KD/r6oemp5Wjs9IJNn6YzxRrjP/Mav3e7Q0UPCP0Q3YcMSE8uRz
	kwyzYmuX8r5WK2S44G6Hk/iUfcBaO8x4nxDu0UWjJoQkqLWWzAUA8qGuwFv0rJDJJzwQx/vaT7P
	9suqkbi95M4skv5HL9/mFI+4yreKnwBie2Uqs46jiuyJpTdtbkvKliSq2l8uVW49JsR6bTuBKMO
	l/88zyVG2ECDoZKL+wyrTTOd2ZIZfh8tB
X-Received: by 2002:a05:6a20:729f:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3c38d8cffa8mr6107711637.5.1784252588138;
        Thu, 16 Jul 2026 18:43:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:729f:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3c38d8cffa8mr6107686637.5.1784252587696;
        Thu, 16 Jul 2026 18:43:07 -0700 (PDT)
Received: from hu-daizhuan-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429ff04absm898423eec.8.2026.07.16.18.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 18:43:06 -0700 (PDT)
From: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, daizhuang.bai@oss.qualcomm.com
Subject: [PATCH ath-next] wifi: ath12k: Set DTIM policy to stick mode for station interface
Date: Fri, 17 Jul 2026 07:13:02 +0530
Message-ID: <20260717014302.284034-1-daizhuang.bai@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAxNCBTYWx0ZWRfX4RVEn7TJuoCi
 2mRqKPy3BTIvsDJYIPVe8Nmo+l4i21tOFgl4Kh2utVR9aoxs76Jmkj9ZeSexwEjHEeQb0qGi0r9
 brhdf0phpJqCWRQgpMbdN+wDo2XmsFyHd6YfOrtqnEwMefezVVIHcujBGITcHm+5j+WPvuzi2Ht
 zccbE74hiSJwReUJwUlJaXdOpNEiRjAvQIgkUpDnPmZqqOCuAQxESXpSJpzpNqaGx2BB2FeY0SC
 1Vf8bKmnzn/+aEMraPSoCwwexHXdwV8F8tsBrLlYAXitl51n6PAH2BgIPiVY5tJ+FnA7RCUH+Fp
 hpLQSD8mFy6wBDHc7H66WOHsT+4XevXW5Uy5zPpeLkDs/3CCHeUOYCn3oOrLH9/Iz5bxr2Q02fC
 oG+rvknlbtT5DPl3GsOavTtlerQkSoN6A7S8ETLSsB5uXwXYFGcUhkeqQxT3zSVVvtVzjIlbaXI
 yp3Lsstarjwh+CqrF5A==
X-Proofpoint-ORIG-GUID: HDLwyJr3F1Qz0RoFPwNOipXBeqZlOepu
X-Proofpoint-GUID: HDLwyJr3F1Qz0RoFPwNOipXBeqZlOepu
X-Authority-Analysis: v=2.4 cv=VMvtWdPX c=1 sm=1 tr=0 ts=6a5988ac cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ApbYuknxaN76yxS-R38A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAxNCBTYWx0ZWRfX4gDBS7aKAamU
 otjRRfxhdR06mIj1G/5ENlKCe6yKxeVLlJcoDi4FguUtMFdMiVqRRReeHKjEBhhFV0sJiQQ9eUV
 9ShXPDKgv3xv270ya3q+lSkag2JVj50=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_184310_941316_394744E4 
X-CRM114-Status: GOOD (  12.76  )
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

Currently, the station always follows the listen interval regardless of
the DTIM value. The DTIM function does not work as expected. The default
value of the listen interval is 5 so that the STA wakes up every 500ms
when power save is on. This can cause a data transmission delay.

Set the DTIM policy to DTIM stick mode so that the station follows the AP
DTIM interval rather than the listen interval, which is set in the peer
assoc command. DTIM stick mode is preferable per the firmware team's request.

Apply this only for STA vdevs and only when STA power save is supported, to
avoid affecting unsupported targets and P2P client vdevs.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 11 +++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 16339469c24c..706104168650 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3985,6 +3985,17 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 		ath12k_warn(ar->ab, "failed to set vdev %i OBSS PD parameters: %d\n",
 			    arvif->vdev_id, ret);
 
+	if (ar->ab->hw_params->supports_sta_ps &&
+	    ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
+	    ahvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE) {
+		ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+						    WMI_VDEV_PARAM_DTIM_POLICY,
+						    WMI_DTIM_POLICY_STICK);
+		if (ret)
+			ath12k_warn(ar->ab, "failed to set vdev %d stick DTIM policy: %d\n",
+				    arvif->vdev_id, ret);
+	}
+
 	if (test_bit(WMI_TLV_SERVICE_11D_OFFLOAD, ar->ab->wmi_ab.svc_map) &&
 	    ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
 	    ahvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE)
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 51f3426e1fcd..0145cc477944 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2330,6 +2330,13 @@ enum wmi_slot_time {
 	WMI_VDEV_SLOT_TIME_SHORT = 2,
 };
 
+enum wmi_dtim_policy {
+	WMI_DTIM_POLICY_IGNORE = 1,
+	WMI_DTIM_POLICY_NORMAL = 2,
+	WMI_DTIM_POLICY_STICK  = 3,
+	WMI_DTIM_POLICY_AUTO   = 4,
+};
+
 enum wmi_preamble {
 	WMI_VDEV_PREAMBLE_LONG = 1,
 	WMI_VDEV_PREAMBLE_SHORT = 2,

base-commit: 913998f903fb1432c0046c33003db38a9e8bedb1
-- 
2.43.0


