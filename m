Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F3CC77B7C
	for <ath12k@archiver.kernel.org>; Tue,  9 May 2023 05:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qf+QN+HEqgfqbXIOf5aLnNBQnLO3H5ox4Azj1NKgVW4=; b=rlhGtiDKb3nqvZ
	wfneV2P8cwjVsF+FsuQqHQ/yKx/qFDbJM/PcSMNWQ1GIH8+yR4OliaieVfixrKAOvoCSs6EjKqTUf
	FqfPSqJp3tdYFFJQWqONkoSlscq1Q2FQUdp+VgZxAZeDCGvPcoSHzfBC5WBX7fuJA7ZtXeFqOXymN
	1QAlrGMNXUwkXXbnGnjxJ/NZo92+rsGfZkvZrPSYv6fT6wehREgkiTL8Vk4A4v1hsw1YAclgGZsPh
	n/+Gt3RV/zFwHC9uSvWI870Uzys8rQwaDDgLLtXqoUJgdE5uvFE86X7zQXplDUMFzRQsshW8FiI66
	yMCyvw50shLEDspjJndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwFvl-002KfN-2Y
	for ath12k@archiver.kernel.org;
	Tue, 09 May 2023 05:30:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwFvj-002Kel-0e
	for ath12k@lists.infradead.org;
	Tue, 09 May 2023 05:30:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AED5763145;
	Tue,  9 May 2023 05:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59091C433EF;
	Tue,  9 May 2023 05:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683610230;
	bh=tfK56c7AYEPmr0e77RaY2s4xdbpEAsF0d7sMOIndBZo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bJmmN1zvlYTH3Rp9Ked3zBrBDB/9mp0ht2SH4fipxUgUDmOh0Z5CDAg7NdMzQ5ro8
	 9E9ToLIX+T4+6Khk+GlSGaE5DeBDtdOkwaLWwPL8XXDgFq71fA7PvE3wKEHmyvOB7w
	 aeiD/729P3vYw9bgZIKUP+5cIoqeN9n019pR2Fa1O/0gVYIU/RaVmZnZiUQDrxgZ9M
	 vNyKy/f2L7+jnSbY/jyscOPsVJJQ9IlCIrgIsR1nZdfJpkmjOt3EAlpz06AZ3cNzms
	 vcuqbL5eOo8F91F09vlvmsHUIS4oA5GGDoumNryw+VYTZ9eOqtLRls1tQzxVbS60YX
	 LdSJeGUq8ypMw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: Use msdu_end to check MCBC
References: <20230427013021.29792-1-quic_bqiang@quicinc.com>
	<87zg6rqnhv.fsf@kernel.org>
	<b0321483-ae4e-c44f-ed41-4a83e8693f09@quicinc.com>
Date: Tue, 09 May 2023 08:30:23 +0300
In-Reply-To: <b0321483-ae4e-c44f-ed41-4a83e8693f09@quicinc.com> (Baochen
	Qiang's message of "Tue, 9 May 2023 11:42:43 +0800")
Message-ID: <87ednqnkb4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_223031_286172_D40FC5BE 
X-CRM114-Status: GOOD (  12.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 4/29/2023 1:13 PM, Kalle Valo wrote:
>
>> New warnings:
>>
>> drivers/net/wireless/ath/ath12k/hal.c:892:16: warning: cast to restricted __le32
>> drivers/net/wireless/ath/ath12k/hal.c:892:16: warning: cast from restricted __le16
>>
>> Please remember always run ath12k-check (with sparse installed).
>
> Hi Kalle,
>
> I have sent v2 where I change __le32_to_cpu to __le16_to_cpu which
> should fix this warning.
>
> But I can not find ath12k-check, where is this tool? Could you help
> point out?

It's here:

https://github.com/qca/qca-swiss-army-knife/tree/master/tools/scripts/ath12k

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
