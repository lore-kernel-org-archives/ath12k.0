Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A05C7115B
	for <ath12k@archiver.kernel.org>; Thu, 26 Jun 2025 07:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqlBNz9RkxU5GmUfvK2gLIcI6NeZRHtGWLMpeVYEKaE=; b=W7sgDbxndpVCK6dGYp7B1unMDp
	hVL0fppKIQRNpD8Sj/bWW0eE43CTYIEhKtThhIOcXu42ayUW8HiA4lNMZLbFf1pl5dIuKzB5ZNYvO
	7i0PRFf/OnVLs63PjK8/od4snLIryH/eFqvcPdpYUY+uL0O8Srlz80Dg5q5bIT6FZyf6j4BCcV2Ns
	557G23ApbmYfBUTaNhcCt99rgHhshL1W3WCTCxQdYb+QnDoagFT+IlKSesH+D2o3Vp7XhpXHyUFcr
	Ec+m+X0my+Qu+mn/DNSxc2WDHWYXPP+I47ACAnxpkhPetu+ERv9ZxOdT+y8bicoKa3M7R7//maRq/
	f/dAA2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUh3d-0000000AoCE-1F1U;
	Thu, 26 Jun 2025 07:30:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUh3a-0000000AoBr-3cTN
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 07:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 622905C4941;
	Thu, 26 Jun 2025 07:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99F2C4CEEB;
	Thu, 26 Jun 2025 07:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750923001;
	bh=USPecJ+fVgr0c6joAtvhKAAbQeCia+AOGrJmMy5S67s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zOz4DkoaO1jWxTi1g8gxaqhuZFjhE58S2mC08ZOo65kPh8SCcNbP/rKvuW+4l78g8
	 fgF47yIEpADGouZPK6Z7LTVUYQyBDzVmeDDL6Vm0wv4U9fLCT3zHF2wkC5oa81G/us
	 oM69Ad7pj8HIncudOUeIlD2SyDqSz8kzL4dfsMlo=
Date: Thu, 26 Jun 2025 08:29:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: stable@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, Gregoire <gregoire.s93@live.fr>,
	Sebastian Reichel <sre@kernel.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: install pairwise key first
Message-ID: <2025062637-facsimile-chatter-f87a@gregkh>
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
 <aFvGnJwMTqDbYsHF@hovoldconsulting.com>
 <2d688040-e547-4e18-905e-ea31ea9d627b@quicinc.com>
 <e23d7674-31cd-4499-9711-6e5695b149c6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e23d7674-31cd-4499-9711-6e5695b149c6@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_003002_968415_26961086 
X-CRM114-Status: GOOD (  19.53  )
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

On Wed, Jun 25, 2025 at 07:48:54AM -0700, Jeff Johnson wrote:
> On 6/25/2025 3:15 AM, Baochen Qiang wrote:
> > 
> > 
> > On 6/25/2025 5:51 PM, Johan Hovold wrote:
> >> [ +CC: Gregoire ]
> >>
> >> On Fri, May 23, 2025 at 11:49:00AM +0800, Baochen Qiang wrote:
> >>> We got report that WCN7850 is not working with IWD [1][2]. Debug
> >>> shows the reason is that IWD installs group key before pairwise
> >>> key, which goes against WCN7850's firmware.
> >>>
> >>> Reorder key install to workaround this.
> >>>
> >>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=218733
> >>> [2] https://lore.kernel.org/all/AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
> >>>
> >>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> >>> ---
> >>> ---
> >>> Baochen Qiang (2):
> >>>       wifi: ath12k: avoid bit operation on key flags
> >>>       wifi: ath12k: install pairwise key first
> >>
> >> Thanks for fixing this, Baochen.
> >>
> >> I noticed the patches weren't clearly marked as fixes. Do you think we
> >> should ask the stable team to backport these once they are in mainline
> >> (e.g. after 6.17-rc1 is out)? Or do you think they are too intrusive and
> >> risky to backport or similar?
> > 
> > Yeah, I think they should be backported.
> > 
> >>
> >> [ Also please try to remember to CC any (public) reporters. I only found
> >>   out today that this had been addressed in linux-next. ]
> > 
> > Thanks, will keep in mind.
> 
> +Stable team,
> Per the above discussion please backport the series:
> https://msgid.link/20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

