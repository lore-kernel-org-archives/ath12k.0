Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EFFC3DA64
	for <ath12k@archiver.kernel.org>; Thu,  1 Aug 2024 00:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1D0KqUqVOSHuNz9wPN1WPN0fMq408Z2ARcM3kOTJeE=; b=y6EuReFZXHd/LGaWCl4WUFsvVg
	NkbaiCUFK0JKizjK2kQo6Qv8mJM+HA7pxQA7xWarz45FpQc43Crc185foPsgAHz2vKNhkxTDBpgC+
	lY44KZlEYHUt2u4dadYjNLKfmeDpfFHw/iv2wWEbS39Op/ZYIc/vC9fJx8YnkBmiO+crC4h83YfKm
	RemSC11jIFfW+mQpVHQSYHLpag/CNiY5U9+ratcelhZTMy7F4FX+mhdxheZ9IkfI8e1UCLX19p5IE
	6ObWBSxbt95Wy4iDHVkSRm9HPU0UBE8tbE55d8pt+QY7wSpIuX93x1zsVQq3CrZKp5OAo+NEZlTFe
	ISfQRiew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJR3-00000002usD-0IY4
	for ath12k@archiver.kernel.org;
	Thu, 01 Aug 2024 00:12:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJR0-00000002uqc-1vLO
	for ath12k@lists.infradead.org;
	Thu, 01 Aug 2024 00:12:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F2EBE626E6;
	Thu,  1 Aug 2024 00:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821B5C32786;
	Thu,  1 Aug 2024 00:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471165;
	bh=mkbH1HDvlQU+3/cr6kcml5JYntra0ISK9U/XzN7Q2S0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q5sQV981+9WaRmgMxTQQa3jLsaQDDfkWa2H6T33/TXNZQfa46c9ApLK/HO1ccB1r1
	 tOWJmPlZyD3gaQ62gaETnUdDFbfmKGXbCFUVxC7DHE/XnWu0wUcwNPGl4PqNeUy2QV
	 n40uOu/7tJs8Ne6Km1dK9GP9zEdx7itgnDKV1Ves2EDBWz8EKv7UWItBtBboCwyx3H
	 0yEpDn3ImhX0xXrLJg5VtPvFepR2yXMevvILZo/lzH9sBheDAO308FM8UsoNQrQoxU
	 8qt9QgIslXZtNqZpzRVCCw4JD1VCK+FN8ymKQcb6o+lR0L6TP+LO6w+sY/F3Umzy6y
	 S/4sE8L9/+5fg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 038/121] wifi: ath12k: initialize 'ret' in ath12k_qmi_load_file_target_mem()
Date: Wed, 31 Jul 2024 19:59:36 -0400
Message-ID: <20240801000834.3930818-38-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_171246_568284_820E355D 
X-CRM114-Status: GOOD (  11.21  )
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

From: Jeff Johnson <quic_jjohnson@quicinc.com>

[ Upstream commit bb0b0a6b96e6de854cb1e349e17bd0e8bf421a59 ]

smatch flagged the following issue:

drivers/net/wireless/ath/ath12k/qmi.c:2619 ath12k_qmi_load_file_target_mem() error: uninitialized symbol 'ret'.

The reality is that 'ret' is initialized in every path through
ath12k_qmi_load_file_target_mem() except one, the case where the input
'len' is 0, and hence the "while (remaining)" loop is never entered.
But to make sure this case is also handled, add an initializer to the
declaration of 'ret'.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://msgid.link/20240504-qmi_load_file_target_mem-v1-1-069fc44c45eb@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 5484112859a66..6d1ebbba17d9b 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2538,7 +2538,7 @@ static int ath12k_qmi_load_file_target_mem(struct ath12k_base *ab,
 	struct qmi_wlanfw_bdf_download_resp_msg_v01 resp = {};
 	struct qmi_txn txn;
 	const u8 *temp = data;
-	int ret;
+	int ret = 0;
 	u32 remaining = len;
 
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
-- 
2.43.0


