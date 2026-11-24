Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3508D606A329
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 16:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ern6PCN5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=v4LgC2dv;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ikGoWWMC;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ex4fZBNc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S7pEWQuD36aSY4tsDM7SLDt3J4Lqpe+VXP9rOttq+Dk=; b=ern6PCN5R4/B6t
	lGELjfvD53bxDPRCgWPFGfAXb3AVTocxBtiJwaUok4GcfZcSmt9vVgNDf7IY0QP3FcazBOiXYcVH5
	a5I4juA0osCdbE7wIvC/DtyFy0lG86RuuhExvZWfshDFXemZkdk4H6RH6ba3JJN2SbTgXNuoYVvGW
	cYQBw8SOzscO3MqDmYDbsPimOdkc+rR/zWfzJ5OfkO2ZkAQVESoJ8BjDIlvDMM8EeLLKmQ7+1epsN
	NSO4mZ0K59VsHOivQdB8rjv1gurMKVlfna7nKVNntzcqkVv3ErNAjGDdtod4DvYLOpbDh1onUSs6K
	iVdKnVXmi8hy2QQD9fYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdJ-00000007A4V-3Xd0;
	Tue, 24 Nov 2026 16:44:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdH-00000007A0K-1Nn1
	for ath12k@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=S7pEWQuD36aSY4tsDM7SLDt3J4Lqpe+VXP9rOttq+Dk=; b=v4LgC2dvm6HHU2MhDT4/kbw/G5
	EMdoayfTvJEhkZrNAfcAv+f5D01Vc5sdYbFF1elQJc3gBQ/xiMmSpK9IKSL63Vb6bTc0NGhqU5QBy
	xHHaAPmKo4LKNu1RpZ9Mqcnvu9RvLQAdIzjbqI6HGwZHTekFrJ/IjdXaD4UVbeBHQlCgTWIEnmwCg
	tdR4IVelfTwwAuIgcLr4NoJVS7B9gIEPaE/GXaSAG5OIe+pmWkOXQelFC8LG9MS2vU3O301cNvMiF
	jEisyeio0MegvQHEuApbT0f9+NGlbz0H8Huhhhl7/Ou+lN8ift9TSPQhCWHIZ5M+08zeKcPFL4TMR
	06m3Eslg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtd9-00000009Cja-0i5q
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 16:44:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL8qs1215297
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7pEWQuD36aSY4tsDM7SLDt3J4Lqpe+VXP9rOttq+Dk=; b=ikGoWWMCbWGr8hMb
	bHjrKeyjR51/FUE3fBQXpEZL5rIe3B4bOHwK8JRlDbUfs+YZiphwzwCtgWiJs2/H
	leRCpgrg8Zl0AaqDVK83oMZTxFCtcx77mhAJiq2LwhCRJsrdssLkIE0SYfuj4LrF
	AIsjNAQ1U/pbisihBuF0CNPsrJJH5Z+p82JHPDviR07xp1vD06JsOh8EXN2M6zu6
	7fc1jk1EqJXNEgWXSkl+gCg0ie6k3WbvPsj1gRmvwMuqAsh5pa2j3uCxOrkzePkk
	Dv7zim5XZF8TxjLxk+jswbd3MAQIzG8QQhjlq4TsgGb1N696FDVMHquQ/tDoyga0
	28meAA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpjucp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso5363512eec.1
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 08:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538668; x=1796143468; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7pEWQuD36aSY4tsDM7SLDt3J4Lqpe+VXP9rOttq+Dk=;
        b=Ex4fZBNcTTbfoC+/1Kj4qHbksZFcBSuzQJx4A79cNt2BLA6nuhhcevFgLJfBYjJuoK
         +beHauEGvhAht1lq1tDpbDV755sv2qe6osHagY6t1hUQTH0rRtcdp1sIFoT2kISpgU4A
         EgPjiJHSdLioUh0D7lk+wy9nZSiFNIjQLKDoPM7G4alh0pBwx/DIYXLn+tB3w4TfncV8
         3GsUwWp7F1dfyxiLbnYxpUudb0alI3MS09usJif4nEg8zuCHBf/CgNKQymHZaROEjQ/c
         hAI6nlgJk3pZcabScH9sxYVAuMEYTAlMfV+1Onu4bhxgWSWZ9i/xdG7Oxqpu4mDnw9Od
         mdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538668; x=1796143468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7pEWQuD36aSY4tsDM7SLDt3J4Lqpe+VXP9rOttq+Dk=;
        b=CiINNWUG8rNb69Rbkm9TBVKAPHb4Gf1sGDxdVyptEFetpLUrPYHYRmL2GWFv9KLdPa
         DL3+iIbrB8yHS1JJF36zKHlPk9Cpir/C9CUZzu9Wz2jArsOFUz8Yxytj+TUoiL9Im4BX
         vZ7m0hypUQlexUzovG1QV4Hj/5cRC3q7B2YUp8x0QBCUQ+5/DYZaw5IwoCpGLbIAavLc
         PCA3EUGPAdXIWtj+lwHocgmOh0om8NAB1/9xCV/QzFL+QjZcf7+VGKBcpKvUXVjCdqtX
         ZD1t1von4SoL+U/rsuN5sdmLIYYaPWceAr3LD/iKWV26BSB4wBOW0Dd6oS1FXMorYek+
         9Qfg==
X-Forwarded-Encrypted: i=1; AL+hErFoEK/4J8BwlzBLg3D7Tt98yWxnbAszra40HMfAjsdcRbhddYqhAovyaiH15I1JnylWhyBbGs4=@lists.infradead.org
X-Gm-Message-State: APuU4Z+M4UEj9U373q47wiAiEIaokFz3f9Ad/XDGYj3X8WGPHFV+3cV3
	efvhkqwubLVIWDbnu6w8k5ovnlJ6KN3LKENu+2QMbpLm+u1MUQd0Z+urTWnGAJXFVOww2IbiZT0
	tUIAwpXr9SoClrjFnM7iX1HXckXNOohvYL+lGAs/pKK837+Rbpd+Ydw3A9WWsGubZ
X-Gm-Gg: AZFdTZcrqe1y4g7MBGxZewEsgBr4Q8c7K2jHBDKHpgMqf5Y7+ptMG2e3QQ3SzrHl6vU
	VUJNl0tDzEp+mh2lDucKBMG6BFug1VutHi/+wBkh9nTAaSVjh9qQhaD9wwk9HvG5tKe16ISwENC
	DhVezoW34hM9nIJHe8KGTFzGIcL0336it5AtLP7sCEjWpCLskGPyL0qJ0E+4cjQLFVPAuVG70zY
	V9qwR0EMuSOwxj0uPFV1PUHMT/CANKXNaSVXC8xIFYfYLN7vOOr8YxnJSNieWbAKiflEjwrvllp
	vpMLvrRJImc9rR8Ct4BZkZz53ZT/lh4iTs2B51aCW840B3On5sDYM3dA8+vXfzCFcUtl0xJiGXa
	QBzpxU/UQYitKS/7W86/bTwusXdCKT3gpZUVT494J0xdIF0DH0FiXr0duRk5OnqILI5RRY8BE2K
	EfDh6g0B5ZDkXpjNLEP1EyfwIA0Oo7E7gBvewlYHXrgb5dEcHm6MW+E+Iy448oF66u/TE6+6CG8
	2A=
X-Received: by 2002:a05:693c:8813:10b0:385:cbc5:7eeb with SMTP id 5a478bee46e88-385cbc595acmr13312088eec.15.1795538668039;
        Tue, 24 Nov 2026 08:44:28 -0800 (PST)
X-Received: by 2002:a05:693c:8813:10b0:385:cbc5:7eeb with SMTP id 5a478bee46e88-385cbc595acmr13312050eec.15.1795538667382;
        Tue, 24 Nov 2026 08:44:27 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:27 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:36 +0530
Subject: [PATCH ath-next v4 10/14] wifi: ath12k: add Wi-Fi 8 CE config and
 service pipe map for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-10-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX8MCycB7B5A8e
 ACkCTUeJg6EMa7D6JsARDzpOjSRtEdYbRFl8jYekqB4KD/80FNFbHbOGkKyoZwUBPXNVYPtZa5K
 ANJ7uQRnNcfnhDu597kKkCIm0gUDYrmbzyeVpfxrUeYKgTVvn9QQtOWXiJuQ1TamCwLGC24WJC3
 6cOjugEjXOVDZKXP5IZwIS0+1iqYD9JznLOxhZr+nsSqt0Z/yVEtvp87Cesaa7F9h4r/qdULCUL
 yrtK6A0JcjgSqfhL4XBn38lEWaNVljZq+Ey9YIX8qGn+OZaEFQdCcPQq7l3i6YTad++8n8Os7af
 IKaKOj9JKpkPc/UeB688uR5Hp5/4TGtRJqYWJFuzMsoxVdMD3e9nwTh+/cg93nRI7vMmU/SJoKt
 udpmELkCwcRX8DjaLNhn0h2I8XncC4RtTd4oYPWt/t7dSBi0NXDGdHrp96Wxd6HuMseK1Hmpv7P
 Sp0fIrCHLjx1fqJOk4g==
X-Proofpoint-GUID: uJMc7jLHcuHM0nmHYe1PrNikXAW7uvI4
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05beed cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ve5JB-QzZkeB4WSZPW4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX0lGcqS3gV4mp
 SrtmaI+AzL1IXHn8yq+/KP9uTfvrpyKPvS4ELKZW3ecBsTVeHuRmlvXPtK5WU6ischw9skpOAFA
 cI93TMcjvAqtZEigWyN90xOs7jamZi4=
X-Proofpoint-ORIG-GUID: uJMc7jLHcuHM0nmHYe1PrNikXAW7uvI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_164431_510015_9AA947FB 
X-CRM114-Status: GOOD (  19.47  )
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


