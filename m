Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D242EC43458
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bwvb6hHj9l6Yne/LOBL2AhqvJDVM5cGE5+22179LIpk=; b=bVRT93TGbkU31pZ1qyGekubF9h
	ZHa5oto6PxLZ3dT35X56R2q8JPXq4A/nqmjpveSYG8dTOb2gCndadpagKwVGXwa4v0RSYY/i6aIDs
	N/c3MQAlJnQu4MSe4azZrHavnp9FHPeFLhohKva0dDM18mJGzhdvjkqR7Hb6QXQVuYtKJ1Xat7EGn
	/IA+xODavOeY2lqzrhOuBImRXRb+XS15KH0G8UCMhtz+71N3h4YSXbIWKSps7Z0SH4dRjvKG49BzR
	omP49EQT9etJdAleV/pChWeuMlDJQQ9xo7Fej20oqUwNCzg2OSKDh01FBbc93LZbd5dfYZF0jk4AH
	79DEpSnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDKK-00000003xLT-2TaA;
	Thu, 02 Jul 2026 09:03:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDKJ-00000003xL7-1AO2
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 09:03:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5F554352A;
	Thu,  2 Jul 2026 09:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264911F00A3D;
	Thu,  2 Jul 2026 09:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782982998;
	bh=Bwvb6hHj9l6Yne/LOBL2AhqvJDVM5cGE5+22179LIpk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=aUBRs9uPdJcAAhzxzoMgW/3Z8S0pOAwjv5caiflPdwTXjAm0IeEhsGP406EUAC/Yp
	 GKkmwK3elRu2hl2GtMQCNo7XmKPZvFdI0pRlW++JwycKPUAnEOSStkylnZDM66Nmn8
	 5bxyH5qL57GMGhWBHW/Oj1YzpgzirKUzpJWK8F9Bx96+2Y2CvBrkW17ACfqmfkPt3Q
	 U2VhCzpyTIlBAFwZ5XwqT/Svq33gM3ehpnCF2uSDgPFGJQmOS1HAx9wFyut6D085xo
	 0XkvDp+SpPC/7rBm7FT5EZsgPiJxhVotj4eUZE8lRiLkga9G3KHnm6hi3eCqSW43mX
	 jrAhmMKtANZBg==
Message-ID: <40d95b47-d7ce-4e0a-ab25-8adce6851aa9@kernel.org>
Date: Thu, 2 Jul 2026 11:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: wireless: ath12k: allow calibration variant
 for WCN7850
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Andrew LaMarche <andrewjlamarche@gmail.com>, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, ath12k@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
References: <20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com>
 <20260702-beneficial-hopeful-binturong-a0bee9@quoll>
 <a0cb02e3-0566-4294-b41c-3b156ecda5e0@kernel.org>
 <zglhxxu6txw2xvz4vcyu32v6722hqppcfvntan5ho32ak2y6tw@2mvfuaoxcvss>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <zglhxxu6txw2xvz4vcyu32v6722hqppcfvntan5ho32ak2y6tw@2mvfuaoxcvss>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 02/07/2026 11:00, Ernest Van Hoecke wrote:
> On Thu, Jul 02, 2026 at 10:29:51AM +0200, Krzysztof Kozlowski wrote:
>> On 02/07/2026 10:27, Krzysztof Kozlowski wrote:
>>> On Wed, Jul 01, 2026 at 05:42:24PM +0200, Ernest Van Hoecke wrote:
>>>> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>>>>
>>>> qcom,calibration-variant selects board-specific calibration data for
>>>> systems where the bus and device IDs are not unique.
>>>>
>>>> This is not specific to WSI-capable QCN9274 devices. The WSI binding
>>>> already allows the property, so allow it in the WCN7850 PCI binding too.
>>>
>>> Why? You need to provide reasons WHY do we want this.
>>>
> 
> We (Toradex) have SoMs with the SX-PCEBE from Silex, which uses the
> WCN7850. Silex provided multiple board files for this to deal with
> separate regulatory regions. Thus, we need a mechanism to select which
> one to use even though the PCI ID and machines are the same.
> 
>>>>
>>>> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>>>
>>> Where is any user of this?
>>>
>>
>> Actually I missed your link in changelog section. I still however do not
>> understand why these are separate. Separate means they are completely
>> independent and thus my question about the user stays.
>>
>> Best regards,
>> Krzysztof
> 
> I agree that they could be one patchset and considered replying there,
> but felt it easier to discuss this with the relevant patch already
> attached. As the other binding already validates this property there is
> no real dependency or ordering problem, and I thought this would ease
> review.

If you do not have user in this patchset then your commit msg must
explain why you are adding this, otherwise it just looks like you are
adding unused ABI.

Best regards,
Krzysztof

