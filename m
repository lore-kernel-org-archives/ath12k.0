Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F3BD111A8
	for <ath12k@archiver.kernel.org>; Mon,  1 Dec 2025 02:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejlZdqDe9E22VPiZx/V7ZtidSGM6OnXHFF9hiPPFmPU=; b=FN3MRcujfdf2Fp7L1rG/0KitO7
	teXqwCFnmv5BkC7UbTfQX66sNe5v3ugWu1Q6jp7CIr9nuYOHqilelFdkr95vXdE2Q2XNXByUQFZa6
	1uvY7wBRcwmR42cg6wmpcno38gkopKxw5uJWh8Zg8EKjXOVo/Oa3VYcoo+zR01ximAft+BPld1X28
	C0KnKxLtNF0uNWZkcG6ml4k3++1sG5rKfgj55L0Nd3Q1AiJoPkFKxXNTQQXZevFEom1Lbsu0M20fa
	u25n2j2aJ0DsJX7uzw4O9HmZU3pNXZx1d652q62E7CuOKV7UzCxzgDwEuFfZsZsNLd/7nCmPdcNuQ
	mPZTX96w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPtTn-00000002oNG-22tf;
	Mon, 01 Dec 2025 02:17:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPtTm-00000002oMx-20l2
	for ath12k@lists.infradead.org;
	Mon, 01 Dec 2025 02:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92D9B6015E;
	Mon,  1 Dec 2025 02:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE52C116B1;
	Mon,  1 Dec 2025 02:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764555449;
	bh=qAR4s+Sscu888FeC6OAcpjCUzMfZfymLy2FSxVamYDg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hGSoaUqyPnJR3vfA76Yf72BR0NW64ieqH6jU+UOq61BFL7JyN4zpRAZln8yvAeIwt
	 OH4MoOGpwjQz48oN1FVxneNHmJVUUsRXeR9hGcQXoMHitCKOLiGizqFSP7JAIYEfVR
	 BmdbvSutzNodrFlfOCkRVFaITuwmJpCUZ/nnasjxk+yR7Nyyjyoqh7IUqAU2OSRANU
	 gez9hzW5Od3lTBaMYiaPnOvnQGdapn+11xkfC/aFwm6E7T8ZPTYaVlynHGOPI1S8tP
	 QqRY83EXJSw+8Ozn5sEeIezR+B+Z3WcjK783OWiUNk3RQXYZufjSlgWYZFwssMyAqf
	 7FvXfWUPhXjkQ==
Date: Sun, 30 Nov 2025 20:17:28 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
 Johannes Berg <johannes@sipsolutions.net>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, ath12k@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Dale Whinham <daleyo@gmail.com>
In-Reply-To: <20251201011457.17422-7-daleyo@gmail.com>
References: <20251201011457.17422-1-daleyo@gmail.com>
 <20251201011457.17422-7-daleyo@gmail.com>
Message-Id: <176455544616.1847608.6932629512199964095.robh@kernel.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: wireless: ath12k: Add
 disable-rfkill property
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


On Mon, 01 Dec 2025 01:14:47 +0000, Dale Whinham wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> rfkill should be disabled according to the Surface Pro 11's DSDT.
> 
> https://lore.kernel.org/all/20250113074810.29729-3-quic_lingbok@quicinc.com/
> has added support to read the ACPI bitflag when ACPI is supported.
> 
> Document the disable-rfkill property to expose one specific feature
> (DISABLE_RFKILL_BIT) for devices described with a DT, so that the
> feature can be disabled.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath12k.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251201011457.17422-7-daleyo@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


