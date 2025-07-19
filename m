Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A406C83F1A
	for <ath12k@archiver.kernel.org>; Sat, 19 Jul 2025 03:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bo9ReKfaUPK8jqiqUxtPtw5dg3GbHwm+856V0z3BfII=; b=cGImoPo9Tl9EmMYQOXjbdXQfjO
	bd+IIFkRM/QJ3mdle63qmgfXTFW3fO1s+RB1mJc5WaPG+cRKNBesVTv4wKnRHnnRmIhp17sExN/nq
	BTDxD1pPxlRToYe9fU9eCozk6IvgE0vZj3epkgL1NKK/YXL3Wpo0SDB0N4NOOsc7djIaQLcU2CEI/
	k/3lCPYGQi5MOsF+zqgEgPT5fOy1yIVAOv84exReU30caYrRVdv/M1v1BepXUOce27VQBkR4v3d3B
	Ua9h6Me3V3Zrmcp6VWBKtKX0nRt2APbMyxg4rc97rGjwhjFc2eDWYGwwzHMBbTDhZhTxODl1kLBgq
	W4AtsSeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyBx-0000000Dny6-2HLo;
	Sat, 19 Jul 2025 03:24:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyBv-0000000Dnxf-0IBa;
	Sat, 19 Jul 2025 03:24:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 318EE5C0599;
	Sat, 19 Jul 2025 03:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C80C4CEEB;
	Sat, 19 Jul 2025 03:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752895488;
	bh=XEASl2DavDoT9hNzoWLmpWGP6OxRxWr3zHYeH6vOsgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6ZIsGkrXKkcYkOZjst0jboOvYy8GYi1dDxIImUnOqZSAPd3tOKvpKieaGRhjhk1Y
	 1saGJ/cmKKBPfxeUvMwrKrRCaFvFJcIgg8Mfia6TZpmloYfbez6xQwfdg+dxQAXJs5
	 WoiOw8cbJUPAL1qbgTucPlp6VWGNetFEQ97ZVHGn7lLWETNkicnr+8+CiltnDq0CeO
	 /sTRDFmIo1HJOps9HLo83uB+7Z2IRlIAFsXy8pKOqjikoJSqsGHE2opNBuoGHiX8sl
	 jW+uFsTHNBLNTdKRLTkNVojJdoHTO8Tb2zIPFhAIuOZBTixAfT/D9N6Eq4E9QLQZwO
	 gNLgeuUNsrM9A==
Date: Sat, 19 Jul 2025 08:54:35 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Youssef Samir <quic_yabdulra@quicinc.com>, 
	Matthew Leung <quic_mattleun@quicinc.com>, Carl Vanderlip <quic_carlv@quicinc.com>, 
	Yan Zhen <yanzhen@vivo.com>, Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
	Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kunwu Chan <chentao@kylinos.cn>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Troy Hanson <quic_thanson@quicinc.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Baochen Qiang <quic_bqiang@quicinc.com>, 
	Sumit Garg <sumit.garg@kernel.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org
Subject: Re: [PATCH v6] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
Message-ID: <yywgwnk3aky2qqyxnyiisqxdi5a545tijtigm3al3yyzxrjnst@ged5v7i24nsc>
References: <20250516184952.878726-1-usama.anjum@collabora.com>
 <175014516328.16478.17449149106590025798.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175014516328.16478.17449149106590025798.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_202451_148424_D25ED90A 
X-CRM114-Status: GOOD (  11.93  )
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

On Tue, Jun 17, 2025 at 12:58:51PM GMT, Manivannan Sadhasivam wrote:
> 
> On Fri, 16 May 2025 23:49:31 +0500, Muhammad Usama Anjum wrote:
> > Fix dma_direct_alloc() failure at resume time during bhie_table
> > allocation because of memory pressure. There is a report where at
> > resume time, the memory from the dma doesn't get allocated and MHI
> > fails to re-initialize.
> > 
> > To fix it, don't free the memory at power down during suspend /
> > hibernation. Instead, use the same allocated memory again after every
> > resume / hibernation. This patch has been tested with resume and
> > hibernation both.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] bus: mhi: host: don't free bhie tables during suspend/hibernation
>       commit: df75d6d7ce922645e674f5d591c7333f11027cdc
> 

Dropped this patch from mhi-next as Greg is opposed to drivers keeping memory
during suspend [1].

Please resubmit once the consensus is reached.

- Mani

[1] https://lore.kernel.org/mhi/2025071722-panther-legwarmer-d2be@gregkh/

-- 
மணிவண்ணன் சதாசிவம்

