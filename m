Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C67606A333
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QEa+m3zl;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bachbU0d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vtU+kBzBPd6DlQELqlotiDLJ3HaHy3LtAxD3GeegWhs=; b=QEa+m3zlfkDPwqc6BAPGOTqR9U
	txwEfxgfsSU7jAMhH22+AJr0XO0OTiriApf/t2SU/EtizBdkm9PZkb1gg8faR59GsMVXK9yd36++L
	u9sJQLxZ45QknmcBxJQtrNzd9/4uuoQYeFrUNGVuEBDIBD6fAN8U2Tn6t+Msno59eZmApzDOO00zw
	gNnNdFK405Y11+lNt9ee27iZbKQt5XQ3FhbZbw0o6/4XK/E6uGQXlt6orQpHsf3OcgPrTVJnJ1mHu
	Q73PXK1+Ens+Qk+3RM0VUclwlwOHQNy2wHJMod2V63IsypR2d5ShqaTdrqw+WVAkywswtTlpsEfSG
	sDOfN8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLOS6-00000002ywI-1reN;
	Mon, 26 Oct 2026 17:25:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLOS5-00000002yv8-1Nue;
	Mon, 26 Oct 2026 17:25:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77392601EF;
	Mon, 26 Oct 2026 17:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75F71F01825;
	Mon, 26 Oct 2026 17:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793035540;
	bh=vtU+kBzBPd6DlQELqlotiDLJ3HaHy3LtAxD3GeegWhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bachbU0dKGwcBYfW42KWyzvr8NDrZSvBhcmnOgwCtYFmnFjXJ6X0+FhrZkBztKbMJ
	 wQ3Nc2YGmiV/XYHQgULEdGinAd9edH/fw2ICcIESbKiWC5QnCgOZe6/jQCZdaW3UZT
	 rJEm5UuOzb+ey2m/sOKzGmOSsvlhO2Sz+0uLRCvYAqNPlKNryYvDg3Or2UYJHh+zUi
	 4cAoK9xZWf3sxeWch3e+H0aueN8TcrnkoQgxh2XsJteKdwYGxBfeEZ5X9jq4+8bPUo
	 h/wxuGYbHhJ2KGcGCEeDjUcgShKUKE9oE34HweBWNHYj91p+PPxfL44szG2+KAX/yd
	 HM8qBOExM7Wog==
Date: Mon, 26 Oct 2026 17:25:34 +0000
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
Subject: Re: [PATCH v4 2/4] net: qrtr: Assign unique node id for MHI endpoints
Message-ID: <20261026172534.GI257209@horms.kernel.org>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
 <20261022-qrtr-multi-ep-v4-2-c6fdb75fcd3e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-qrtr-multi-ep-v4-2-c6fdb75fcd3e@oss.qualcomm.com>
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

On Thu, Oct 22, 2026 at 07:43:08PM +0200, Manivannan Sadhasivam wrote:
> Now that the QRTR driver allows using the unique node id for each device,
> which is different from the node id received from the remote node, compute
> a unique node id using a new API, qrtr_host_node_id().
> 
> This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE.
> The base is chosen well above the node ids in use by the remote nodes, so
> that the host assigned ids never collide with the pre-existing ones.
> 
> Since the ids at and above the base now belong to the host, reject any
> packet carrying one as the source node id or as the node id of an
> announced server in qrtr_endpoint_post().
> 
> Finally, call the new API from MHI endpoint driver by passing the MHI
> controller index as the parameter. The MHI controller index is unique for
> each controller, thereby for each MHI endpoint device.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  MAINTAINERS        |  1 +
>  include/net/qrtr.h | 22 ++++++++++++++++++++++
>  net/qrtr/af_qrtr.c |  9 +++++++++
>  net/qrtr/mhi.c     |  4 +++-
>  4 files changed, 35 insertions(+), 1 deletion(-)

Reviewed-by: Simon Horman <horms@kernel.org>


