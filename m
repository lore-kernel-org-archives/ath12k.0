Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9253606A89F
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 06:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OtcH65Pn;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i87DefKw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VY6V+j2q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S7pEWQuD36aSY4tsDM7SLDt3J4Lqpe+VXP9rOttq+Dk=; b=OtcH65Pn7oyTz2
	3R2QV6MkWo4k6pxzpExfb5jeiw6utj/aGXISwz6U4Tsw9xSLJeDuKPOpmR94Se0yhz/L/6EJQL2aZ
	cF8l2WGz7lie2jyDSJYoRsnlXcG+HaUzeumTV+qWFzI0LZ8ckn/rZ3r4wkEuNmiezphunSRBBBTGw
	Gx52q5RFy7i2y2Z0RJJpstdw3Ti9Kv0ZITvxpcUZUjNB0S8aqH8oi8FV6bhT2UU+mVr33bLi3yj8x
	pFDXnID/JRNYU9xxdKWTgu0y8t5mMXtV8IiV4wLnKUhCFOPwZ03qCu+1pLpIwuSkRcmpmvlX5P5yX
	EH4FKo5tTjhLFsdZ715A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ1p-00000007rxW-1SQg;
	Wed, 18 Nov 2026 06:20:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ1e-00000007rmX-3tLx
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 06:20:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI5joKH2413931
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7pEWQuD36aSY4tsDM7SLDt3J4Lqpe+VXP9rOttq+Dk=; b=i87DefKw8nUwCLYN
	qR+IiDnAyIj+Pi1qUrki5T6xWMEtxajVmblZP3WVZgcKZYY7HQ6iVJO77DxsUBUe
	+YzVjin70jPSpgeGzkEM59vQmp2Mt+Nc5QrG5on5OYBAUIUwZ5tnqTBLBpCP81lY
	qUBVLv1RHIgcF5yrqX8sqYFbOqfukc++S3bF8XYX2bb8QT6D6ArtR2QUB6nxEQB2
	RmbjIu6rXquQNsRMXVvieM2vNJKjYrwYAZEwcLuqtS7pUic994cHsBhdCIfYgcNR
	IvqEMFrRYiLa2cvDuL6RUExQpYvOCGBUupaKfKRst6hGXGWllDBeSDDrQc+COCfE
	VleZjg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hhsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:20:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so583446a91.1
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 22:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982808; x=1795587608; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7pEWQuD36aSY4tsDM7SLDt3J4Lqpe+VXP9rOttq+Dk=;
        b=VY6V+j2qTj2tc8bXt6AJffGUiFfE5U9udmhiP+tbW/j0tDg2vQ3QGVWxoNO+2x5neW
         bhdul0LmnusGGtn7zJWz7+5u8yevIhvfpQbCAQlZXF9kp/zOkM1JJRcsd2krjlOHRSPO
         NA+f/B51Uil9Cc4xr8anMuuoD63UKMc38NrHgmfq6neZLrwuxHMDg3xbmMk/zqAL1xNO
         0QntpKzwkqBBRf25xqVuIUelZF5tTk02ZtVzDwDOidB82Rm6XDvRJTeCzFLLBO4tFytf
         59Cg2lGmzdKD/S1zAcVatb/as1n1hZSBMcXUNU1IxtczI2d0/+6UAG4gdffinFOMFQSA
         5qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982808; x=1795587608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7pEWQuD36aSY4tsDM7SLDt3J4Lqpe+VXP9rOttq+Dk=;
        b=NKVQpOJnU5VZm5oL4fbU3igoLn4yhX0azlgcwfSbsGLOsg+apcjnHipEeDKNsFMq7t
         +1HRFy4x3ByNuDvSQfbjqF8dRb/+f5ixY8hyTe+e5VEf8r9Px/4kNj1jGtxBTH7H0jmk
         ruk2foMaKJBaF8rhBP8/NvqB58REfImuqYpO4jhM/VLxOnkBZkz/uXmqyOUKHei1CiD4
         Xcm7u2TddOlvumAYPbxGvLMamt3ML3/xFynbX4Hd/dwiXYRX3muqa4YTG4Duq4a/ly90
         609m0AGN3XiZmY6daudPSwqKJ8frKgHuEXP+wUer4GblytC5SrOYteSQ0Ly6KYilLanO
         VAoQ==
X-Forwarded-Encrypted: i=1; AL+hErGScvpak3UvXlbQXHt3du4829a1tJkZ6NCL81lmpVILgqzCJV+xE1O0/1wq4Ug6gUeJs//aPBY=@lists.infradead.org
X-Gm-Message-State: APuU4Z+5+v1OWe1jBKob944uwvqMqpfp764qi6n71ifLoBUN6+Jb5pHR
	r7/iH97gupk0BKeJeK2hgSz9yvgA88WcWQR0smgGyIATeJh4Wnij0ASf6nWO6SgbKT+KhxcKXvp
	b4Za03cvV/ujG5Ols6uVFWX9o0Gdp2omXo5B5kLlfQFOqdkeNMUAd3Sa6H+q3/BZU
X-Gm-Gg: AZFdTZdsaWkx3qCqMZ8XNuriBf657GI3/vM+FtwBL4uhtwMACKWlNjKkEukZgGgmXeM
	sVtcF9ab5K775hX3vkgMsufukW/h4k19QAZC9o58CCS4iK9bcEKZQPXv2BSSsyYZvmUgiFQhI4d
	vckKKD44/4hW8l41ilfL+16HesJ1uQhteCZw5hRs1ybre8JodVce5AC+4qODT/3+UDuvIbUtUx4
	/R4Ot/13OF6893wYULGycbTJHAeyy1k4cKt2ex+X9qytoBFL7UKzv6TWlOEdYjgjD0l0F07rWeB
	ByEbcMVo2y0Ckw4lZ/6nOi/ecpAyKyQEJuu49znYnqCFDG5bR/7GmzhxwISlq8Tfsq+uLc1JFXB
	mQEdxqrxGGbAjm7/XazNTcawYMcK3ctbzhq0UnJjMQWNyDK/vSriivlexHa+WOkFYFutSR3rO0n
	dgqT/7o0tqAYc0SUS8bw/3krbL6tHjfnFvWnGfx8G9Pbrgsj83ly754ftwUxVDoMkYPZSmKAja5
	9g=
X-Received: by 2002:a17:90b:448b:b0:3b0:9782:8721 with SMTP id 98e67ed59e1d1-3b3d07b9f34mr1716887a91.36.1794982808216;
        Tue, 17 Nov 2026 22:20:08 -0800 (PST)
X-Received: by 2002:a17:90b:448b:b0:3b0:9782:8721 with SMTP id 98e67ed59e1d1-3b3d07b9f34mr1716848a91.36.1794982807411;
        Tue, 17 Nov 2026 22:20:07 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:06 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:14 +0530
Subject: [PATCH ath-next v2 11/15] wifi: ath12k: add Wi-Fi 8 CE config and
 service pipe map for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-11-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 0FBioi8xqXwqb6sNLuMJAy9lhiUw1glb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX5w0ejL1KCgXU
 BhKhfT3JSB/p8Gvhd7BPyRc9Jgbcm5sRj6l7144BtrTh4DwlJ24m8NDcRSRq0bsor/4DjoxG211
 ADAXNV8ZRJykDcpe7fMx6lq9cG0OBzc=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd4399 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ve5JB-QzZkeB4WSZPW4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX9xug5zVgVypz
 BUX55V2k/Cl1JUfN7WZnxZKI7ys5bReuUHr81NLZjZ+EmV6hEqkEi1G5P22RC7QvrLBDmB9ROPA
 77qsAIQXAq5FNVODT7EIM4x5HXpKrAEvU9MHevrEzWlCfNTmGjqMFt/XrmAy1IoNMgNwercUcW2
 sysbjCGw/B3B8i5uhqRKvLezsHVWyDKVo6ox7gM1IYvviR6PM1oGbYnMhaxPK4MmOiBjAs3uC4V
 9zYuLuKLbW9QdmOTU6uEwyod7TWQB18A8b7J9tRVzw22jbxpnzV9YNUgtlWEKyDpl+xhBxjRR9P
 WYgkT0rTNJ6BOjGuHiKbPtVUaBO28SOjy3G1fKjlVLx0F6rZRGPKOY0/FaZOAsa8r6sRQ7fioeo
 KjS6yimbcfV1lz3YVXPsJnUl3UlYJlH6hcRlDgTS9fy90jgtI8kqR5/I3Nbnrh8pI3L32XuEuDE
 CLWaTSnGYayy+Mzu38g==
X-Proofpoint-ORIG-GUID: 0FBioi8xqXwqb6sNLuMJAy9lhiUw1glb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_222011_147113_9A4B19F7 
X-CRM114-Status: GOOD (  23.20  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement the CE and service-to-CE configuration for QCN9575. QCN9575
uses 16 CE pipes and a service-to-CE map that includes additional HTT
data service IDs not present in Wi-Fi 7.

Add QCN9575-specific CE configuration tables in wifi8/ce.c: host CE
attributes, target CE pipes 0-8 and 12-15, and a service-to-CE mapping
that includes HTT_DATA4 on CE15. Introduce HTT_DATA2-HTT_DATA5 service
and endpoint enums in htc.h to match the HTT data service group
numbering QCN9575 defines; only HTT_DATA4 is wired into the CE map by
this patch, since it is the only one QCN9575 currently maps to a pipe.
HTT_DATA2, HTT_DATA3, and HTT_DATA5 are added now so the service group
is defined contiguously and are expected to be used by future CE/service
map additions for QCN9575. Add name cases for all five in
htc_service_name().

QCN9575 also requires HTC endpoints 9 through 12, beyond the 9
endpoints (0-8) existing Wi-Fi 7 targets use. Add ATH12K_HTC_EP_9
through ATH12K_HTC_EP_12 to enum ath12k_htc_ep_id, raising
ATH12K_HTC_EP_COUNT to 13 for the shared endpoint array. Since
ATH12K_HTC_EP_COUNT is also used as the validation bound for eid
values parsed from firmware (HTC rx headers, credit reports, and
connect-service responses), raising it for every target would let an
out-of-range eid for a Wi-Fi 7 device (9-12) pass validation and index
an endpoint that was never connected to any service, where ep_ops is
all-zero.

Add max_htc_eps to struct ath12k_hw_params so each target can specify
its own HTC endpoint limit independent of the shared array size, set
to 9 for all existing Wi-Fi 7 hw_params entries and 13 for QCN9575.
Switch the eid bound checks in ath12k_htc_send(),
ath12k_htc_process_credit_report(), ath12k_htc_rx_completion_handler(),
ath12k_htc_reset_endpoint_states(), and ath12k_htc_connect_service()
from ATH12K_HTC_EP_COUNT to hw_params->max_htc_eps, so Wi-Fi 7 targets
keep rejecting eid >= 9 exactly as before.

Update Wi-Fi 8 hw params to use the new CE config tables and build
wifi8/ce.c from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/htc.c          |  18 +-
 drivers/net/wireless/ath/ath12k/htc.h          |   8 +
 drivers/net/wireless/ath/ath12k/hw.h           |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c     |   7 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |   3 +-
 drivers/net/wireless/ath/ath12k/wifi8/ce.c     | 404 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/ce.h     |  13 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  13 +-
 8 files changed, 454 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/htc.c b/drivers/net/wireless/ath/ath12k/htc.c
index 7227bed91ade..a9241d290534 100644
--- a/drivers/net/wireless/ath/ath12k/htc.c
+++ b/drivers/net/wireless/ath/ath12k/htc.c
@@ -82,7 +82,7 @@ int ath12k_htc_send(struct ath12k_htc *htc,
 	int credits = 0;
 	int ret;
 
-	if (eid >= ATH12K_HTC_EP_COUNT) {
+	if (eid >= ab->hw_params->max_htc_eps) {
 		ath12k_warn(ab, "Invalid endpoint id: %d\n", eid);
 		return -ENOENT;
 	}
@@ -158,7 +158,7 @@ ath12k_htc_process_credit_report(struct ath12k_htc *htc,
 
 	spin_lock_bh(&htc->tx_lock);
 	for (i = 0; i < n_reports; i++, report++) {
-		if (report->eid >= ATH12K_HTC_EP_COUNT)
+		if (report->eid >= ab->hw_params->max_htc_eps)
 			break;
 
 		ep = &htc->endpoint[report->eid];
@@ -264,7 +264,7 @@ void ath12k_htc_rx_completion_handler(struct ath12k_base *ab,
 
 	eid = le32_get_bits(hdr->htc_info, HTC_HDR_ENDPOINTID);
 
-	if (eid >= ATH12K_HTC_EP_COUNT) {
+	if (eid >= ab->hw_params->max_htc_eps) {
 		ath12k_warn(ab, "HTC Rx: invalid eid %d\n", eid);
 		goto out;
 	}
@@ -411,6 +411,10 @@ static const char *htc_service_name(enum ath12k_htc_svc_id id)
 	case ATH12K_HTC_SVC_ID_NMI_DATA:
 		return "NMI Data";
 	case ATH12K_HTC_SVC_ID_HTT_DATA_MSG:
+	case ATH12K_HTC_SVC_ID_HTT_DATA2_MSG:
+	case ATH12K_HTC_SVC_ID_HTT_DATA3_MSG:
+	case ATH12K_HTC_SVC_ID_HTT_DATA4_MSG:
+	case ATH12K_HTC_SVC_ID_HTT_DATA5_MSG:
 		return "HTT Data";
 	case ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS:
 		return "RAW";
@@ -430,7 +434,7 @@ static void ath12k_htc_reset_endpoint_states(struct ath12k_htc *htc)
 	struct ath12k_htc_ep *ep;
 	int i;
 
-	for (i = ATH12K_HTC_EP_0; i < ATH12K_HTC_EP_COUNT; i++) {
+	for (i = ATH12K_HTC_EP_0; i < htc->ab->hw_params->max_htc_eps; i++) {
 		ep = &htc->endpoint[i];
 		ep->service_id = ATH12K_HTC_SVC_ID_UNUSED;
 		ep->max_ep_message_len = 0;
@@ -667,7 +671,7 @@ int ath12k_htc_connect_service(struct ath12k_htc *htc,
 
 setup:
 
-	if (assigned_eid >= ATH12K_HTC_EP_COUNT)
+	if (assigned_eid >= ab->hw_params->max_htc_eps)
 		return -EPROTO;
 
 	if (max_msg_size == 0)
@@ -754,10 +758,10 @@ int ath12k_htc_init(struct ath12k_base *ab)
 
 	spin_lock_init(&htc->tx_lock);
 
-	ath12k_htc_reset_endpoint_states(htc);
-
 	htc->ab = ab;
 
+	ath12k_htc_reset_endpoint_states(htc);
+
 	switch (ab->wmi_ab.preferred_hw_mode) {
 	case WMI_HOST_HW_MODE_SINGLE:
 		htc->wmi_ep_count = 1;
diff --git a/drivers/net/wireless/ath/ath12k/htc.h b/drivers/net/wireless/ath/ath12k/htc.h
index 05b3e593542d..1364eea56f70 100644
--- a/drivers/net/wireless/ath/ath12k/htc.h
+++ b/drivers/net/wireless/ath/ath12k/htc.h
@@ -207,6 +207,10 @@ enum ath12k_htc_svc_id {
 	ATH12K_HTC_SVC_ID_NMI_DATA	= SVC(ATH12K_HTC_SVC_GRP_NMI, 1),
 
 	ATH12K_HTC_SVC_ID_HTT_DATA_MSG	= SVC(ATH12K_HTC_SVC_GRP_HTT, 0),
+	ATH12K_HTC_SVC_ID_HTT_DATA2_MSG	= SVC(ATH12K_HTC_SVC_GRP_HTT, 1),
+	ATH12K_HTC_SVC_ID_HTT_DATA3_MSG	= SVC(ATH12K_HTC_SVC_GRP_HTT, 2),
+	ATH12K_HTC_SVC_ID_HTT_DATA4_MSG	= SVC(ATH12K_HTC_SVC_GRP_HTT, 3),
+	ATH12K_HTC_SVC_ID_HTT_DATA5_MSG	= SVC(ATH12K_HTC_SVC_GRP_HTT, 4),
 
 	/* raw stream service (i.e. flash, tcmd, calibration apps) */
 	ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS = SVC(ATH12K_HTC_SVC_GRP_TEST, 0),
@@ -227,6 +231,10 @@ enum ath12k_htc_ep_id {
 	ATH12K_HTC_EP_6,
 	ATH12K_HTC_EP_7,
 	ATH12K_HTC_EP_8,
+	ATH12K_HTC_EP_9,
+	ATH12K_HTC_EP_10,
+	ATH12K_HTC_EP_11,
+	ATH12K_HTC_EP_12,
 	ATH12K_HTC_EP_COUNT,
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 9c11edd2b051..96776c6e2050 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -164,6 +164,7 @@ struct ath12k_hw_params {
 	} fw;
 
 	u8 max_radios;
+	u8 max_htc_eps;
 	bool single_pdev_only:1;
 	u32 qmi_service_ins_id;
 	u32 qmi_max_chunk_size;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 282a41980d98..7b2f54248fa6 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -416,6 +416,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.unified_fw_image = false,
 		},
 		.max_radios = 1,
+		.max_htc_eps = 9,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274,
 		.qmi_max_chunk_size = SZ_2M,
@@ -514,6 +515,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.max_radios = 1,
+		.max_htc_eps = 9,
 		.single_pdev_only = true,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850,
 		.qmi_max_chunk_size = SZ_512K,
@@ -612,6 +614,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.unified_fw_image = false,
 		},
 		.max_radios = 2,
+		.max_htc_eps = 9,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274,
 		.qmi_max_chunk_size = SZ_2M,
@@ -708,6 +711,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.unified_fw_image = false,
 		},
 		.max_radios = 1,
+		.max_htc_eps = 9,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332,
 		.qmi_max_chunk_size = SZ_2M,
@@ -800,6 +804,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.max_radios = 1,
+		.max_htc_eps = 9,
 		.single_pdev_only = true,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850,
 		.qmi_max_chunk_size = SZ_512K,
@@ -899,6 +904,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.unified_fw_image = false,
 		},
 		.max_radios = 1,
+		.max_htc_eps = 9,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332,
 		.qmi_max_chunk_size = SZ_2M,
@@ -992,6 +998,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.unified_fw_image = false,
 		},
 		.max_radios = 1,
+		.max_htc_eps = 9,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432,
 		.qmi_max_chunk_size = SZ_2M,
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 051c6447d35c..3717b00741fd 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
-ath12k_wifi8-y += core.o \
+ath12k_wifi8-y += ce.o \
+		  core.o \
 		  hal.o \
 		  hal_qcn9575.o \
 		  hw.o \
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/ce.c b/drivers/net/wireless/ath/ath12k/wifi8/ce.c
new file mode 100644
index 000000000000..27bdb7a3b20d
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/ce.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/types.h>
+
+#include "../core.h"
+#include "../ce.h"
+#include "ce.h"
+
+/* Target firmware's Copy Engine configuration. */
+const struct ce_pipe_config ath12k_wifi8_target_ce_config_wlan_qcn9575[] = {
+	/* CE0: host->target HTC control and raw streams */
+	{
+		.pipenum = __cpu_to_le32(0),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE1: target->host HTT + HTC control */
+	{
+		.pipenum = __cpu_to_le32(1),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE2: target->host WMI */
+	{
+		.pipenum = __cpu_to_le32(2),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE3: host->target WMI (mac0) */
+	{
+		.pipenum = __cpu_to_le32(3),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE4: host->target HTT */
+	{
+		.pipenum = __cpu_to_le32(4),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(256),
+		.nbytes_max = __cpu_to_le32(256),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE5: target->host Pktlog */
+	{
+		.pipenum = __cpu_to_le32(5),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE6: Reserved for target autonomous hif_memcpy */
+	{
+		.pipenum = __cpu_to_le32(6),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(16384),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE7: host->target WMI (mac1) */
+	{
+		.pipenum = __cpu_to_le32(7),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE8: Reserved for target autonomous hif_memcpy */
+	{
+		.pipenum = __cpu_to_le32(8),
+		.pipedir = __cpu_to_le32(PIPEDIR_INOUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(16384),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE9, 10 and 11: Reserved for MHI */
+
+	/* CE12: CV Prefetch */
+	{
+		.pipenum = __cpu_to_le32(12),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE13: CV Prefetch */
+	{
+		.pipenum = __cpu_to_le32(13),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE14: WMI logging/CFR/Spectral/Radar */
+	{
+		.pipenum = __cpu_to_le32(14),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),
+		.nentries = __cpu_to_le32(32),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS),
+		.reserved = __cpu_to_le32(0),
+	},
+
+	/* CE15: host->target MSDU/MPDUQ */
+	{
+		.pipenum = __cpu_to_le32(15),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),
+		.nentries = __cpu_to_le32(256),
+		.nbytes_max = __cpu_to_le32(2048),
+		.flags = __cpu_to_le32(CE_ATTR_FLAGS | CE_ATTR_DIS_INTR),
+		.reserved = __cpu_to_le32(0),
+	},
+};
+
+/*
+ * Map from service/endpoint to Copy Engine.
+ * This table is derived from the CE_PCI TABLE, above.
+ * It is passed to the Target at startup for use by firmware.
+ * Pipe direction:
+ *      PIPEDIR_OUT = UL = host -> target
+ *      PIPEDIR_IN = DL = target -> host
+ */
+const struct service_to_pipe
+ath12k_wifi8_target_service_to_ce_map_wlan_qcn9575[] = {
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VO),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BK),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_BE),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_DATA_VI),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(3),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(0),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_RSVD_CTRL),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(1),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(0),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_TEST_RAW_STREAMS),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(1),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(4),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA_MSG),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(1),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC1),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(7),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_MAC1),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(2),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_PKT_LOG),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(5),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_WMI_CONTROL_DIAG),
+		__cpu_to_le32(PIPEDIR_IN),
+		__cpu_to_le32(14),
+	},
+	{
+		__cpu_to_le32(ATH12K_HTC_SVC_ID_HTT_DATA4_MSG),
+		__cpu_to_le32(PIPEDIR_OUT),
+		__cpu_to_le32(15),
+	},
+
+	{ /* must be last */
+		__cpu_to_le32(0),
+		__cpu_to_le32(0),
+		__cpu_to_le32(0),
+	},
+};
+
+const struct ce_attr ath12k_wifi8_host_ce_config_qcn9575[] = {
+	/* CE0: host->target HTC control and raw streams */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 16,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE1: target->host HTT + HTC control */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 512,
+		.recv_cb = ath12k_htc_rx_completion_handler,
+	},
+
+	/* CE2: target->host WMI */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 128,
+		.recv_cb = ath12k_htc_rx_completion_handler,
+	},
+
+	/* CE3: host->target WMI (mac0) */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 32,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE4: host->target HTT */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 2048,
+		.src_sz_max = 256,
+		.dest_nentries = 0,
+	},
+
+	/* CE5: target->host pktlog */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 512,
+		.recv_cb = ath12k_dp_htt_htc_t2h_msg_handler,
+	},
+
+	/* CE6: target autonomous hif_memcpy */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE7: host->target WMI (mac1) */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 32,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE8: target autonomous hif_memcpy */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE9: MHI */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE10: MHI */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE11: MHI */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE12: CV Prefetch */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE13: CV Prefetch */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE14: target->host dbg log */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 512,
+		.recv_cb = ath12k_htc_rx_completion_handler,
+	},
+
+	/* CE15: host->target MSDU/MPDUQ */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = 2048,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/ce.h b/drivers/net/wireless/ath/ath12k/wifi8/ce.h
new file mode 100644
index 000000000000..222b8dddefda
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/ce.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_CE_H
+#define ATH12K_WIFI8_CE_H
+
+extern const struct ce_pipe_config ath12k_wifi8_target_ce_config_wlan_qcn9575[];
+extern const struct service_to_pipe ath12k_wifi8_target_service_to_ce_map_wlan_qcn9575[];
+extern const struct ce_attr ath12k_wifi8_host_ce_config_qcn9575[];
+
+#endif /* ATH12K_WIFI8_CE_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 428d6b2b4418..fa64b865b931 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -8,9 +8,11 @@
 #include <linux/types.h>
 
 #include "../core.h"
+#include "../ce.h"
 #include "../debug.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "ce.h"
 #include "hal.h"
 #include "hw.h"
 #include "mhi.h"
@@ -28,6 +30,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 			.unified_fw_image = true,
 		},
 		.max_radios = 2,
+		.max_htc_eps = 13,
 		.single_pdev_only = false,
 		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9575,
 		.qmi_max_chunk_size = SZ_2M,
@@ -36,12 +39,12 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.hw_ops = NULL,
 		.ring_mask = NULL,
 
-		.host_ce_config = NULL,
+		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,
 		.ce_count = 16,
-		.target_ce_config = NULL,
-		.target_ce_count = 0,
-		.svc_to_ce_map = NULL,
-		.svc_to_ce_map_len = 0,
+		.target_ce_config = ath12k_wifi8_target_ce_config_wlan_qcn9575,
+		.target_ce_count = 13,
+		.svc_to_ce_map = ath12k_wifi8_target_service_to_ce_map_wlan_qcn9575,
+		.svc_to_ce_map_len = 21,
 
 		.rxdma1_enable = false,
 		.num_rxdma_per_pdev = 0,

-- 
2.34.1


