Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78700C369D3
	for <ath12k@archiver.kernel.org>; Mon, 28 Apr 2025 08:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gybe4B5ORHBA+vmlE156kv9SMiZJ0aU/O8Q4xvxEpio=; b=n0WRppVCid04dpH1UJnQM0zU0i
	qpiiDrA1OK+pPiAqyXcQ6BxakZB67Ktv79djCFiQ8GNOwI18VdidsDErIjXSvqo9NKO8E+QY1zCUg
	yiuSVLEhD6qGHTrc0pv8JBIowMNfZcc+UXArl2fdmEQu6x+6pqJBh6xavm5mHE16dvPkz52iUpxHu
	Ybbf35ZiBckvsZeRjiscHUa0jcSU+f+nKjb5n94RyrdfwN1aEpYTCilhJLhC/SMbeu6pSf6eZRIKb
	0LV8w2FWUmii2lee4wP5Phh1sd7scuQ+5PED+Y+b0rSwKhbj+RMe2y0ODIdC3pis/cndz0xGvBaOI
	QuJlJNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JyA-00000005TbK-0vDG;
	Mon, 28 Apr 2025 08:36:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Jo5-00000005QFL-3E2y
	for ath12k@lists.infradead.org;
	Mon, 28 Apr 2025 08:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11407A4A70F;
	Mon, 28 Apr 2025 08:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30243C4CEE4;
	Mon, 28 Apr 2025 08:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745828740;
	bh=yTHxmPegTimTQRX+ehlBAgPugX5B2Xw+Yx43SP2+8w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5oM2togKlPWPVrgBwV1vWVT6oTq4Rbr+Ly55q0JEUiSugVz+K5Diyp4LeyhEw1tu
	 qa/j8BfyhzjT2ajfsJi/oJaIXVlS/GB3bow8MK/9TYWjVwmJzH/VQzP+h097tPoPpQ
	 ujKMbvkNcRHAkp3EXsSpHoctsmB7OFabPfObCno2kVwuvrxnF/3/Y1i0eABUCyiyi3
	 M0WEoJTMYM8w8QqE/fSZFGhEb+cLOtizRtUE8b09uhwlfmwVTBhkEufXrFi7C+UJ9a
	 pXnxthVIN9a5/ChheCKLPNaa/9omNzQ/x6yoUtvEDQHA5rBJSij1gJfRXutJNYBvAN
	 GaRTepzaAwRFQ==
Date: Mon, 28 Apr 2025 10:25:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RESEND ath-next 1/2] dt-bindings: net: wireless: ath12k:
 describe firmware-name property
Message-ID: <20250428-ruddy-bold-macaw-9ffd28@kuoka>
References: <20250424005703.2479907-1-quic_miaoqing@quicinc.com>
 <20250424005703.2479907-2-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424005703.2479907-2-quic_miaoqing@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_012541_883434_B5ECD4F6 
X-CRM114-Status: GOOD (  15.81  )
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

On Thu, Apr 24, 2025 at 08:57:02AM GMT, Miaoqing Pan wrote:
> Introduce 'firmware-name' property to allow end-users and/or integrators
> to decide which usecase-specific firmware to run on the WCN7850 platform.
> This is necessary due to resource limitations such as memory capacity and
> CPU capability, or performance and power optimization for different
> application scenarios.
> 
> Two firmwares are supported: 'WCN7850/hw2.0' and 'WCN7850/hw2.0/ncm825'.
> The former is the default firmware, suitable for most WiFi 7 STA
> functions. The latter adds support for commercial-quality SAP and
> optimizes power consumption for IoT applications.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath12k.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


