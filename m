Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A396CA5FA7
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 19:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPq1lDMEISVN+4Wuw6T9MQdT1Hadq3U5RnwOvLWqtiI=; b=Mj5BKDWQox7YQXiJWk0ZwkhBhj
	117yTA5tnAUK8E3u3bkYlekA2r1ZF5X7+1h0mZ5MvLYzGuz3pncL6Ku5gJK7NUCAxA0JkY59fq0BQ
	O/tyO/cTji9WeAdauvDbcCV8p3nnGtIiK4xkoydqT3SaYoYzPfg2M4TF7RFcpj/6aWjm6Acjl+va2
	OKGcBsHE7xEmW5Xnau2D5aKuw2Euqg2Gyqm0xP9MJ5y7XQUJrIc8G0Nu9ZdSpdAHeCtPsAA1EWesJ
	7QRsImJfvPSkMwCUBY+IIRkmmBkN1RXxbg5nn4R+WoTN2ckDIyOIdQfElZHvY5OqkcJ4hHyQTDLdE
	uH1+nfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdV0-00000004Mpw-373u;
	Tue, 29 Sep 2026 19:28:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdUy-00000004Mpg-3rtQ;
	Tue, 29 Sep 2026 19:28:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9147D41252;
	Tue, 29 Sep 2026 19:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2AA1F000FF;
	Tue, 29 Sep 2026 19:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790710100;
	bh=WPq1lDMEISVN+4Wuw6T9MQdT1Hadq3U5RnwOvLWqtiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NuegzX1UKYqn/UPWpQSpkyHmTr3d3g03TW7g+C5olyCVAouYMAlk6oBFelgupSEYt
	 8VH+lhlaHXzsRENC+xixzvC9g3gG1JhjwQbpK1+PPlyLDOkVoDZwMw54PdnOTqHnq9
	 23BqfIn1ooJac4iV67+OB+G++SPLudSAyWBQjfLTJto0vIz1jeglLhKYZIb2gJyYYD
	 rCpDS1itH8K8mtMEfHh90+S1AxiFcCCGE1T1I5gfiawCG/Brf2LpyLUEoDvE/5lwTw
	 mlyRMAtmt8JrRhyjPUQl6Wc3IdFvauM9SLa6oJlXsruUTfGpJ3LHiZFDp63CpPWnIq
	 /EcVbqkJAeV3g==
Date: Tue, 29 Sep 2026 21:28:11 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, 
	Juha-Matti Tilli <juha-matti.tilli@iki.fi>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
Message-ID: <4dt7cguc4trc5i55ot3numuzz3nolbcpgtl4iztxw4a7b46v23@relb42cpotlz>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
 <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
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

On Tue, Sep 29, 2026 at 10:15:52PM +0530, Deepak Kumar Singh wrote:
> 
> On 9/22/2026 7:11 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > Now that the QRTR driver allows using the unique node id for each device,
> > which is different from the node id received from the remote node, compute
> > a unique node id using a new API, qrtr_host_node_id().
> > 
> > This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE,
> > whose value is outside of the node id range used by the remote nodes (0 to
> > 0xffff).
> > 
> > Finally, call the new API from MHI endpoint driver by passing the MHI
> > controller index as the parameter. The MHI controller index is unique for
> > each controller, thereby for each MHI endpoint device.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >   MAINTAINERS        |  1 +
> >   include/net/qrtr.h | 21 +++++++++++++++++++++
> >   net/qrtr/mhi.c     |  4 +++-
> >   3 files changed, 25 insertions(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index df8ab9b82402..9c8bb086be28 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -22511,6 +22511,7 @@ QUALCOMM IPC ROUTER (QRTR) DRIVER
> >   M:	Manivannan Sadhasivam <mani@kernel.org>
> >   L:	linux-arm-msm@vger.kernel.org
> >   S:	Maintained
> > +F:	include/net/qrtr.h
> >   F:	include/trace/events/qrtr.h
> >   F:	include/uapi/linux/qrtr.h
> >   F:	net/qrtr/
> > diff --git a/include/net/qrtr.h b/include/net/qrtr.h
> > new file mode 100644
> > index 000000000000..745d51b4a6ba
> > --- /dev/null
> > +++ b/include/net/qrtr.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef _NET_QRTR_H
> > +#define _NET_QRTR_H
> > +
> > +#include <linux/types.h>
> > +
> > +/* The offset is chosen carefully to not collide with the node ids allocated by
> > + * the remote nodes. All the remote nodes use node ids in range 0 to 0xffff.
> > + */
> > +#define QRTR_NODE_HOST_BASE 0x10000u
> 
> Can it be exposed with include/uapi/linux/qrtr.h also. There are user space clients like modem manager
> which need to calculate modified node id to distinguish same service from multi modem over mhi.
> This is same as wlan use case.
> 

I'm OK with exposing the final nid to the userspace, but not just the offset and
asking client to calculate the nid on its own.

Will implement this final nid ABI in next version.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

