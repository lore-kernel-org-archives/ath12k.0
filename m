Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F134F60A2610
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 17:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hJu0uGsp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S0wpvMbb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k6TWqe6a8TrmnSxPzfBWojZNqbAoIQPtwFE2RKyIVPo=; b=hJu0uGspbomyYjKmrf41h+YpeZ
	wMv0s42RAlUmYBGdteZGXHGsTVusHH7PtXdUPgDxYYzL0/o8gthG5DIg2fmKnEn9CFCBuPZSFNHjs
	t83rI9aAKFcT1ZiIGS/mWtes34guAec1RBDkP86ExEB6UycS6BIvDDrtOfTI/jvWDEbFy4SO2+F29
	Gte0UxTDPVLtbFYHi6JLpejpmDsJI9iRb5S/TLXGwqv8LrMjHrb0WTnHsbrmfEac3LATfugcdPlRs
	lvy30529RBbkqBVsWQm3WO4BqTTudYtPwl/MHBc9DGlQvK6DYzkOVBSLRpHReyF7qvDJyybTxnk9x
	zEFtimVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLORR-00000002yg8-3VTG;
	Mon, 26 Oct 2026 17:25:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLORP-00000002yfP-2Xz0;
	Mon, 26 Oct 2026 17:24:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E49243EC8;
	Mon, 26 Oct 2026 17:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFCA1F01825;
	Mon, 26 Oct 2026 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793035498;
	bh=k6TWqe6a8TrmnSxPzfBWojZNqbAoIQPtwFE2RKyIVPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S0wpvMbbVmxyhuPDPxnibJKXyr98XwfGMMYyQCZgyII0zZsb/jkU+b0YClSZ9eLzn
	 RdNJHWwEivyLczV3NKuj+MsGaYwfFqWF3coUXb7J9OGiHbWhPYsg9BLqiNL3Q7xNBw
	 dIVrKldAHUJNEsp9z6eIlBoa75zuUlIZbi5imjb0bt27O3BIZ+GrZapOR/wDx49ZGA
	 H1GJNim+Gw7Nm4XOJQuloa33dSxLqjELFiwMXItMUX2+Fp8LP1TpkkFG1oTU1r7P4/
	 pzCCDVZ1gA1Tv1vqdr0PVOFOs743YmtM9sN4XGvjloi854i6azmpsNeWutnu7nHi/x
	 lEkcvWdGSsyPA==
Date: Mon, 26 Oct 2026 17:24:53 +0000
From: Simon Horman <horms@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
	Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
	Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] net: qrtr: Allow the host QRTR to assign a unique
 node id
Message-ID: <20261026172453.GH257209@horms.kernel.org>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
 <20261022-qrtr-multi-ep-v4-1-c6fdb75fcd3e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-qrtr-multi-ep-v4-1-c6fdb75fcd3e@oss.qualcomm.com>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 07:43:07PM +0200, Manivannan Sadhasivam wrote:
> Currently, QRTR identifies each remote node by the value of the
> 'src_node_id' field in the received packet and uses the node id as the key
> to store the node to the internal 'qrtr_nodes' radix tree.
> 
> But this approach comes with a limitation. When more than one remote node
> share the same id, then QRTR can only add the first node to the radix tree
> and has to drop the successive nodes with the same node id as the 'key' in
> radix tree has to be unique. This prevents connecting identical Qcom PCIe
> WLAN devices to a single host at the same time.
> 
> To fix this limitation, allow the host QRTR to use the node id (nid)
> received from the endpoint driver during qrtr_endpoint_register() as the
> unique node id and use it as the 'key' for the internal radix tree. Also,
> store the received 'src_id' in a new 'qrtr_node->ep_nid' field and replace
> the 'ep_nid' with the unique 'nid' in the QRTR control packets if both
> differ i.e., an endpoint driver has passed a unique 'nid' during
> qrtr_endpoint_register(). To maintain symmetry, replace the 'nid' with the
> 'ep_nid' while sending the packet back to the remote node if both differ.
> 
> A node can also bridge other distant nodes, so the source id of an
> incoming packet is not always the id the endpoint advertises for itself.
> Keep adding such ids to the radix tree as additional keys for the same
> node, as it was done before this change. Otherwise the bridged nodes would
> lose their route and qrtr_sendmsg() would start failing with -ECONNRESET
> for them.
> 
> Currently, all QRTR endpoint drivers pass 'QRTR_EP_NID_AUTO' as the 'nid'
> during qrtr_endpoint_register(). So 'ep_nid' and 'nid' are same and the
> routing behavior is not changed.
> 
> Finally, since qrtr_node_rewrite_ctrl() dereferences the control packet for
> DEL_SERVER and DEL_CLIENT as well, extend the existing length check in
> qrtr_endpoint_post() to cover both types.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  net/qrtr/af_qrtr.c | 132 ++++++++++++++++++++++++++++++++++++++++++++++-------

Reviewed-by: Simon Horman <horms@kernel.org>


