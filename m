Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6485606B242
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GMBTG+aW;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YjHh/NWS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I3wFSh9t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=GMBTG+aWOHHhiW
	3N4sMcg2o/V4SFRZlyFu2WaPsKjGHrwuZ80QbC+1Jt0rfMi2n/c6R1DQA/jfHHgQyhL+i9t/h67jF
	FjgbQ/q/sx5Ivjh2Yo8ZJyR6ePv0PpGpVVVZhsP9RoEUU/WwyyYBUmXduVLWMHQdeOwTMYKQ7w9Ss
	W4nyS8ZcpoPKloP1yG+JAYWTTnFJNbAEfuDr8NZ8uCEM+g3Z6pqyejSNIMiY7/OzN3noyVCETwd4a
	wXjDxEZHOOM4Z5zx4hrZ6eYfsCcMD+fkNJ1UzkOJI+rR1vsHQ15qrfAtIpx/ZD6GevTUsxHg2SNqV
	alVktqvPXiHVl7RxHVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQKz-00000009BFx-3XhR;
	Thu, 12 Nov 2026 08:39:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQFO-000000098ZL-3eMp
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 08:34:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZkIK904025
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=YjHh/NWSxVqpHQQX
	6O/19nLrWv3JzxjaKQ0N4A59qitzmX81mdV3g+XWNi9RGD1YURuekKgBGU4WkqL8
	msqEpZX+c/3dJiiuXE5nFUCrEInIP47NEqeLviLLpiUSdK84OOqKvcDS4SSvKPIC
	uvHBIsoGQkRTZQVeNbz/rNJuyqWPlfbLjnCpIH9NJhjLZy3sCiFwlB1DOIWkXgFx
	TvpSx85jDMwU7WfKwmX/7b/eSyIp6ykyeV7kUUU7R8AHYdJm2JJ3s5MJGJWKlq6D
	q/N71X7zNwRC7RNkn/9NZr8P5G3Wf+WZDMNj+yX31xHhCCN7ds7WrS8oB6hWFChu
	QdMDpw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1ubr60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:33:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso146943a91.1
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 00:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472410; x=1795077210; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=I3wFSh9tXpQKq69cnE8k8ivKnMnL7zJ6N+w0+m1oh3zx+0agtsglC82mofpKl56/H4
         vkYwTpE/PwXmUfRxhxcVY+V9oUhw1SHiZT3dOU5lLm002+rK9Lc1yHnOfQhzc/uwDVbi
         E/haec1I9XQaGV1EKmn6hzJJtPf3yzkPWL9ucUF0mg29RR4EAADLf2XEHYy0y1Il0OP/
         WtVNELyNNqxOkxuYHpHMx4lBgCChbSGnsFwwL3p8OVi17p607p92ZETxdVAtdZNTP6kX
         T5dIYk1GN6t3uPHABtG53v3lGNqY2GBT0fWFv6T45045Xo9D9SbXobAYzAZXygiYKdpA
         JBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472410; x=1795077210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=cUxDUo+kqqAU6lgpGhEauxhaaYD5g+oqWl/dj1xa/KyR0Ck8Gvh0E42Gj55cBinFI9
         mzzlChecqoMAuzglREvRYmf9gEFUj7S5TV2bCVJNI7svpC+Vnsu1wJ3HOSkGhvLp45X5
         NJZqgpdPAJJfivzIuKh1QYVB0PROfVk4LnaUJWp1502+44XERDrYJbN1mjPrsrPlwUUw
         1puTdfaslJpxyQmhCzVITzhuE/F90eciB7+rElu3EAD53kGuCDd5ypGWUABG1hkQjwOs
         ZNPrniahTYQ9zNrbUxZJEerj+TdcYPsehxgGvmfHoq25dvlFnmn3CdwdHDrmC0RwMd8r
         Xu3w==
X-Forwarded-Encrypted: i=1; AL+hErEuwIbWg+lE6QohT857w74HxZZoew+8/SQHrXnwRCYn3v2ynFTObOclTy19+ynadioPEybn9hw=@lists.infradead.org
X-Gm-Message-State: APuU4Z9lgDs6Tsty+Meb9gVYzBf2HTzAGHn5nhb9aXtbj0BELmMtqMVe
	H362xbCwsnoiR+ObRecze7l1XBSAjTxdC/ad8DZUs3yFSIHr/zBlB273KI1zRjAGR8n6B9mDcyx
	hYENwcgvHK+9J15nfbTqY8RHjlPKa0qbwF257N8EhgupZ+DVDpojJRab0zslYFvWC
X-Gm-Gg: AYBFou2sQSnJd6p8Xznc3GhmEbFTYdst9wibs0XtwjHYSZR+IkKSlYYPM441ql6uJNv
	2+wh2pVOyFqnxHNOPxczGcxH/iyKoxiaSR+AEElDICyx5t8GNhhr0pIZ5YKrJjEvxXwXYR9ynu1
	BQetA3+/xlL9Qk3LfKtsbvgkke31jfl+0jIlZWM1VUh0n8oCnFHWWnw89CPtatQdu52xEnUgTmv
	nVDmnsNh3vTR+Qo93pbFjrvKCce6yNahsOEs1q6cgPD1jR6+23utV+T9IlyvBDnLBROgqwRq7Tc
	XMO9ZXPxFluo7hr/4zJveBe2jM3TSS2LXiKNrdrehCvxGceoJYA7/S8hRm1D+8LD5PmqqG+NHql
	+PoRDILQaliEU5esSeEZPp8+UJcwOIXHq1vZ3ZBVQNvLuxkE8yJTPuL1dgWojKfVjE/XEFVKquI
	fBluDOxvkyaIHbJ0zcBET6GI85D2mKhaq8M2xZOJZM7NCApBe9qRfD+9UuHnlayaUuyir/fjr2y
	Q==
X-Received: by 2002:a17:90b:1e47:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3b182e030a6mr4671810a91.7.1794472409298;
        Thu, 12 Nov 2026 00:33:29 -0800 (PST)
X-Received: by 2002:a17:90b:1e47:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3b182e030a6mr4671784a91.7.1794472408781;
        Thu, 12 Nov 2026 00:33:28 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:28 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:26 +0530
Subject: [PATCH ath-next 12/15] wifi: ath12k: add Wi-Fi 8 WMI init for
 QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-12-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX6N6/eDDaz5Wd
 o4N7kKt3cD5hyV8MroEBqqXethZEUIRk16sMQizMQ3s33NTNHz4IymPtFYNyXsorzjzEgVF0YQl
 Yfab6IsNk0TaXBPHRADpC+RqmNbAa5I=
X-Proofpoint-GUID: 8SdIrQRaMrAbWSqP4qshvtuvFimjSS-9
X-Proofpoint-ORIG-GUID: 8SdIrQRaMrAbWSqP4qshvtuvFimjSS-9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX9/A8FcwQcCZD
 4/XFPRggINjAIknQxym3ov1UlZixU55v2+CUqYxkKbDmYfiQXP9nrzvTxS62jt++eYzI5BvkuFT
 IRauoGOHrBIZQ8Kqqo2B/pBCs1hKB/RekDeUBeK941jvAsXphB+oaDSqA+ghCmNkSw5Zwh3Q2S6
 XWmimiUsY0YNcpJCs/QVdkszuVGZOvQdsPm7bbbO0hCcnL/SYcVNBPiYCLhGOuGUfzKchIOITdu
 xYHoCOXrTQZExlj8ZXEKKNeAfAuGB9EDgn4zYits5YfPzKb1G5yfYFWJLHEYTpZ5xm4igdjZzBy
 B4z0P6Zx3sdXPpkCydjLmBbQWjYOph+93l1yuo8ogfuHTRqEw/Ap1oXorFJ72oYkLICMWY2L34u
 WELCYovs6sMPKGzGJr9Da86PNjqi3XevbulqpCEYymrISKzfxBt5pB7LDP1rZ4A+xNf+QegNhDD
 00AumQ307RR62ZJMnhw==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af579da cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Fa-mINMYIZ2DnWK0-L0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_003331_013256_40797197 
X-CRM114-Status: GOOD (  18.73  )
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

Implement the WMI resource configuration for QCN9575.

Add ath12k_wifi8_wmi_init_qcn9575() in wifi8/wmi.c to populate the WMI
resource configuration struct used during firmware initialization, setting
vdev and peer counts, RF TX/RX chain masks, scan and power-save limits, EMA
and TWT parameters, and peer metadata version. Set the QCN9575 hw params
wmi_init pointer to ath12k_wifi8_wmi_init_qcn9575 and build wifi8/wmi.c
from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h           |  2 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c    | 57 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h    | 13 ++++++
 5 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 96776c6e2050..b8045b33ca0d 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -77,6 +77,8 @@
 #define TARGET_DMA_BURST_SIZE		1
 #define TARGET_RX_BATCHMODE		1
 #define TARGET_EMA_MAX_PROFILE_PERIOD	8
+/* host supports peer map v3 and unmap v2 */
+#define TARGET_PEER_MAP_UNMAP_VERSION	0x32
 
 #define ATH12K_HW_DEFAULT_QUEUE		0
 #define ATH12K_HW_MAX_QUEUES		4
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 3717b00741fd..989e640c7b41 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -6,4 +6,5 @@ ath12k_wifi8-y += ce.o \
 		  hal_qcn9575.o \
 		  hw.o \
 		  mhi.o \
-		  pci.o
+		  pci.o \
+		  wmi.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index fa64b865b931..74873fc5f3f3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -16,6 +16,7 @@
 #include "hal.h"
 #include "hw.h"
 #include "mhi.h"
+#include "wmi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -70,7 +71,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 
 		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
-		.wmi_init = NULL,
+		.wmi_init = ath12k_wifi8_wmi_init_qcn9575,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.c b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
new file mode 100644
index 000000000000..c575cae2582d
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../core.h"
+#include "wmi.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config)
+{
+	config->num_vdevs = ab->num_radios * TARGET_NUM_VDEVS(ab);
+	config->num_peers = ab->num_radios *
+		ath12k_core_get_max_peers_per_radio(ab);
+	config->num_offload_peers = TARGET_NUM_OFFLD_PEERS;
+	config->num_offload_reorder_buffs = TARGET_NUM_OFFLD_REORDER_BUFFS;
+	config->num_peer_keys = TARGET_NUM_PEER_KEYS;
+	config->ast_skid_limit = TARGET_AST_SKID_LIMIT;
+	config->tx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_timeout_pri[0] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
+
+	if (test_bit(ATH12K_FLAG_RAW_MODE, &ab->dev_flags))
+		config->rx_decap_mode = TARGET_DECAP_MODE_RAW;
+	else
+		config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
+
+	config->scan_max_pending_req = TARGET_SCAN_MAX_PENDING_REQS;
+	config->bmiss_offload_max_vdev = TARGET_BMISS_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_vdev = TARGET_ROAM_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_ap_profiles = TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES;
+	config->num_mcast_groups = TARGET_NUM_MCAST_GROUPS;
+	config->num_mcast_table_elems = TARGET_NUM_MCAST_TABLE_ELEMS;
+	config->mcast2ucast_mode = TARGET_MCAST2UCAST_MODE;
+	config->tx_dbg_log_size = TARGET_TX_DBG_LOG_SIZE;
+	config->num_wds_entries = TARGET_NUM_WDS_ENTRIES;
+	config->dma_burst_size = TARGET_DMA_BURST_SIZE;
+	config->rx_skip_defrag_timeout_dup_detection_check =
+		TARGET_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK;
+	config->vow_config = TARGET_VOW_CONFIG;
+	config->gtk_offload_max_vdev = TARGET_GTK_OFFLOAD_MAX_VDEV;
+	config->num_msdu_desc = TARGET_NUM_MSDU_DESC;
+	config->beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
+	config->rx_batchmode = TARGET_RX_BATCHMODE;
+	config->peer_map_unmap_version = TARGET_PEER_MAP_UNMAP_VERSION;
+	config->twt_ap_pdev_count = ab->num_radios;
+	config->twt_ap_sta_count = 1000;
+	config->ema_max_vap_cnt = ab->num_radios;
+	config->ema_max_profile_period = TARGET_EMA_MAX_PROFILE_PERIOD;
+	config->beacon_tx_offload_max_vdev += config->ema_max_vap_cnt;
+
+	if (test_bit(WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT, ab->wmi_ab.svc_map))
+		config->peer_metadata_ver = ATH12K_PEER_METADATA_V1B;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.h b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
new file mode 100644
index 000000000000..a66ede369ba3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_WMI_H
+#define ATH12K_WIFI8_WMI_H
+
+#include "../core.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config);
+#endif

-- 
2.34.1


