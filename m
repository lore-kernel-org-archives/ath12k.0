Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28242C87FCB
	for <ath12k@archiver.kernel.org>; Thu,  7 Aug 2025 00:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTyEoBVvcCfSeC0GP6mzfIGLDZ8sKUCoIkvM1gF+cAk=; b=p9x1C9hTxJQhhiUZFmTEYwsLrt
	iAyZm5XEDYhchq+e6h4Nr/LNWKeDx6wR3fs6Zcb/vj6Ciy7BilULEIU8eeZMiluddrubQWuMqgO+S
	DO5WgEtsXMJXRvK7uepgz/ksDCXcAE3bhCLayIYr7A1gH1Ihf/4mhG5P6Iyc4bgxoBCvcOfSqkq+l
	rbSJWR5DlYI7Atq1x3QXrVEYhOqCvB6yJ/ZnbAZJ+trNM9lC9TFOahc1ZbxNhfK66x+iQ8wGfHVNc
	ClG/mzlDd3bRBKsmEzbWiBVvPCkJdnD2C8hHKogAB2647C0tu7DLZYWMcPmoE1zNAe9cIuztIwIXk
	tjIApXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujoW4-0000000Gv9y-3nyL;
	Thu, 07 Aug 2025 00:29:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmCi-0000000Gfa7-1rnC
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 22:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 957AE60203;
	Wed,  6 Aug 2025 22:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979C1C4CEE7;
	Wed,  6 Aug 2025 22:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754517707;
	bh=bqEANgtVHYBiWJjODjg0b94/tXX3NxqIOs4Fyw6rZzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sSqyx08pXFpAV3mzDXwjaIlC3y0oohzuhT7jWxi36v0iN2oeqy6Hn7Ibgzwl/FAla
	 UYQxAdUd79P/uYX0Qi8q7rNAQtWW4eBYuTzUQfhnOk+gKS7UwWeH1iGNcU6Dtk7Shd
	 D9ipMkh9yytIJ4lG1MelnfjVj9A+rwMQk5zoMUpWpwkHs4mE7xrPXuqaIWiP7sJ1wZ
	 VrS6jXjV6/6NQgHTXe8yWBum/ntosaeAa2CInDIUK3G+pdVD1gHZtajVm16UyrMLlC
	 xA7E8VvMQOGm9lJihku7YvY3ZF/OEvoaMpLbBDVkvYoZn1iK2eAuIXWklHDj1tDZc4
	 DJHcwqpgusOhQ==
Date: Wed, 6 Aug 2025 15:01:45 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Dikshita Agarwal <quic_dikshita@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soc: qcom: mdt_loader: Fix check
 mdt_header_valid()
Message-ID: <wgpgwf2yq4awig5cztgkgm32h6zjtqzv4irpxd277gwjydofzu@f3zb6t4iyahc>
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
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

On Wed, Aug 06, 2025 at 10:55:28PM +0530, Mukesh Ojha wrote:
> Firmware binaries may lack section headers, in which case
> the e_shentsize field in the ELF header can be zero.
> 
> Update mdt_header_valid() to correctly handle this scenario
> by adjusting the validation logic accordingly.
> 

As I replied earlier today on v1 (probably after you sent this), I've
applied the patch I sent out earlier for this problem.

Thanks,
Bjorn

> Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2:
> - Make this patch as first patch of the series.
> - Added R-b tag
> 
>  drivers/soc/qcom/mdt_loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index 0ca268bdf1f8..2a14ba9b0fb6 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -39,7 +39,7 @@ static bool mdt_header_valid(const struct firmware *fw)
>  	if (phend > fw->size)
>  		return false;
>  
> -	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
> +	if (ehdr->e_shentsize && ehdr->e_shentsize != sizeof(struct elf32_shdr))
>  		return false;
>  
>  	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
> -- 
> 2.50.1
> 

