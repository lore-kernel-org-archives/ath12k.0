Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9134606A31C
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 02:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AatPYDCn;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LP447Ftg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LoGw/+F8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fVrHYGVlMXC6b3VTkteHwcWoTiNql5FwArEDV+9ynw4=; b=AatPYDCnR0Sgpo60OXtfEaXMkP
	O3XqHtLCQZtu5qqyDr0/mDu9215oC96SzE1mihindyM1ti3Rtp4OKYgVrQggbi/nSggyk7zUo+IT2
	FhCzTViTR72eiutt1mCaBTNww8Qr5dW0hX5+SLf9uHtXGzHKoTv0/7s9eLZlUI/oiixVQ5zvGegpJ
	NJ5wDy1ozKP9jIYB7WS3YSuGSyY4OaI4ZBiWm2ZL1933rsg7wsJAjulrWibVngdyt/E3HvBpnozcJ
	9mJLMPf2XDvjywmYx5IVg7iif7ZIP+muoUPofntuzv/ZHiDxl4PBJ5fiNXppHFRASprenmtMsi6Z2
	pwPODkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmQT-00000000wC8-1JyR;
	Mon, 16 Nov 2026 02:26:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmQQ-00000000wBb-0tjb
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 02:26:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1LEgN137441
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 02:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fVrHYGVlMXC6b3VTkteHwcWoTiNql5FwArE
	DV+9ynw4=; b=LP447FtgIcZYN7mOakuw/ZpXbHLpPVs1QdPtEh0hTJ7Iog+yZHv
	mp914LCwXXlK2M5UXCPKuKqK/FrwgqCPA9fvmof53oDodWDQigrTu/bKOIWTy2bl
	ExBe/NCWzbX2fHU3Jpxa4fkVZ4oeudDPfAsVccz2IBhQkpKFYqBMwbDc+6YWrL4h
	KTPwhYO1H9kFzLNy0wZbhOxO5zia4J65kGm4ySSX4S9gAXM2MkyBHiK69TZgBLx/
	bQXgr47mvfiwl+FjgyNCXpQ6TINGa5gcxzjZwkGjxE6isLcM2kq+az9KOl65zZza
	METULkhP26pkQLbJdLPnGxoF00QYs745uGg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk24cmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 02:26:28 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3ae17c536so2423003c88.0
        for <ath12k@lists.infradead.org>; Sun, 15 Nov 2026 18:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794795987; x=1795400787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fVrHYGVlMXC6b3VTkteHwcWoTiNql5FwArEDV+9ynw4=;
        b=LoGw/+F8jcXbl3t5ADFGChPQhcDjH2wfTkwDBlqcdmCqVbwg9qQyHi9Dsqi2SFIWOe
         4cwCfufXf6iJUqDjHfrPKE/0SBN1vnCs5V+Pb1IST4UlXq1fv5ekobZnr8Pn1x41LpdO
         T4DkAVewQbqvwwv7zhPH4GUITqvOXo25KbgNAAGfgRLDIxPm/5ovw3AqeFXIXGE2uqrC
         xwy43yi0K2Kn+UKpRgOrXAmv5houQjDoxkZ7RW4Ccah8Rl+I9dp/RbUQkUeQ8SKVRILk
         QSAJPUO4ZnpolgZobz/4TBL407Vm9tUQXr1zEREIGcEbO12Ikv1ZLZsPsX/h7TOzI0hq
         n7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795987; x=1795400787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVrHYGVlMXC6b3VTkteHwcWoTiNql5FwArEDV+9ynw4=;
        b=SThF8WaIWVU3xP/gJcDyCLAqzv7EZSZqRkPkRJFCQIyR0IokyNC7gvdVKeTbMLwH5Y
         L6YluQA0nCXhU4/i3BvWKgf7xLjLksq1FBGz4qXW2kWyHnkeliDkR97zlRQPbq0YYUrZ
         0RcsUN61+Je/LfogBkIkGtMRKIV1OmVr74lv3XzEl5Xn38Kt+lqfWEZX3ib6tqdqK78G
         EMizlrsVQ41X4GslsCWZsiiL4H/MWyR6PSsHwypq4k2vVyXmGqj2amQUFlMH+y3Bdgh3
         iabOqbnEtXwvhUZElOAQkIFFoyOTnj+QLastqLUWf72tZeSs//hvojpYAzd60i782FQh
         yz/A==
X-Gm-Message-State: APuU4Z/yeMjVZMzh5QhJUlzYg5oa0XCeKiRiV04R/7PQjlFi1MGxysOa
	pHhttdQf/6UlCPD9y/6/PvDDKDfQ+n55zqJSh6Kuj6qpM5IN1KP4r8wriz30YE/v4EtCTMppUyC
	vOtWtKoEkmppxJT3HHtt4jK95qmMZGp+iSqp963fbljHa51f0+x6b36P7tGqteszClUzvxM9Q
X-Gm-Gg: AYBFou1J/J56deKXwk0aKpSKfdqu4+MTRXAWdtvq8D6tE+MnHK6yzXEzv4IH4Y7pLfT
	9+k6nwBk8YL0O3oNwlt0Enyw3sOsXnF6mPCNdj8zjNQG1azGSmFUvPKRZvMK7TDbR8YymXdVGFR
	apG+CtU61h360abXBgU3EYFJkC1rlf8N3L/DYdfNnUlUS4xrww13Sh/KXk3/pWljQq0O5R2HbCK
	D1laSTSFGtm+IiryRb5ZE5hkow45onqekhJ5nnhBX/pEjmzazLStXksp0hCMIOD6ouIJnyiPkhU
	zyx84n/Eu/aWAzOAwknNqtMXR51ocfWIMiyNMLF3cVvD+omSbQ0Oz9qX9cIGZV1OJvS9SegDk5r
	6YpyWEMQ/vIXzKPWtDm86ulQavjvDQHR4RlLgDAh7Qk/Zp1H4x1qZy4oNGXXPkRmg8tg0SIu8T3
	KJV6qlO/nSS/O5tyo8mO3+IJVaoRKhU/wK6I1FTvOOSthx+JfjjX0h4//z59dzmL1mDEHVE7ADL
	E0=
X-Received: by 2002:a05:7022:5e05:b0:15b:afce:62c2 with SMTP id a92af1059eb24-1b50313d900mr10173129c88.41.1794795987089;
        Sun, 15 Nov 2026 18:26:27 -0800 (PST)
X-Received: by 2002:a05:7022:5e05:b0:15b:afce:62c2 with SMTP id a92af1059eb24-1b50313d900mr10173088c88.41.1794795986209;
        Sun, 15 Nov 2026 18:26:26 -0800 (PST)
Received: from hu-surapk-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031bc518sm25890675c88.15.2026.11.15.18.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:26:25 -0800 (PST)
From: Suraj P Kizhakkethil <suraj.kizhakkethil@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: Suraj P Kizhakkethil <suraj.kizhakkethil@oss.qualcomm.com>
Subject: [PATCH] .mailmap: add entries for Suraj P Kizhakkethil
Date: Mon, 16 Nov 2026 07:56:03 +0530
Message-Id: <20261116022603.58123-1-suraj.kizhakkethil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Wdq0LLAtMU0VpoGwJxalKpa3aVcYhp7U
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6afa69d4 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=sozttTNsAAAA:8
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=svCTMBYCAAAA:8 a=PxZ3Jr3rAAAA:8
 a=UoQb5AwVAAAA:8 a=wmhE9n2aV8QMZK8crdcA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22 a=lbQUARmhvTNeubMQCRFT:22 a=QSkXuXA7ws12Y4bPx1bm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAwOSBTYWx0ZWRfX/q3FdX6HQmMw
 LaQ2Qem0/agFjJ/5MrgMzBcvE0Pjq+RQOX4SYaapf5vwteBS3EcROZAo0IbEU3cU/MsrmqsoVBH
 +DB1dtB4/IvuIr48RIH3OsBkLdWitV4aqOSu2DmtAA5fQ7iSjOi7TKddth2QUzOz98ZEhTZX+nF
 l4qnE4Is/wWMlJXmTb8l1IvPUuOdNT6/mtpifZCnCgDWzDnaZ3fRUJUJidab/qsjK00pkt8hUHZ
 s33c6MaI68RBHWgTSeidBYuQ1RKROnRl9lYREhJhMFjFwcQXsrCJxfvdj63vnwRrPrHiaD94L0z
 uA6VxfabHhSe/4qXWW1z2SR8czNy6QbleIzId3UC/2lhh03jIRdsz42FuAQm2l8YutRcJW6uxGJ
 3qVzY3jOKGhgREKVyIGXY3c9Q/qLmjZ3Msz4Iv9Upot9JTeOX9qklpSe4X8NbdAn3DwM2b+eTZm
 UF7kdr495T+xsG0f9vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAwOSBTYWx0ZWRfXwS2PrXlAbN4H
 i1pkCubjnGzcE6iU0fc4BC3kFWFr+Bc5FF3+RIy7GeQYfNwIsKdIzv6BIgW2Mw5GrB4Bk/6XDlK
 w6VuIet2YII4AcXcoC0iz5ooBNuAF40=
X-Proofpoint-GUID: Wdq0LLAtMU0VpoGwJxalKpa3aVcYhp7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_182630_368922_5709E0B0 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Suraj P Kizhakkethil <suraj.kizhakkethil@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 5ab2cf568d3d..b145d59312b8 100644
--- a/.mailmap
+++ b/.mailmap
@@ -915,6 +915,7 @@ Sudeep Holla <sudeep.holla@kernel.org> <sudeep.holla@arm.com>
 Sumit Garg <sumit.garg@kernel.org> <sumit.garg@linaro.org>
 Sumit Semwal <sumit.semwal@ti.com>
 Surabhi Vishnoi <quic_svishnoi@quicinc.com> <svishnoi@codeaurora.org>
+Suraj P Kizhakkethil <suraj.kizhakkethil@oss.qualcomm.com> <quic_surapk@quicinc.com>
 Sven Eckelmann <sven@narfation.org> <seckelmann@datto.com>
 Sven Eckelmann <sven@narfation.org> <sven.eckelmann@gmx.de>
 Sven Eckelmann <sven@narfation.org> <sven.eckelmann@open-mesh.com>

base-commit: 983dbe9129e04693ee8905449fb757fa60cebc76
-- 
2.34.1


