Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B616D43358
	for <ath12k@archiver.kernel.org>; Thu,  7 Nov 2024 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZiY9KE2jJiKiFL+9MXwlA1ATEp7qFEBIE4Cyfo4wais=; b=r0Et868XAs/9liO72wUfXghAM5
	gqlKvSDquS3A1KqTdYzwqDvHrG4pLnn9YB9T0Xj0tROjNQQ4j8ofKZOiocmAGyrOzmWXaWB0I9Y+V
	NUCY9aYgl/xJ3ASopd996zFeu8CoIw2pXN+ZA96RaXwNdwHAvv+uqbOQg7/S86+l9F17OMk2SKx5H
	jI7B99DmhCdv74JnEat9pLemwude3AgZev0JvkOBdkiaK82H47ktVua7kyWGFEJZyxzUcadJN82zw
	JKdy6BxMuvm5NkpWS+BHF3AIkB8Ka3yOosyaGLYV5hXlcTY9gcChL9XYo6GVQPa8Qf2UBWDSNF6sP
	4HWSYFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91W1-00000006uHt-33KM
	for ath12k@archiver.kernel.org;
	Thu, 07 Nov 2024 12:21:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91Rf-00000006tYi-3Y9k
	for ath12k@lists.infradead.org;
	Thu, 07 Nov 2024 12:17:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CAE0EA4376F;
	Thu,  7 Nov 2024 12:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7019C4CECC;
	Thu,  7 Nov 2024 12:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730981822;
	bh=EIyzkWslkWt3z9X5/Kx+ztKigmF58WmnDqUUe3ffxEY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ryA6Q4qV9QVvx2vOqi74IWrkCacGjAuIxRVyqu/QjCx+tvBBGd6zjYLU5VPC4N2gV
	 Sxq5nOE55+AlNfP0Rzgp8uQv0rDVkm9+TxCwd01JdNW+C+5ni7TPWWDXvMUVzD0kOV
	 2/JOWUw6WtWObo1PQEdVUCL3dOPW5TWRrP+n3HoF6WuJpckNlACbf1ZTcr3DnR1HAC
	 8WNLwPcs2hqXZvhCGLIKCTpOkzJThdc9CMQl8Y1vjFSCmyHG48GKPRZsih2s85pbne
	 tNF2pUqBdlXfnUzHIjSWZlau2+UdUG2A1zrc9v1dXncSdgJeJUfY1cAWVWOZ04DsWi
	 Ek2zC2CQ87zjw==
Message-ID: <9d158c25-197a-49fd-b639-45287a46438f@kernel.org>
Date: Thu, 7 Nov 2024 13:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/5] wifi: ath12k: Add wifi device node with WSI
 for QCN9274 in RDP433
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
 <49a6ec0d-8a0b-49aa-a9eb-1174cff930f6@kernel.org>
 <cmvfpctliqggra33u6ituguoxh3jxcuxiyjpbtcjbcgpu6lhoi@4zdthfkc2ed3>
 <692503b8-cf39-4d6b-b70e-910fcc710d69@kernel.org>
 <CAA8EJpqMCbyK0dodMNyfs8dNjV2QoB2nyWm233eOS9xo8BaFJg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAA8EJpqMCbyK0dodMNyfs8dNjV2QoB2nyWm233eOS9xo8BaFJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_041704_051498_6B8B04C5 
X-CRM114-Status: GOOD (  14.38  )
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

On 07/11/2024 13:03, Dmitry Baryshkov wrote:
> On Thu, 7 Nov 2024 at 11:29, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 07/11/2024 12:06, Dmitry Baryshkov wrote:
>>> On Thu, Nov 07, 2024 at 11:23:20AM +0100, Krzysztof Kozlowski wrote:
>>>> On 05/11/2024 19:04, Raj Kumar Bhagat wrote:
>>>>> The RDP433 is a Qualcomm Reference Design Platform based on the
>>>>> IPQ9574. It features three QCN9274 WiFi devices connected to PCIe1,
>>>>> PCIe2, and PCIe3. These devices are also interconnected via a WLAN
>>>>> Serial Interface (WSI) connection. This WSI connection is essential
>>>>> for exchanging control information among these devices.
>>>>>
>>>>> This patch series describes the WSI interface found in QCN9274 in
>>>>> device tree and uses this device tree node in the Ath12k driver to get the
>>>>> details of WSI connection for Multi Link Operation (MLO) among multiple
>>>>> QCN9274 devices.
>>>>>
>>>>> NOTES:
>>>>> 1. As ath12k MLO patches are not ready yet, this patchset does not apply
>>>>>    to the ath.git ath-next branch and that's why the patchset is marked
>>>>>    as RFC. These are the work-in-progress patches we have at the moment.
>>>>>    The full set of MLO patches is available at:
>>>>>    https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=ath12k-mlo-qcn9274
>>>>>
>>>>> 2. The dependency marked below applies only to the DTS patch. The
>>>>>    dt-bindings patches do not have this dependency.
>>>>>
>>>>> Depends-On: [PATCH V7 0/4] Add PCIe support for IPQ9574
>>>>> Link: https://lore.kernel.org/linux-pci/20240801054803.3015572-1-quic_srichara@quicinc.com/
>>>>>
>>>>> v3:
>>>>> - Created a separate binding "qcom,ath12k-wsi.yaml" to describe ath12k PCI
>>>>>   devices with WSI interface.
>>>>
>>>> Thanks for the changes. When you finish with testing/RFC, please send
>>>> proper version for review (just remember to keep numbering, next one is
>>>> v4 regardless whether this is RFC or not).
>>>
>>> Isn't the 'RFC' being an invitation for review per the nature of the tag
>>> itself?
>>
>> No, RFC means patch is not ready, might change. This was brought on the
>> lists multiple times and some maintainers clearly ignore RFC. Including me.
> 
> Thanks, point noted. I'll stop marking my patches with RFC tag.

Wait, you can keep marking them RFC! It all depends what do you want to
achieve. Get some comments on early work or actual review for something
you believe is a finished work.

I looked here briefly, no comments from me and I assume that was the
intention of RFC.

Best regards,
Krzysztof


