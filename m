Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3FF606A31C
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 11:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wgE+yr5z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxpBaLeN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=POVXBINIjtay3B3IQVKcen/EZ7XVUhcPPfdW9Ywiirg=; b=wgE+yr5z03p0Wv
	Wf38JJ/Fa7dJICw2WYkdIPbsRESD7lReBZ0XOw+2zQUYHEBrDXh43pnyOt96/JyTZyrPQ10WWPlu6
	Bb0sO6UiulHiSdBY/Sl94BJKSmkNx4wQmkM7PBCPhP1NvPxd5G20gh8FX2Oll09mb+15IR43/K6iP
	BYtOqLXeHIpdcouhxm5fjQJN0/FtH0Jz9zKXtWZb9EjdlbC+DFThatSrI4gp8GpUcaJtO0kLFAtHg
	j6qZNU5bjscPRIhvW83RC8+ojDk+l72XxA2Eqe1Oh3WaUGT3sPSOyjf0QeyepcVQs4zu/ftK50yv9
	2+iTfOc3KA8iaSPrRWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSYd-00000009bTR-3pLk;
	Thu, 12 Nov 2026 11:01:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSYa-00000009bRl-1hn2
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 11:01:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso43478715e9.1
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 03:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481286; x=1795086086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POVXBINIjtay3B3IQVKcen/EZ7XVUhcPPfdW9Ywiirg=;
        b=bxpBaLeNTUjw4d0MdKprmCHSXJmbuSSCm2HpG9nFVGJJ+zB8D3LUeeymaE5DLBGAzg
         8N5wf4Xtv1y1jWfAm2hYAVmDZhvF8ay98GQ+HzCkrPi/UFbQHstKhvdyfLXjhNMw2umR
         rJS7IidaqtQWG4MwMBLDllK7/2Z0KDZBbXuEWXPyvgTCBnfrBxeqKC074SysSAVLgTXp
         K4wFw1D1DMiAcfkvWJ/mS3iv0gfa5AuN//OwmUn29oMn7V5NincqsfFHJJ0CDSyuPlNN
         I8OaaCqoW322X2ldv8Lk8PIcifovK0K6WqgG4atY+RBH4Y05h5jtTWFEhLXayew+3UsW
         h+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481286; x=1795086086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=POVXBINIjtay3B3IQVKcen/EZ7XVUhcPPfdW9Ywiirg=;
        b=cx4IkAaTlD2wT1vJz8jxSjBidMSiVp2mba2K5tjOWCikRLTSJBrZRFC4cM2ygHvN/F
         yGmllMTeoHDNyJtNUftxGm4p7oFSVuRhM2PP5u8R5etpXwqM/wUS9jutyVyyGaYLRWeb
         LFx2NWoVy6vahxnJElONHMRw/VGHtGM0EkdmM5382varaOlJY3K8xpugLP7mO2XDcqDG
         NurMKnUPd5wTNbI30bQ+7BqsFLyW37DoSc2AvvM+ZZqs82BA2VNm1iI/8xJf8Y9DHJrG
         6JbMEuyxMGw4rGndn3Aaj/xVbQTmhedDc6Qelc3kYC9oDajVyz2Eu8FuSaWEpGSkssUm
         sOaw==
X-Forwarded-Encrypted: i=1; AL+hErEb4yBfbOGw485ntyGQjDS8ozv7PqnUPzISdCRhJDmOpgnnUlyP5yFyIhRsnGIS+SnvVy5h5mo=@lists.infradead.org
X-Gm-Message-State: APuU4Z+k6qraxaj+DITBWBFG70juXnNwb27RdbFpEhuaSaodE17hpb3b
	roQOQ2xhfHQdBWl07dUkB3APcwWhZzWFwJ+oBanM8ufA/4gCL0yf7Gno
X-Gm-Gg: AYBFou12/o0zInkIRbzDwckCmYciaEvVHjmVMIE/Ly+nrz4JsH5fHhMWAI/LG79OEtb
	7Ul8ooK5w1CzmTWjuKKrKk2KhVsLbH3rtTmITOlSxqSrRays4PpdGGcVBJgA3P8vghLoZCfld2k
	23a7A+M9alXmuld9JYdf5KjZYlN7mnRm5I/19idJEfAUC28Fzahhzi/n5cU6P0ixd5qWNHU4Oud
	qdYSjvOuhcSN8oRnQq2m6wPy4k6f57XqvvnY4zD9gNFuxG6z2UGLCCfi7AIuqqYBnathzj0wl2I
	JeYPCxFdpplZy0RN+pcX053UF7W+mjpL5f7l9B+0rYUt1d53BkPu3JCx7qneMQGmdYpZTIppgm/
	1ZM1TfjDRi6WUmFkPgPsEwrrb5CilXPsRAPv26sQb5+Xn158sc2xx6jWL+LtM63OLSrM60QbP7d
	KynmqHyxpTC3QJiWkWdi0HatAYNEpHQ33duoP2byCotAg9YfF2gWPyjQV8BsY78GlMPnLA488dN
	nqUQfqLRphvtUn7hTFBZowYjzsPIwJ0G3Zq/U/m8w46eJOS059N5c9j5AwPvZUZpB8AjyjIeyYE
	Tu/K+2tNJtrZk4Nvpac2m/Qw1KIT2jBroWtTEXaw0/MUNlX3UZZM6Kl7KRYcq43rrS6BD9/sqDI
	OaQ==
X-Received: by 2002:a05:600d:82e4:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4ba093cd6d3mr118257905e9.31.1794481286017;
        Thu, 12 Nov 2026 03:01:26 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm58546125e9.14.2026.11.12.03.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:01:25 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] wifi: ath12k: do not wait in resume for a reset that cannot finish there
Date: Thu, 12 Nov 2026 13:00:06 +0200
Message-ID: <20261112110008.1229-3-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261112110008.1229-1-tvlad744@gmail.com>
References: <20261112110008.1229-1-tvlad744@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_030129_298387_E1819413 
X-CRM114-Status: GOOD (  13.04  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_core_resume() waits up to 20 s for restart_completed. When the
firmware crashes during the cold boot started by
ath12k_core_resume_early(), ath12k_core_reset() powers MHI down, which
destroys the MHI channel devices, and up again. The driver core does
not probe the new devices before the system resume is over
(device_block_probing()), so QMI cannot come up and the restart cannot
complete while ath12k_core_resume() is waiting for it:

  mhi mhi0: Wait for device to enter SBL or Mission mode
  ath12k_wifi7_pci 0000:01:00.0: timeout while waiting for restart complete
  ath12k_wifi7_pci 0000:01:00.0: failed to resume core: -110
  ath12k_wifi7_pci 0000:01:00.0: PM: dpm_run_callback(): pci_pm_resume returns -110
  PM: suspend exit
  ath12k_wifi7_pci 0000:01:00.0: fw_version 0x10097fff ...

The resume takes 20 s longer and fails.

Let ath12k_core_resume() go on as soon as a reset starts during the
resume. The restart then completes after the resume, as it does for a
crash at any other time.

Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 6 ++++++
 drivers/net/wireless/ath/ath12k/core.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 42a9cd28c652..b1d1247a0dc6 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -224,6 +224,7 @@ int ath12k_core_resume_early(struct ath12k_base *ab)
 		return ret;
 
 	reinit_completion(&ab->restart_completed);
+	WRITE_ONCE(ab->resuming, true);
 	ret = ath12k_hif_power_up(ab);
 	if (ret)
 		ath12k_warn(ab, "failed to power up hif during resume: %d\n", ret);
@@ -243,6 +244,7 @@ int ath12k_core_resume(struct ath12k_base *ab)
 
 	time_left = wait_for_completion_timeout(&ab->restart_completed,
 						ATH12K_RESET_TIMEOUT_HZ);
+	WRITE_ONCE(ab->resuming, false);
 	if (time_left == 0) {
 		ath12k_warn(ab, "timeout while waiting for restart complete");
 		return -ETIMEDOUT;
@@ -1727,6 +1729,10 @@ static void ath12k_core_reset(struct work_struct *work)
 	int reset_count, fail_cont_count, i;
 	long time_left;
 
+	/* The new MHI devices are probed only after the system resume */
+	if (READ_ONCE(ab->resuming))
+		complete(&ab->restart_completed);
+
 	if (!(test_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags))) {
 		ath12k_warn(ab, "ignore reset dev flags 0x%lx\n", ab->dev_flags);
 		return;
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3a92a4b03359..2d8d91afb66f 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1072,6 +1072,7 @@ struct ath12k_base {
 	atomic_t reset_count;
 	atomic_t recovery_count;
 	bool is_reset;
+	bool resuming;
 	struct completion reset_complete;
 	/* continuous recovery fail count */
 	atomic_t fail_cont_count;
-- 
2.43.0


