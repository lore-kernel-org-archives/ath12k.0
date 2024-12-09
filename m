Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F55E7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 09:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rk8opW+9ycz7Q+TwZwbT+7DbKE46ZkEQAV1rOVdhUvo=; b=F+az7mJYU21L77pUx3Q6/OISTt
	z2bs17UubVpRqYMd+27FUfVQWRmUQ3dwWEKvK8fpjK633LDzb8xwt7KjaikMZtnBRIkmKIHN7yDhr
	qKXZUNKjdbcLDNg8UF0BDMlM/C+3pdbDsR0B1ZoJpFBc3a7pzNSmpZmQeyYpOwY9YnE3OTrzK/yep
	/mzMaEkDcz+y1t/uvXTBrkUis7RBmmjFvGYrl0KphWsD8PmLpPwO7/W02yN8e6Opw8ISFoZ5phM/z
	I1cngY4VZwwg+cJ4RXce2ZgcJ6WZFdQzsgAQcmM3NImZu6jCkXO3/Aat2ap1hIkEAS41qyOQZVACa
	xvLwd6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaRg-00000007A8p-02vS
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 09:52:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaO8-000000078oL-1GF3
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 09:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB2DC5C4323
	for <ath12k@lists.infradead.org>; Mon,  9 Dec 2024 09:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4738AC4CEDE;
	Mon,  9 Dec 2024 09:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733737751;
	bh=qhrx3ojEXBzEaAfZ+IYNq03LjibZUpkxxO/wLrw5KxA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Xn+qMvvbUXfDiIJZ4474c8UVpIOt4pSffXzuVqUvjAIrPAzgJwmJ5K/gTXQKAvmEn
	 4TJKKTsIu3MrD7gIU2K//yTQzOk5EHiSR2Toyxp5u9FgB0ZJIVBTDycXnCiQKEROHq
	 Vxk07kmPKtt7JQhH6+6KpM7OpmJ58ANg1hkto1IdjPmSo6B2aNJsgTK7IGDOVNCCj3
	 k9dhto7AEeh9WzQrnegSkkSlDJS3VOt1SA5rOCZYXRZbSF3vN+bEJxOlrtRzwGBdEE
	 nxoAR3ZoaFuA9I1Pe5zZxwZOOLuK3r1uHEWFA58cIhhWdg0b6+ZVDppVuWyzHvWn8n
	 7O9Yvoqa8cTEg==
From: Kalle Valo <kvalo@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: net: wireless: Describe ath12k PCI
 module with WSI
In-Reply-To: <20241206-sugar-surely-9efffa93aa5c@spud> (Conor Dooley's message
	of "Fri, 6 Dec 2024 17:05:03 +0000")
References: <20241205203044.589499-1-kvalo@kernel.org>
	<20241205203044.589499-2-kvalo@kernel.org>
	<20241206-sugar-surely-9efffa93aa5c@spud>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 09 Dec 2024 11:49:08 +0200
Message-ID: <87zfl5rxt7.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_014912_379031_588285F0 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

Conor Dooley <conor@kernel.org> writes:

> On Thu, Dec 05, 2024 at 10:30:37PM +0200, Kalle Valo wrote:
>> +  qcom,wsi-controller:
>> +    type: boolean
>> +    description:
>> +      The WSI controller device in the WSI group aids (is capable) to
>> +      synchronize the Timing Synchronization Function (TSF) clock across
>> +      all devices in the WSI group.
>
> This should be type: flag btw.

Just so that I understand correctly, do you mean it should be like this:

  qcom,wsi-controller:
    $ref: /schemas/types.yaml#/definitions/flag
    description:
      The WSI controller device in the WSI group aids (is capable) to
      synchronize the Timing Synchronization Function (TSF) clock across
      all devices in the WSI group.

And no changes in the code?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

