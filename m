Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A85EC982E1
	for <ath12k@archiver.kernel.org>; Mon, 21 Sep 2026 11:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IU8t1JRfWrIGINdVDCgScYXPyiqDlZ/6ergXEl1tFY=; b=FAJoGw4q9iK8XixWXBdXIMtTqM
	AjijmKdogqEJIixxUg4hT6EqD8kfVCIg1yOSspPrsVBQJJq3pRWuTjPWCaoDns2CoD+qrja+3g4DB
	iuOlEBel/3joOJAUPt7LI0rIgownq2RwV/6t5u3eXXOiO0g+PrAYudsA8+wbAKh1F/Zoo2hlKdKKr
	efywNi3SM7aKzSILcyPtCzb9b7N6dQcJG7toUPmQfwvwSTRMGbtdsbX/dYdg8eOzJUBepAVfOSqir
	dmGd5D89PKZXSccHqpkvJ9OFQFgPj7luuZ7GZziBHMQjCCrd3URKhYeAM68RgcbOQzJdErvousXhm
	A5tLCZsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c9k-00000001uQX-3x0d;
	Mon, 21 Sep 2026 11:25:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c9j-00000001uQE-3P6x;
	Mon, 21 Sep 2026 11:25:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5119243695;
	Mon, 21 Sep 2026 11:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E571F1F00893;
	Mon, 21 Sep 2026 11:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789989955;
	bh=+IU8t1JRfWrIGINdVDCgScYXPyiqDlZ/6ergXEl1tFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k9sz3N4GdpeJEzRzX4jMR2FXUFXpxSvoIQYfMv+R2t1GqT2//p4GZwP/X/5+lve4P
	 yJIZfXwQFM7SRsc7dIWr4GDAzOp5hKtW56b2FfiEkEaAom6R0zXFsILi5cqa0nwAeB
	 Ipbk3eVN87PthYRWyyCgEO1rsbq8CtAlwQcy3yW8u3YYfLOpzs5/aPSC6AgpZ53slR
	 YdAvUqqm2cODG7VtK1Pe/zJm31JPk0KQgaJqFDbVat+Ci38dXlb5HDZRJ497kPDFWT
	 bHMJ8ad+byfEUFK0AMK/xQxgqrqIFfK1246dPIBxqRILgKDGmereFtay3nJ2aZt5mr
	 9a6T/QpCBEeWw==
Date: Mon, 21 Sep 2026 13:25:45 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Cc: "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
	Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] wifi: ath11k: Connect to the QMI server belonging to
 the device owned by this driver
Message-ID: <zozo7e42rvf4evl2q5ugrb2ccvkb6l3um56yuqfgi7ghx5rfou@57b4pqg7fpfk>
References: <20260918-qrtr-multi-ep-v1-0-8a06caa368d3@oss.qualcomm.com>
 <20260918-qrtr-multi-ep-v1-3-8a06caa368d3@oss.qualcomm.com>
 <da0421b8-bf31-43d1-8d71-520753c8344c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da0421b8-bf31-43d1-8d71-520753c8344c@app.fastmail.com>
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

On Fri, Sep 18, 2026 at 07:39:09PM +0300, Juha-Matti Tilli wrote:
> On Fri, Sep 18, 2026, at 19:28, Manivannan Sadhasivam via B4 Relay wrote:
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
> 
> Tested-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
> Tested-on: 2x WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> (assuming the patch is the same and hasn't been updated since 17.9:
> https://github.com/Mani-Sadhasivam/linux/commits/qrtr-multi-ep/ )
> 

I just sent v2. Could you please test this version? I had made some changes
while rebasing to net-next/main, so making sure I didn't regress, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

