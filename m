Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9F4606A326
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pVmkYMlf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=aJSqScDP;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mgsz5mts;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ez2Zls4j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=pVmkYMlf6ox6/Q
	fRK4JTfwrM7x09D2xzGgmlqaJ6hE/XF3YsLOZEAE9O19NSl+qiWs0Ti8K4mmU6JHADDw1giJlj5+k
	mA5sBbcPOoVUMVa+RbYtDML8WLp0lGwctCMAYRypE4OO9lx/GJyCSSCNcj0E65wu3goV/g3k1Md9I
	WTT5ooS6QTfeZXJYfZyHiLYqw+KbYlz3ePYiCy7MSY/Ainas+QDocz7/EKD9fzMLfnK1DbubRDdJW
	/+LzRZrYgA/NCWuxXwdSTGzXMtmGw991EpB302rpTNmV+YXx6BLPD4hIMsh+LHfTOe6ECGFWxESBQ
	mJkrYAv8Gy+Kv1cbt8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtcv-000000079dF-43Sx;
	Tue, 24 Nov 2026 16:44:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtct-000000079b5-0AkY
	for ath12k@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=aJSqScDPTO/msGpGXWLEUgPENC
	YxmeDqv96fNGA1RHUSaq3GXOfjEw/YoUyxyfYdLipwnPsmdpxykJq8jHDpFZmoXmi+GxcYl33ixFa
	+1QY5RC9MERE6MCrj8TMfFCLTVmhxHYqivAKlFqzTiB8UzQ9ih4t/ZXGi+/m4W0MPeehjjPDzbysH
	40ajO9tKvTQYoVZsD+4GIGjyjSHlzBYbk3ENSWr1WAev1o+jXQfAxPCI0w4bdww9YI6R1p3WsnkeC
	bcvPO/EaQFwiOkJ4PVFEUbO29SPlMjTGpx0L6ewgz/P8S1xA7QO5sVKyX5CtxGIxLYlISvLw6o/B/
	A0lULSiQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtco-00000009CHw-3K4J
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 16:44:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL3qU700045
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=; b=Mgsz5mtsbM/YV7L8
	vevAtQYJmK3evPgUU75EUO/zGexMQvfuhN2MPiDhUc4p4Hqq1yy2NJUSioln4enh
	NKkslAnb7JvPFqr/b/B6cvLeCY/1oQYi7py+DDD9QfkeUr4n/qsQoU6zXx23iJ1d
	p69m73mKlZA9wMXFrSeW8MSx8jtaLq26V/bZ2KnONenwcTQoSCRcnODhfFCCoLTa
	aKrdj+t0T8e6wdJCUCBEi1p4jFPcFqi19Fo6zlBw6eaa921mxdsbfyYKbryPYWGH
	plGNxf6nhVnkf5UOcxDFXpXnWRXyz3LKIfRlKH5afB+Bw8S+I2E7lpVvXYQdOnl9
	znefFw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f46xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so12382137eec.1
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 08:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538648; x=1796143448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=Ez2Zls4jWGaaxyc+BVJl23l7t5QJ4rV5TlWgcRCUXa8G+fnvha8Rw6v1HxmwXlgWb8
         wLiFpE8Rftr1gClGEAGigVGAaWawBuDun56dqQH7ENR7eeX9UaP57DyjxsV48gWsmdsu
         2DyC4XoJWaeK+xELJYwOWyxHcxH+422Xd5EaUuKmMdTDXZYurRpPKIVfbSe2Qp5dcvw3
         GTVZZpbFPuAXyAwa2rPEc+gNJor3kvfxX4UHkuMek1xjxnqZYLcCn6GvRvKyvc8LP/4o
         uaYWTJNfg0C8WD7PyDR0KvDQ2zTPta0jgaJk/kvdJ7Ms4d5mxDaSQOKA9A0j9Uqo1y5E
         j1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538648; x=1796143448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gVImVKSYwlu0y9iYIfF4tE463YxrNVJDP1PpJFp4zg=;
        b=sC+5BeamvwlCuTNy47S+uhKCWU9ZJorUzqYg8v380HyXsz8aaNJK4LLWaArUM1m/dv
         G6I46YA882MOyUeuSvPf6u879m3jKXYqLQU5pinv/12BHZQM7PpJx7GHOhQtRpTRRQdt
         4aHbgBS5xcv2NdzoPDv5vhf68ZQIbqeQkO/a5eXd96lTty5dqyz1O/ghXFOlVHTbrhyT
         WxPlrgOfY9MnIAW+cNzbfMWxahckV6pN9trP4MKgNH6U1IoKXcwkLFrrYBTsw/GhSWUI
         IPy5Ovg+qcwraotxKYE71Ts/oCNXoHf5925CMv45SAHnojbGkQTZiPUqEjTucCkYFSi3
         QIeg==
X-Forwarded-Encrypted: i=1; AL+hErHng+SksnE1nz6P0YjINUmSxRLGcPSEWNJV6iePe0D0UcQboEvrdhGvT2X8yzFkrNFqsinWRTM=@lists.infradead.org
X-Gm-Message-State: APuU4Z9Z+KbzvSHl4mMVLh+wqIu/Bs4PFg0CEGhVCbvviLkpBxfKlUzd
	r9j5f0wILQCsv0/m/s0CJf0YSaoxLiUr9d8MjcxYBUH58iuxFXFveabZPthJv72Fgut1cfLRCGc
	2hLgufPYM1GADMwAAtdG2QRKGAkWOnSJWuKP8Wjm9zbz3tzuOl6q73SnX28FjuLNw
X-Gm-Gg: AZFdTZdXMMjzX+GdUDcdvJCkgXczK8JswQ0U2yVrgSf8CIuSYzTz/bDPB/zHm6GdPRY
	MkEBrZHfxoh/D5s6nGf2DvvvkwfvCn6+SeeTIYATGrl3XED6vlTtoIrSa2Vs0LTpLCsSTByMki+
	K5ccWPnhgTfucYZpEp2f3+B0N5XmDS1htwDA+3D2FiQkzdoKKwW8oiBhGArQz5qezxTgEgx7Ex8
	kG/5n1qJaGBpsF14uFBlCJ8ydCwbR6K7x7ZP7YbsNG0hhQWjypUfyCN3MILNlYgwpUS3rUUJU62
	J76b4I722rNBB4XHWlrFLvVX4Z11bLwGs3pKWVp/Eko+wWfL+aDReSFYcDBVLm22HQh5GsvK4P0
	AqgB/f6BFebYmimB0YZB63qO0T/EjVvsoaZEe1y5fS5otpYpf/kSrGHz8z7vS/rI6DEcvUT0a51
	qgx22De+JxNL6JB/t5WaxJEEoicLZM6eVMXz2AeAMU7n885APHrRJ0vFYAlIAa6n7f+Ql7G9t1n
	Lw=
X-Received: by 2002:a05:7301:dd94:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3856f559cfemr15111453eec.30.1795538647904;
        Tue, 24 Nov 2026 08:44:07 -0800 (PST)
X-Received: by 2002:a05:7301:dd94:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3856f559cfemr15111421eec.30.1795538647325;
        Tue, 24 Nov 2026 08:44:07 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:07 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:32 +0530
Subject: [PATCH ath-next v4 06/14] wifi: ath12k: add Wi-Fi 8 HAL register
 table and hal init hook for QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-6-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX0cn2CmylKZWx
 h6zLzwaEsnIAHRInibOhfA84Ks/iUPT9j/llAx6ll3uDi+e29CR2+kTNR67HtBNwW/WRMgHjI6a
 h386bat6vJyILFG5IbHZTutyTO1YMXw=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b05bed8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=k5nCMmGC1qFvne7xG5UA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: IgcdrrDZjCI-vpILv8_Ony0bDCbabmVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXzO4QLPk2UrLS
 YB0vpgrK9cD4qdqfcE1tsK969EY9G/tqV/jvX4nhP3Ar6zKcshzEbIJq4X7d8uBCD1tJ4zxtLIb
 brfpYwxtbL0ssl+Tga2DA2G+yER5sRv35lSNS9Z5o/dHmKNr4POtmuQlBCQBxkP/0EeIFGQN7LK
 UkFwh2IYBe2kbX8ds0ajghddcXAwYmK34HF9PjRvlcGXyX6btrmDf/pmP04fyGZWQ/2+XuY91+o
 R9ZAo/xUilgJNKxdhZNA5XFJwZyYw7s+6KWtNQPNC5PXLJQ/+oH2q/xaQqdc23+o6yU4G4tG2zI
 N4KOivHpZWPvJlmbWUnok0gvkLVjngMGvcQ9MgOJIaouL/8812gBlx4VTzuIl/Si8jdhAq/2Qy8
 KKsWygTCf9wFOpryfd3ClIVJjz6Xs4+B5vFOzNia1UrM0NDi+ysJ0bsAIUnMcHAbvsPoL486aTz
 iDqQxYQ/gAHva3hbG8w==
X-Proofpoint-ORIG-GUID: IgcdrrDZjCI-vpILv8_Ony0bDCbabmVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_164411_223677_55944973 
X-CRM114-Status: GOOD (  18.40  )
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

QCN9575 uses a different HAL register layout from Wi-Fi 7 and requires a
dedicated register table and HAL init path. Add QCN9575-specific HAL
register definitions in wifi8/hal_qcn9575.c (qcn9575_regs) and its
header.  Add wifi8/hal.c with an ath12k_hw_version_map entry that points
ATH12K_HW_QCN9575_HW20 to qcn9575_regs, and introduce
ath12k_wifi8_hal_init(). Invoke ath12k_wifi8_hal_init() from
ath12k_wifi8_hw_init() so HAL setup is hooked into the Wi-Fi 8 hardware
init path. Keep HAL ops and params fields as NULL placeholders;
follow-up patches fill operation tables and remaining HAL parameters.
Update wifi8/Makefile to build hal.c and hal_qcn9575.c.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile     |  2 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 23 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 13 +++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    | 42 ++++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    | 13 +++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         |  3 ++
 6 files changed, 96 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 277b5f13754d..b1b90c109c76 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
 ath12k_wifi8-y += core.o \
+		  hal.o \
+		  hal_qcn9575.o \
 		  hw.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.c b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
new file mode 100644
index 000000000000..1afc6fc21d0f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include "../hal.h"
+#include "../hif.h"
+#include "hal.h"
+#include "hal_qcn9575.h"
+
+static const struct ath12k_hw_version_map ath12k_wifi8_hw_ver_map[] = {
+	[ATH12K_HW_QCN9575_HW20] = {
+		.hw_regs = &qcn9575_regs,
+	},
+};
+
+void ath12k_wifi8_hal_init(struct ath12k_base *ab)
+{
+	struct ath12k_hal *hal = &ab->hal;
+
+	memset(hal, 0, sizeof(*hal));
+
+	hal->regs = ath12k_wifi8_hw_ver_map[ab->hw_rev].hw_regs;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
new file mode 100644
index 000000000000..311fc5b8015c
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HAL_H
+#define ATH12K_WIFI8_HAL_H
+
+#include "../core.h"
+
+void ath12k_wifi8_hal_init(struct ath12k_base *ab);
+
+#endif /* ATH12K_WIFI8_HAL_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
new file mode 100644
index 000000000000..56d45785ecd4
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include "hal_qcn9575.h"
+
+const struct ath12k_hw_regs qcn9575_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.tcl1_ring_id = 0x00001604,
+	.tcl1_ring_misc = 0x0000160c,
+	.tcl1_ring_tp_addr_lsb = 0x00001618,
+	.tcl1_ring_tp_addr_msb = 0x0000161c,
+	.tcl1_ring_consumer_int_setup_ix0 = 0x0000162c,
+	.tcl1_ring_consumer_int_setup_ix1 = 0x00001630,
+	.tcl1_ring_msi1_base_lsb = 0x00001644,
+	.tcl1_ring_msi1_base_msb = 0x00001648,
+	.tcl1_ring_msi1_data = 0x0000164c,
+	.tcl1_ring_base_lsb = 0x000015fc,
+	.tcl1_ring_base_msb = 0x00001600,
+
+	/* REO DEST ring address */
+	.reo1_ring_base_lsb = 0x00000848,
+	.reo1_ring_base_msb = 0x0000084c,
+	.reo1_ring_id = 0x00000850,
+	.reo1_ring_misc = 0x00000858,
+	.reo1_ring_hp_addr_lsb = 0x0000085c,
+	.reo1_ring_hp_addr_msb = 0x00000860,
+	.reo1_ring_producer_int_setup = 0x0000086c,
+	.reo1_ring_msi1_base_lsb = 0x00000890,
+	.reo1_ring_msi1_base_msb = 0x00000894,
+	.reo1_ring_msi1_data = 0x00000898,
+
+	/* CE base address */
+	.umac_ce0_src_reg_base = 0x01b80000,
+	.umac_ce0_dest_reg_base = 0x01b81000,
+	.umac_ce1_src_reg_base = 0x01b82000,
+	.umac_ce1_dest_reg_base = 0x01b83000,
+
+	.gcc_gcc_pcie_hot_rst = 0x1e38438,
+
+	.qrtr_node_id = 0x01e03300,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
new file mode 100644
index 000000000000..e2dd68ebd82f
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9575.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_HAL_QCN9575_H
+#define ATH12K_WIFI8_HAL_QCN9575_H
+
+#include "../hal.h"
+
+extern const struct ath12k_hw_regs qcn9575_regs;
+
+#endif /* ATH12K_WIFI8_HAL_QCN9575_H */
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 6e89a42111b6..91d8f762e642 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -11,6 +11,7 @@
 #include "../debug.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "hal.h"
 #include "hw.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
@@ -129,6 +130,8 @@ int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 
 	ab->hw_params = hw_params;
 
+	ath12k_wifi8_hal_init(ab);
+
 	ath12k_info(ab, "Wi-Fi 8 Hardware name: %s\n", ab->hw_params->name);
 
 	return 0;

-- 
2.34.1


