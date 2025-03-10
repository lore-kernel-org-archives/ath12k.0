Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D1AC282EC
	for <ath12k@archiver.kernel.org>; Mon, 10 Mar 2025 14:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6+w3029kfHch5SeD/z0zur2K64cd98za9hhmN/ji0MY=; b=K7rR7bnzesXDMVHRarwCiucHSO
	68ENkUuEaMERgg2hhfd/eDoaWhQWPD5Tkahb0uHORwo/OdDKz4NWMnhk1cVmt1oKYkCgvRq62E1eB
	39gNlgJRDD82/1/aYL9TZcKY0P4Q+N8fhtvfkU80Ick/ZDZADwobk80MYbIhfA5CB0l2CaLUlunv/
	225BUVIPcXn2qWx6gqpJ4XZCEdLyojIVBAC0o31sDLrnhScqpb6aZXs9ccIf0u2PfilgIeqMHAmCH
	0J3YFgHZ4Pt7yj+U9aA9451BdpUkEdJ6BEwNfe+fu+bvv8FKzJrOYrFhCA1GlzZaVbTtvgOq5ElnF
	vtM4EfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treZf-000000033WZ-3rlY
	for ath12k@archiver.kernel.org;
	Mon, 10 Mar 2025 14:57:47 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trdBY-00000002nW7-1iV4
	for ath12k@lists.infradead.org;
	Mon, 10 Mar 2025 13:28:49 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so4323192e87.1
        for <ath12k@lists.infradead.org>; Mon, 10 Mar 2025 06:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1741613326; x=1742218126; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+w3029kfHch5SeD/z0zur2K64cd98za9hhmN/ji0MY=;
        b=Gesy4A6YXdIx56YG1aZAgeqCf65pZ+qLCLJhV9x27dgQsWt8sgGaVMxV/DYBeHTKAV
         jOl0kPs+mbA10GXHOK017iu8yKD8cdYyzkIyQnjFcpwPnexhTbX9SHkK+/li/+B3nE0n
         wSzyCLfuiM1bZhwsG1BMtDj1/gssx3y1XXEoDJuzFB3GEx1QO3UexVxb/tVeepHo1wFE
         dx9f1Zw9xiRfqzaMZhfyXA84w8qQi4DZNwjlwGPNbeymTKo4AWs7e0iW/uIrSwEH3A7J
         I1dyN2KPdqvqeHJd+/Hzh3mhWz57fHTG6KHpTvvcucVCXQxNZC2fAFaEE6g/wVwO+dTu
         olAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741613326; x=1742218126;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+w3029kfHch5SeD/z0zur2K64cd98za9hhmN/ji0MY=;
        b=rP4K2fdPprg4e+E5XSA1UOIKXIEShU7dvq/+nMzPV8506uVuXVImqpLfLCrehsKYzO
         xeKXf8nNu6LjTyQ3Jk7PBpY7al+xHSKW5I/oSHB42KIkf396czH5MZl2RlfzZwOOWdiZ
         VBscMnsCkFTUF22HJ/mD9SsldiDQ6WmXlqqJ5UVsdqkEOuDEguSGz+cZkKHYoapUR+1k
         Ic+2ZN+UeA9rOWAI0CvQ/NZfWjQsd3rPI/N3sbpfAj9W2+fodyGs9VK+eZ80sPCXK8e6
         gv/wcbuT7kO7i+l3zxJY2oZwUDO6dqx6N1u1vdjkS88I8rlF27BMNuOXeXC+8uAEgba2
         Ccag==
X-Gm-Message-State: AOJu0YyEjQPZaptI21K9fuzstEmA8be7Ug4921FSStQkNd3G78Qwqn6C
	COcd/xdKJP/zByUPl9PFvknBJ3llct6bmdG55ex54QMJCbNYM1BsjxQ9AXMCfn4=
X-Gm-Gg: ASbGncu6GTzaYDIm7AZSDGnf5cdpk4yxigTYhilU6uQ0ZV4SmcNzoMnMlHx41AhpB9U
	8jAErqlOlcb4Ybhhi/hyypbUnw90dmv/FLfKC5MmvBND1ZI0QvdsWmuE4Irw29Y3AXO3aVFlQeB
	ZaTVEXAfcNiyXRilas8n4RelzNEdqKBRKOiwZ05yc3+jsCw8kDJpF/x/9do4Z7dY3CSn+G0Paqy
	w94qH3jz3aW8E3t0lug/OK+GXGrUtkIKbN27MhzezwxKyeSd5OtThtRWOZ9HU5h7sQR9NzLmrx3
	HLqISiG0D+kRLGGgFvt3nNi4NEjnDWsmrkCB/9mOdouiaWw3IcsSUA==
X-Google-Smtp-Source: AGHT+IGIixTut4yqDWp69RPz6EjMMq4lD94Ez1yhsRnow6NgvTk6WmKPLFavYgOJC+xGczTQmaocLw==
X-Received: by 2002:a05:6512:1112:b0:549:5850:f275 with SMTP id 2adb3069b0e04-54990ec8e60mr4354451e87.50.1741613326121;
        Mon, 10 Mar 2025 06:28:46 -0700 (PDT)
Received: from [127.0.1.1] ([78.62.132.154])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1bcaecsm1460408e87.200.2025.03.10.06.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 06:28:45 -0700 (PDT)
From: Mantas Pucka <mantas@8devices.com>
Date: Mon, 10 Mar 2025 15:28:18 +0200
Subject: [PATCH ath-next] wifi: ath12k: limit WMI_SCAN_CHAN_LIST_CMDID
 argument size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-limit-wmi-chanlist-v1-1-8f0fb45459a7@8devices.com>
X-B4-Tracking: v=1; b=H4sIAPHozmcC/x2MSwqEMBAFryK9tiGJ+MGriIuMtvpAM0MSHEG8u
 9FNQVG8d1IQDwnUZid52RHwdUl0ntGwWDcLY0xORplSFVrxig2R/xv46StCZF0Pn2Y0ibaiNPx
 5mXC8px3ZuLCTI1J/XTfUqQSebgAAAA==
X-Change-ID: 20250310-limit-wmi-chanlist-17cb8d27cba6
To: ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mantas Pucka <mantas@8devices.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_062848_465456_8A7AD579 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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

When using BDF with both 5GHz and 6GHz bands enabled on QCN9274, interface
fails to start. It happens because FW fails to process
WMI_SCAN_CHAN_LIST_CMDID with argument size >2048, resulting in a command
timeout. The current code allows splitting channel list across multiple WMI
commands but uses WMI max_msg_len (4096) as chunk size, which is still too
large.

Fix this by limiting the number of channels sent at once, using the value
specified in WMI interface description [1].

[1] https://git.codelinaro.org/clo/qsdk/platform/vendor/qcom-opensource/wlan/fw-api/-/blob/NHSS.QSDK.13.0.0.6/fw/wmi_unified.h#L6459

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Mantas Pucka <mantas@8devices.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 3 +++
 drivers/net/wireless/ath/ath12k/wmi.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 6d1ea5f3a791b09044191ce86f4897b7f06f35eb..88ac800d44401a139de75e90568c8d68f3ed4f3f 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2780,6 +2780,9 @@ int ath12k_wmi_send_scan_chan_list_cmd(struct ath12k *ar,
 		max_chan_limit = (wmi->wmi_ab->max_msg_len[ar->pdev_idx] - len) /
 			sizeof(*chan_info);
 
+		if (max_chan_limit > WMI_MAX_NUM_CHAN_PER_WMI_CMD)
+			max_chan_limit = WMI_MAX_NUM_CHAN_PER_WMI_CMD;
+
 		num_send_chans = min(arg->nallchans, max_chan_limit);
 
 		arg->nallchans -= num_send_chans;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 1ba33e30ddd279e21a57a1db6150e1d08f4a2890..2831f7e3033c7f4a9886577f542c5026f1bada28 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3909,6 +3909,8 @@ struct wmi_stop_scan_cmd {
 	__le32 pdev_id;
 } __packed;
 
+#define WMI_MAX_NUM_CHAN_PER_WMI_CMD	58
+
 struct ath12k_wmi_scan_chan_list_arg {
 	u32 pdev_id;
 	u16 nallchans;

---
base-commit: 42aa76e608ca845c98e79f9e23af0bdb07b2eb1d
change-id: 20250310-limit-wmi-chanlist-17cb8d27cba6

Best regards,
-- 
Mantas Pucka <mantas@8devices.com>


