Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8D2606A322
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MfjgwrgQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BLpYs2cb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jau+PZuEPRdnI6rZvYHlpRwrBnMws6uBKUU9f9SsPHc=; b=MfjgwrgQnZfYOx+Hkc3QfJ/zL/
	0Aadv3Oyop55MWLdvljHHiHcq/ZaN2zJZ5DCgv+3jWKj8t1jgybqnqWkTyR82ullKHbk7qNy4v5gv
	u0pvDRF1UohIwwEnJ+HyO8MzUsOuWk1q0LH5TsWqg+M7kBanhj6MQRwAZreUIqD3Ip9KCgzzhJT3s
	FTpdLi752Kwqq9LqvYXC2bpAXJS9Cs+J/XfxxxOVyhhybWEcugt94csC/mWiSSTXnw0t/nsIxkFhS
	MEVjttGZaWgMVNE6SM5MTAIgF9UASeXj2jNkHSWqSL9twAsF42vKTzMMNCn3RZEQrLGCsr+X5yi/f
	dsMBtByg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnzY-0000000Btyd-3yY5;
	Fri, 30 Oct 2026 14:54:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnzX-0000000BtyX-0HFc
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 14:54:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 50C88400AC;
	Fri, 30 Oct 2026 14:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D3D1F00A18;
	Fri, 30 Oct 2026 14:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372042;
	bh=Jau+PZuEPRdnI6rZvYHlpRwrBnMws6uBKUU9f9SsPHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BLpYs2cbXAHOdyOfNBb1ztSow/pDm1JHqoEBGyS08uofb79chz6YmYz0s5/b6fK8H
	 m0YYKS7nZZsXbYJ4Qu1fb/J0YJhOAMQFXvGArlTF0C1F8rxE9ohgAck2pbYjk1gHTo
	 76SC4wCY8ZRFsAa17Ekn7+IzQ4HgOcXJUcDWiJ6TRn95oBHQa0C3pyL9uVcBzSwZWA
	 rrPOvyJmdUoFAIX4havbXGS0QaNIxAJOMOliJ7wqCh68m4piundA2PJXEmGhnR+H0w
	 OzCyOHwoRg13NWv99jjUVYvJntQgd3nHDGTOrOQRByQUav3SQtX4TVqiJ7QKsITfCZ
	 71Ga/cKCxWnAw==
Date: Fri, 30 Oct 2026 09:53:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew LaMarche <andrewjlamarche@gmail.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2] dt-bindings: wireless: ath12k: allow calibration
 variant for WCN7850
Message-ID: <179337193753.3936464.10436179036151297295.robh@kernel.org>
References: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 07 Sep 2026 16:17:20 +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> qcom,calibration-variant is the generic Qualcomm Wi-Fi DT property for
> selecting board-specific calibration data when the device identity alone
> is ambiguous.
> 
> Commit 06cca100ad08 ("wifi: ath12k: support calibration-variant from
> device tree") implemented support for this property in the ath12k
> driver.
> 
> WCN7850 can be used in systems where the PCI device ID and machine
> compatible are identical across product variants, or across regions with
> different regulations. For regulatory changes, the hardware description
> does not change, but the vendor-provided calibration data can differ. In
> that case neither the PCI identity nor the machine compatible can
> identify the required data, so DT needs an explicit calibration variant.
> 
> The ath10k, ath11k and ath12k WSI bindings already allow this generic
> property for the same class of board-data selection. Allow it for
> WCN7850 PCIe devices as well.
> 
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
> Changes in v2:
> - Rebased
> - Updated commit message
> - Link to v1: https://lore.kernel.org/r/20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Sorry, not sure why this wasn't showing up for me. You may want to 
resend it in case it is not in wireless queue.

Rob

