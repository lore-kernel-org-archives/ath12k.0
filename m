Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CFFC52D70
	for <ath12k@archiver.kernel.org>; Tue,  6 Aug 2024 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e043eLSePT+35kCuaDKpz3OjGOekjHIFyV1BdxQkTng=; b=edtRl6YvCoZooe1rZS1makYLzu
	ErfQLCmjY11Uoa3Py/jTPh9BEFzpptBs40S9xDkuBIgsbWNTzVEOh72lzv9Qxt5LX1yf9fAtVqeVz
	8PLvY4aSvVw5764N/cNYkrOlV/3DFDVgv1QEXXBxHAd9cRueo7JmgD/PHntuFTk8pjn8MlF0+q7l9
	m4eciJ+043wWEQQd8glm0fgQyPAYNBB9CLzPQJQzmaYVnaA4jbr836znR+8pFsbGbrVXzuRMQ5OrW
	vYXZqToA+c70zDtX5lCYtpgjfnCw9rYwpxz/gZnRXPVFi7yyrZ+/rIWkYYVPYinBePiEaMdW61Vu/
	bhlGCVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbN72-00000002MLN-1YWj
	for ath12k@archiver.kernel.org;
	Tue, 06 Aug 2024 16:32:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbN6x-00000002MIM-2hox
	for ath12k@lists.infradead.org;
	Tue, 06 Aug 2024 16:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E95C061034;
	Tue,  6 Aug 2024 16:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E954C4AF0D;
	Tue,  6 Aug 2024 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722961954;
	bh=ThAnpjMgWYwVRIgApNu4yXNd2bSsni8iuQB3jx3mIxM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=DRpd6JFKQxkp/BXAMVELbvuMS63Po9Mby//cv2/k1LYb714RXVUrGOVi/ngkFboS2
	 Ly/4x0AZKe96FNSblNBO+CPi+A+cw+aYy/M0ytS5f+sL/tP4zgn8nRI37hgYcRUGtz
	 fMRsbmg2S8Zw2FIfsPHRnaGx0s58cyvkaGB6nqCcxMpIsj6T1sPIZfLANEXFDL54iM
	 n2hRTSDl+0x9ghalbfWbnHDtRvZP4rc7wYA/tvEEP3ENnAc+hOjUvGAMahhSe6sL2B
	 FP4pWHeKgsdrIUgGhBTWoIRwneo5kjAo68SQ9hpx/BJLwUa15LGaLJgEXLLEZH63C0
	 lss0N0qqO+sGQ==
From: Kalle Valo <kvalo@kernel.org>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Sriram
 R <quic_srirrama@quicinc.com>
Subject: Re: [PATCH v6 1/3] wifi: ath12k: prepare vif data structure for MLO
 handling
References: <20240711165511.3100433-1-quic_ramess@quicinc.com>
	<20240711165511.3100433-2-quic_ramess@quicinc.com>
	<87plql6djk.fsf@kernel.org>
	<1510a11a-c31c-4a05-80c0-bffa81fa340a@quicinc.com>
Date: Tue, 06 Aug 2024 19:32:31 +0300
In-Reply-To: <1510a11a-c31c-4a05-80c0-bffa81fa340a@quicinc.com> (Aditya Kumar
	Singh's message of "Tue, 6 Aug 2024 21:32:14 +0530")
Message-ID: <875xsd628w.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_093235_839933_1C41A47C 
X-CRM114-Status: GOOD (  13.18  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> writes:

> On 8/6/24 17:58, Kalle Valo wrote:
>
>> Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:
>> 
>>> From: Sriram R <quic_srirrama@quicinc.com>
>>>
>>> To prepare the driver for MLO support, split the driver vif
>>> data structure to scale for multiple links. This requires changing
>>> the use of arvif to per link and not per hw which can now
>>> comprise of multiple links.
>>> Also since most configurations from mac80211 are done per link, do refactoring
>>> of the driver functions to apply these configurations at link level.
>> Something I noticed while reviewing this patchset:
>> 
>>>   static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
>>>   				       struct ieee80211_vif *vif)
>>>   {
>>> -	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
>>> +	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>>> +	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
>>> +	struct ath12k_link_vif *arvif;
>>>   	int i;
>>>   -	memset(arvif, 0, sizeof(*arvif));
>>> +	mutex_lock(&ah->conf_mutex);
>>> +	memset(ahvif, 0, sizeof(*ahvif));
>> Here we are we clearing ahvif so ahvif->deflink is NULL.
>
> deflink is not a pointer member. It is statically defined inside
> ahvif. So basically this memsets the whole deflink memory region to 0.
>> 
>>> -	arvif->vif = vif;
>>> +	ahvif->ah = ah;
>>> +	ahvif->vif = vif;
>>> +	arvif = &ahvif->deflink;
>> So here we assign arvif to NULL.
>
> This would be a still valid pointer.
>> 
>>> +	arvif->ahvif = ahvif;
>> And because arvif is NULL this is a null pointer reference, right?
>> Or am
>> I missing something?
>
> So since it is valid pointer, this is not a NULL pointer de-reference.

Ah, of course. Clearly my vacation was too good and I forgot C :) Thanks!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

