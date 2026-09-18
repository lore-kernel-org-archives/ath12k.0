Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFB3C982DF
	for <ath12k@archiver.kernel.org>; Fri, 18 Sep 2026 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rDMpIdvBXzn+vCf17mZbvyDE8a3kbb4k9xJTrPsVR5c=; b=lo6bgWgIBxJ1jtN9mfOwLCad+q
	GXJfiqEzGjBGUb/QZbjSqiWRKrrA23h1eAtHoAnzzlcdKwpu2iQFsZFYHk/yCE0ieZ9ckPrNgBvr0
	firM8t+eAnf/CNCYk4uQ5Bo2IU1GWwF9bwCDsAnA3S4s52KrxKPh14Di8UioGZ6G0pDtB5phVG2xl
	GQbNxSkiFFBTJZinEbuK1IJSXiPvkuJu+ZeuCn/ySUifWxN+8QvOhNFSBf8fcJBKneNWiq6v7puNr
	kGLoUo5hn2h2ckrwiw8XfXjA7gnKkMwS6DTLxZoXa/QeaIFfi7nOTW3pV+mkAWfX5hEHndNAueWOu
	DR2yN5TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bRm-0000000F1bO-31zL;
	Fri, 18 Sep 2026 16:28:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bRi-0000000F1Xm-3WtG;
	Fri, 18 Sep 2026 16:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24B906053B;
	Fri, 18 Sep 2026 16:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCFC9C2BCF5;
	Fri, 18 Sep 2026 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789748897;
	bh=6Z8qKohBjG+nYdXMxSIz7GwXcSnl7h3FDD5QcnwlKuY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UB+YS1UsxCALsNwNH0jSBd7fW29V3RBvgybAQ4h/xGNdUH/X3IfqjYN8WdmgjfUB3
	 A//A3CjxLTkRhlJA5ehoK03Lii1bxtQend0rG8TZ16NIEvS5JoRZkaQFsZWNbp18A/
	 7CKgtAFNV9FjigLPhMQnQr6UxSr68hIbLTgUhVX27qM4AEjcFSW2oTLG6PKXhBXyTP
	 JyHcm6IOKNzCKAEH7kO6H8xzm6C+jNRqRj8qXEarbrhIhghjCrZiloEq0phxz2yRD1
	 pHtBIAa8t1f59BWhVVUSxWxh7EHNDVgHodvfTapYuVHhfF0hjKQaKDUzCbLFzX5y0Q
	 Ly2l/SGGIUbBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C0CC982D7;
	Fri, 18 Sep 2026 16:28:17 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH 0/4] net: qrtr: Add support for using identical MHI
 endpoint devices
Date: Fri, 18 Sep 2026 18:28:12 +0200
Message-Id: <20260918-qrtr-multi-ep-v1-0-8a06caa368d3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJxmrWoC/yXMQQ6CQAxG4auQrm3CTECFqxgXUH61BhA7AyEh3
 N1Rl9/ivY0CTBGozjYyLBr0NSa4Q0byaMY7WLtk8rk/5pU789ui8TD3URkTiz+Jb6UsAEepmQw
 3XX+/y/XvMLdPSPxOaN8/x3mQHnEAAAA=
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
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2798;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=6Z8qKohBjG+nYdXMxSIz7GwXcSnl7h3FDD5QcnwlKuY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqrWad4ZoZAEk0cQeZgtJ6b+1eEpkYMcmutGWLA
 bVHEQdUHwSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaq1mnQAKCRBVnxHm/pHO
 9ajuB/9glk15Vu0tJD0QCmDRJJUz3pwSef4SYXyEyq4KwQWyU8SLii0UBPrZAO8Qc0i91NTNI6o
 U43q/76VuAhZFJW60hvtqrjwOgMelpnds+dpqZER0h26ie9F9MKmgRJLfNhW7Mp8JYMzYSsMBE7
 zSydfaCl33EE+Paw/sQMO1ktG35sGcQSi6pIvTaWBL4pLDRfG2oQHqPkwIrNGXZZ3xNB82jh6aX
 9xv42TRFy9qRwDQ0/7M/1BpSV4WZ32GfSxzXFKAZoH4BITmySewHu92P1NeI0dsRitKiXZlk016
 Z+Fbq1Hr4crb5FBljkXN4jfcjzVhgEmR4VWmIWBenBt0UcZP
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

Juha tested this series on multi ath11k setup by backporting this series to
6.6.156 kernel. I'd appreciate a formal tested-by tag from Juha and other folks
CCed to this series.

Merge Strategy
==============

Since both QRTR and ath drivers are falling under the networking tree, the whole
series can be merged through netdev tree.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Manivannan Sadhasivam (4):
      net: qrtr: Allow the host QRTR to assign a unique node id
      net: qrtr: Assign unique node id for MHI endpoints
      wifi: ath11k: Connect to the QMI server belonging to the device owned by this driver
      wifi: ath12k: Connect to the QMI server belonging to the device owned by this driver

 MAINTAINERS                           |  1 +
 drivers/net/wireless/ath/ath11k/hif.h |  9 ++++++
 drivers/net/wireless/ath/ath11k/pci.c |  9 ++++++
 drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++
 drivers/net/wireless/ath/ath12k/hif.h |  9 ++++++
 drivers/net/wireless/ath/ath12k/pci.c |  9 ++++++
 drivers/net/wireless/ath/ath12k/qmi.c | 11 +++++++
 include/net/qrtr.h                    | 21 ++++++++++++
 net/qrtr/af_qrtr.c                    | 61 +++++++++++++++++++++++++++++++----
 net/qrtr/mhi.c                        |  4 ++-
 10 files changed, 136 insertions(+), 8 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260918-qrtr-multi-ep-c27c2bc54ee1

Best regards,
--  
மணிவண்ணன் சதாசிவம்



