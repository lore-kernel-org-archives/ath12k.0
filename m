Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0150D3B7CF
	for <ath12k@archiver.kernel.org>; Mon, 25 Nov 2024 03:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BDLlCOm/h2d06ErNWeZDS+fImritsT1Oq/Bbm0LhNQ=; b=tnJGzknfCjRLYsJlpmPany4fHv
	rgb8ZhqBKCme/MqdJPP81tVKIeiy73LlbniZL9U/4phQDJdZ/a7rUEDu0QdcGa5yOFpzV6OCWK6uF
	qFban+V1PFksHI0pgwp7ZKjwh120gcM3E3h8I2KMvQuuTbGX5LsZ9EmvXxJnJhutN754gdq3iirzP
	PAMxn72fDZNNFBje9kajvxsvcComSrwBwsF1Rmzc5sf+UKnHtEMfMd9OvzZmSy4LYTI7BzgYGcFJa
	6nvEbD8fdxzPy1I1t1+KXoWcRSMuGMNilN004iHmiJXG1v+LZxBC0z8yubamnd5kuxS1ZcrHDEJNX
	f3bluxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8h-00000006z9N-44xq
	for ath12k@archiver.kernel.org;
	Mon, 25 Nov 2024 03:51:57 +0000
Received: from ionic.de ([145.239.234.145] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQ8e-00000006z6P-1P6Z;
	Mon, 25 Nov 2024 03:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1732506708; bh=WaJt0MbfiLuCLmsPYGY3mx15UPFsO9CVWdVbdNYCpxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q2dlXsmYZNtjt+BaM/dXnrvh/kDHw8Xwzol01zB9m94ZFaQ2M88DmD4bE137cK/Sz
	 /6rKf6Aia2xOF3UQj3AKKTAy8kL8XLTkFvCbp9xLRo2s+RtOhnBzOYsglpLi6FjCkP
	 TfaNUhiDUBZK1NCjhJbiiTVVtyh80ZmXNeJoHIgw=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 6BD2314886FD;
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
Subject: [RFC] [PATCH v2 04/13] net: qrtr: tun: register inode as endpoint-specific data
Date: Mon, 25 Nov 2024 04:50:19 +0100
Message-ID: <c9644b9d169c22ccaed87b186ecca0bfc08129b0.1732506261.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1732506261.git.ionic@ionic.de>
References: <cover.1732506261.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_195152_808697_45419B64 
X-CRM114-Status: UNSURE (   6.68  )
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

For the TUN backend, we will use the inode pointer as the
endpoint-specific data.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 net/qrtr/tun.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/qrtr/tun.c b/net/qrtr/tun.c
index 304b41fea5ab..9dcfecd529f7 100644
--- a/net/qrtr/tun.c
+++ b/net/qrtr/tun.c
@@ -41,6 +41,7 @@ static int qrtr_tun_open(struct inode *inode, struct file *filp)
 	init_waitqueue_head(&tun->readq);
 
 	tun->ep.xmit = qrtr_tun_send;
+	tun->ep.endpoint_data = inode;
 
 	filp->private_data = tun;
 
-- 
2.45.2


