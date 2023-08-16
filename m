Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13F8C001E0
	for <ath12k@archiver.kernel.org>; Wed, 16 Aug 2023 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tZzS8ez9iQXFa1yWQ+XJp23hUBP+yaruQEg7BL7TLrw=; b=lGdHwYGwZQvmjR
	J1lokz3M6R/jLIzlIg36/MuKj11uw6DX8RvZU7QbyXnpZwobmR2gWxORkepL/1Uf0WukQmaoqrIgE
	EY4TR9M+rO4r1NhJv/Pz+9PVcKMe7qaMXxVP7JIQznuVcZjWMOj1Yrui5oQZi69b79MeoC5BhRmCg
	RxuGXkTAl6wPzpzc3mT2pcbzfOhUB8XTrDH4JSKJxztQn2ElGwQM4HT24/IEi5HAnKH58uJJIXC2f
	3pqg1pgqfXqE0avTVsXYnixVbPMDPrSwSX58gN7dbazIns3izGZ9Y74rVeeVp3ZcIUmFYlDWpM9Pg
	KrxD9haIJgGybLJgETfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWGE6-004DFd-25
	for ath12k@archiver.kernel.org;
	Wed, 16 Aug 2023 13:06:18 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWGE3-004DDQ-1M
	for ath12k@lists.infradead.org;
	Wed, 16 Aug 2023 13:06:18 +0000
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RQpHJ1YPfzVjsD;
	Wed, 16 Aug 2023 21:03:56 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 16 Aug
 2023 21:06:01 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <kvalo@kernel.org>, <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	<yuehaibing@huawei.com>
Subject: [PATCH] wifi: ath12k: Remove unused declarations
Date: Wed, 16 Aug 2023 21:05:50 +0800
Message-ID: <20230816130550.50896-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_060615_969466_A4AD0944 
X-CRM114-Status: UNSURE (   6.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Commit d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
declared but never implemented these, remove it.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/ath12k/ce.h   | 3 ---
 drivers/net/wireless/ath/ath12k/core.h | 1 -
 drivers/net/wireless/ath/ath12k/qmi.h  | 2 --
 drivers/net/wireless/ath/ath12k/wmi.h  | 2 --
 4 files changed, 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index 17cf16235e0b..79af3b6159f1 100644
--- a/drivers/net/wireless/ath/ath12k/ce.h
+++ b/drivers/net/wireless/ath/ath12k/ce.h
@@ -176,9 +176,6 @@ int ath12k_ce_alloc_pipes(struct ath12k_base *ab);
 void ath12k_ce_free_pipes(struct ath12k_base *ab);
 int ath12k_ce_get_attr_flags(struct ath12k_base *ab, int ce_id);
 void ath12k_ce_poll_send_completed(struct ath12k_base *ab, u8 pipe_id);
-int ath12k_ce_map_service_to_pipe(struct ath12k_base *ab, u16 service_id,
-				  u8 *ul_pipe, u8 *dl_pipe);
-int ath12k_ce_attr_attach(struct ath12k_base *ab);
 void ath12k_ce_get_shadow_config(struct ath12k_base *ab,
 				 u32 **shadow_cfg, u32 *shadow_cfg_len);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 4389ff40b49d..d873b573dac6 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -788,7 +788,6 @@ int ath12k_core_fetch_board_data_api_1(struct ath12k_base *ab,
 int ath12k_core_fetch_bdf(struct ath12k_base *ath12k,
 			  struct ath12k_board_data *bd);
 void ath12k_core_free_bdf(struct ath12k_base *ab, struct ath12k_board_data *bd);
-int ath12k_core_check_dt(struct ath12k_base *ath12k);
 
 void ath12k_core_halt(struct ath12k *ar);
 int ath12k_core_resume(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index df76149c49f5..15944f5f33ab 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -562,8 +562,6 @@ struct qmi_wlanfw_wlan_cfg_resp_msg_v01 {
 int ath12k_qmi_firmware_start(struct ath12k_base *ab,
 			      u32 mode);
 void ath12k_qmi_firmware_stop(struct ath12k_base *ab);
-void ath12k_qmi_event_work(struct work_struct *work);
-void ath12k_qmi_msg_recv_work(struct work_struct *work);
 void ath12k_qmi_deinit_service(struct ath12k_base *ab);
 int ath12k_qmi_init_service(struct ath12k_base *ab);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 8c047a9623f9..c75a6fa1f7e0 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4855,8 +4855,6 @@ int ath12k_wmi_vdev_install_key(struct ath12k *ar,
 				struct wmi_vdev_install_key_arg *arg);
 int ath12k_wmi_pdev_bss_chan_info_request(struct ath12k *ar,
 					  enum wmi_bss_chan_info_req_type type);
-int ath12k_wmi_send_stats_request_cmd(struct ath12k *ar, u32 stats_id,
-				      u32 vdev_id, u32 pdev_id);
 int ath12k_wmi_send_pdev_temperature_cmd(struct ath12k *ar);
 int ath12k_wmi_send_peer_flush_tids_cmd(struct ath12k *ar,
 					u8 peer_addr[ETH_ALEN],
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
