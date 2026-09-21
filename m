Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3DBC982ED
	for <ath12k@archiver.kernel.org>; Mon, 21 Sep 2026 01:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDur6IwTSE7iTR0vxd9Zd48PXGF6FvROWSLYkOLIWkQ=; b=LDHaFK2N2n8uSbVFtYFz5YgpTs
	DeA5Pe9keQmJ6v8TbqgaqF0NY3mmtst4Uca/xrOMxWEDrqN+6/Y4wdgknpimYlVQkmR+oz+j0nipv
	c4Zkz9DG/tSsL7F7ytef44VSW7sehmhl3fQUCEhzKFPKbx24yOIuuuN4EGRltVmTEoZjt3gKDn+1S
	Dvu2kpLx6DNLAju1Kes2wLWOeZJrBHaB0FSftVwKsl6YLdVzKzHENpKqx+sRpo6BZnEF2iqZnbYrl
	a7TGe9OduJGCbrAw8jkqFxkU/POoSxr7zUOmTfA7pfVkYWBOYA68fzaBVW9BoIV1ua6cIvMrc941K
	3YqqJYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8SfA-00000000fzQ-2S8r;
	Mon, 21 Sep 2026 01:17:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Sf9-00000000fyz-220k;
	Mon, 21 Sep 2026 01:17:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01B90600C8;
	Mon, 21 Sep 2026 01:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACAB1F000FF;
	Mon, 21 Sep 2026 01:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789953460;
	bh=YDur6IwTSE7iTR0vxd9Zd48PXGF6FvROWSLYkOLIWkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OKkp+pe9xIpMgy2kIuEbPoZqVzeihqLQ6TA3Wyi8ZDStD+EeeVhcqIHBZahTRwweH
	 gDuQGyJGgLjdjZeKSS1Q1f/mP/OAt00rp2UnpAd8x9JboiDWnWQRIXUlUpiKJF8xN2
	 uwHi13TBks7vz1/jjQsf0kCMQguuDYhC7VISMQd34V/5j5d83h08IBRVk/3IwZOjm/
	 A8Pk14VPuIQQgNsaq7jLHuIEtYcAs06ZD/uSm3S8MeS0erbL1pOp+iBVErmRdMfHUt
	 vNURY/YTmu91VgAouiUqxw1RtA0ZShQcdOlUB40TQr1GYpNY2/Hla0iTqYRb6KzyPs
	 uwzcExwxuI3ag==
Date: Mon, 21 Sep 2026 03:17:24 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
	Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH 0/4] net: qrtr: Add support for using identical MHI
 endpoint devices
Message-ID: <j22jk53fhr7nkbb5vcjgp3xw6zoklbt7afzvfetmoh3om3ttsl@pobyf4t3zcsv>
References: <20260918-qrtr-multi-ep-v1-0-8a06caa368d3@oss.qualcomm.com>
 <4e0481c1-9288-42d4-94c9-e18da5cf8e5d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e0481c1-9288-42d4-94c9-e18da5cf8e5d@oss.qualcomm.com>
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

On Fri, Sep 18, 2026 at 11:13:42AM -0700, Jeff Johnson wrote:
> On 9/18/2026 9:28 AM, Manivannan Sadhasivam via B4 Relay wrote:
> > Hi,
> > 
> > This series reworks the QRTR driver to add support for using identical MHI
> > endpoint devices at the same time. Currently, QRTR driver has a limitation on
> > using more than one identical MHI endpoint devices like QCS6490 or any Qcom
> > Endpoint device making use of QRTR at the same time. Because of the fact that
> > these devices will have the identical QRTR node id, they cannot be used at the
> > same time, on the same host machine.
> > 
> > This limitation is a blocker for running upstream kernel on devices like Qcom
> > based routers as they often have multiple identical WLAN Endpoint devices
> > connected to the Router SoC.
> > 
> > This series supersedes the following 2 series from Juha:
> > https://lore.kernel.org/all/20260915054207.2513877-1-juha-matti.tilli@iki.fi
> > https://lore.kernel.org/all/20260915074135.2567411-1-juha-matti.tilli@iki.fi
> > 
> > Compared to the series from Juha, this series simplifies the multi-endpoint
> > support by computing a unique node id for each MHI endpoint and uses it for the
> > internal QRTR book keeping. This ensures that even if the MHI endpoint devices
> > have same node ids, the host QRTR will always use a unique node id for each one
> > of them.
> > 
> > More details can be found in the individual patches.
> > 
> > Testing
> > =======
> > 
> > Juha tested this series on multi ath11k setup by backporting this series to
> > 6.6.156 kernel. I'd appreciate a formal tested-by tag from Juha and other folks
> > CCed to this series.
> > 
> > Merge Strategy
> > ==============
> > 
> > Since both QRTR and ath drivers are falling under the networking tree, the whole
> > series can be merged through netdev tree.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> > Manivannan Sadhasivam (4):
> >       net: qrtr: Allow the host QRTR to assign a unique node id
> >       net: qrtr: Assign unique node id for MHI endpoints
> >       wifi: ath11k: Connect to the QMI server belonging to the device owned by this driver
> >       wifi: ath12k: Connect to the QMI server belonging to the device owned by this driver
> > 
> >  MAINTAINERS                           |  1 +
> >  drivers/net/wireless/ath/ath11k/hif.h |  9 ++++++
> >  drivers/net/wireless/ath/ath11k/pci.c |  9 ++++++
> >  drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++
> >  drivers/net/wireless/ath/ath12k/hif.h |  9 ++++++
> >  drivers/net/wireless/ath/ath12k/pci.c |  9 ++++++
> >  drivers/net/wireless/ath/ath12k/qmi.c | 11 +++++++
> >  include/net/qrtr.h                    | 21 ++++++++++++
> >  net/qrtr/af_qrtr.c                    | 61 +++++++++++++++++++++++++++++++----
> >  net/qrtr/mhi.c                        |  4 ++-
> >  10 files changed, 136 insertions(+), 8 deletions(-)
> > ---
> > base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> 
> I see this is based upon v7.3-rc1 (current release tree).
> This series doesn't cleanly apply on the net-next tree.
> 

Ah, that's bad.

> Are you planning on netdev taking this through current or next?
> 

-next only. I will respin.

> And an alternate merge strategy would be for netdev to take the first two
> patches and then after wireless fast-forwards and ath fast-forwards, I could
> take the last two though the ath tree.
> 

Unfortunately, ath patches depend on API introduced by the 2nd patch. So they
can't be applied independently.

I will respin this series on top of ath-next so that the series can be applied
through netdev next.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

