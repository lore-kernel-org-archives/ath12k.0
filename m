Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65FDC982FA
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 13:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApsZVBFkcyb1C7G7ucDacbOxA5hWzpJXw9SDkNt3hYw=; b=gSJSZ+76BOBZgfWlsBPgjm4Izq
	GsBqgo4+U8LYZmLK8lhDe2i08zFxMcnKpzJ9GyxgEHSTh9yGr8RCgrk1HaT8I6NE9tPaIKwMkqKFZ
	tHxpgk2Kcu080W/uySWV8E5PTTQEqDP1HiI1XS7HJz9i/y9C0r1/7B+WwFS1MHIJA/h5jDTDPfIYs
	kMd7btabtPrUqgjiz9ptbJWp5O7ThSRg6Iugzbl5kK90mla4lzStOodP8iOXwqZDHJLZs/E/cH9DF
	05aPU5yHs8lyL9lfaRiPkHPaXCRr/ycErWE8a7XiZ1cp2clOEZ94dKn4xxkuAL+G/oTi2Bhe2+KXT
	w70Wpbxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90XO-00000005WH0-1Oki;
	Tue, 22 Sep 2026 13:27:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90XN-00000005WGT-1GWs;
	Tue, 22 Sep 2026 13:27:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 78D9460DFF;
	Tue, 22 Sep 2026 13:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560641F000FF;
	Tue, 22 Sep 2026 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790083676;
	bh=ApsZVBFkcyb1C7G7ucDacbOxA5hWzpJXw9SDkNt3hYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FwhENWJkUL+Ph/E/ZL08lyizsjNyTtU6O+wgwczrNQQDJdxOGDr8Xkh7SjPAAT7pT
	 lnVQgC0Cf7WE3w8On+hyQLcfF2SrM437/whHiUMkQ3DZtWaY8x2ToWjM1eUJQ5ZQZY
	 qMGenCbLjWe/h8ax5QShb0raOqc+uLsvhMjUCplAmP2hyChI4W5FuhbPGSJc7+Myu0
	 FkP91zRSSM5mBvItuthSEdtgzWn/vG+JCEVXQ+/kjKJpIEO9ntAyiqHGASa28we9o1
	 GyOqxEu+9kDUVOGhOnH/9/vyu3oPSD1+i/12DF7cfNd1/hg/r2bHQ5lDI1tq4P9xOh
	 4HzsuT7Wof19g==
Date: Tue, 22 Sep 2026 15:27:45 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
	Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] wifi: ath11k: Connect to the QMI server belonging
 to the device owned by this driver
Message-ID: <irhurowbxxpxrg7j3f4onxboxoxzj5jszyuq5ex5osedmx5k4u@r4d365t6kpze>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-3-27dd80d841a0@oss.qualcomm.com>
 <3f31a185-b7ba-4ae4-a3c3-874bac0d66b3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f31a185-b7ba-4ae4-a3c3-874bac0d66b3@oss.qualcomm.com>
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

On Tue, Sep 22, 2026 at 04:32:07PM +0530, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 9/21/2026 4:53 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > When two identical ath11k PCIe devices are connected to the same host, both
> > advertise the WLFW service with the same service and instance id. The QMI
> > lookup reports both servers to each device, so a device may connect to the
> > firmware running on the other device.
> > 
> > But now, QRTR provides each MHI endpoint a unique node id which is
> > different from the node id announced by the device. So use the same id to
> > pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> > the node id derived from the MHI controller index and zero for transports
> > that do not assign one. In the new_server callback, skip any service whose
> > node id does not match. A node id of zero disables the check, so transports
> > that do not assign one keep their current behavior.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >   drivers/net/wireless/ath/ath11k/hif.h |  9 +++++++++
> >   drivers/net/wireless/ath/ath11k/pci.c |  9 +++++++++
> >   drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++++
> >   3 files changed, 28 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/ath/ath11k/hif.h b/drivers/net/wireless/ath/ath11k/hif.h
> > index 017fed1b4bd1..0da9025c7ed8 100644
> > --- a/drivers/net/wireless/ath/ath11k/hif.h
> > +++ b/drivers/net/wireless/ath/ath11k/hif.h
> > @@ -32,6 +32,7 @@ struct ath11k_hif_ops {
> >   	void (*ce_irq_disable)(struct ath11k_base *ab);
> >   	void (*get_ce_msi_idx)(struct ath11k_base *ab, u32 ce_id, u32 *msi_idx);
> >   	void (*coredump_download)(struct ath11k_base *ab);
> > +	int (*get_qrtr_node_id)(struct ath11k_base *ab);
> >   };
> >   static inline void ath11k_hif_ce_irq_enable(struct ath11k_base *ab)
> > @@ -159,4 +160,12 @@ static inline void ath11k_hif_coredump_download(struct ath11k_base *ab)
> >   		ab->hif.ops->coredump_download(ab);
> >   }
> > +static inline int ath11k_hif_get_qrtr_node_id(struct ath11k_base *ab)
> > +{
> > +	if (!ab->hif.ops->get_qrtr_node_id)
> > +		return 0;
> > +
> > +	return ab->hif.ops->get_qrtr_node_id(ab);
> > +}
> > +
> >   #endif /* _HIF_H_ */
> > diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> > index a163168f3617..4d327b5cc98a 100644
> > --- a/drivers/net/wireless/ath/ath11k/pci.c
> > +++ b/drivers/net/wireless/ath/ath11k/pci.c
> > @@ -10,6 +10,7 @@
> >   #include <linux/of.h>
> >   #include <linux/time.h>
> >   #include <linux/vmalloc.h>
> > +#include <net/qrtr.h>
> >   #include "pci.h"
> >   #include "core.h"
> > @@ -900,6 +901,13 @@ static int ath11k_pci_start(struct ath11k_base *ab)
> >   	return 0;
> >   }
> > +static int ath11k_pci_get_qrtr_node_id(struct ath11k_base *ab)
> > +{
> > +	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
> > +
> > +	return qrtr_host_node_id(ab_pci->mhi_ctrl->index);
> 
> nit: since qrtr_host_node_id() returns node_id in unsigned int,
> may be maintain that in the return type of the callers as well.
> Mostly harmless as it is unlikely that node_id is allocated with
> an extremely high id. Either way is fine with me. Same applicable
> for ath12k patch as well.
> 

Thanks for spotting it. For the sake of correctness, it makes sense to use same
type everywhere. I'll fix it in next version.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

