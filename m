Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA874C98304
	for <ath12k@archiver.kernel.org>; Wed, 23 Sep 2026 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJuvljr4VJrwhkS2WB5iCaspV3ZEJ4xcFgJqC1vtnGg=; b=pZVWcuG1R21zHIBy8f/KzHAzQU
	wyyaMiK2MzHoV9Baxi5X3jfGDn58FTWVSj9h/eH7YxeauseVxw+TCgNCd0Q4Hm30vFes1nEcoEKvK
	IuXk3A7e5F/PesyNECs+sXLSm/FOoSBKtYLfox39UpqDKxMgtVF4YRTOjAdRD+H+moApivd6MkRB4
	6h5/b/9r7s2Ig1u5cfIHt32DYICskUwYaKp1fMGY7caOFxG7i6pt9v33DP6KeR+/CUMpMWV1dso1P
	Dlh3N1eB8NEysSUB23XiphtILZCE1vLW0EJopcnCksE0iptJPQzj2FXQ9MPOrEjoEF51C/+isOD8T
	TcjEjMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q1e-00000008tlM-1QKl;
	Wed, 23 Sep 2026 16:40:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q11-00000008tgL-1Qly;
	Wed, 23 Sep 2026 16:40:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59672600D4;
	Wed, 23 Sep 2026 16:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279F11F00893;
	Wed, 23 Sep 2026 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790181614;
	bh=pJuvljr4VJrwhkS2WB5iCaspV3ZEJ4xcFgJqC1vtnGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m9XbphuRQlcHxv/dIcs/B0xX7P6p+A4iWPybU/3YwAAAaBzvF6sjQzP7t4HTjjjg9
	 ZeIIJ4x1eOXrnjwvp4pZvQaY7H2KL8ILGII9aZ2um1GBWK2/P/+6H0FTL5uJ2h1H5a
	 S6ks5u66CrHUX11jmZ1FONtFut0a047A27JLGTMDDVHxq+jd8nZq+qM4A9p1b1EIGY
	 pDtXT+VJZ6tysEBC7ykFlsFG2RLITC8gJjLCRFinsIKbSBEhaZhNrfoP+htoWErD44
	 a19iPOU6RI6I4/siJo9XYSzFpHC8C2zSx6YSLwXzJABl7FHYgz0acqKQCBlmdLvEqO
	 oWIMUu4hpYitw==
Date: Wed, 23 Sep 2026 18:40:02 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
	Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] net: qrtr: Allow the host QRTR to assign a unique
 node id
Message-ID: <l32syvvxm7h22li5bj2n4unqjqor7bgehlbg3pzly7i43l4xkl@xr7xzaf4ydyj>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-1-27dd80d841a0@oss.qualcomm.com>
 <3f5da6c9-7394-4452-92f8-b773cd34aecf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f5da6c9-7394-4452-92f8-b773cd34aecf@oss.qualcomm.com>
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

On Tue, Sep 22, 2026 at 06:08:11PM +0100, Youssef Samir wrote:
> 
> 
> On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > +/* Replace the node id in the control packet with 'node->nid', if both are
> > + * different.
> > + */
> > +static void qrtr_node_rewrite_ctrl(struct qrtr_node *node, unsigned int type,
> > +				   struct sk_buff *skb)
> > +{
> > +	struct qrtr_ctrl_pkt *pkt;
> > +	__le32 *nid;
> > +
> > +	if (node->nid == node->ep_nid)
> > +		return;
> > +
> > +	if (skb->len < sizeof(*pkt))
> > +		return;
> > +
> > +	pkt = (struct qrtr_ctrl_pkt *)skb->data;
> > +	if (type == QRTR_TYPE_DEL_CLIENT)
> qrtr_tx_wait() will create a qrtr_tx_flow object keyed by qrtr_node->nid.
> qrtr_tx_resume will attempt to retrieve it with qrtr_node->ep_nid, which
> will fail. This leads to the HTD path pending packets reaching
> QRTR_TX_FLOW_HIGH and block indefinitely. QRTR_TYPE_RESUME_TX should
> be handled here.> +		nid = &pkt->client.node;

You are right! I've already fixed this issue in v3.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

