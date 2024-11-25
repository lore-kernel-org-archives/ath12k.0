Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25A0D3B7D1
	for <ath12k@archiver.kernel.org>; Mon, 25 Nov 2024 03:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frFgCrWmSijQIbE0s2cLug5C/eMtSEJl8xqwEfAC0eU=; b=XlevGUW0zVzjHZK6+2cpSKusHv
	d++GVMLSUlHfIsfQcGS6pVXX3cttMeKmbGHoLOi4d+2hPSgZjZP6yY6cxT2AuC0XNnBp7pnkQTrMd
	yMYtuvntBtOWHnD7GsXH/nMIUKAf0D1aG38OVuFFGxsDvQQg347p5vVWPmt+2Y6ab64ibwYVksONG
	BZqczvwxrngDNpYxrTEOyhwApDktLEsuyBNfZZovMiyhzT5a3lAjmc5yODVI8/wjBmWIwBU5W+vM0
	U12G9jqXcymYt2cpAE3/RJM1ZSXn1S2igiaBhxNv0G6VnkvKpPxnQesWRmOnOWiKWP3otxu4JeU18
	TJFu1oMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8q-00000006zKb-2EvP
	for ath12k@archiver.kernel.org;
	Mon, 25 Nov 2024 03:52:04 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8h-00000006z7t-1Dhh;
	Mon, 25 Nov 2024 03:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732506708; bh=mwFNh6fCQilCetdqM9GB1/3XnP01zdiqQkD768arI/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RmytRxVv1y+Zq5OYaqttZVMLivau0IYhRxwDvVY+ojzSleN2mmJoHmjbxsXymNdoO
	 lVZo9iESVcl4XbItZ/dsRvh08KYDo/4R5l3N0/x+wWh2ORmbHEEb66QNXK+83VpCsV
	 OsgGsH7OXVlNjJDVL7bKj0+w3Z8pTmlXT2Vd0XXk=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id AFE0E14886FE;
	Mon, 25 Nov 2024 04:51:48 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [RFC] [PATCH v2 05/13] soc: qcom: qmi_helpers: add QRTR endpoint ID to qmi_handle
Date: Mon, 25 Nov 2024 04:50:20 +0100
Message-ID: <68f8f8e04b6076d8f497f101ecae9c78b128f59b.1732506261.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1732506261.git.ionic@ionic.de>
References: <cover.1732506261.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_195155_484218_6524C94B 
X-CRM114-Status: UNSURE (   8.17  )
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

Adding this allows us to easily supply an endpoint ID to bind on later
on when creating the socket.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 include/linux/soc/qcom/qmi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index 469e02d2aa0d..77743c855762 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -212,6 +212,7 @@ struct qmi_msg_handler {
  * @txns:	outstanding transactions
  * @txn_lock:	lock for modifications of @txns
  * @handlers:	list of handlers for incoming messages
+ * @endpoint_id: QRTR endpoint ID to bind on
  */
 struct qmi_handle {
 	struct socket *sock;
@@ -235,6 +236,8 @@ struct qmi_handle {
 	struct mutex txn_lock;
 
 	const struct qmi_msg_handler *handlers;
+
+	u32 endpoint_id;
 };
 
 int qmi_add_lookup(struct qmi_handle *qmi, unsigned int service,
-- 
2.45.2


