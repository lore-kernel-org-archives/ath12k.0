Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CE7C98321
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Oqj7B1TcaON877H4SXvrAAE63yKPFQybY15jqtw0w0=; b=MPmti507qWzqe5ydpgfHeexI/G
	gOTLsqF3+mL/akA2pyV5XWIfTdVSKMhaAJwwsPIv05rTKHp7+7m0jQXEp5JoUg/z7wMvYAIOxFGPy
	tH0l8fFCEKuxE769KdooiryiPmFm0jfGNawVLOpqOHWnKGNScmO9Juf8IMb2vk/Rp1R5k3P5YqXBQ
	8oRjG4F8Db1acvxvD6pkMMBMSb07hfMSpw+6K8Z9047Uk4cYEtD1dFGwn30RP0LYXx0dIdQXAaQPM
	9E5THR9qD6ftcDki3/9X8FwpJLwxkd2yyA+WkQ4NjFzfwCqs5crw0LaLbuAHNqYsPXrQph3bj43Fq
	5K+TQOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7gn-0000000Dkt3-3nCA;
	Fri, 25 Sep 2026 15:18:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7gm-0000000Dkrp-31iY;
	Fri, 25 Sep 2026 15:18:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 35DFD43A4F;
	Fri, 25 Sep 2026 15:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFD11F000FF;
	Fri, 25 Sep 2026 15:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790349496;
	bh=/Oqj7B1TcaON877H4SXvrAAE63yKPFQybY15jqtw0w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DTSdc2s1DCtiTNLgefTpjk1yzNz422Yg5tTaQTrljnQGIQr7tHw+IE2y2IXiOvzGc
	 pnJ+ziSlkScuozdyKCRnNfEumWNuppLZYJxVY89fM96yAcF9W32nLhmwRbWMO3h+1g
	 cgTNP9A2JlNrpiVxlW2cUWitmwBRXjaLZpuJW4KX5ctIfbrLWnYSPt/nZzZtrQjgir
	 icic68KAWBT3fh+iYn66MexUD2hkjC1EqsYaod0sDZ1zozJDUkT29ksAUYOwx/Toxb
	 hq1A8yNbcTQK1UWLlIQRhA083X0ZRJHoSkwY0BALIL2H+vkY0rFEJdZBY7DEPekwC1
	 eMWD3ciNo2g9w==
Date: Fri, 25 Sep 2026 17:18:00 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Cc: Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
	Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
Message-ID: <pnt3alevvps5rx2av3r72j6xlky4wlrvzedfs4apnsnpq7cu7x@5begxgw5vsju>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
 <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com>
 <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
 <CANyhwx0hZJC6xXaSC2g4GFgUOp5n_KN4tdXksW+s8Mk_+7xEAA@mail.gmail.com>
 <ayyrvpxnxonroz6kafehepplhltnzgopgt6pn5fnpdmft6rbxm@a5sps2dnso47>
 <CANyhwx1EG=2FyBm150wrKpj=kQ1066iwZWndx=ZL3BKNoZUhVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANyhwx1EG=2FyBm150wrKpj=kQ1066iwZWndx=ZL3BKNoZUhVA@mail.gmail.com>
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

On Fri, Sep 25, 2026 at 01:46:34PM +0100, Youssef Samir wrote:
> On Thu, Sep 24, 2026 at 4:58 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Wed, Sep 23, 2026 at 04:03:38PM +0100, Youssef Samir wrote:
> > > On Tue, Sep 22, 2026 at 6:24 PM Juha-Matti Tilli
> > > <juha-matti.tilli@iki.fi> wrote:
> > > >
> > > > On Tue, Sep 22, 2026, at 20:14, Youssef Samir wrote:
> > > > > On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > > > > +
> > > The chance of collision is slim, but still not impossible.
> >
> > When you mean collision, do you mean node id collision due to bridged nodes?
> > Because, even if the directly connected QAIC devices use 32bit node ids, the
> > collision won't affect the functionality.
> As in ep_nid of one device matching the nid of another device. In MHI,
> that shouldn't
> really matter since this patch moves away from using QRTR_EP_NID_AUTO in node
> assignment, but as you mentioned below, it could clash with TUN and SMD EPs that
> are already registered with their ep_nid.

Ok, this clarifies. But as I mentioned before, there is no current
usecase/requirement to support attaching identical SMD/TUN devices. When the
requirement arises, we can extend this node id assignment scheme to global or
some other method.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

