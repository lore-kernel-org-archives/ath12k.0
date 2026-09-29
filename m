Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC7CCA5FA7
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 19:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYT1pzhI3fvjvNKGoV0gv49pvi/bcg98Rzpa+iMF22U=; b=mTm48lFQJJQQMSOlvEsy0iS0xe
	zULw+ntYsnoXS728abtIXmkchdABefmBIvDAnD1EjNHCAtSCQCqqgaZHS/RiXolbzk17jmC7LL6a0
	0CUUZbVihWEg55EOWyQptcxvpyegrcFVyNDFXDhR6RA0XK2m9z5PQhcY/QZE6x+wtlbJMJM6XhdSV
	gL7k1LR8IAtzh2GLjAHO5/1Tp7GXRqiUqpabhCnbGM6YFySrzUxiLNorclx0r7ugIXLMwPJrb3IZF
	fBGAypp+qgX6nLHJ6CxifpcyNYnrDteb+1ln9v2cZ5DaAUyg/eWYtaf6QvghxSkccC/QWQa1u8taD
	gd7zsB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdZ8-00000004NLX-1e7o;
	Tue, 29 Sep 2026 19:32:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdZ6-00000004NLD-3rl1;
	Tue, 29 Sep 2026 19:32:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FD0443691;
	Tue, 29 Sep 2026 19:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCF61F000FF;
	Tue, 29 Sep 2026 19:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790710356;
	bh=DYT1pzhI3fvjvNKGoV0gv49pvi/bcg98Rzpa+iMF22U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dliHjACD6G8cM6hYVY4XjJBOleZdtkVYSGu1FX1+CxqinZZxM0wele4GyNm/fiiuN
	 LVNGN+oMVkKa9DJ4wbQGjrtKwaKPpmuPJ/+dKknRavmrMDXFM6K+moRrhCpnj80ojC
	 9/aGRsjL/3ybLo6/PBiAiVGK8gSM7Aa58ftoQwaumcUIkSdNuMz0PHH8sBktzfwe/D
	 ZESGCpQ1Q+2xq1xWukZ+P0uGJGBWs1Y3vJ9ivqeTPR+fc6oJzBenWHAmVVxN4wS/qw
	 sdpfczACclbENStrycVY5MgbtCRZCuiEbWcd3CIbkD65UUC+khs49257qzI+kDuRb+
	 ehY6BsRSmlMdw==
Date: Tue, 29 Sep 2026 21:32:27 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, 
	Juha-Matti Tilli <juha-matti.tilli@iki.fi>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
Message-ID: <erwghnlgy7bv7bjiut6f3cidzm4gpblevrfvxfe7yllwf6aqaw@d6w5d4jp5kr5>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
 <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13BFC5B0-77E6-48F2-B857-37686EA1DB2C@holtmann.org>
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

On Tue, Sep 29, 2026 at 07:05:31PM +0200, Marcel Holtmann wrote:
> Hi Deepak,
> 
> >> Now that the QRTR driver allows using the unique node id for each device,
> >> which is different from the node id received from the remote node, compute
> >> a unique node id using a new API, qrtr_host_node_id().
> >> 
> >> This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE,
> >> whose value is outside of the node id range used by the remote nodes (0 to
> >> 0xffff).
> >> 
> >> Finally, call the new API from MHI endpoint driver by passing the MHI
> >> controller index as the parameter. The MHI controller index is unique for
> >> each controller, thereby for each MHI endpoint device.
> >> 
> >> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >> ---
> >>  MAINTAINERS        |  1 +
> >>  include/net/qrtr.h | 21 +++++++++++++++++++++
> >>  net/qrtr/mhi.c     |  4 +++-
> >>  3 files changed, 25 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index df8ab9b82402..9c8bb086be28 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -22511,6 +22511,7 @@ QUALCOMM IPC ROUTER (QRTR) DRIVER
> >>  M: Manivannan Sadhasivam <mani@kernel.org>
> >>  L: linux-arm-msm@vger.kernel.org
> >>  S: Maintained
> >> +F: include/net/qrtr.h
> >>  F: include/trace/events/qrtr.h
> >>  F: include/uapi/linux/qrtr.h
> >>  F: net/qrtr/
> >> diff --git a/include/net/qrtr.h b/include/net/qrtr.h
> >> new file mode 100644
> >> index 000000000000..745d51b4a6ba
> >> --- /dev/null
> >> +++ b/include/net/qrtr.h
> >> @@ -0,0 +1,21 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +
> >> +#ifndef _NET_QRTR_H
> >> +#define _NET_QRTR_H
> >> +
> >> +#include <linux/types.h>
> >> +
> >> +/* The offset is chosen carefully to not collide with the node ids allocated by
> >> + * the remote nodes. All the remote nodes use node ids in range 0 to 0xffff.
> >> + */
> >> +#define QRTR_NODE_HOST_BASE 0x10000u
> > 
> > Can it be exposed with include/uapi/linux/qrtr.h also. There are user space clients like modem manager
> > which need to calculate modified node id to distinguish same service from multi modem over mhi.
> > This is same as wlan use case.
> 
> did anybody actually looked at the proposal that Denis and I came up with. It was exactly addressing this properly.
> 

I did review the proposal from Juha and shared my review feedback.

> It seems you guys came up with some hot fix and want to run with it. After month and month of silence and not bothering to review the proposal, you are trying to push your thing?
> 

I aplologized for the very late review. But the series I shared was not just
some hot fix, but a proper solution (without userspace ABI though as I didn't
forsee the requirement) that works for the multi-WLAN setups.

> If you don’t support userspace, your proposal is broken. Plain and simple.
> 

Small correction: broken for some setups, not all. But I do get the point. I'll
incorporate this ABI in next version.

Thanks for the review!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

