Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAC6C53219
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 07:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ny0swmE7MmuvYquYFpfbom/etRJNh+llibZoszEySI=; b=3JY1Lm8eoVgeQIOAQzwI++Y+fR
	5r6XfhnoBCvNcB2ZYrP3useIOyDlCOUZs6s55IlyZIdts/8RKs24webOuoGpB/pccLX6VFuDfyVdu
	66hRQrRK8glWOAD4zW7xuNjpBd4Z6F6tygUO6z8I9f9hRrON5kZTepEonwWfnixd5sfsqC039nWnz
	aNu/tO/2Z7MXZ7BqKf30bX/C+5dCLozRnDGBxwPjoRixBHJP3nT594ExIMYeu1kUaMJTLAHKGLEJS
	G6NI35Wk2OHF1q1jmqmNh8Ahg3F3McqghC821bdh6bjvlW2k38Bs9BEsdJo1NCQEFS1Zzu0ZM1Wi/
	dZjz/m2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyYs-00000007699-1GiS;
	Wed, 29 Jul 2026 07:18:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyYo-0000000767o-1RSp
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 07:18:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T5guLj2055646
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 07:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ny0swmE7MmuvYquYFpfbom/etRJNh+llibZoszEySI=; b=DMyFrFTaHPGui9GW
	4dRbOZh8CsrwNWcC6T013tJCfGXi7hSQG7uoeUpYS34MztU97PA/s36KAZT7y2Gg
	CYFJbKps4QkaIAGki0mbjXxPFh9QcVWoFNBEsWaDIjCVooh05UwCCyYimJT7y3ri
	qErKZBKh6eh8/O0ohgO59b9VUCZSfar4HY9yS5q+j3BpBxEYKak+ullmBg0L9RBe
	ctrj66tbnUtjrP6tUiGdAPgxk2A07uNl6IFcTWV+BiMfkonTYAX8rVPaHjml/PMA
	gbeSemuwoYngyGpeSxMDO1XzD9zyMoQ605IOM3zlxcOZryn5+ix5Qi+K2IO425u6
	KtCHYA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbm1gbxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 07:18:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so716610a12.3
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 00:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785309516; x=1785914316; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ny0swmE7MmuvYquYFpfbom/etRJNh+llibZoszEySI=;
        b=TPo2xrdRj7RWHseK7Ts1SXwuOGrJ4ff+tJyVa0YJ2hse6I7gpvkKvp408I1CmK81Vr
         Rhzsb/aP9KtXWpvPMZSyWF9lZP3viR8p5rBJ40bUr2UQmR4emGQxpIHnkmjPhJhl/XwG
         ajWh7lcuIhSJpzkfxpICxSX18hyVEhgPEFALEZu+5eHFXN/dRCy5r/p/v6lpUrAoU8Yy
         RM/12Sy0VpS7SpIBMsZ5k10SjG3+XcdrY8NiF8o2+9MOHy3czlGX8k9TDdlmNT52NDdR
         dvV3X42kMIM57xVfDOjRqgK9JHsg29obMW1PxGLyzw+zjA4MoOs6DiqTPJIbqd/OebHB
         1sWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785309516; x=1785914316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ny0swmE7MmuvYquYFpfbom/etRJNh+llibZoszEySI=;
        b=gZJaxpoN+NkHSRfP6fM1RRahed0y2Vswn/X/5Cr+aVLliIy/JCYwdRiGkVZ5JSOV+D
         8q+wz+FNjLnM3QtDsA311tcetnQXdXq5nMuufgLOmjMXWXRxsZ2n1ISMoMZ1o0AUYhcZ
         inApgLBZbh/lD1PBjpLrmjS36uctssqoBKcmD9SUqEl6cOa/hpKr/gJnycynKvBwXREZ
         4nu1AUSeJTvvUi18oox5KEQvND6Qm15GjK0yRj46ttOQLiihntM0fTa4sEqlKABKHZzF
         Y08pMxt19uweZ9X/2t8/rR6Fu8S29A3N1zY7wrOagvOApL3mImzeXp37YGiXUhRZsOjp
         8XNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4k7jhxW9+l9/Q5j3Qnp6ANfSqIupjM0C/XASdH656QwPXrOO/m7KQ+QtN+NXNueJSYeP3iqA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Va9/E9L3EK/FBf0VQWE1bJVuvCfP7vnF/Zs6geudGEQpWUcc
	VwLGRPmXzS2ZkKl4hL0rYqnwq4GKGIUc5Xz8r/Tt/+XsRJ5tZPanjejmkypBfOWFI8Kd9IL3Qvi
	Cfkkqgrzm61z7LmNyDSBKy7q6/vSDOpgTQ8GPtcZSoUF32lh8yq/tnaIqjeyqVkGA
X-Gm-Gg: AR+sD12OP2NCINXiq6bCCmXFMNTrA1SnMD9+JACSP3raPzwyb0ZGXnB5s+WIqoQ5Zqs
	TSTXjhH846/Qb4HpyZhamsMX+DZWwFSd77Ny6fFm1bDBvYRXD9N/b9wk8ij/L+pxokuRZ3gtRXf
	KPZdQTzYik+Rufc2MDfbc/lq8y4/qmSLgmEDLk/KRHaUGHxQiUO72AITsItZ7Ic/e4v3NWWFjPm
	hYG1h+jdleewELJfenUKTSJc9Osc85vlUCRI0G0U9O/3ouXVtQv7gIqQBKbd0lsQtF+I2vCH1nV
	SyyUod+CRmcxryd2k6FjiYGr6S+PaN19F5E9UrU3RMyYpVxChXBmEozlBEFz6Ebq/WRFWrF6Mdh
	Dna+jbuQ0M+KyTXVBEAuErlsyyw5xbX8WDuR2CXS1sZWZEqn/l0i72A==
X-Received: by 2002:a05:6a20:1d98:b0:3bf:e2dc:bc85 with SMTP id adf61e73a8af0-3c8ba5bf3dbmr6517783637.40.1785309515942;
        Wed, 29 Jul 2026 00:18:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:1d98:b0:3bf:e2dc:bc85 with SMTP id adf61e73a8af0-3c8ba5bf3dbmr6517749637.40.1785309515426;
        Wed, 29 Jul 2026 00:18:35 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb78ae98asm474793a12.1.2026.07.29.00.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:18:35 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:18:11 +0800
Subject: [PATCH ath-next 1/4] wifi: ath12k: signal regd update completion
 when reg event is dropped
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-ath12k-regd-wait-timeout-v1-1-504aa6e7e93c@oss.qualcomm.com>
References: <20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com>
In-Reply-To: <20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfX+Fmqgqz7kWbJ
 X1Y/vpEA37Qpb4xGnyRfTa7nBgzIQj5VxPOq8r+G1Fu4nRx3qc6EjzqNw1PLWm3ryEfWC8Q4Y3Y
 JVpnUaMhU5NhDea0lYteFoGxigRURLFrKM24nJYzMrPEg8MmU1/wJIQLiaNE8TA5xXRO8d7NJsU
 rCvANaa5sh0yODB+L0XSr55ixo/H99za0KcR2sfNBkpKDnGz1n9wJsbMev3aog80mQQEMk2X1tj
 lGXXBhT9xA2z2vCzkyyg7rsXPoAv5N8pDuPQ7y37gQP/u0EPbwxRgcMsTbyJrvJu0awIkMPwjPt
 eAa1V7CB4IxEDfapKXlKvsl1F6f2rUvb1kLe9nlqVq88KTdcvo8IXMUMUUBwTHi9PGRIZRdc8KO
 Qb1u+1lNrRC3gyKxXdm7aqH2oNxRXvJXX1SEmcPV9lYceE+DIRmH2BTlUwo4KvQdJeuA56ZQt8E
 xclYQv3+oPBjE9USyjw==
X-Proofpoint-GUID: 8MtkwattJJcJBu-zuWL5ree8QjDTPwpG
X-Authority-Analysis: v=2.4 cv=R7Az39RX c=1 sm=1 tr=0 ts=6a69a94c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Bb4tyEC6cNv58RkMtAsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 8MtkwattJJcJBu-zuWL5ree8QjDTPwpG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfXxajjJiAAIcuI
 tDoBfhfBrbTqWgD5XRzV2RGkc6qh9jL6Zl8Lm/2pISyFOlA1CUSGWGGJT6gU3BOgoNqD/vnwO34
 heH5ub9F5J5qWj50niGd5LZA4yPGX6c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_001838_459616_AB778E7D 
X-CRM114-Status: GOOD (  18.67  )
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

During driver bring-up, ath12k_mac_hw_register() reinitializes
ar->regd_update_completed and sends a set current country command to
firmware. It then relies on the regulatory event from firmware to signal
that completion via ath12k_reg_chan_list_event().

However, when the country being set is identical to the one already
applied at boot time, ath12k_reg_validate_reg_info() returns
ATH12K_REG_STATUS_DROP through the "Avoid multiple overwrites to default
regd" path. In that case ath12k_reg_chan_list_event() jumps to mem_free
before assigning pdev_idx, so pdev_idx stays at its initial value of 255,
'ar' remains NULL and complete_all() is never called.

As a result the reinitialized completion is left unsignalled and the next
ath12k_regd_update() waits the full timeout, printing:

  Timeout while waiting for regulatory update

Fix this by assigning pdev_idx from the event's phy_id right after it is
extracted, before validation, so that the drop and fallback paths still
reach complete_all(). Change the guard at the end to check the index
against ab->num_radios so that an out-of-range phy_id does not lead to an
invalid pdevs[] access.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 906619a00967 ("wifi: ath12k: handle regulatory hints during mac registration")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 2b707ffc1a20..e9ec56a0e8db 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6964,6 +6964,14 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
 		goto mem_free;
 	}
 
+	/*
+	 * Set the valid pdev_idx before validating so that, even when the
+	 * event is dropped or falls back, the completion the caller in
+	 * ath12k_mac_hw_register() may be waiting on is still signalled at
+	 * the end and it does not time out.
+	 */
+	pdev_idx = reg_info->phy_id;
+
 	ret = ath12k_reg_validate_reg_info(ab, reg_info);
 	if (ret == ATH12K_REG_STATUS_FALLBACK) {
 		ath12k_warn(ab, "failed to validate reg info %d\n", ret);
@@ -6980,7 +6988,6 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
 	}
 
 	/* free old reg_info if it exist */
-	pdev_idx = reg_info->phy_id;
 	if (ab->reg_info[pdev_idx]) {
 		ath12k_reg_reset_reg_info(ab->reg_info[pdev_idx]);
 		kfree(ab->reg_info[pdev_idx]);
@@ -7019,7 +7026,7 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
 
 out:
 	/* In some error cases, even a valid pdev_idx might not be available */
-	if (pdev_idx != 255)
+	if (pdev_idx < ab->num_radios)
 		ar = ab->pdevs[pdev_idx].ar;
 
 	/* During the boot-time update, 'ar' might not be allocated,

-- 
2.25.1


