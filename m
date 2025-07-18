Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC97EC83F3B
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 08:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZ0kO4gx1K1FUqESiDR2JMNiz0KtS+5h2UwFlaWAkWs=; b=S7iI8YU6oLck7Vay7mP2TVGDuZ
	ikFe8y91r1ZWRZ2LBa8gyGjnCEyp6KfMqIgyEI5Jqbc/KdwcL0SRzWOdI7w2F1OLVhfYouiFzSE4f
	RI0PSFs0AlDZhKLAN3DaTgqdpwL1oX6Ut6CNNnmI+m3C8ncfFxvR9K+K9GjqnemQMrmiNWyy8iNnH
	mK8Mv6ZKVWhHiHCwg8YHz65AMhPoyDDsdl/hZsmi7thb+AFVVHsRSQbb0w8ryDGd/r5dap+7t8JGO
	0Tgzk7xFfGDTKIGsbcI34NqyjH1bcRLXx1wmWjQ82gN2fKjRUqLcKKqvqJUUYA4zO79uR8MU4L941
	1DG6Ue5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg9I-0000000ByYF-2KXV;
	Fri, 18 Jul 2025 08:08:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfzY-0000000Bx2k-3rxq;
	Fri, 18 Jul 2025 07:58:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07B21601D3;
	Fri, 18 Jul 2025 07:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35402C4CEEB;
	Fri, 18 Jul 2025 07:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752825531;
	bh=12v/B1njx1GkSjd81wSRKVs6DUKXXXdOGDYz4vDwGeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ltsWnabxmqTT2JCoEYE3IoT1RdQw0tobW7lrwo0mCF/3jla/11w3ueRvcSEjH5yae
	 xQv1gBtIesBR4jOUyoqIyYyzCLvE+iBT8xU5aFpxqJgkvSNJLz8xmr6YeyJRHIH8H3
	 92T/1PQqIybmqK7KNmSqQRPSnbvLbK1cDKiITOsOKY84B7RTauPwAPcV8osgUkqznv
	 njXxqGzZgAuydvHPLvzKcgLPqCzMCJ4K01HniHj0opAk7pIaxXsJ0Vxh5eBOiy8KMa
	 lR8/MqNNYyIDyoUIDkHxdmf2EKvvZAaZRYM7ZoNmMamaFpgqXp09w74KKpZkUlhh3J
	 0M5b/p7N9J5Tw==
Date: Fri, 18 Jul 2025 13:28:40 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Jeff Johnson <jjohnson@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org, ath11k@lists.infradead.org, ath10k@lists.infradead.org, 
	Bjorn Helgaas <helgaas@kernel.org>, ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] PCI/ASPM: Fix pci_enable_link_state*() APIs behavior
Message-ID: <imlq2j5wrjjagm3y6t4zfsbsal75vok7mr4lw3aexu7eerfbsk@utkcid56k2u4>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <f3374104-684d-48c7-9e2d-e97dd48700e9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3374104-684d-48c7-9e2d-e97dd48700e9@oss.qualcomm.com>
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

On Wed, Jul 16, 2025 at 10:11:27AM GMT, Jeff Johnson wrote:
> On 7/16/2025 5:56 AM, Manivannan Sadhasivam via B4 Relay wrote:
> > Merging Strategy
> > ================
> > 
> > Even though there is no build dependency between PCI core and atheros patches,
> > there is a functional dependency. So I'd recommend creating an immutable branch
> > with PCI patches and merging that branch into both PCI and linux-wireless trees
> > and finally merging the atheros patches into linux-wireless tree.
> > 
> > If immutable branch seems like a hassle, then PCI core patches could get merged
> > for 6.17 and atheros patches can wait for 6.18.
> 
> I'm fine with either strategy. In the first case I'd merge the immutable
> branch into the ath tree. Note I plan to issue my final PR to linux-wireless
> for the 6.17 merge window on Monday, so we should close on this decision soon.
> 

Looks like there are a couple of things that need to be fixed before this series
gets merged. So we can defer the whole series for 6.18.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

