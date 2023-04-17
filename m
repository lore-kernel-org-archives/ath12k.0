Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058A7C77B70
	for <ath12k@archiver.kernel.org>; Mon, 17 Apr 2023 12:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=okltr9rjuTaABqiI3hHjrMBdiI4hRwiGP/yPqQjEoeY=; b=pgZLXoyBjZarlN
	JhMdhhudklVDJ9kjrxGQHcxp/tkTYLdgfMmG8gWEQpoA2Pbo/cXlLWke70FUPII49L18PbTg/UiNk
	WAR5Y7+kkovGcn5RgqqdFS3ofSTe2mqGFL4BTiclYM0mVGC/YQj9QOa2abs5B4jJuKDl8mtNMY23d
	/KTZYCnIHKSKiaIvQfrSCZ7/lxWSjEzle9vMeR85CisDPk8EScD7sMp7fh7TNfb/Y+yxlKhtwf95V
	RmKg8AMCJzLdrblIGoMJfpSF0br+QTglncp0RfF388NfWFYKWKREDxWeoUj6ZZOXYrngCfCCBdgiS
	+dSnLOJ/avtiL16DEiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNXm-00G4D1-0w
	for ath12k@archiver.kernel.org;
	Mon, 17 Apr 2023 12:01:14 +0000
Received: from [202.114.0.240] (helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poNXZ-00G490-0S
	for ath12k@lists.infradead.org;
	Mon, 17 Apr 2023 12:01:12 +0000
Received: from lnk.. ([10.12.190.56])
	(user=lnk_01@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33HC06ws003063-33HC06wt003063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Apr 2023 20:00:10 +0800
From: Li Ningke <lnk_01@hust.edu.cn>
To: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
Cc: hust-os-kernel-patches@googlegroups.com, Li Ningke <lnk_01@hust.edu.cn>,
        Dongliang Mu <dzm91@hust.edu.cn>, Kalle Valo <quic_kvalo@quicinc.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fix missing unwind goto in `ath12k_pci_probe`
Date: Mon, 17 Apr 2023 11:59:21 +0000
Message-Id: <20230417115921.176229-1-lnk_01@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-FEAS-AUTH-USER: lnk_01@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_050101_553364_A6F2B14F 
X-CRM114-Status: UNSURE (   8.22  )
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

Smatch complains that
drivers/net/wireless/ath/ath12k/pci.c:1198 ath12k_pci_probe() warn: 
missing unwind goto?

In order to release the allocated resources before returning an
error, the statement that directly returns the error is changed
to a goto statement that first releases the resources in the error
handling section.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Li Ningke <lnk_01@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
The issue is found by static analysis and the patch remains untested.
---
 drivers/net/wireless/ath/ath12k/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index ae7f6083c9fc..f523aa15885f 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1195,7 +1195,8 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 			dev_err(&pdev->dev,
 				"Unknown hardware version found for QCN9274: 0x%x\n",
 				soc_hw_version_major);
-			return -EOPNOTSUPP;
+			ret = -EOPNOTSUPP;
+			goto err_pci_free_region;
 		}
 		break;
 	case WCN7850_DEVICE_ID:
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
