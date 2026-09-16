Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09644C88E77
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 06:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taOEqL4siH3lxxx1UH5RkTc6W3vPtQoc/t7GJVuIGJw=; b=nl9va0w0eQTSy+7614WnBaSghq
	W6ZaGB0UAaiG4eD4JFoxYv3rnxy0HpjGX/BtuW3Hf7+O+omhUFZhP8EnuEcsZ2IHsmVhjgbn5F3Sr
	YQbeprgUsZcvj2dV8OAzP6ibHtaixrY1j/N9BiZmyy9GijD84pm+zNyPEqrlj8vjZ0Ec9LvFLms6e
	rEba7syyu6armgJ43bLaEuGGPqiTmOtfxpsWLxNo1if7LkfK4nrRn3QzB2MrbUzfDQET4/O/NJNgv
	I66cyh/Wr64h235eB4m1I70keYIn+F7dvWKM1enbZni55ysddKCrYNidAoCvZL8MxYdFvaecXJf+Z
	oyLNHDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jP7-00000008VWx-31st;
	Wed, 16 Sep 2026 06:46:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jP4-00000008VWI-2Pnw;
	Wed, 16 Sep 2026 06:45:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 78F1360200;
	Wed, 16 Sep 2026 06:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BE01F000FF;
	Wed, 16 Sep 2026 06:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789541157;
	bh=taOEqL4siH3lxxx1UH5RkTc6W3vPtQoc/t7GJVuIGJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ACAVyIFhrftw/R6xa50icqAmL7UozbxRjlWRNvte13eswSGg7vgO0zg4mULqhyL2c
	 iHCohyHxSHLyx5BlFuNe9obKCSnmsSGkSBUe89qjqvD9DFYidFmCKBv/eSv+ymQY8H
	 mYdjt2/FWhqv8ofu4DF7EvbDkBSENNeoJfdkFMcoKM3W3nX46eQ8+lRPR41FAfmS6i
	 88iNrayH1la8aNgoWASgJBIV3E9T42k2tE/SWZJRkb9HS+8JNdgLVfYu+tOWj1pPg4
	 RCeXpfdsNs2YvvFUIbtO1AR0DJopyl0HLhV24eckCwHuX6KfLcY0QQ8k0q9HX8tucX
	 /2rLyzN9JYGNw==
Date: Wed, 16 Sep 2026 08:45:46 +0200
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
Subject: Re: [PATCH v7 01/15] net: qrtr: ns: validate msglen before ctrl_pkt
 use
Message-ID: <uo3sk7ygezaysxs3xgizspx6usbtin63rrpoc42l2jp4yxrii4@2jcof2iillbd>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
 <20260915054207.2513877-2-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915054207.2513877-2-juha-matti.tilli@iki.fi>
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

On Tue, Sep 15, 2026 at 08:41:53AM +0300, Juha-Matti Tilli wrote:
> From: Denis Kenzior <denkenz@gmail.com>
> 
> The qrtr_ctrl_pkt structure is currently accessed without checking
> if the received payload is large enough to hold the structure's fields.
> Add a check to ensure the payload length is sufficient.
> 
> Signed-off-by: Denis Kenzior <denkenz@gmail.com>
> Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
> Reviewed-by: Andy Gross <agross@kernel.org>
> Signed-off-by: Mihai Moldovan <ionic@ionic.de>
> Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
> Signed-off-by: Juha-Matti Tilli <juha-matti.tilli@iki.fi>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

