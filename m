Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97088C9830E
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 13:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6d/AhrifUYHA3V2tpUROu6IS0J2DvSc9j933wK/Q5fw=; b=CEM0DAZ30NTVugvTZstui37Xyl
	Y96KpHZVlz+WyCJQwBm6LjIwztnST3N0qMehBGmFBgLvoliIj1Lh8znCOeBAFklUG3VYCWliR0DFW
	Sk6wClLtg0s10zyXuIO/CcNo9bbo4tHRRbn/pEYRu5ns7X/8xtfCldbFWcxN4woB9UunEJZs00DZJ
	pkYSqoi88v489sapUqmFyW8crZAfcdhdcoxLa0G3z4Tj+ksigD9T7jyg+QLNcfAjh4v0t0fmqTIE9
	6ocQAegm3NmlYag0W4ekx0YbCDey0A/yGAh/t/t10tCHTYV3S47UbBYx5o7K7urth3MbqX17G/Cg2
	djayo0pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90l7-00000005ZDi-18Rw;
	Tue, 22 Sep 2026 13:42:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90l3-00000005Z9a-3Cn6;
	Tue, 22 Sep 2026 13:42:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D77AB60A82;
	Tue, 22 Sep 2026 13:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B120C2BCB8;
	Tue, 22 Sep 2026 13:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790084524;
	bh=+7hgMzH+bUETBpciyveHW9m+55rtTRhGRMMDzVczHHs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gTJp68GIBHw7Hj1+3ocx2rgbB6/o1d5+XU9iBp5CuVNMSnfFbMtpYl4qZ5IiPVhXW
	 DbdzY52WY/yZmuhcH6+4WB7CoTomgQoiY/UxmBWnemGTBonl0zMj5kD+kNSnX4I9BL
	 0EXYDcBLaeCtPprQ7O3cCL+yabXShrS7PwCyu3HhfxC/wmjykleHCddAqbvgj2hgmN
	 xjfgm4APbiHRWmWlPYSDcvrgYJ6vyT/BGpYNGjEsNOgg9wLOVuWWvsQUPiC8pWtwEQ
	 bXMBLluKRY9J9YW8x7h3G1MxMn8xh605Me0WcOVmguwIF7rXJd99lgInEJFvGlhJj3
	 UcJWyi5+yB4zg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B70FC98307;
	Tue, 22 Sep 2026 13:42:04 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v3 0/4] net: qrtr: Add support for using identical MHI
 endpoint devices
Date: Tue, 22 Sep 2026 15:41:44 +0200
Message-Id: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJiFsmoC/3XN0Q6CIBQG4FdxXIcDNKWueo/WBcIpaSoKyGrOd
 w/sprW6Odu//ef7F+TAanDomC3IQtBOmyGGYpch2YrhBlirmBEjrCIHyvFkvcX93HmNYcSS1ZI
 1cl8CUBR/RgtX/di88+Wd3dzcQfqEpEarnTf2uQ0Gmnr/7EAxwVyQSgpRVFwVJ+NcPs2ik6bv8
 3hQmgjsA2H0G2ERYbVSnCheUkF+IOu6vgBOaOD4CAEAAA==
X-Change-ID: 20260918-qrtr-multi-ep-c27c2bc54ee1
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chris Lew <christopher.lew@oss.qualcomm.com>, 
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
 Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, 
 Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3240;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=+7hgMzH+bUETBpciyveHW9m+55rtTRhGRMMDzVczHHs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqsoWhJbkRU/X1+Ad7kGtYbrJVhlsIhCOo64Xp8
 6JUHKH95qSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCarKFoQAKCRBVnxHm/pHO
 9ZFHB/sHbFtYkUxenvI3tCEX7PFWivliqXjghO3lpuXBSqbZOY+ZVTdQ1LiS1Q7auKj/53jTl5f
 7FXtPZ6Q7UPs2KRSPizAV2uJL3txPrqvnKmvhFhntiTk8KUYOpDvqCVXXGrlIZYSkShGaOW/Aqa
 a7boMPoCYttyFnTwMbWWPHojaKAp5Jj7LddPpsnGpMAWqiiWLLV9KDFILZcklHNwEvf1RBPNLmm
 dlqOsBeLHJUXnXuqwKiYvHHLGWRD7IfQ+g8L4ReQHG18JjTcKFRXLF5sb03SVrhgf8Z5+ywieGt
 kk2B25NOZwR0C+m6jCBuFQl3QGKL35KE0BS8mpSsmpw/P8le
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi,

This series reworks the QRTR driver to add support for using identical MHI
endpoint devices at the same time. Currently, QRTR driver has a limitation on
using more than one identical MHI endpoint devices like QCS6490 or any Qcom
Endpoint device making use of QRTR at the same time. Because of the fact that
these devices will have the identical QRTR node id, they cannot be used at the
same time, on the same host machine.

This limitation is a blocker for running upstream kernel on devices like Qcom
based routers as they often have multiple identical WLAN Endpoint devices
connected to the Router SoC.

This series supersedes the following 2 series from Juha:
https://lore.kernel.org/all/20260915054207.2513877-1-juha-matti.tilli@iki.fi
https://lore.kernel.org/all/20260915074135.2567411-1-juha-matti.tilli@iki.fi

Compared to the series from Juha, this series simplifies the multi-endpoint
support by computing a unique node id for each MHI endpoint and uses it for the
internal QRTR book keeping. This ensures that even if the MHI endpoint devices
have same node ids, the host QRTR will always use a unique node id for each one
of them.

More details can be found in the individual patches.

Testing
=======

Juha tested this series on multi ath11k/12k setup by backporting this series to
6.6 kernel. 

Merge Strategy
==============

Since both QRTR and ath drivers are falling under the networking tree, the whole
series can be merged through netdev tree.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Changes in v3:
- Added missing qrtr_node_rewrite_ctrl() for QRTR_TYPE_RESUME_TX
- Fixed the types of ath{11k/12k}_pci_get_qrtr_node_id() and helpers to use
  'unsigned int' to match qrtr_host_node_id()
- Collected tags
- Link to v2: https://patch.msgid.link/20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com

Changes in v2:
- Rebased on top of net-next/main
- Used READ/WRITE_ONCE for reading/writing ep_nid
- Link to v1: https://patch.msgid.link/20260918-qrtr-multi-ep-v1-0-8a06caa368d3@oss.qualcomm.com

---
Manivannan Sadhasivam (4):
      net: qrtr: Allow the host QRTR to assign a unique node id
      net: qrtr: Assign unique node id for MHI endpoints
      wifi: ath11k: Connect to the QMI server belonging to the device owned by this driver
      wifi: ath12k: Connect to the QMI server belonging to the device owned by this driver

 MAINTAINERS                           |  1 +
 drivers/net/wireless/ath/ath11k/hif.h |  9 +++++
 drivers/net/wireless/ath/ath11k/pci.c |  9 +++++
 drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++
 drivers/net/wireless/ath/ath12k/hif.h |  9 +++++
 drivers/net/wireless/ath/ath12k/pci.c |  9 +++++
 drivers/net/wireless/ath/ath12k/qmi.c | 11 +++++++
 include/net/qrtr.h                    | 21 ++++++++++++
 net/qrtr/af_qrtr.c                    | 62 +++++++++++++++++++++++++++++++----
 net/qrtr/mhi.c                        |  4 ++-
 10 files changed, 137 insertions(+), 8 deletions(-)
---
base-commit: 8830e65ed46de41f849eefb8ba227d4852c460f6
change-id: 20260918-qrtr-multi-ep-c27c2bc54ee1

Best regards,
--  
மணிவண்ணன் சதாசிவம்



