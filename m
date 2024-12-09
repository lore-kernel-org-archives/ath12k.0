Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809D4E77180
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 17:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZyzY7k6+XQMOFWAUj2QWqm7uCQ9iM7/tYCy7MlD7HA=; b=nz1L9Kk5STjD05RDsEx2nSBf3+
	8qJa8Q3KLxby3UBi/Y+mThV1uELi/G5Qjv8Ska00OLSuwMkoVDjsFznQaVx/W+sKJqG677iQ7/GOG
	RdzI081KZriOkBupfniXEFcnueCApYScRow44njdYbEzoFe2W5X4pIcA1qdZ1tj+NMyXg/slrUJ2g
	f92db4ox3IP0CfOfFN2PTTx3Gf6uDN0pAzFT8YUDAQIc/vYbPCw/zGWE9YNOpv4iWhDS3FMAiVxAT
	5v1ep6KcSv2yht3eqU6Xx68C09beJ2zErcOPL8i3kBfSb4gj9EHxEuC8w+zNhVd78XSWLD7dxGoJY
	TGXtNcrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhWX-00000008jCx-1E6R
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 17:26:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhWV-00000008jCI-0Szi
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 17:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A79C0A41835
	for <ath12k@lists.infradead.org>; Mon,  9 Dec 2024 17:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1F1C4CED1;
	Mon,  9 Dec 2024 17:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733765177;
	bh=DbEW8HiEN8UrWTm2ai5cXE5Unx4Lt0hypX28FJ3zTkI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=SQdbv32M4gQfi9aL+m0N6a0fpwF6PUXBwwdopOppQ3QfliOy+UR05w1z7Aew+lk8w
	 tBF9Yrqe1thB/xvp707bYe6Vd0m+O0WMa+BdLluei4HltbGcR38U2jb2p+V8GbjB7m
	 pQVMeVr6WeFGjt9tB2yJ0i9MVRw0wsV3nzNu6cn/q7bhr/KciaOHKrPrr3W/Z0XDoS
	 EQ4NoG542UvaMERya0nKonWZ/nboV1147wMcNe3ZxUcx8FG8+68Rqb53ikI/Lk7Mph
	 Y/j/fYA7dAxAlAWRi+duqZlxLyoMM7Yio/4yxC5RhCqNOPnLeRqV+RlxtZML8djoR8
	 5K6LpBoog8cTg==
From: Kalle Valo <kvalo@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: net: wireless: Describe ath12k PCI
 module with WSI
References: <20241205203044.589499-1-kvalo@kernel.org>
	<20241205203044.589499-2-kvalo@kernel.org>
	<20241206-sugar-surely-9efffa93aa5c@spud> <87zfl5rxt7.fsf@kernel.org>
Date: Mon, 09 Dec 2024 19:26:15 +0200
In-Reply-To: <87zfl5rxt7.fsf@kernel.org> (Kalle Valo's message of "Mon, 09 Dec
	2024 11:49:08 +0200")
Message-ID: <87a5d4sr7s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_092619_217587_881985A2 
X-CRM114-Status: GOOD (  11.07  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Conor Dooley <conor@kernel.org> writes:
>
>> On Thu, Dec 05, 2024 at 10:30:37PM +0200, Kalle Valo wrote:
>>> +  qcom,wsi-controller:
>>> +    type: boolean
>>> +    description:
>>> +      The WSI controller device in the WSI group aids (is capable) to
>>> +      synchronize the Timing Synchronization Function (TSF) clock across
>>> +      all devices in the WSI group.
>>
>> This should be type: flag btw.
>
> Just so that I understand correctly, do you mean it should be like this:
>
>   qcom,wsi-controller:
>     $ref: /schemas/types.yaml#/definitions/flag
>     description:
>       The WSI controller device in the WSI group aids (is capable) to
>       synchronize the Timing Synchronization Function (TSF) clock across
>       all devices in the WSI group.
>
> And no changes in the code?

I submitted v2 now:

https://lore.kernel.org/ath12k/20241209153034.50558-1-kvalo@kernel.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

