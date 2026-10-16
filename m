Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2341DCCA463
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXo3vu+kQ+7jaN7ywrrxzbnLHTPWgIs9D5YOpR7+/eQ=; b=Br0oHclBVfiXkkoS1+MrNkE2ab
	4OM3Qzpwu9juLO0GqP5NAjbYnBOxejv3awFc1RRb3i/vODOuxvDQNMiz8xmnnxqYTZJYRGN5xSbbN
	XzotCgt1JFUku2XuBM4UjBMjWLSaRw9MUo5UsrdRhq8U4jmAIZnr+oZhjihdn6v3VgMLnm3kPr9n9
	taEd03ZPHK7CT3nhE3N0f/jDdCVKVSsLGPo8JryZ6NVcIHmYSkdtYyr3LHwSqyeFkJ1UZdAD7ANLQ
	761RTHn6a0RcKFtKcMG8XaPyBpIjx5qTxk81a3JJTYcAy4tZGXP49TM/uEyD/1z49zrj5RIbJiP5R
	UNB4+Ong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYE1-00000001me0-3HvF;
	Fri, 16 Oct 2026 03:03:17 +0000
Received: from out-121.mta0.migadu.com ([2001:41d0:1004:224b::79] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYDy-00000001mcs-0h6Q
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:03:15 +0000
X-Envelope-To: ath12k@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4wygRKFSnqgr6PR5rOi3tKEHsDx4IhZAfPvVtWyXV6w=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792119790; v=1; x=1792724590;
 b=UyVu8LvVi9FBljEix6kcgd/o2rQR7UMjRVbX86NR/5frH/B+RQnMOIeVAAFC1C1tfkxjm0pM
 N/juytQyF1fOgcpLwROY20Axskw4x0X9FW/F0TN56cGiGX8BzcTgH9KGVOFqiE4PTWb/Iq/XV74
 1qbaB7f5c/B0sMOITmxB+MCPKScKAbuviCVQPXaE2po5+tpX5UPlTuPhXPajaqi97N0NVcX6sgd
 m0tcNrvfjRIPysFyRrSDBbMdi3ES3HYxT7tKjj3K6lJY9mR2pLQp4QGkdEN128pvde/pDWFqh+N
 yODkxwWde/gcZukmtFykyj9I/kxgwkQDd110+SlLzNh3A==
X-Envelope-To: ath12k@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0d9d1dbd2876dfe1;
	Fri, 16 Oct 2026 03:03:09 +0000
X-Mizu-Trace-ID: 0d9d1dbd2876dfe1
X-Migadu-Flow: FLOW_OUT
Message-ID: <5f0ee2bd-1b2b-4745-a547-83708b977544@packett.cool>
Date: Fri, 16 Oct 2026 00:03:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] PCI/ASPM: Add pci_force_enable_link_state() API
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 ath11k@lists.infradead.org, ath10k@lists.infradead.org,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20261013163107.GA1522779@bhelgaas>
 <2517d322-9e5d-5b81-aa67-56705879be74@linux.intel.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <2517d322-9e5d-5b81-aa67-56705879be74@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_200314_548057_48727F6A 
X-CRM114-Status: GOOD (  18.31  )
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


On 10/13/26 2:42 PM, Ilpo Järvinen wrote:
> On Tue, 13 Oct 2026, Bjorn Helgaas wrote:
>> On Tue, Oct 13, 2026 at 02:41:32PM +0300, Ilpo Järvinen wrote:
>>> On Mon, 12 Oct 2026, Bjorn Helgaas wrote:
>>>> On Wed, Jul 08, 2026 at 04:30:16PM +0200, Manivannan Sadhasivam wrote:
>>>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>>>>
>>>>> pci_enable_link_state() and pci_enable_link_state_locked() APIs only enable
>>>>> the ASPM states that were not previously disabled via
>>>>> pci_disable_link_state*() API or blacklisted during init (e.g. the pre-1.1
>>>>> device blacklist, which is only meant to be overridden with
>>>>> 'pcie_aspm=force'). This is an intentional behavior as these APIs must not
>>>>> silently re-enable states that were deliberately disabled, since doing so
>>>>> could enable ASPM on a link where it is known to be unsafe.
>>>> I think this is saying that many uses of pci_disable_link_state() are
>>>> to avoid hardware errata, i.e., these are basically quirks, and we
>>>> should *never* enable those ASPM states.
>>>>
>>>>> However, some drivers (e.g. the atheros WLAN drivers) save the currently
>>>>> enabled ASPM states, disable all ASPM states before firmware download, and
>>>>> then try to restore exactly the states that were enabled before. Restoring
>>>>> those states requires re-enabling states that were just disabled via
>>>>> pci_disable_link_state() API. But, this cannot be achieved using the
>>>>> existing APIs.
>>>> This sounds like it's also for hardware errata: if ASPM works
>>>> correctly, there's no need to disable it during firmware download.  I
>>>> think this is *only* the atheros drivers, isn't it?  I didn't see any
>>>> others.
>>> There are more that should use disable/enable API. In addition ath*, I had
>>> also these in my unfinished series:
>>>
>>>    brcmfmac
>>>    ib-hfi1
>>>    rtlwifi
>>>    rtsx
>>>    r8169
> [..]
>>>> Instead of adding pci_force_enable_link_state(), I think we should add
>>>> a new interface for the *quirk* behavior that permanently disables
>>>> states.  Then pci_enable_link_state() and pci_disable_link_state()
>>>> could be made symmetric.
>>> My suggestion is to make the disables/enables counted per state which
>>> would allow parallel sources of disables to function without clashing.
>> By parallel sources, are you thinking of sysfs and driver calls?  If
>> locking would be sufficient I think that would end up being simpler.
>>
>> But maybe the issue is these devices where we think ASPM breakage only
>> happens in certain circumstances, e.g., firmware download, so we want
>> to keep states disabled for that period.  Then I guess locking inside
>> the enable/disable doesn't prevent sysfs from enabling those states
>> during that period.
> There are (at least) these sources:
>
> - quirks (disable only)
> - hw has ASPM related problem at certain phase of operation
> [..]

FWIW, one not-yet-merged user is this patch that disables ASPM around 
link retraining for bwctrl on host controllers that do require that:

https://lore.kernel.org/all/20260819-bwscale-v5-1-6dea79786b37@oss.qualcomm.com/

That particular version of the patch was already written assuming 
symmetric enable/disable and I hit that when testing it, so here's an 
example of the potential trouble :)


Naming suggestion: if it ends up being that counter thing, it should use 
the verb "inhibit", like idle inhibitors in userspace. Those are 
commonly understood to be counter-based ("as long as there's at least 
one inhibitor, the state is disabled") and temporary.

~val


