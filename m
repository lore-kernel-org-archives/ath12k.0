Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5C6606F1C6
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lXA8Swn4;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZXc5IhW/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Bm4eimUVDWH8GGmPwAOM7az6Dr399/ObEEE8HbX+iYY=; b=lXA8Swn4mqHs24LkpaSvNVP2rY
	UdC4NwhDGZzFAkvyShO3VJIhI1ngdsmatLR9PBEG85qRqcKvbdVmHuuSiGT9AExiFfZBdBtW1Gy2n
	elPoSdqKDYFn0k5bDhy4/TrY5m35IhDLRilgXc/4SywAXPfGvAsFekjriXTVecz3qVHH4mhcfkmxN
	Bw0OZVYtVYDBU9IaT4MCQES/kpUI24aCPsSX+Wkp8uleSy0ZEighrLCqk+lqP1zjvvLr0Hq6WdBIv
	o3jOIvXgFg2C+uRPiMFKZ0AjOVP6WANLUIgqVVVNAMMKjBBsck5f0zpvqvqeupPD/VSHAqeyw/w8i
	ujJURB2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwoz-0000000Ebpd-3LkH;
	Thu, 22 Oct 2026 17:43:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwoy-0000000Ebp9-1gvR;
	Thu, 22 Oct 2026 17:43:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CE5042B8F;
	Thu, 22 Oct 2026 17:43:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792691000;
	b=JCfmyc5eYZTNPd+o5hBckE7r6O32RvwzKGjrvTFG3KYeYc+AMvqk9GL4uQSiTbhqN6pJ
	 0P52I2HNUSWGUe+RdDVC/lJDsuFn4tmzyN8Meptqtikd8jc7giqWM7IBxYVjL8d1XyYI7
	 4hjUdMhDe+DP7DihygfpFPRaZLxLAyAvUaKRicYPSLy36BpaudglHfeJr7Ht4+vAb3v0Z
	 FZPnwX8RGuWYhBcr7IjH/1xGWRVa63x9pymEdmF4cpqbxkNmx3eXEHYIa64k2z2i628hX
	 uzoA7R4uB5jFxGlV1S8h84fSXg3XaVbEtqKLoLg0KKPQu108h82B5vkX39ZD9TDdrvA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792691000;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Bm4eimUVDWH8GGmPwAOM7az6Dr399/ObEEE8HbX+iYY=;
	b=m08If9m/C2bGPf7+ksoRyNVr+0k784PbwuW2aWpsEC6Ca2vtVBZ4c3ALk1CaDtF1aL/a
	 Tzm5He7loqgE7Inwa4kODwNgqyEmQ4kGWiDKq9Ulsk/8cRSKg9B6lEnuo65oh4P6pdvre
	 LS6O4rtQZo6Dwo4kOhFST6tIVoNG2f6zF3RIJjol+EUy7u5sSWNA8KYrkWI8mhk4p6mP3
	 pbXTeleCP322QfxHW6iHdmQy2EDPEL8PmW9exN1jK0oVfmQuk0PUVC9AKSbULvyFbX0H0
	 cv+dw5cgaFpAuSo42/9LrwzP2I72XTZAVVxtqpc4NzgRD3MZKMTywJ7vaL40g6nxJ5g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 667F31F01829;
	Thu, 22 Oct 2026 17:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792691000;
	bh=Bm4eimUVDWH8GGmPwAOM7az6Dr399/ObEEE8HbX+iYY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ZXc5IhW/A0kJyWVuojF2PMxSus2+4n29aDHmvJIAMm6j37bwSiH02g7kZ6y2XpxqL
	 scIkIkgUOsteVIGQj8umfH8BcCjO7lvgo6HSr5Mhl+niAL8m+Dmsi9vXeHoD91lOkj
	 dKpB78pVWzbBsTfxPY1exTA9HlEMb4oOrzsl1HqUoEx5MLL9RLs8UhzdPETU+hBVVw
	 1tJCyVzma4pdzfTEgCzrxSDOTZu4gtVD8GKN2f/Sgm/dd//4kRyMPx4I3XWsFHCCYn
	 uvop/FmckWb5KfCJDZ0EpHL/HxwPUZYkd31vnTx9ad0h7dU+KMfu+s83D3h6z29Kpk
	 hsoJZ0ZPjWIxA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B862A41E90;
	Thu, 22 Oct 2026 17:43:18 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v4 0/4] net: qrtr: Add support for using identical MHI
 endpoint devices
Date: Thu, 22 Oct 2026 19:43:06 +0200
Message-Id: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACpL2moC/3XNTQ6CMBAF4KuYri1pp/wUV97DuCjtqDVAoQWiI
 dzdghtjdDPJS958byYBvcVADruZeJxssK6NId3viL6p9orUmpgJMMhZySXt/eBpM9aDpdhRDYW
 GSmcpIifxp/N4sY/NO53fOYzVHfWwImvjZsPg/HMbnPja+2dPnDIqFcu1UiKXRhxdCEk/qlq7p
 kniIevEBB8I8G8EIgKFMZIZmXLF/iDiE4FvREREMyYFRynLrPiBLMvyAojzXoJNAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3962;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=q+w1LBsK2b8ldE4G3w95CnlIooEs/ixDTJAOtFqRgYI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq2kszz4zwVzJKE+K4NeeIkUmI4zQIjghu5A/p/
 fK7iEXr3TaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCatpLMwAKCRBVnxHm/pHO
 9YVhB/9PbMqL00DWGsIB4zThW8y+Md9kmNepLqE6qV36OtjjBZfZrWyrYurgELw5kPGfhO8DTng
 TpHi7lZ3arKGzauH0lIQWHp8DrtqTCt6GMrIJrJvMHvZl4NaoIBIo4gD/Nw17jxI4FQQR5U2YM2
 X3K9UR1b6y3/okrgEdK3oM91rzLD3P/oFw9C71g+wbejaHv8iy8Th1J2IUCP0nL2IgoTgeni6CZ
 4Nx+FYeUCbeayl1/lesuNfoahEzd0ZCazuIXC6lOKYnEEi3ALYL4yviAVi02x41RrZjx1Ue2gFV
 UC5rMWUW8ZeScArSX955IYpNMzS+g+FQF+vch6Xb9d+ShIFA
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Merge Strategy
==============

Since both QRTR and ath drivers are falling under the networking tree, the whole
series can be merged through netdev tree.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Changes in v4:
- Moved the 'ep_nid' and the node id assignment into a single
  'qrtr_nodes_lock' critical section and used READ_ONCE() elsewhere
- Propagated the radix tree insert error out of qrtr_node_assign() and
  rejected the packet or failed the endpoint registration
- Fixed the assign condition that stopped adding bridged node ids as
  lookup keys
- Moved the control packet length check to qrtr_endpoint_post() and
  extended it to DEL_SERVER and DEL_CLIENT
- Rejected endpoint node ids at and above QRTR_NODE_HOST_BASE
- Returned error for the QMI message received from an unknown server in
  ath{11k,12k} so that the QMI core drops the service
- Dropped Juha's Tested-by and Vasanth's Reviewed-bt as the code changed since v3
- Link to v3: https://patch.msgid.link/20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com

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

 MAINTAINERS                           |   1 +
 drivers/net/wireless/ath/ath11k/hif.h |   9 +++
 drivers/net/wireless/ath/ath11k/pci.c |   9 +++
 drivers/net/wireless/ath/ath11k/qmi.c |  10 +++
 drivers/net/wireless/ath/ath12k/hif.h |   9 +++
 drivers/net/wireless/ath/ath12k/pci.c |   9 +++
 drivers/net/wireless/ath/ath12k/qmi.c |  11 +++
 include/net/qrtr.h                    |  22 ++++++
 net/qrtr/af_qrtr.c                    | 141 ++++++++++++++++++++++++++++++----
 net/qrtr/mhi.c                        |   4 +-
 10 files changed, 208 insertions(+), 17 deletions(-)
---
base-commit: 8830e65ed46de41f849eefb8ba227d4852c460f6
change-id: 20260918-qrtr-multi-ep-c27c2bc54ee1

Best regards,
--  
மணிவண்ணன் சதாசிவம்



