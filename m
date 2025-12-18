Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDB1D6E2AF
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ErTlMAv6ZVtNtIwiySv/0dt6NKw+yq7HXxauLF93bM=; b=qyrCvHfAFUrsiDjwzFw2ZrvI9P
	w9Tw9ffvHdsC9wS0RL4e6l1hsPbWh+4WhlAACKfZr5LAfCJJqIcq5fD4feQs/7KD/+yjR8u1L4GHq
	+obOOIZJlTgCSWfqDIHEyP4wJFXCpijWxtDa2lVYAvsn/MwETVNXv75yvwkZPalT++2Z91SPl2xpF
	ktFDCAdnq40eQnTqB50pAflC3oT6z+rpmp/BrbX14PrAJvIRod5IbEVkE9KHnINb9TUCv2xyOYCmf
	kHH/k9cZ7wovlDtMu0S9/E7GPf+4bZmNBzFaK5Q39QNU9v4yX5cMqSvCA/a4f8lBpDir7CkdjnpdK
	3C6TjEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGnc-00000008ovw-1NNG;
	Thu, 18 Dec 2025 16:24:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGna-00000008ovd-08K4;
	Thu, 18 Dec 2025 16:24:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7109460008;
	Thu, 18 Dec 2025 16:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742D1C4CEFB;
	Thu, 18 Dec 2025 16:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766075057;
	bh=X5gSMMJxTpeVSLwt9c3VGpJBP7cA+dKBFUTwA1R/8Mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpB9QjfxUGu7QHeL+Ttl3LbAbI0T6PGcte3cn+vIPi7DalYPSikxLc4VNjs+cpLMU
	 wAHm/NDnq3/9kUW0LDoX3+13AOelp2GqKXTYjoe50BFg7vDy3SO6luvKjh1dbx8+uX
	 esRJC+w0UZsPyGsE4IuZLrx1NXnDPaAPK7noFXUR3Sfa757BmSMq29w2iuXqHYK48p
	 MZaE4rqXx9iMTl7GFQzcqkHRmumgpFlPwZofAGeWpTNAx1AKVTt+Di4Upt2U7lFyTc
	 1X3wPqiVCqHD+JYpbvtv5JKyX0UGO6Mxcto4/3HoJJkrHjbEJkKYjYI8YoSW//pXSP
	 XLtDOMNb4Xjqg==
Date: Thu, 18 Dec 2025 21:54:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, 
	Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maxim Kochetkov <fido_max@inbox.ru>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	mhi@lists.linux.dev, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] net: qrtr: Drop the MHI auto_queue feature for IPCR
 DL channels
Message-ID: <pm5amorzm2bvjrvswd4phwiic7wsmitxtzwdvtwqflepxkukjf@esikj32tds7o>
References: <20251217-qrtr-fix-v1-0-f6142a3ec9d8@oss.qualcomm.com>
 <20251217-qrtr-fix-v1-1-f6142a3ec9d8@oss.qualcomm.com>
 <CAFEp6-0iuJNDM9hdU3rWns=Vst6Ev1iyNim1ngRH3Z44CHwTAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-0iuJNDM9hdU3rWns=Vst6Ev1iyNim1ngRH3Z44CHwTAg@mail.gmail.com>
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

On Wed, Dec 17, 2025 at 09:55:01PM +0100, Loic Poulain wrote:
> Hi Mani,
> 
> On Wed, Dec 17, 2025 at 6:17 PM Manivannan Sadhasivam via B4 Relay
> <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
> >
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >
> > MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> > auto queue the buffers for the RX path (DL channel). Though this feature
> > simplifies the client driver design, it introduces race between the client
> > drivers and the MHI stack. For instance, with auto_queue, the 'dl_callback'
> > for the DL channel may get called before the client driver is fully probed.
> > This means, by the time the dl_callback gets called, the client driver's
> > structures might not be initialized, leading to NULL ptr dereference.
> >
> > Currently, the drivers have to workaround this issue by initializing the
> > internal structures before calling mhi_prepare_for_transfer_autoqueue().
> > But even so, there is a chance that the client driver's internal code path
> > may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() is
> > called, leading to similar NULL ptr dereference. This issue has been
> > reported on the Qcom X1E80100 CRD machines affecting boot.
> >
> > So to properly fix all these races, drop the MHI 'auto_queue' feature
> > altogether and let the client driver (QRTR) manage the RX buffers manually.
> > In the QRTR driver, queue the RX buffers based on the ring length during
> > probe and recycle the buffers in 'dl_callback' once they are consumed. This
> > also warrants removing the setting of 'auto_queue' flag from controller
> > drivers.
> >
> > Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> > So only the QRTR client driver requires the modification.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> > Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> > Reported-by: Johan Hovold <johan@kernel.org>
> > Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> > Suggested-by: Chris Lew <quic_clew@quicinc.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >  drivers/accel/qaic/mhi_controller.c   | 44 -----------------------
> >  drivers/bus/mhi/host/pci_generic.c    | 20 ++---------
> >  drivers/net/wireless/ath/ath11k/mhi.c |  4 ---
> >  drivers/net/wireless/ath/ath12k/mhi.c |  4 ---
> >  net/qrtr/mhi.c                        | 67 +++++++++++++++++++++++++++++------
> >  5 files changed, 58 insertions(+), 81 deletions(-)
> [...]
> > diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> > index 69f53625a049..0b4d181ea747 100644
> > --- a/net/qrtr/mhi.c
> > +++ b/net/qrtr/mhi.c
> > @@ -24,13 +24,25 @@ static void qcom_mhi_qrtr_dl_callback(struct mhi_device *mhi_dev,
> >         struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
> >         int rc;
> >
> > -       if (!qdev || mhi_res->transaction_status)
> > +       if (!qdev || (mhi_res->transaction_status && mhi_res->transaction_status != -ENOTCONN))
> >                 return;
> >
> > +       /* Channel got reset. So just free the buffer */
> > +       if (mhi_res->transaction_status == -ENOTCONN) {
> > +               devm_kfree(&mhi_dev->dev, mhi_res->buf_addr);
> > +               return;
> > +       }
> > +
> >         rc = qrtr_endpoint_post(&qdev->ep, mhi_res->buf_addr,
> >                                 mhi_res->bytes_xferd);
> >         if (rc == -EINVAL)
> >                 dev_err(qdev->dev, "invalid ipcrouter packet\n");
> > +
> > +       /* Done with the buffer, now recycle it for future use */
> > +       rc = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, mhi_res->buf_addr,
> > +                          mhi_dev->mhi_cntrl->buffer_len, MHI_EOT);
> > +       if (rc)
> > +               dev_err(&mhi_dev->dev, "Failed to recycle the buffer: %d\n", rc);
> >  }
> >
> >  /* From QRTR to MHI */
> > @@ -72,6 +84,27 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
> >         return rc;
> >  }
> >
> > +static int qcom_mhi_qrtr_queue_dl_buffers(struct mhi_device *mhi_dev)
> > +{
> > +       void *buf;
> > +       int ret;
> > +
> > +       while (!mhi_queue_is_full(mhi_dev, DMA_FROM_DEVICE)) {
> 
> This approach might be a bit racy, since a buffer could complete
> before the alloc+queue loop finishes. That could e.g lead to recycle
> error in a concurrent DL callback.

I don't think the race is possible as we just queue the buffers during probe and
resume. But I get your point, using mhi_get_free_desc_count() is more
straightforward.

- Mani

> It might be simpler to just queue
> the number of descriptors returned by mhi_get_free_desc_count().
> 
> > +               buf = devm_kmalloc(&mhi_dev->dev, mhi_dev->mhi_cntrl->buffer_len, GFP_KERNEL);
> > +               if (!buf)
> > +                       return -ENOMEM;
> > +
> > +               ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, mhi_dev->mhi_cntrl->buffer_len,
> > +                                   MHI_EOT);
> > +               if (ret) {
> > +                       dev_err(&mhi_dev->dev, "Failed to queue buffer: %d\n", ret);
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
> >                                const struct mhi_device_id *id)
> >  {
> > @@ -87,20 +120,30 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
> >         qdev->ep.xmit = qcom_mhi_qrtr_send;
> >
> >         dev_set_drvdata(&mhi_dev->dev, qdev);
> > -       rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> > -       if (rc)
> > -               return rc;
> >
> >         /* start channels */
> > -       rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
> > -       if (rc) {
> > -               qrtr_endpoint_unregister(&qdev->ep);
> > +       rc = mhi_prepare_for_transfer(mhi_dev);
> > +       if (rc)
> >                 return rc;
> > -       }
> > +
> > +       rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> > +       if (rc)
> > +               goto err_unprepare;
> > +
> > +       rc = qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
> > +       if (rc)
> > +               goto err_unregister;
> >
> >         dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
> >
> >         return 0;
> > +
> > +err_unregister:
> > +       qrtr_endpoint_unregister(&qdev->ep);
> > +err_unprepare:
> > +       mhi_unprepare_from_transfer(mhi_dev);
> > +
> > +       return rc;
> >  }
> 
> Regards,
> Loic

-- 
மணிவண்ணன் சதாசிவம்

