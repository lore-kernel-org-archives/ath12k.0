Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2502CE7A81
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 18:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5yhUUdo2ltmq6Ytv8IVTjsvyg4c991/K1Rn6XKZybY=; b=DZrU+/DqqZNntJHRowyMSWwajA
	RRFduuT7/+BKEoCp7NoUACGNelmMyP0GSLerAdeiIEbfJnoetszD+L6xafEZMekmc+lwn7KMF+b7E
	3f5Tknv68m4IoK3AvzVBjwWznTjRFEr41GB6HaEyLbOqqopib8IVEyaDubBSAu1a85ebXHY6cSx5z
	k9Gxljw/WzLFzmIRr1Y8k4BAKRl2RoWqGhWpTtqidm0rXWHMmQsRE2rF3V5WQgvyKmbbv5vHH8Vq6
	k1dNuROVzz/x27WqjKq6ggF5FFCVmm4In15aMrj5Vki6Eq0I/0JzWElppl3CKNmtqnoeMbfpruNxZ
	NDAtzIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHIt-00000009SX0-1v0H
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 18:33:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHIq-00000009SVw-0GPZ
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 18:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CED8BA44EDA;
	Thu,  5 Sep 2024 18:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8525C4CEC7;
	Thu,  5 Sep 2024 18:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725561233;
	bh=0IyRC2uxRfR0TLKCB/z3dbBdDVG91WjX5B0avIrfGsw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Zp71xDyqlTXRQt3Hgs9dX7maNS+Qv+SS0pnRsXfZPfMO3gWJK1JpPRINzTNz9vjK4
	 8Pn6c2eXC9wE5pvP+wiZHyeItr2+fOVuX+Trvf5oBKQZNjhwTBwF7PYjwnZJgMiLw2
	 U4+H5vv2jw4h8/+dnXe9yPIKYiEQ1N2qIaEaYumzRXg4XsjIXCS+y8CWTBMLJyQtLx
	 mxDfnJkctto3XkEF8pngirPzlFPCEAhsAiRKvMm6sJUi4ElBBokZtV6BrZrZQoOaas
	 AKWgb0NrA5nwpgvHhcIaqAI4XmOlQ2vvSbwGyvc3QPSqo/HYgW+3pRRQm8NxZhoXKe
	 qNHbOww5EfBKA==
From: Kalle Valo <kvalo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
  ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [RFC PATCH 01/18] dt-bindings: net: wireless: describe the
 ath12k AHB module
References: <20240814094323.3927603-1-quic_rajkbhag@quicinc.com>
	<20240814094323.3927603-2-quic_rajkbhag@quicinc.com>
	<6a740dee-464a-4a10-9c25-ee6f0d22b279@kernel.org>
	<cecf0e32-b84c-423e-89c3-61eab9f1928a@quicinc.com>
	<1e2a2974-b78b-483f-9190-34d5dae69f7d@kernel.org>
	<9e40f028-dc71-41cb-a5ac-772ef91129ac@quicinc.com>
	<a782bd91-6d8a-4d3a-8df2-c8aebebc00f9@kernel.org>
Date: Thu, 05 Sep 2024 21:33:51 +0300
In-Reply-To: <a782bd91-6d8a-4d3a-8df2-c8aebebc00f9@kernel.org> (Krzysztof
	Kozlowski's message of "Wed, 4 Sep 2024 13:42:25 +0200")
Message-ID: <874j6uhrw0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_113356_221539_F6EA6801 
X-CRM114-Status: GOOD (  12.19  )
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

> On 04/09/2024 13:28, Raj Kumar Bhagat wrote:
>
>> On 9/4/2024 1:08 PM, Krzysztof Kozlowski wrote:
>>> On 04/09/2024 09:23, Raj Kumar Bhagat wrote:
>>>>>> +  qcom,board_id:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    description:
>>>>>> +      Board id value, it identifies the variant of ath12k WiFi device.
>>>>>
>>>>> Please do not upstream whatever you have in your vendor tree... You even
>>>>> copied its style! There is no such property in upstream.
>>>>>
>>>>> NAK, you are duplicating compatibles.
>>>>>
>>>>>
>>>>
>>>> qcom,board_id is a new parameter introduced to distinguish between different variants
>>>> of ath12k devices that share the same compatible value. This differentiation is crucial
>>>> as these variants have different qcom,board_id values (with the same compatible) based
>>>
>>> You must explain why compatible cannot be used for that.
>>>
>> 
>> The compatible property is used to define the variant of the Ath12k device. However, the
>> Ath12k device variant does not change with different capabilities or configurations
>> (e.g., operating band). The qcom,board_id parameter is introduced to define these
>> configurations, not the device variant itself.
>
> operating aspects are run-time, so not suitable here. It's all still
> vague for me.

Yeah, this is weird and I would hope there is a better way to do it.
Unfortunately I'm not able to study this in detail right now but, like
you said, most likely this is just directly copied from QSDK (their
downstream).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

