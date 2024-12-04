Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C109CE77172
	for <ath12k@archiver.kernel.org>; Wed,  4 Dec 2024 17:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJsXLk62X2hBA1BCrecuvyVXLgiafaiuSNjKL5ABB7o=; b=kYIKZWJcWovFnRyeysWQoIqG7A
	yPqyirdnH33l1yC3u4EG6JOQfugPIklkAnV91Fw2hpmGlUSGDe8+tEcbGcOCOo+rhmVfsorsYxZyL
	JOjgeY5kZGwavlG0hjW+I/vwqzOVoSWmuf/T60yTq2nb/1lGmQBwfUXeEjhGuEoXEi1ZDaNwsTI7I
	zyxxuX1mfsJct+F9l4Qokf8Hqnzw3lLM3wuhXK7huQX7d9nwnczwritjbqZJOHotcXPN+bbasLjIp
	1rpm9jhddUO187IbCi6qxyVGOhoWprLGqlti7EIf0Z+b0hrpGkJP86cEGblfMY4wSmqmO2JKjkkqo
	p3cAH0Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tItPv-0000000DPf0-2HTs
	for ath12k@archiver.kernel.org;
	Wed, 04 Dec 2024 17:44:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsId-0000000DCUN-35ud
	for ath12k@bombadil.infradead.org;
	Wed, 04 Dec 2024 16:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZJsXLk62X2hBA1BCrecuvyVXLgiafaiuSNjKL5ABB7o=; b=TMwuI7t3i0KnlqKljl/M0N04e/
	NVtrzO5DWuu3KaP5mU2waFtZfULjpivy3/vG3347TuOOYgUApbFqfItbEKOfQhVOEKs4fpwiQtx29
	01YeCa8DnqebT6EVHRCT8DViuea3RAS7U3vLUqt4PAFLlqnfpf5ni4eSBg8GpM0fbXCxTjlyMH6mn
	mm31EI6iBuhL4NxSa7Nm26jQYA6tf6jsiturwyz5sWQhnghKYFJeJLc8yHUqW5utNTT/y0XWREkeZ
	gIAc7BJwph8Di3YkA2uASIk9/5Ddy/jGimh8kHAAzOZ9MGLIkdoeD+S1YiWQM2IYIOedxog0D5ovz
	Qj3ZqI2Q==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsIa-00000002esv-3kIb
	for ath12k@lists.infradead.org;
	Wed, 04 Dec 2024 16:32:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CD055A41A32
	for <ath12k@lists.infradead.org>; Wed,  4 Dec 2024 16:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17390C4CEDF;
	Wed,  4 Dec 2024 16:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733329940;
	bh=5NgdQtgdx9L6DLYrc7Hr1UkgwpKbPHyj9dlHR5lrHxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M1m2QM/IYsHu2P2KI6NHqw9tdNSanIGypnbAcJj1LXuOyGN17Et6mduC96xLnUOA6
	 jZwtdB9yDntUULDrPOLY5sbclYcEeIESbQaY5hItdwXSp7GlzWQjKnYeEoXZUZJHTG
	 veIlPpAf+PP+N/eqjcbrPITvRKO3AbxxPKFMoOHJfLtsmgEkLmybmKrmXqsXSNfL4N
	 Yyc1qqhyVVBeh3gq6QcwSBWxlqXTZYN+5QSyXM/m/dLLT85AheOc+yIlNbOWVJKKC4
	 ngrI0cQ7A2lSHKnroavj+ZpbhLBSSmOxwBHqOmPBKLWR9B5h15z0nq/RJ279npM0TF
	 6ARz2WWZXpnOQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 1/7] wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to ath12k_mac_register()
Date: Wed,  4 Dec 2024 18:32:10 +0200
Message-Id: <20241204163216.433795-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204163216.433795-1-kvalo@kernel.org>
References: <20241204163216.433795-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_163225_121375_94AF208F 
X-CRM114-Status: GOOD (  12.04  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

When hardware device group abstraction is introduced, a group abstraction is
registered to mac80211 rather than a particular single device.  So we cannot
set the device registered when the QMI firmware ready event is received, only
after all the devices in group have received the event. To do that set and
unset ATH12K_FLAG_REGISTERED flag inside ath12k_mac_register() and
ath12k_mac_unregister() respectively.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++++
 drivers/net/wireless/ath/ath12k/qmi.c | 4 +---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 129607ac6c1a..1180070278da 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10839,6 +10839,8 @@ int ath12k_mac_register(struct ath12k_base *ab)
 			goto err;
 	}
 
+	set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
+
 	return 0;
 
 err:
@@ -10858,6 +10860,8 @@ void ath12k_mac_unregister(struct ath12k_base *ab)
 	struct ath12k_hw *ah;
 	int i;
 
+	clear_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
+
 	for (i = ath12k_get_num_hw(ab) - 1; i >= 0; i--) {
 		ah = ath12k_ab_to_ah(ab, i);
 		if (!ah)
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 77d8ee14bf33..20382b751829 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3349,11 +3349,9 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 				  &ab->dev_flags);
 			clear_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags);
 			ret = ath12k_core_qmi_firmware_ready(ab);
-			if (!ret) {
+			if (!ret)
 				set_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE,
 					&ab->dev_flags);
-				set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
-			}
 
 			break;
 		default:
-- 
2.39.5


