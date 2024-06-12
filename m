Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8799BC27C7B
	for <ath12k@archiver.kernel.org>; Wed, 12 Jun 2024 12:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfO0bvyUfQITqg3RM0IAf12PUgDeQScKjtZWByToljI=; b=q4tQ9jNF5pMRBSyC4Onas3fFUE
	BF0VzuAMf4Pn8HJo9ib1CZ6cTaEV2Vu9MBrRS9TD5I7llMK6quI4S0gpkOFrflfQETc+0/0t/wRpv
	tbW1HOimXl+35bCsxSNopRzqL+k/VJcZBXXfAZf6V7ivPA4iIdBp1LTY+XIV55FlGCkgSJcB3Nyd5
	SMiBOvR9DoHAGZ+d8jMQHiN47Bsqa+l/qAOvr9zAVdFji5jtd6ivyq0qqmtP6jN0bEc6aGf5XUczy
	sDkhhz4co1oQRGECIQYH8yrfjkSPx/BBOXlEEOqi2P68g5JzPgF9uI6dFHPMmop49v1LfvHs6cyR7
	dqYsgR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHNQS-0000000CdNb-4495
	for ath12k@archiver.kernel.org;
	Wed, 12 Jun 2024 12:50:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHNQN-0000000CdKH-3BKp;
	Wed, 12 Jun 2024 12:50:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5738BCE1C0F;
	Wed, 12 Jun 2024 12:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94965C3277B;
	Wed, 12 Jun 2024 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718196596;
	bh=eQnr5sp7TMU5N9+uMDCu57G7uX0Piw4Oz8VKM7kfQy8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=aJ2k0Fwtt4Xb1+hzlbll1Aahwhuiw50/l5W97ntyw/wMLsB1NPLwI8RyOXHcP6scE
	 LDeOq9eFDKNdz1Rqv+0AZh5iWyng3A3wsJw85AQP4Tgo15pNlzXsqoJNBGuC0wOBOd
	 ePJzAeCzlYh9g1k2Ha/zf5lnnK65hoYrkznfPeoPr3YX/99a0PZkyE55ILb9Zt0QK/
	 3gsNei2Yyg4Ip8d1LqdhbBnCGAd8eQhDnY8MrYVwYdkXLmzCp2M7q8kjAS659fi5oU
	 +WZn8rsCC7RSlyfS1BDCDW79WFkX2AcfW0Xn0B3qc2Ue3XdfGm70GuI7lr4PazJTDl
	 8pdMRG8iYjqaw==
From: Kalle Valo <kvalo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,  "David S . Miller"
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
References: <20240605122106.23818-1-brgl@bgdev.pl>
	<20240605122106.23818-2-brgl@bgdev.pl> <87h6e6qjuh.fsf@kernel.org>
	<CAMRc=MdiKxtnN+g92RUTXdOydaPV5M2u5iUdKyE2SNvDkdXAjg@mail.gmail.com>
	<871q5aqiei.fsf@kernel.org>
	<CAMRc=McacZMP-51hjH+d8=PVe+Wgw4a8xWcv0sRPLJKL_gP=KQ@mail.gmail.com>
	<87sexqoxm9.fsf@kernel.org>
	<CAMRc=McYAbhL5M1geYtf8LbgJG5x_+ZUFKXRuo7Vff_8ssNoUA@mail.gmail.com>
	<8db01c97-1cb2-4a86-abff-55176449e264@kernel.org>
	<CAMRc=Mer2HpuBLGiabNtSgSRduzrrtT1AtGoDXeHgYqavWXdrA@mail.gmail.com>
Date: Wed, 12 Jun 2024 15:49:51 +0300
In-Reply-To: <CAMRc=Mer2HpuBLGiabNtSgSRduzrrtT1AtGoDXeHgYqavWXdrA@mail.gmail.com>
	(Bartosz Golaszewski's message of "Tue, 11 Jun 2024 22:05:57 +0200")
Message-ID: <87ikyenx5c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_055000_319103_7967884C 
X-CRM114-Status: GOOD (  13.87  )
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

Bartosz Golaszewski <brgl@bgdev.pl> writes:

>> >> Sure, I don't need DT but that's not my point. My point is why require
>> >> these supplies for _all_ devices having PCI id 17cb:1101 (ie. QCA6390)
>> >> then clearly there are such devices which don't need it? To me that's
>> >> bad design and, if I'm understanding correctly, prevents use of
>> >> qcom,ath11k-calibration-variant property. To me having the supplies
>> >> optional in DT is more approriate.
>> >>
>> >
>> > We require them because *they are physically there*.
>>
>> I understand that for all known DT QCA6390 hardware, the supplies should
>> be provided thus they should be required. If in the future we have
>> different design or we represent some pluggable PCI card, then:
>> 1. Probably that PCI card does not need power sequencing, thus no DT
>> description,
>> 2. If still needs power sequencing, you can always amend bindings and
>> un-require the supplies.
>>
>>
>> Best regards,
>> Krzysztof
>>
>
> Kalle, does the above answer your questions? Are these bindings good to go?

To me most important is that we are on the same page that in some cases
(eg. with M.2 boards) the supplies can be optional and we can update the
bindings doc once such need arises (but we don't make any changes right
now). Based on point 2 from Krzysztof I think we all agree, right?

Just making sure: if we later change the supplies optional does that
create any problems with backwards compatibility? It's important that
updates go smoothly.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

