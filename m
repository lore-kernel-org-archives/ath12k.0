Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6847C606A333
	for <ath12k@archiver.kernel.org>; Sat, 21 Nov 2026 12:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zOP3pWid;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=af5LBooQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a+8c7yffJQ5BVh3ZLy2LMawlt2ATsxt0KRFpWXeqlm0=; b=zOP3pWidp2UfL+cm+PPGOjb6ER
	jUI2fVzfYIppIl+LaPyhap1coz1hGFAqOiObORw4ef9+CerURD7Rl/AJI38Jh3+pdc2ny0RinHNUQ
	iZzBQFwwf/XAousKZqTkYtmRswsXg5yR8thSFHZAZtYQjNPLsgsBPx1hqGYi7EHF9LX1FSif2BTta
	ljvawMlQszA6XMvlUiASZju/K9/pXHDB3eqyJR3VmBu6lYArSYH8wFoX3o2cGN8vMJo5eb7qKxrJy
	SVZvVxlT0GbvRboXjIrlLlJznYEJlzEfK6OMsjBO4o323JHUGr0HcXlIQPfhRbKxoS80uz8spMyUk
	8bTfdS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkFO-0000000HAbN-0hfI;
	Sat, 21 Nov 2026 12:31:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkFN-0000000HAbE-0Mte
	for ath12k@lists.infradead.org;
	Sat, 21 Nov 2026 12:31:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 71E5B613FD;
	Sat, 21 Nov 2026 12:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A821F000C0;
	Sat, 21 Nov 2026 12:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264272;
	bh=a+8c7yffJQ5BVh3ZLy2LMawlt2ATsxt0KRFpWXeqlm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=af5LBooQcrrs3jQoYDZH+bAiPNrTpj0EX+kY6amVx9sW4kPNQtkjWXKOJ/476trjL
	 uAJsIsp3B74GrQWc2A2DnQWfF5HWB8EN4Z33bB5oI5Ako3CL3WZhaCJM0hJyrKJ00Z
	 kOfPXMEFuWdfo7g2TrpPdCSqvdkrhyEstzGP/G/c6uB7yw8Da0xEQP5oOlXeOTvpyI
	 wtmabKDA+B1fyHtugmStV7wHjD8Yg5fyjYQVb6pPqz88FBchUtxBaklJKKXVSuJMRi
	 4u9de1vCr/jTuDjPh3EJjV7+CN9apNjOwqGzZw/fq2TSnew+XStwLI9zzKGgrDY0NU
	 7/kgfOBHBTpUQ==
Date: Sat, 21 Nov 2026 13:31:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH ath-next v3 06/15] wifi: ath12k: add initial Wi-Fi 8 hw
 params and init helper for QCN9575
Message-ID: <20261121-demonic-dove-of-improvement-2e73ae@quoll>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-6-9875d2a3953f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-6-9875d2a3953f@oss.qualcomm.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 01:45:29PM +0530, Madhavan Ganesan wrote:
> +int ath12k_wifi8_hw_init(struct ath12k_base *ab)
> +{
> +	const struct ath12k_hw_params *hw_params = NULL;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ath12k_wifi8_hw_params); i++) {
> +		hw_params = &ath12k_wifi8_hw_params[i];
> +
> +		if (hw_params->hw_rev == ab->hw_rev)
> +			break;
> +	}
> +
> +	if (i == ARRAY_SIZE(ath12k_wifi8_hw_params)) {
> +		ath12k_err(ab, "Unsupported Wi-Fi 8 hardware version: 0x%x\n",
> +			   ab->hw_rev);
> +		return -EINVAL;
> +	}
> +
> +	ab->hw_params = hw_params;
> +
> +	ath12k_info(ab, "Wi-Fi 8 Hardware name: %s\n", ab->hw_params->name);

Drivers should be silent on success (see coding style doc). This is not
even called anywhere, so difficult to follow any logic here how is this
supposed to be used, e.g. if this is initcall then clearly NAK.

Organize your work in logical chunks instead of adding bunch of
functions without users.

Best regards,
Krzysztof


