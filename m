Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509A0606A321
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 16:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uAhWRrRc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=I/oLrLsK;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iXwnYJ5f;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gwngQgrp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=uAhWRrRcMnsKQ1
	C/Mm736A9+UPdppNVzmzngy+3FiybGIW3sQNh4vCvoQQ0yQ2nPxZ/cuD1QJVnJpDNWU1bwjHa2MNJ
	OQTERkTOt66hyTDXdrM5Djh7S9Goe1lRJyrHepYZNqE1b59D+mzlR6QdErgw/F/gKHsVsFBvXwqBc
	lCCDturFFPQF/7MHmlbEiwd2tM4REFiRccBTYrMcMTm/0DxhTquuAfLbGOaxRmq0hp2ai3BEnUvs7
	q7/vzmCnsSIiQcCyQYNecW00mP4XE/eYxPadvfho7G2FmGtluQgiRxRxhOH6q5RQ7wWp1Ic7Ry2Hl
	K/RdD1jhWb4yuSc5GVMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtd7-000000079rZ-4C2d;
	Tue, 24 Nov 2026 16:44:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtd7-000000079q4-0kYG
	for ath12k@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=I/oLrLsKCJTl7R8oc7lVEP1XgI
	bfoTnj8UJsqCzQAR8QSupFdzJySDVnP/3jAKqXmtuq8GO7KX8b14JOcHRC8TC8l5Y2jnaz0vkzHk0
	/8fsm6mQ3XeaFUSzPPtNEbuG96sPt/1ArYa71OFvgwXDsJ2ibKfYWQW7Q1KT5a1/cw8mO9ZI+nhxI
	/sc5U8L0Nb9SuchHsqIg3sBOXllnuBhgAL5ingUH9QT0diAvFL4jCeqIWhKLhEYpeKMkGSlSYiXOj
	3e/3lj7G/67gnxE6JHRoy5iyH6HPUyqZGJTuR4ny8dYCk8FvhyJuJ+W4Lkp1wOFcSJptixA+fiSq6
	pHN2rKEg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtd3-00000009Cen-3okk
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 16:44:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL3jE700060
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=; b=iXwnYJ5fW9xOmc+g
	7aXFmwPg/z5qHfsqTJt3QKfvtf5geKOF4Hjp4kZrPtqRdGHL1c/uw6pySXrhFq6L
	gFOPW98tSyYWj86I8kqjdfMMqNWRl1TGXCpTBUXzZ55hMPsCfDGEfAG8rNcSleAi
	Lfe+pnyy1kIeDk7ElD+WzxC1C4mE3Wk/GnKG9qJ69f981dT8lqfJxGkGfxVq62dK
	oIswBrUR6p7V63fKlQQMPkMyeiyIYQfRk+NO4BUVmNe+2aHM4WMAtJIHOlMCWTcW
	452W2WbZFRp4qNIPhgT9kbaFeTDWeHqtnhwnE8RdBKqUnDfgKAY7xDjN7uL8c9vl
	WZES7Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f46yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386c3309469so910248eec.0
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 08:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538663; x=1796143463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=gwngQgrpJwGL1fru39BZPeD8wXfDOqrv56msmu7OCSZHjw6TJ/XNdMG/Kj5PG0mOWU
         WH/JjIAnNWlDyhh7fKhyAmn1bbN9wBYVcKEjMwa/MF+E/SYN2IoP7/kotUGqjOIZBiku
         Bo/Qo4Tn76Jb4f18ZMu5ZMUd3mOM+Nc0ioH5q97XVuQe17Fw6AWGFmn1WK+8tlHdTJsM
         B8qLjYBiDfZnhpKp7+QWmpbJ3MgjcNSVtUwtjIkZqy0yzARU4pANUYWR6mT7qilmQCXn
         6L6jT7Jfv1D4nXXIY6PP+9sm3XWXIplOLY9Skmx4rTY/Cs9CPwkH9x6j43gSAsMefLQ2
         Byvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538663; x=1796143463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO7c9o0yG0Z1EDbhW+OqM/Ij43hLdl7lNBk4x9MT9E8=;
        b=pC+MmqTfxf2kl0Bqvr7/8CpzCtpmihrOzuOO7DML5g0E2S1ELnWj2Ca3cAl0yHt9XM
         M5qpYusLt4pxAxSbNXhBCfu/MTfCXor9NMJxDyworwgwysjZhXe6jJazEOHSEUr6qJrM
         1T4zZzGD2je+hjtT0m2v5jonA0Ha7I2fk+gl+ZhdU19lKf0z/j4Zw9zba3a5ThYJOe/C
         b4wdTP7NM0HNS8it9Sm6GzLaQJl3F6AL9A4f4t2mvDGVRXpQ+BoAybIEHMZbPutygXUq
         zsCittTfQkuIZouPzBXTOJjAcKRFBkh3aQRG7DlodUTvdpav4VDnxrrX6JIiFw+MwXTr
         Jd7Q==
X-Forwarded-Encrypted: i=1; AL+hErEspwzzMjlCsCzAAdmIuLObtVYJz/fFVdYP+4/QH+m3jD2gQpXm+fbio3axibw66uPXD9yWmSk=@lists.infradead.org
X-Gm-Message-State: APuU4Z9WRUHad0IxP6BPMHRMA14yhv0A6+P7KTxHpvu0V1x6lWazPpOm
	p/wBjhkkSomAeaHiJt7/u5DBGv0Vyh0yCCcUC5McDylEzX5xfUHInu6C1nu6hySpGNL3gxt1JDl
	bz0b98QKwp5aeE/m2KGZuRz4jfzOf9V6j1GmPt0PdYEkvRxURyExO6pnGXvkLPgW6
X-Gm-Gg: AZFdTZfk8M80FL1foF3ZZLiaR4mIGMYLVJCtQRfNLQrxiq/zgAXBKyy8iGpxGAsleYD
	YWI8rDZarO3kfRHDiXyHFUSvdmBeWx7h40ViZ2rKvBdYILXM0ptmIriNgh4C8YHs+af8x5+ShgT
	TtlfMHURyEEK5Kcv9vn7+biNHzHAN6HP8Tc9Mnb3nDnPAD3/U7NSnHFt0s8pRqNjotdyLKWkC1b
	aWtheTixtTCAIvB3x6RBNWsSUL2V1EBzph1vkf7zPT+X5yYnep/RtIlajIL7lU5ogWD5UDfgcl+
	77g/6PIL/4TKPTWwtGd6m2B5Y8tSpiXgRB/HgVg2Y8A4Buzh7VAtuXqUHx/J2smCF2QZlCXGjp5
	cbje7Dws9oJxEhwtRO18b7g7t1HrGO0VBv+VzeGHoK74RakFbbDum+xlAHkivzyu9rP9oImDZXu
	ee1SGXRee5CBFugN3RXIJbXyGk+nJPzcuHjtFkvn0WFBxX/ZDn2j59AAursY4I3sV96iU8XT3Lt
	AY=
X-Received: by 2002:a05:693c:20c6:10b0:36a:15ee:c20e with SMTP id 5a478bee46e88-3869a150409mr12781548eec.33.1795538663029;
        Tue, 24 Nov 2026 08:44:23 -0800 (PST)
X-Received: by 2002:a05:693c:20c6:10b0:36a:15ee:c20e with SMTP id 5a478bee46e88-3869a150409mr12781515eec.33.1795538662394;
        Tue, 24 Nov 2026 08:44:22 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:35 +0530
Subject: [PATCH ath-next v4 09/14] wifi: ath12k: add Wi-Fi 8 MHI config for
 QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-9-1f5b87ece6a3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX/vP1TwnaGXfm
 DDaoXrN9GuD6uFaPc9SCKjF3RhCuqWSvIFRMMOPqoQDp+RcnEgsC+DGWZ+4+yl2pcfoozObffBV
 LWKRK/2WB06bxhXN0kGq9gBNMhD8fHs=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b05bee7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FOB8LY2opcXQ8BbJJMkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Ld27zgMywp1HwDHlbDGDSMtf-NL0TPCn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX+8Czhv8cNGOY
 z8Y+x0XtptX7iYsEGNcC1DorY7TkPvmtEd59sqEjtlkjy6UI9StaOQ2VbkffribJWVr4TJf0bNu
 XxPH+Lhgw9OAQHI+HlYkisw94owwXRd5DS3/DC8EUKZ5Fp6CkFSzoti6J0+11OwUUSuMmidFEZT
 YtaOm7jxCE7YVKcCq1vTZX0FRFPvYz1sgY11SLbFULuxCiHeoZ3uz4zwXgKXIldCxlQP2bhMtzg
 5ob5HM7r5UOYujbLHgsHiXNV+nHOfIllV3WF4bJs22OSidetNUt5P76PYg0u7BwbAchkLE2hKbY
 1VuRcmDfcNX8l5qMSUrt43qZYEdXPk81ZhFx8R5hwrQJwgb7d5y69NLlnQxcnsXRLCU31dAUjub
 JwJR2TNe1TuV0TeVeq9cXlYN5VnIffEJWtwTnKnvo++RaY17LZ/2+IHGZDBvNjI9MMKK5gA8Um9
 qy0ny0V3y79CfHtGJkg==
X-Proofpoint-ORIG-GUID: Ld27zgMywp1HwDHlbDGDSMtf-NL0TPCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_164426_479810_CFDFB5E5 
X-CRM114-Status: GOOD (  17.18  )
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

Implement the MHI controller configuration for QCN9575.

Add ath12k_wifi8_mhi_config_qcn9575 with IPCR channels 20 and 21 and
control and data event rings in wifi8/mhi.c, and export it through
wifi8/mhi.h. Update the QCN9575 hw params entry to use
ath12k_wifi8_mhi_config_qcn9575. Build wifi8/mhi.c from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/mhi.c    | 70 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/mhi.h    | 10 ++++
 4 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index b1b90c109c76..051c6447d35c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -4,4 +4,5 @@ ath12k_wifi8-y += core.o \
 		  hal.o \
 		  hal_qcn9575.o \
 		  hw.o \
+		  mhi.o \
 		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index bffd1081fd2f..428d6b2b4418 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -13,6 +13,7 @@
 #include "../mhi.h"
 #include "hal.h"
 #include "hw.h"
+#include "mhi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -64,7 +65,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.num_tcl_banks = 0,
 		.max_tx_ring = 0,
 
-		.mhi_config = NULL,
+		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
 		.wmi_init = NULL,
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.c b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
new file mode 100644
index 000000000000..04eb1f1650c3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../mhi.h"
+#include "mhi.h"
+
+static const struct mhi_channel_config ath12k_wifi8_mhi_channels_qcn9575[] = {
+	{
+		.num = 20,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+	{
+		.num = 21,
+		.name = "IPCR",
+		.num_elements = 32,
+		.event_ring = 1,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = 0x4,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+	},
+};
+
+static struct mhi_event_config ath12k_wifi8_mhi_events_qcn9575[] = {
+	{
+		.num_elements = 32,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.data_type = MHI_ER_CTRL,
+		.mode = MHI_DB_BRST_DISABLE,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+	{
+		.num_elements = 256,
+		.irq_moderation_ms = 1,
+		.irq = 2,
+		.mode = MHI_DB_BRST_DISABLE,
+		.priority = 1,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
+};
+
+const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575 = {
+	.max_channels = 30,
+	.timeout_ms = 10000,
+	.use_bounce_buf = false,
+	.buf_len = 0,
+	.num_channels = ARRAY_SIZE(ath12k_wifi8_mhi_channels_qcn9575),
+	.ch_cfg = ath12k_wifi8_mhi_channels_qcn9575,
+	.num_events = ARRAY_SIZE(ath12k_wifi8_mhi_events_qcn9575),
+	.event_cfg = ath12k_wifi8_mhi_events_qcn9575,
+};
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/mhi.h b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
new file mode 100644
index 000000000000..7a229ea378d2
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/mhi.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _ATH12K_WIFI8_MHI_H
+#define _ATH12K_WIFI8_MHI_H
+
+extern const struct mhi_controller_config ath12k_wifi8_mhi_config_qcn9575;
+#endif /* _ATH12K_WIFI8_MHI_H */

-- 
2.34.1


