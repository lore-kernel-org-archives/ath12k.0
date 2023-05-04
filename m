Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7AEC77B78
	for <ath12k@archiver.kernel.org>; Thu,  4 May 2023 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jhpiJoBL5gdJHBmxNbBEXe4J6N//gKUb/pgJwEpErU=; b=SfXKMyxW9/I9kg
	V69wHnRWBSr1qnqk55OjAE/cemxtYic3rj30vElCDdPVdOL5FFVqiEDAt+H7pQzVEcaopbUzMHT3+
	mEdSvN89ymUbf7f7QrJh/B5VevjISQCHl8tWODDmPJ31FoKA+zqHW97xh9wa9HWpWuc67ghiNxWSS
	Ma8/HXrxWnAo+3+G+eH9Nlz89sn9HZm2DFLaq9ssOF+IwuhxbSlSQW5FCp8oko+TmhnrjOwHRLa5E
	t1FmbBaGWG/m2iGPPYTdyUSXkT9cDgEfmtiul+L+W/Z3bC0yGscs984zJo2eqBSXTgwNlt8aR3yn4
	V6yMmeXIj4pNNjhtAI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pueqZ-008pFg-2N
	for ath12k@archiver.kernel.org;
	Thu, 04 May 2023 19:42:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueqX-008pE2-1f
	for ath12k@lists.infradead.org;
	Thu, 04 May 2023 19:42:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE6C76370D;
	Thu,  4 May 2023 19:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF387C433A7;
	Thu,  4 May 2023 19:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683229352;
	bh=bkD6hVU+8F90R1FdgY0SO//u+++2L4MdapcaIwB2BL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZnJ83nOSmWzoU9SGz7V4PJlMT0ELfP1zqYEyy57eCOxHHYEHg2zV/6Mv+X7p6QaK2
	 BtVIC6pXA7PY+6El3VrTJ3Gt9MmtEN5TZcS+56qAicXmbCWuUevaD/djCbQTLNmi6Y
	 wn0SaVpILLTrfmTPRlH0vRCDOyVk+CKqa3jlHquYqLuwModOU4RTNhWwuMZ3mJTE7e
	 LU3Od7YiL34ZFYDvEOQ2JAL7MZaQ01gBShR3J+djPnuWwCe7OevSwQx4ULfbau8x4r
	 B8AKFFAhlXMudA/W3YlllOC8GVwGF3KejDpWXsXm7O6DRVf8GYCgXJ7KcZaw+nueD9
	 MSKilzqag2Zwg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rajat Soni <quic_rajson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 16/59] wifi: ath12k: fix memory leak in ath12k_qmi_driver_event_work()
Date: Thu,  4 May 2023 15:40:59 -0400
Message-Id: <20230504194142.3805425-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194142.3805425-1-sashal@kernel.org>
References: <20230504194142.3805425-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_124233_594761_3F119522 
X-CRM114-Status: GOOD (  11.59  )
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

From: Rajat Soni <quic_rajson@quicinc.com>

[ Upstream commit 960412bee0ea75f6b3c2dca4a3535795ee84c47a ]

Currently the buffer pointed by event is not freed in case
ATH12K_FLAG_UNREGISTERING bit is set, this causes memory leak.

Add a goto skip instead of return, to ensure event and all the
list entries are freed properly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230315090632.15065-1-quic_rajson@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 979a63f2e2ab8..03ba245fbee92 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2991,7 +2991,7 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 		spin_unlock(&qmi->event_lock);
 
 		if (test_bit(ATH12K_FLAG_UNREGISTERING, &ab->dev_flags))
-			return;
+			goto skip;
 
 		switch (event->type) {
 		case ATH12K_QMI_EVENT_SERVER_ARRIVE:
@@ -3032,6 +3032,8 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 			ath12k_warn(ab, "invalid event type: %d", event->type);
 			break;
 		}
+
+skip:
 		kfree(event);
 		spin_lock(&qmi->event_lock);
 	}
-- 
2.39.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
