Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357B5C3DA64
	for <ath12k@archiver.kernel.org>; Tue,  6 Aug 2024 06:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uk+2DQ1OQujnUvfHLCUAhLyADYnpjvkGdP9GV+pt5o=; b=z/pEB7hPxLV4Oxve9Y7TNNJUL8
	o1NHRE6708PYfOEcHXTVHE/2REMlKAxqQInj9zaytHZnhJ++C7AA8CxhVxOUow6ozc2M2msZBTiEX
	tPpdD336TDeVpNgG2S0DeBRhhKTFf3Y5No9Op0JQTEgWfycu2kAarYZNz4mA75WnYhQMzHx87lcfV
	XZGRTt4noQE2McPPwLZ0Q3xTPsjA89igUfge8zBD5fe+BDuYXOQ4aGaMMPy+CDaqossZ+eD3MU9SM
	GmSdAJFQHIJYw72PZr0Q57WZyzkB1k9kjuiRCRU06Ae0J2dn1W90qsZdD5jFtEc1Md/MEM/Udrhpv
	nhLNgkTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbDIB-00000000d4P-3gs5
	for ath12k@archiver.kernel.org;
	Tue, 06 Aug 2024 06:03:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbDI8-00000000d3j-44k3
	for ath12k@lists.infradead.org;
	Tue, 06 Aug 2024 06:03:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 20FAACE0C6B;
	Tue,  6 Aug 2024 06:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7973AC32786;
	Tue,  6 Aug 2024 06:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722924206;
	bh=nbG32vBYlywcNx4vZpmXm/t1i2crQ86B6ZJl7EmFdQU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Hc3YIRnfanKOP6ZOZVFAGLkj1/9YqIT3ijKo2vyDyKpHEBFPQbw99di6iwnbtEBYY
	 wSOuKtat3AqxIt3YN7JHixpitlEYDPcWHUVX3oM181q9HaMHDMzXbHvrSnxpIW96nf
	 u0QGz18lrTrO1do82Ew9vcozTLJfKwDYgHsGH0xzUB1w9I/ADwsaK/Li0L1fvBvyVk
	 SrmzbwT1OljBf/hynVH6VhM/3wqXjauBMjy1ItVixS+VAe/aOXE5/IgE0Wvyrdt+KR
	 orIOLigNpWNeAf3GobO/kc0HVk+lSBe5Mo9XXRkwlod4dcLUDwrpO59cWOP7nij1JT
	 eV7SKOAarn8tA==
From: Kalle Valo <kvalo@kernel.org>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Subject: Re: [PATCH v8 7/8] wifi: ath12k: refactor core start based on
 hardware group
References: <20240531180411.1149605-1-quic_hprem@quicinc.com>
	<20240531180411.1149605-8-quic_hprem@quicinc.com>
	<87plsuql2y.fsf@kernel.org>
	<dd2488bb-43f9-d546-7617-2a54ca3d1a1d@quicinc.com>
	<87ed8ae8ye.fsf@kernel.org>
	<4f0963ff-a822-49b8-3d45-5d90e2c2d511@quicinc.com>
Date: Tue, 06 Aug 2024 09:03:23 +0300
In-Reply-To: <4f0963ff-a822-49b8-3d45-5d90e2c2d511@quicinc.com> (Harshitha
	Prem's message of "Tue, 9 Jul 2024 15:44:20 +0530")
Message-ID: <8734ni6vdg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_230329_385324_E641E9D9 
X-CRM114-Status: GOOD (  27.17  )
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

Harshitha Prem <quic_hprem@quicinc.com> writes:

> On 7/3/2024 9:58 PM, Kalle Valo wrote:
>> Harshitha Prem <quic_hprem@quicinc.com> writes:
>> 
>>>>>    +static void ath12k_core_device_cleanup(struct ath12k_base *ab)
>>>>> +{
>>>>> +	mutex_lock(&ab->core_lock);
>>>>> +
>>>>> +	if (test_and_clear_bit(ATH12K_FLAG_CORE_HIF_IRQ_ENABLED, &ab->dev_flags))
>>>>> +		ath12k_hif_irq_disable(ab);
>>>>> +
>>>>> +	if (test_bit(ATH12K_FLAG_PDEV_CREATED, &ab->dev_flags))
>>>>> +		ath12k_core_pdev_destroy(ab);
>>>>> +
>>>>> +	if (test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags)) {
>>>>> +		ath12k_mac_unregister(ab);
>>>>> +		ath12k_mac_destroy(ab);
>>>>> +	}
>>>>> +
>>>>> +	mutex_unlock(&ab->core_lock);
>>>>> +}
>>>> This patch is just abusing flags and because of that we have
>>>> spaghetti
>>>> code. I have been disliking use of enum ath12k_dev_flags before but this
>>>> is just looks too much. I am wondering do we need to cleanup the ath12k
>>>> architecture first, reduce the usage of flags and then revisit this
>>>> patchset?
>>>>
>>> yeah., more dev flags :( but flags were needed for the race conditions
>>> when multiple devices where involved in a group, some devices would
>>> have completed till pdev create some might not. Some crashes were seen
>>> because hif_irq_disable was called for a device in a group but that
>>> device was not even at the stage of core register. Will check the
>>> possibility to  reduce the flag usage but it seemed necessary for
>>> multiple device group clean up.
>> I think the core problem here is of mixing enum ath12k_hw_state and
>> enum
>> ath12k_dev_flags, it's just a mess even before this patchset. For
>> example, these flags look like they should be part enum ath12k_hw_state
>> instead:
>> 	ATH12K_FLAG_RECOVERY,
>> 	ATH12K_FLAG_UNREGISTERING,
>> 	ATH12K_FLAG_REGISTERED,
>> 	ATH12K_FLAG_QMI_FAIL,
>> If we have an enum plus set of flags to handle the actual state then
>> it
>> will become difficult to manage it all. Instead we should just have the
>> enum for tracking the state of the driver.
>> 
>
> ath12k_hw_state is the driver state representation which is used to
> indicate whether driver has started or in restarting from mac80211
> prespective where as ath12k_dev_flags closely related to devices and
> its q6 states.
>
> So, ATH12K_FLAG_RECOVERY, ATH12K_FLAG_QMI_FAIL should be in
> ath12k_dev_flags because these are specific to Q6 crashes and failure.
> ATH12K_FLAG_UNREGISTERING is actually used to indicate pci_remove is
> initiated and we should not process any QMI events but may be naming
> is creating the confusion. ATH12K_FLAG_REGISTERED flag is used whether
> to recover or not with the information available in mac80211 to
> reconfig.
>
> With hardware abstraction, it can be like 3 devices (ath12k_base) in
> one ath12k_hw and with ath12k_hw_states alone we might not be able to
> handle. Because, say device1 is in recovery, device2 is already till
> QMI firmware ready after device probing and these two devices are not
> registered to  mac80211 then we cannot set the ath12k_hw_state as
> ON/OFF or anything else.
>
> Hence, we may require two distinct flags, where one holds the driver
> abstraction state and other is device states. With grouping complexity
> would increases as we have to sync between the devices and we require
> two flags. Please let me know your thoughts.

Can you elaborate, for example provide exact state machine description
for all these states? I just can't understand how using several flags in
addition of an enum as different states makes anything easier to manage.
To me that sounds just like spaghetti code.

What I'm thinking is we should cleanup ath12k_core_start(). Now it's
basically asynchronous (ie. qmi.c calls
ath12k_core_qmi_firmware_ready()) but if we change it to be synchronous
(using completions etc.) I believe we could get rid of lots of these
annoying flags. In other words, if ath12k_core_start() returns with zero
then the firmware has booted succesfully.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

