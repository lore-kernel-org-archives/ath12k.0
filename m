Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F015D3ABDA
	for <ath12k@archiver.kernel.org>; Mon, 11 Nov 2024 18:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTlUasrI4q1wQ14cfwDw37WAnTigSmByA7UHClahYQ0=; b=oj3bBT6gNkTLnIy3rGONM3DLBB
	4BTmnKbOpEcCJycpJ/O5Bkoys3c8AhrLBi1bJPKogmEiJzuVVxv0vfAP7uUJsro2PLAleoenwhVQk
	6qS5JpYee2vB6PtwPMW2lRrf7SLHOcPccA7cxJ/LgiLLakwiTPWykio6Ee54yuDjhhKZLkIdyKQse
	EQMZcbGdGb1jiRniaYOQd6uK2W/c+nWIngdfAlm74cccZkJP8+CrrltVaRwFs+deOZAvAuBqg5mFU
	CT2wVteTlxy8seuBPdZCkOCgbZBxt05/Szyv1XUUUL+bqmZqc8bNID2ADChtXsDnGj5Xs5bt22zbu
	macsogbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYmk-00000000pRF-1Xy0
	for ath12k@archiver.kernel.org;
	Mon, 11 Nov 2024 18:05:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYft-00000000nxz-2XPD
	for ath12k@lists.infradead.org;
	Mon, 11 Nov 2024 17:58:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8DCBAA417E8;
	Mon, 11 Nov 2024 17:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DC7C4CECF;
	Mon, 11 Nov 2024 17:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731347884;
	bh=o3CQlzBRpJV7aSV4DDZJsHMn6BJpLIqcjJ/aGt/TrPw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pwgmUV20E5aFcgwiIvoi9A192iBJ8Zm9CVa0R7SLCKwUtHCxAbSDAhm7yBGz2lqNr
	 jETq5UW1TzB8BWPmXi8TZ9WhuhNv5gfmYbIQmJTr83Mm/DKDsdONzg3sARLRzUTLWr
	 XtqGGPVPnT812jB0Nw6XJ/yj6Yozw1dhC0of3Q98xk9yfk19deIkHKE2a+pfV4HYG1
	 MWhjiyluh/cLJH6+4dSS2Z5awGosMnSLw+gxt4NuzZZJRbdS0MvpmJCqiO5NUSUSGw
	 t18OJG06Wdk8UweroCF29N+UUt7Y7igbWNkx2Gl2hi43SzSmreioKTylBHJVD2u1LF
	 LgbFFtHfTLqUQ==
From: Kalle Valo <kvalo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,  Raj Kumar Bhagat
 <quic_rajkbhag@quicinc.com>,  ath12k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jeff Johnson <jjohnson@kernel.org>,  Bjorn
 Andersson <andersson@kernel.org>,  Konrad Dybcio <konradybcio@kernel.org>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-msm@vger.kernel.org
Subject: Re: [RFC PATCH v3 0/5] wifi: ath12k: Add wifi device node with WSI
 for QCN9274 in RDP433
References: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
	<49a6ec0d-8a0b-49aa-a9eb-1174cff930f6@kernel.org>
	<cmvfpctliqggra33u6ituguoxh3jxcuxiyjpbtcjbcgpu6lhoi@4zdthfkc2ed3>
	<692503b8-cf39-4d6b-b70e-910fcc710d69@kernel.org>
	<CAA8EJpqMCbyK0dodMNyfs8dNjV2QoB2nyWm233eOS9xo8BaFJg@mail.gmail.com>
	<9d158c25-197a-49fd-b639-45287a46438f@kernel.org>
Date: Mon, 11 Nov 2024 19:57:59 +0200
In-Reply-To: <9d158c25-197a-49fd-b639-45287a46438f@kernel.org> (Krzysztof
	Kozlowski's message of "Thu, 7 Nov 2024 13:16:56 +0100")
Message-ID: <87wmh94pqw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_095805_795847_F4446C2C 
X-CRM114-Status: GOOD (  19.74  )
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

> On 07/11/2024 13:03, Dmitry Baryshkov wrote:
>
>> On Thu, 7 Nov 2024 at 11:29, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 07/11/2024 12:06, Dmitry Baryshkov wrote:
>>>> On Thu, Nov 07, 2024 at 11:23:20AM +0100, Krzysztof Kozlowski wrote:
>>>>> On 05/11/2024 19:04, Raj Kumar Bhagat wrote:
>>>>>> The RDP433 is a Qualcomm Reference Design Platform based on the
>>>>>> IPQ9574. It features three QCN9274 WiFi devices connected to PCIe1,
>>>>>> PCIe2, and PCIe3. These devices are also interconnected via a WLAN
>>>>>> Serial Interface (WSI) connection. This WSI connection is essential
>>>>>> for exchanging control information among these devices.
>>>>>>
>>>>>> This patch series describes the WSI interface found in QCN9274 in
>>>>>> device tree and uses this device tree node in the Ath12k driver to get the
>>>>>> details of WSI connection for Multi Link Operation (MLO) among multiple
>>>>>> QCN9274 devices.
>>>>>>
>>>>>> NOTES:
>>>>>> 1. As ath12k MLO patches are not ready yet, this patchset does not apply
>>>>>>    to the ath.git ath-next branch and that's why the patchset is marked
>>>>>>    as RFC. These are the work-in-progress patches we have at the moment.
>>>>>>    The full set of MLO patches is available at:
>>>>>>    https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=ath12k-mlo-qcn9274
>>>>>>
>>>>>> 2. The dependency marked below applies only to the DTS patch. The
>>>>>>    dt-bindings patches do not have this dependency.
>>>>>>
>>>>>> Depends-On: [PATCH V7 0/4] Add PCIe support for IPQ9574
>>>>>> Link: https://lore.kernel.org/linux-pci/20240801054803.3015572-1-quic_srichara@quicinc.com/
>>>>>>
>>>>>> v3:
>>>>>> - Created a separate binding "qcom,ath12k-wsi.yaml" to describe ath12k PCI
>>>>>>   devices with WSI interface.
>>>>>
>>>>> Thanks for the changes. When you finish with testing/RFC, please send
>>>>> proper version for review (just remember to keep numbering, next one is
>>>>> v4 regardless whether this is RFC or not).
>>>>
>>>> Isn't the 'RFC' being an invitation for review per the nature of the tag
>>>> itself?
>>>
>>> No, RFC means patch is not ready, might change. This was brought on the
>>> lists multiple times and some maintainers clearly ignore RFC. Including me.
>> 
>> Thanks, point noted. I'll stop marking my patches with RFC tag.
>
> Wait, you can keep marking them RFC! It all depends what do you want to
> achieve. Get some comments on early work or actual review for something
> you believe is a finished work.
>
> I looked here briefly, no comments from me and I assume that was the
> intention of RFC.

Exactly, we just wanted to have early feedback how to handle this
feature. We will now incorporate these changes to our work-in-progress
ath12kl-mlo branches, test them and once everything else in ath12k is
ready we will submit the next patchset without RFC tag.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

