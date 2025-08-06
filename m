Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90928C87FD3
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 18:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJi2ifhVqxIFoIwdjpItDSVqyPnMGe5LsQkrbOhDO1Y=; b=mEhYYUaXduiuGdNEq+oKc9AJ7V
	xDKoddoSjrugEUdVL0Rg2d/bIsr6rKe7WmEn+ayifa6lcgwGzmNgK041CjgYAwoo4paDlNFU5tsDi
	Gmqy1JUSACvxBKcqCbhkOuNeLO7MIddx3z7xCruO5WTPGNpRJtSOGYC8jgWk4HSXl+tzr0I64OHUt
	ePOepG03meKEwncW1gP+Zq9vyZT8ArAPC48/Iki+bX/mTDRJLNg/Qef/Tu98+PpSI3H50CxH1zufl
	egUV4qO+Z5XdroVGL9gz2P/sRzNvRbQ0Yr06hut4xHVDbbv6qNjmyL5QsKk6ExxYwczuqEYSgXMy3
	D2GybY9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujj89-0000000G6nn-1Lx4;
	Wed, 06 Aug 2025 18:44:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uji0X-0000000FwVm-3svA
	for ath12k@bombadil.infradead.org;
	Wed, 06 Aug 2025 17:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yJi2ifhVqxIFoIwdjpItDSVqyPnMGe5LsQkrbOhDO1Y=; b=AvZF4I/pdvx1sc4eqXf+Qn82t0
	WJjheWLXN7TFubXxwgo30CVdjwguGODqySiyrT039ngkMjjP/BjMZZ6EkNH16wK0IXyQsUMhi73DK
	0Ij/EVV9RMRDRC1RILG+KKGPrWB2U7Ays9zbq21Osw48wKxCOWC7VKUwbEgxA3SToRiS+bWtxQmfS
	UkWNW2Dt3cD/6qUE05PDKiBKP6onm5rAZp75IrOKdfxdaalgzNgNsZVZIL+nWk4XqHCVQeegycUU5
	dEpYol5xtGmX9UPTi4c0zT7dY/kpga6etySyD+SNfEKQu7N7yZ7Nj/Ju2k14ysUltvFz/XhIf/syB
	q0ReJ6kw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uji0U-0000000ELUq-3OlX
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 17:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D79A5C6AA2;
	Wed,  6 Aug 2025 17:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B936C4CEE7;
	Wed,  6 Aug 2025 17:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754501570;
	bh=UCmqwkbmo34ciLb7WfjGPXOM2nraMZwv7KO2zm6w+7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNFh9BOM3i71piPPEIEay1JN5rDPKJq6pR0Q29H19IoiGycKBtaRCN4XNRff3Pb+a
	 3Jxh6wsmnfTZYwHJ6BGfiKYeCgiN5z0UeE/VUmQFz2MSb2fEHiNxUmaHN+CJeC/+iR
	 wxxzz/RUVnNngBxWYds4hV3UL0ApNE3JPL8/mKLfwpjyl+GCQrJxmWNJppxCXCW9KQ
	 TGi1W16XqFpnL2mVh0dDbWrncwkYLgJkhe+6R6BuoTDzu0JssBdykDdVc5FIdiGSCS
	 gJ/r9Soe0yvjZ78emoK4LdZaHLP0X51KOu5GjJK9vBYof94XnJoz5D6bczc8T4gRJi
	 BW0ySyWSMM1Sw==
Date: Wed, 6 Aug 2025 10:32:45 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] soc: qcom: mdt_loader: Fix check mdt_header_valid()
Message-ID: <w7idutnucnkf2wodytpp6ozr4dxmm2qgjvbxsdz2pdlm4redhv@gfbtjzseonnw>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-3-5e74629a2241@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804-mdtloader-changes-v1-3-5e74629a2241@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_183255_104682_DB0E7313 
X-CRM114-Status: GOOD (  17.92  )
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

On Mon, Aug 04, 2025 at 06:11:51PM +0530, Mukesh Ojha wrote:
> Firmware binaries may lack section headers, in which case
> the e_shentsize field in the ELF header can be zero.
> 
> Update mdt_header_valid() to correctly handle this scenario
> by adjusting the validation logic accordingly.
> 

Thanks for the fix, Mukesh.

I posted and now merged
https://lore.kernel.org/all/20250730-mdt-loader-shentsize-zero-v1-1-04f43186229c@oss.qualcomm.com/
for this.

As was mentioned, in the future, when you have a fix and some other
changes, put the fix first in the series (or send it separately when
possible) so that it can conveniently be picked up on its own by the
maintainers.

Regards,
Bjorn

> Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index 7522223835f5..8210fb3dd51a 100644
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
> 
> -- 
> 2.50.1
> 

