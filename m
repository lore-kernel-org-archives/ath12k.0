Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38933D116F5
	for <ath12k@archiver.kernel.org>; Mon,  1 Dec 2025 12:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YC6FU3llCYxXh4VP04XbK7i9763mHcc9u/o//Iu96T4=; b=u+4J/KhC6REIdTRZAwNlORQE4V
	Yj2YQseiOBcdboQusj9AmINglkQbcUSf57JYjh0sGIjZQJXxRDRK9hpeQiQ/H3YW6l7RHkpwrewqa
	T+rWo6TNaW93aJ20lEQpk/l+6/XG9gP8UdIy4RELZpSmSeuXyZmv9OHYgoOChuPzo705wTggx5pcR
	Hcr2EkOJfUFMz2ZJ0xlCepanzv72vFmEtvmLYP9BJlHjJ0Jw5h/fK1AiC+hQiTolPLeI/0j2eAXsH
	0B6UDLXjYsqhuCK5nRVJN4TOpRktCYce/4YYuuWOw06kzg8Dlr1X12NblrOmSdBjpQEx+nk6GU+0X
	h8qoN8gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3Fh-00000003Zuj-3hDE;
	Mon, 01 Dec 2025 12:43:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3Fe-00000003ZsG-2zcU
	for ath12k@lists.infradead.org;
	Mon, 01 Dec 2025 12:43:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18gY313433214
	for <ath12k@lists.infradead.org>; Mon, 1 Dec 2025 12:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YC6FU3llCYxXh4VP04XbK7i9763mHcc9u/o//Iu96T4=; b=jmGcLuQjx1kSOQH8
	znVK1DJ4FY7Ci3owB8HJ6D2/pr8V281Yz1rCRbBrV2Wwk8ACe/Dc0ecc1XTa/yfQ
	qym6y+ByyrSi6k26VkLVYCp5FiHut7QKKR/Gi8xqmnubfwpuX86qUuoaZbhrS6t+
	+qmG6VfiIMvR8cFDX2EN6GSLIut0wO105sE12uxhad+lQKSRQABpBYPb4ZFa0GlT
	C4tFosIk3SsU7ljWUXllkYcKmvpSUd6CXq476tsEg2z0hsY2IjTSYmalJD+VllcX
	EpExd0XSH8AJzeKCvRP07ilxzjB7XGfYlwxcJXvTVLApdMUx2hXnrlDp0fazZyuP
	LCSW0g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as7re0nk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Dec 2025 12:43:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso7587423a91.1
        for <ath12k@lists.infradead.org>; Mon, 01 Dec 2025 04:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764593013; x=1765197813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YC6FU3llCYxXh4VP04XbK7i9763mHcc9u/o//Iu96T4=;
        b=D06vFa+vJSlZ+wZZa/WKU9cDZNaA7gpb3CnUmFR5/cXUBBsIy4ZpUajYnOG1RkY3Zf
         R0pkNRnzarVIQcKwrCe7zwxoC0mvaQH+Y4YGrA//BqxRa+zpgi8/9j+ZMlnFBJWICcs/
         wl99u3YdvhzwLAkiLHZvFcSkGynwUh2ysEbQQx5xZpRlGBH8Sr8xrzEyLJbnuwmQFf69
         /bsrTghwSc2yC3HNM96/Ro4z77A91jLYU6y5ChidEkg7ZDXAaCdH7EFvROEuoj/DcmTe
         ZE3c8uhFkM3yJuw82A/XkNqurWFhD4gzHLnCFq7ZBweBH1RkTSOi0yE23c9A1imjHrbN
         EoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593013; x=1765197813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YC6FU3llCYxXh4VP04XbK7i9763mHcc9u/o//Iu96T4=;
        b=TdGYh3WeGEjbaHji9x9IO6gbhLopYki2fqAKKwJU3B9t6iXUA1s15W0LDklsPLP/sk
         oAFbryASc1HiNSLgwdnkyy+5vjbcueu8xkOT2aN8K7es+Y0FMJfIix3n1gpxTeZgk06w
         DT3/Eii02Dt2euIlHBEzNCkvuoCJVpm9CA4/YL3AIPsxbKBr8tLXe41h0c4h5gmw0RcO
         YkdYiezLSBe45NYntSV8/3372OHtofLSe9yYd5ourptjc4dUG1I8YlbImTp+J3AVUVdr
         26uvR/7JaibZZ0tGAX3p+GI3zfei52iIc2Ax21rL/oPLPmkRQh6GSWilKPavv+Noapoa
         KEbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdnzUkUrRcpTZa2FcH3fnATdGtWu20blIChsoQqpHGBdQGvC1cPxWs50HHYG8UvbUWAuQy5Lg=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa88dGG2qg/6PRVlJA3DrEtvo7f+NWDfprJjnfWllSqIJKK08S
	fPrtax/2X+Dqtuh5NrQKesSJzRRjfQyA+TPpZn5CKJ5vEBozdNzRX6hNTcZMGIDgD5qkpUsfjRz
	meDGCcFDK/Fh2l0Z9pIGlRyqU/ekHFM9jWARxPx6valWqrPRJa8iZ/MNw/vTiv7aI
X-Gm-Gg: ASbGnctDLGwy8XpOZMWkZlWDnbp74gLIOLMFkNzAdu7pmPGN9fqkHNMc8IJbv/rcuJ0
	jvXE+rpLL6eijzy1RfvpcUGBnkbu49a0SwybGD6bAxsvMgYAvLNxNTIS9awNamMkcLzm/b44YGi
	iHtLhGMdib2XLFOYA92lasXRfwB49wnRCL5E3sFxmhdVKG5y/5SNc0C0Y43Vhn2Hzk/AOqHoSGX
	ZsflKlRRuSa5fz0Rfxp8VegdatmZec9xboGYXDEv5Nl0VTrnw+S7mFi+VDrv2Qp8wxV57LM7H3U
	I6H9nbHHF4bCdxD+ncRJb9X4+4fHCZBcMRpTpNK5kEDu2zAEbGUMN2rvSHf7wsCdUkl98r7nu4s
	Vw9Ftzzl3pFU6K/mVEa4mM5hH/mm/GzgOUUgiPgiqIE0N
X-Received: by 2002:a17:90b:57cf:b0:340:5c27:a096 with SMTP id 98e67ed59e1d1-34733e55262mr35347999a91.6.1764593013365;
        Mon, 01 Dec 2025 04:43:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElgDjDJHW2YDf+PAwc9iRI3ntCUsGwfUffpxrfbB3ePkiBM/khpNTD20UCrGFmP3x4X6p7TA==
X-Received: by 2002:a17:90b:57cf:b0:340:5c27:a096 with SMTP id 98e67ed59e1d1-34733e55262mr35347954a91.6.1764593012680;
        Mon, 01 Dec 2025 04:43:32 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b733381sm13146374a91.12.2025.12.01.04.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:43:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 01 Dec 2025 18:13:17 +0530
Subject: [PATCH 1/4] bus: mhi: Replace controller runtime_get/put callbacks
 with direct PM runtime APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-mhi_runtimepm-v1-1-fab94399ca75@oss.qualcomm.com>
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
In-Reply-To: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593001; l=4834;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=O1bfb49f81nWjSwl16Z6OQyKyPquLUwL1wCzDbmKlZQ=;
 b=yLM+3VZeO3i0vzTYNib15uacoRstISgcmAjNZBsE2uImwB5USfI0sbF6aT/yYbSsn9pqrY/4E
 WgFlDNvcU6+DI+bVnaoIPTkVXI/EG9ShgxobuhrFdniiGsg71jFlRYz
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: uz1zN3wM9dMERHtekZj7j43h80H5DXnD
X-Proofpoint-ORIG-GUID: uz1zN3wM9dMERHtekZj7j43h80H5DXnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfX2w9U+PaXLES5
 QoKl00G1If776h95SP2UZWcMfIV74ICM95YGGNY8DHdbvSgHM6V8wUcG2uYi1Hiv32Ur/5G8CUb
 e9RMzajqKIM4KIqNzUxv3MZTeirMXNGKwKasYG6ZUAvJGhvUfiOjq+sqq7+qs382daY8fBfp6xo
 b6dJNDhwmiVC3EQOE/zCBl9APZy2zMsR4kAIx/Lk/wjQC1DRkv8zbwYeGoYkGPRv+0JwdbMgt28
 vSSxnA5fLcnpSCZBo31jufqQmlWQyUm8nOiCOEYp3CiTsfyc+bI6y/esJUFhOKhkAqNp3JoOCV2
 lInQv4bdclGMSqasYS4yYB8qaPql0Mu0vFT+wIWeDpCjMdWyiyMrZqRvT4pyR+2Ngqjhr4Vee/n
 9hA4wJDAoCue5qlBVdUUJn3sjIRZxw==
X-Authority-Analysis: v=2.4 cv=BOa+bVQG c=1 sm=1 tr=0 ts=692d8d76 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-vyvwYMTLgQEoxk1dJgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_044334_767679_70149A13 
X-CRM114-Status: GOOD (  15.16  )
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

Replace usage of runtime_get() and runtime_put() function pointers in
the MHI core with direct calls to the pm_runtime APIs. As the controller
drivers were not doing more than calling the PM runtime APIs in these
callbacks.

This refactoring simplifies the runtime PM handling and removes the need
for drivers to provide no-op or duplicate implementations of these ops.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/init.c     |  1 -
 drivers/bus/mhi/host/internal.h |  7 +++++--
 drivers/bus/mhi/host/main.c     | 19 ++++++++++++-------
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 099be8dd190078af4ca12cd7a1de739572feca9d..5b22808fd543f9febcaa9ea623101d2d5d05b040 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -938,7 +938,6 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	int ret, i;
 
 	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->regs ||
-	    !mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
 	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
 	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs ||
 	    !mhi_cntrl->irq || !mhi_cntrl->reg_len)
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 7937bb1f742ca8033c17a01f5cffbf103330f51f..61e03298e898e6dd02d2a977cddc4c87b21e3a6c 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -7,6 +7,8 @@
 #ifndef _MHI_INT_H
 #define _MHI_INT_H
 
+#include <linux/pm_runtime.h>
+
 #include "../common.h"
 
 extern const struct bus_type mhi_bus_type;
@@ -353,8 +355,9 @@ static inline bool mhi_is_active(struct mhi_controller *mhi_cntrl)
 static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
 {
 	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
-	mhi_cntrl->runtime_get(mhi_cntrl);
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 }
 
 /* Register access methods */
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 8615512743199a59a58c3756d9cc3407079cee7e..7ac1162a0a81ae11245a2bbd9bf6fd6c0f86fbc1 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -661,7 +661,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 			if (mhi_chan->dir == DMA_TO_DEVICE) {
 				atomic_dec(&mhi_cntrl->pending_pkts);
 				/* Release the reference got from mhi_queue() */
-				mhi_cntrl->runtime_put(mhi_cntrl);
+				pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+				pm_runtime_put(mhi_cntrl->cntrl_dev);
 			}
 
 			/*
@@ -1155,7 +1156,7 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	 * for host->device buffer, balanced put is done on buffer completion
 	 * for device->host buffer, balanced put is after ringing the DB
 	 */
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	/* Assert dev_wake (to exit/prevent M1/M2)*/
 	mhi_cntrl->wake_toggle(mhi_cntrl);
@@ -1166,8 +1167,10 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
 		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
 
-	if (dir == DMA_FROM_DEVICE)
-		mhi_cntrl->runtime_put(mhi_cntrl);
+	if (dir == DMA_FROM_DEVICE) {
+		pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+		pm_runtime_put(mhi_cntrl->cntrl_dev);
+	}
 
 	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
 
@@ -1374,7 +1377,7 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
 	if (ret)
 		return ret;
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	reinit_completion(&mhi_chan->completion);
 	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
@@ -1405,7 +1408,8 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 
 	trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, TPS("Updated"));
 exit_channel_update:
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 	mhi_device_put(mhi_cntrl->mhi_dev);
 
 	return ret;
@@ -1591,7 +1595,8 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
 		if (mhi_chan->dir == DMA_TO_DEVICE) {
 			atomic_dec(&mhi_cntrl->pending_pkts);
 			/* Release the reference got from mhi_queue() */
-			mhi_cntrl->runtime_put(mhi_cntrl);
+			pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+			pm_runtime_put(mhi_cntrl->cntrl_dev);
 		}
 
 		if (!buf_info->pre_mapped)

-- 
2.34.1


