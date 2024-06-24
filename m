Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52A4C2BD05
	for <ath12k@archiver.kernel.org>; Mon, 24 Jun 2024 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Z1R9SWHo+Obwc5DCOTaZhiZgES8pk/1FMeqyAx1jGA=; b=njbr6EyMG+sFZvdaU9mQdjWGNn
	jaNvONK5gJabdldCshM+YG477yB7QUFCGwYNcP8zCcUFOiLReXcdThiYxVvuvnvY02p4h9xoTEPj2
	F9cldujDI0BWoeqXGy3OJ+PgDIvbx7Pl/Kv8yC9/c5bQ0btPh2MJvTvXHgKfA9yJsRU8sYEcqeAmj
	tAEYF3+fg8yi0qeL8XKoK+MX/or8crTXbo7tJbdZE8/tBZx6ohO7G6FVmlvZGCT/9s4GRCDpjA3D9
	p6vzcAiIRNG5U6KiOtcbs7KTGy5Nsp+qkXXPUjNE9xSw8fSiUDQh0ZnvFCQchyxTs3TzAvUgwB1oY
	G66ZJYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLfnq-0000000GDLn-14BK
	for ath12k@archiver.kernel.org;
	Mon, 24 Jun 2024 09:15:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLfnn-0000000GDL4-1J46;
	Mon, 24 Jun 2024 09:15:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1E4960B2F;
	Mon, 24 Jun 2024 09:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C062AC2BBFC;
	Mon, 24 Jun 2024 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719220553;
	bh=3TUo3EMMp2WVQ87yOcyBELzxPkaPehB8lSHQ5fDIpa4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YtKHoYRd2HJ6enVATmRESqjstyG2dIxLknZWWpyuBwcZWbxfnKxTfEx6H4vJozKj7
	 g12H4ZeZw9ew7QsMS1sLjmz6zaSesZBWA4kGspJdrfwDtwUj44iQNtch4ajQOMLizS
	 b5U5ZSNwJ2pai5ca+DgIs6wVKZvRdPdxiSzFxWrsTdxP3mxJbFFXKIdeekFbqQIuWj
	 bFratpLU0LkufXyK46hUiepQoglazhqBMjIBiIFOg3IwBZlg0QZU6SEmDNUi6Z1fJn
	 YzkncSKGEfLj5LuwlxG42lNlfz16F2kcqZwr4uc7aSTGeAq/BYau2Upw7Mi9hdtNPb
	 lXoQrySK9LdVw==
From: Kalle Valo <kvalo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,  "David S . Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Jeff Johnson <jjohnson@kernel.org>,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
  devicetree@vger.kernel.org,  ath11k@lists.infradead.org,
  linux-kernel@vger.kernel.org,  ath12k@lists.infradead.org,  Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 1/2] dt-bindings: net: wireless: qcom,ath11k:
 describe the ath11k on QCA6390
References: <20240605122106.23818-2-brgl@bgdev.pl>
	<171862259099.4124983.18069958656274980613.kvalo@kernel.org>
	<4c3d4437-4c24-4db3-855d-f2ba7d0c6f8a@kernel.org>
Date: Mon, 24 Jun 2024 12:15:47 +0300
In-Reply-To: <4c3d4437-4c24-4db3-855d-f2ba7d0c6f8a@kernel.org> (Krzysztof
	Kozlowski's message of "Mon, 24 Jun 2024 09:00:56 +0200")
Message-ID: <871q4mk8fw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_021555_438528_751CDE01 
X-CRM114-Status: UNSURE (   9.97  )
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

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On 17/06/2024 13:09, Kalle Valo wrote:
>> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> 
>>> Add a PCI compatible for the ATH11K module on QCA6390 and describe the
>>> power inputs from the PMU that it consumes.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> 2 patches applied to ath-next branch of ath.git, thanks.
>
> Hi Kalle,
>
> Are you sure your tree is properly fed to linux-next? I cannot find
> these patches in linux-next and above repo is not listed in Next/Trees.

ath.git is not included in linux-next builds. To my knowledge wireless
and wireless-next trees are the only trees from the wireless subsystem
which are included, all driver trees are not. But Jeff and I are talking
about including ath.git to linux-next.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

