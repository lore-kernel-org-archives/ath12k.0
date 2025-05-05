Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF885C3ABBE
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 01:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8TvJ0Um51beSi3XHa/YVkRVzCrY+ieJtaledzNnJKo=; b=SOo0XYBS/KBleTfbq4RhNOy5Pw
	i2y8iBPqis46+hzkkoCc73hN0N6ceWh9v9Zs+UMUNUM+xtbJu5rh3O7r13b3KLh16knpMxrhjP/ch
	qoy3yck+clh8M82XcqFmdCMWwyD0vVmwSdfDFdS61U4CKcJNeBW6xEq5ZZByVRVGGed4vj55+iRj3
	auE0TJjtg5isk2HShR+DzeZ+RMuWWo43HZNpSExYpRSH3dNEKOoCusVB3HV6q/04FJdASPRrV+U/C
	bUSMBBqhvRcxWweL6W8XYXWzvfGUcn6BHPDHvshTEEliMRN17wZ47ZcI2CXxZ+zWP5D7vrGTqE0eQ
	ZwbxO/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7TF-00000009bln-2d5i;
	Tue, 06 May 2025 01:51:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4bL-00000008rjO-0KCi
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 22:47:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C1C57A4D0A2;
	Mon,  5 May 2025 22:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07123C4CEE4;
	Mon,  5 May 2025 22:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485274;
	bh=DriiC+jigrAkqE9YIrsDXI5AvQJgjGi1697ipqfGh1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PKpRzBohfS/aTLnFGutW/4mICdFPCU8I6w8/PiGUeprX7MY0ZpTm0jVHhvfcFmDUb
	 YLFo8AFOvWY2A/ohwCnoXlEaV64blS7XyCPFHM3OYd+f0yY8yUi/ntYg2kSyMDQufJ
	 KROrL+c20bGcMir4xi62CSocAJcwPpf0vjKksLz4i/3iv3r1IJg9wU35qJ8kWmvaNj
	 aEcD1QRJaCxBYp2D5uLx45QYDhdmQz46k/IK9kAs7OinqY2sdIbIDGXSJgTDsJql9K
	 HWd+xHlhJM0TlmAR4/fK98yMa842dL7ciBM22N8sB42Bb8AuQQyUNPuOYrtcjPOdyL
	 ttUk+WHrW/z0Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>,
	Roopni Devanathan <quic_rdevanat@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 247/486] wifi: ath12k: Improve BSS discovery with hidden SSID in 6 GHz band
Date: Mon,  5 May 2025 18:35:23 -0400
Message-Id: <20250505223922.2682012-247-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154755_253167_01798B42 
X-CRM114-Status: GOOD (  13.61  )
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

From: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>

[ Upstream commit 27d38bdfd416f4db70e09c3bef3b030c86fd235a ]

Currently, sometimes, the station is unable to identify the configured
AP SSID in its scan results when the AP is not broadcasting its name
publicly and has a hidden SSID.

Currently, channel dwell time for an ath12k station is 30 ms. Sometimes,
station can send broadcast probe request to AP close to the end of dwell
time. In some of these cases, before AP sends a response to the received
probe request, the dwell time on the station side would come to an end.
So, the station will move to scan next channel and will not be able to
acknowledge the unicast probe response.

Resolve this issue by increasing station's channel dwell time to 70 ms,
so that the it remains on the same channel for a longer period. This
would increase the station's chance of receiving probe response from the
AP. The station will then send a response acknowledgment back to the AP,
thus leading to successful scan and BSS discovery.

With an increased dwell time, scan would take longer than it takes now.
But, this fix is an improvement for hidden SSID scan issue.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Link: https://patch.msgid.link/20250207060005.153835-1-quic_rdevanat@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index a6ba97949440e..30836a09d5506 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2206,8 +2206,8 @@ void ath12k_wmi_start_scan_init(struct ath12k *ar,
 	arg->dwell_time_active = 50;
 	arg->dwell_time_active_2g = 0;
 	arg->dwell_time_passive = 150;
-	arg->dwell_time_active_6g = 40;
-	arg->dwell_time_passive_6g = 30;
+	arg->dwell_time_active_6g = 70;
+	arg->dwell_time_passive_6g = 70;
 	arg->min_rest_time = 50;
 	arg->max_rest_time = 500;
 	arg->repeat_probe_time = 0;
-- 
2.39.5


