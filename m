Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8C2C88E77
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 06:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvF/lDWIxjmdBnUQu2pw5iZ8dJc+t4gXd603fw/T2So=; b=odw+noGkvwpTJ/eYS6Q5cT+zr8
	KXgudO+PcXrZZSlxWT/OptZkGiBaFI4FW4JOAzxfE4XK78w9hAwLgcwYLjLpVW67SmiSIZxQflYza
	wPWzkotbUQdOt01LMuJFVFq+RM+CAALVwg4mPkdtr8D3s3u3eXslfLLTM4TCsMTm0Fm+Pw1cgSVVv
	f9Jp1MxMtrYxsm7UZqOVb9KOPbLXftZtpckFjN5g9/KECyjZ3NP1dzXjz072hk6bxl31iaTA0hJjZ
	jDG0Jpf17aHQ85zaPUcxRE5qSu6lR4AH4S9WFVDJbVN/oywLmpgvONkwrFIsrt3u9phD2S9v1EjQp
	lc02L3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jSu-00000008WAG-37Eb;
	Wed, 16 Sep 2026 06:49:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jSt-00000008W9t-09NH;
	Wed, 16 Sep 2026 06:49:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1863960008;
	Wed, 16 Sep 2026 06:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1F31F000FF;
	Wed, 16 Sep 2026 06:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789541393;
	bh=IvF/lDWIxjmdBnUQu2pw5iZ8dJc+t4gXd603fw/T2So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n8LGoYWNtpMnTBlGfCbN23m/T84d83Q38jhIFbxr1lPs5b23nLdcNIDWZlcnGYn4R
	 4rKmj2862NZ6AxDZFJ+elEghp1nUPg61brH6238b/4/CyRxtbD/7TpVrHvtjWevlHv
	 VvCS4DHnbNntVbtgjeNMEMBXagW7zo2guZcEWpa09TIp85JznGsoz0D6R+ccuxDWa4
	 OMFzFRr8/Ixyr16SS9C7RGiUuUhmNnXjPDd1KUrfSFvrhyERTTc5zmV1lRRFk4P4pR
	 BgXgRI0bEA/VJyfQT+GUWgNnoUCoJ6rLxS5net0RDlCfYSis+6vrRi9YaroCtLtK46
	 eHtIgBSrHsrPw==
Date: Wed, 16 Sep 2026 08:49:41 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Cc: linux-arm-msm@vger.kernel.org, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Mihai Moldovan <ionic@ionic.de>, 
	Denis Kenzior <denkenz@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v7 02/15] net: qrtr: allocate and track endpoint ids
Message-ID: <k3wxn3ga5gqj5dlhykgnslxfgj536ecfirfc34cd6tc7nbzgo7@jmz46unm7q6f>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
 <20260915054207.2513877-3-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915054207.2513877-3-juha-matti.tilli@iki.fi>
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

On Tue, Sep 15, 2026 at 08:41:54AM +0300, Juha-Matti Tilli wrote:
> From: Denis Kenzior <denkenz@gmail.com>
> 
> Currently, QRTR endpoints are tracked solely by their pointer value,
> which is sufficient as they are not exposed to user space and it is
> assumed that each endpoint has a unique set of node identifiers
> associated with it.  However, this assumption does not hold when
> multiple devices of the same type are connected to the system.  For
> example, multiple PCIe based 5G modems.  Such a setup results in
> multiple endpoints with confliciting node identifiers.
> 
> To enable support for such scenarios, introduce the ability to track
> and assign unique identifiers to QRTR endpoints. These identifiers
> can then be exposed to user space, allowing for userspace clients to
> identify which endpoint sent a given message, or to direct a message
> to a specific endpoint.
> 
> A simple allocation strategy is used based on xa_alloc_cyclic.  Remote
> endpoint ids start at 'qrtr_local_nid' + 1.  Since qrtr_local_nid is
> currently always set to 1 and never changed, node identifiers start at
> '1' for the local endpoint and 2..INT_MAX for remote endpoints.
> 
> Signed-off-by: Denis Kenzior <denkenz@gmail.com>
> Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
> Reviewed-by: Andy Gross <agross@kernel.org>
> Signed-off-by: Mihai Moldovan <ionic@ionic.de>
> Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

