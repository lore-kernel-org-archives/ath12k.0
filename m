Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93982C87FCA
	for <ath12k@archiver.kernel.org>; Thu,  7 Aug 2025 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xio5y0lXCspCluJXgo9hDhsD3UsJmR4wlHE4U9B6BAU=; b=dkVEK3UnoAuWkRgczsUwWCdM/q
	4BJ4c8AgYtHIZnm/KZA3nexDYCHXX1D6S98I/m2nnVIbeqTKfDzf5Sz07GQIJOYFb0yh4dUlcQPn1
	bz7WdmAxBQcaoWF9IYmX9fw0CZKmhziHtdqx14hbvSClcAfllrM506ZkyPr53kFHgWqXQo8JV2UK8
	zYLZrBITHAlLfkhUJa3/z+n4IdRXSxB5RtADxuwgAQjts5ARo7Zuskd96hBwyW5tlEg0YyqIwrFyU
	pcP3EP+CmyrlpFiq4rQHpFPMfRXDgcCAXyVKk5Fg68jQhhvSHUofUZumzXgWBmD66hjc2+KnO5PrG
	Wt/6OPjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0q7-00000000iuz-0pMU;
	Thu, 07 Aug 2025 13:39:27 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0q4-00000000iub-2xq6
	for ath12k@lists.infradead.org;
	Thu, 07 Aug 2025 13:39:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so1008895f8f.1
        for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754573963; x=1755178763; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xio5y0lXCspCluJXgo9hDhsD3UsJmR4wlHE4U9B6BAU=;
        b=b6R4nVt9cgsa7+I4rM/SQzaPIZth6I9CRgjBI6512XQU46Nc2zVmv/F6A0TqLfOMv+
         qvDfI7O0cvry0iT9VThUGo+amR3HYF43whJQnBat8mWHcI9yvifmdYwsmqE2HGFb3oa6
         spHn/ecsLg/E68dLusre0stT5iK7e32urfUaGE3tvh1Vdi/urIISj12EYYlx718uukQ1
         FXn61psXfKDYOLg4UwX7DN0WygfM0LwEFhcdXZzfbyKln9nzmljFjpFqLBpZJdWjQw8x
         NEfCNY6xNHVgjboQI7MpnI8+lMrWnWPbZr9naH9L9tGLeDZ4Bv5uAfG0GMEOhvXaGfZV
         PRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754573963; x=1755178763;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xio5y0lXCspCluJXgo9hDhsD3UsJmR4wlHE4U9B6BAU=;
        b=QL+7pCKWgTZGbFpmEs1/MtfVIzCs6Gtuo1VLpOZqltbJBc2tU6WfMDdZaO1MxKZCek
         wus3in6NzWvyvKvUhThZwuBwh0dX7bsLJAL8tN53hVY/6SEWjysW17l4oozIOOydHD9/
         q3Rh1TUEJ2FgBBpxLZ+aNurMcnho+7Osu338Pz0zDZc+bCOVaH4slNfKdXACUWkfh/2S
         eWqmLh/64OT5hUzi0YUFWRWpr4IOxkpEEX1TSa9f86wSmcpZYREk5xhjzh3oC48prp5G
         aslh81I7nkZaUgASnVoSALqZq/DzkKJTxZvWo9KJBZ8vNsJUlqnTt2G66KDJifW/e8n8
         q9ug==
X-Gm-Message-State: AOJu0Yzv1VDzKyf3BkvW67hmV3nYhHg1UUa/XTVlt76jXjDMVi6xe82D
	cfp3vCqd84nHpUF6hof81H/kTl0/BGyr9GBlc+HfAuvRVOUoDaNYu+c8
X-Gm-Gg: ASbGnct4/xm4s18xInbTTKl3IRMsoFI/jMcV0aNvhGRJ+Hyr3R9zmxsMGYu5syn4FcX
	N4Hx87Owib9dcwUq6SMrEKJdYwNUPQ9k/vEg652bp2MZyBy2fhNpJjXddAa3QphPvbf0TimvkUs
	2FRNPlppfLWCdQQctvEzPSRWXlZnJ5TOa5xs60+mYwrIy5LWE42ajc1SRs6S0a6vJwIrd0VuJQw
	FVaKrdhSUBLX7WTzLLemf2tOnou3igbWwx3osquQUcLDLC+SL78h7Ioz4jBZvidWoqG3PHfMKGs
	jsvb0FpOH8MNJKymIS9WqKQ7QWZLMBP7mgxR/6ah6QTHcjcYij6c9iuC8Xuc0kUzuu0QzbLyTId
	pAU18YkentGG2pYdvnE2wcDBbUBuwZv0=
X-Google-Smtp-Source: AGHT+IFpqmsveJ+G5NUkHgXYl584B8zuFrATJyaI3aJYgC8hKZ91YmLJTJqksXB7fQTdVV/jjE6Bxw==
X-Received: by 2002:a05:6000:2287:b0:3b7:868d:435e with SMTP id ffacd0b85a97d-3b8f41ad8cbmr6078436f8f.41.1754573962864;
        Thu, 07 Aug 2025 06:39:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:0:2480:67b:cbff:fea5:a121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459dcb86d6asm149772725e9.5.2025.08.07.06.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 06:39:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 Aug 2025 15:39:21 +0200
Message-Id: <DBW8K6K30OQS.U5Z6UMSMEY7B@gmail.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-current 0/7] wifi: ath12k: Fix Issues in REO RX
 Queue Updates
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Nithyanantham Paramasivam" <nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com> <DBVM2YZDTS15.1WAPW69YQ5XOA@gmail.com> <CAD1Z1J+jXWng4ma9_BPJh4N8b7AhTvRKtJ=tg1dTyk8E3wqupA@mail.gmail.com>
In-Reply-To: <CAD1Z1J+jXWng4ma9_BPJh4N8b7AhTvRKtJ=tg1dTyk8E3wqupA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_063924_765378_3AE14FB5 
X-CRM114-Status: GOOD (  43.70  )
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

On Thu Aug 7, 2025 at 2:31 PM CEST, Nithyanantham Paramasivam wrote:
> On Thu, Aug 7, 2025 at 1:32=E2=80=AFAM Nicolas Escande <nico.escande@gmai=
l.com> wrote:
>>
>> On Wed Aug 6, 2025 at 1:17 PM CEST, Nithyanantham Paramasivam wrote:
>> > During stress test scenarios, when the REO command ring becomes full,
>> > the RX queue update command issued during peer deletion fails due to
>> > insufficient space. In response, the host performs a dma_unmap and
>> > frees the associated memory. However, the hardware still retains a
>> > reference to the same memory address. If the kernel later reallocates
>> > this address, unaware that the hardware is still using it, it can
>> > lead to memory corruption-since the host might access or modify
>> > memory that is still actively referenced by the hardware.
>> >
>> > Implement a retry mechanism for the HAL_REO_CMD_UPDATE_RX_QUEUE
>> > command during TID deletion to prevent memory corruption. Introduce
>> > a new list, reo_cmd_update_rx_queue_list, in the dp structure to
>> > track pending RX queue updates. Protect this list with
>> > reo_rxq_flush_lock, which also ensures synchronized access to
>> > reo_cmd_cache_flush_list. Defer memory release until hardware
>> > confirms the virtual address is no longer in use, avoiding immediate
>> > deallocation on command failure. Release memory for pending RX queue
>> > updates via ath12k_dp_rx_reo_cmd_list_cleanup() on system reset
>> > if hardware confirmation is not received.
>> >
>> > Additionally, increase DP_REO_CMD_RING_SIZE to 256 to reduce the
>> > likelihood of ring exhaustion. Use a 1KB cache flush command for
>> > QoS TID descriptors to improve efficiency.
>> >
>>
>> Hello,
>>
>> I'm not sure I fully understand so please correct where I'm wrong but fr=
om what
>> I got looking at the code:
>>   - you increase the ring size for reo cmd
>>   - you enable releasing multiple tid buffer at once
>>   - as soon as you allocate the tid you create an entry in the list flag=
ging it
>>     as active
>>   - when you need to clean up a tid
>>     - you mark it as inactive in the list, then
>>     - try to process the whole list by
>>       - sending the reo command to release it
>>       - if it succeed you release it and remove the entry from the list
>>   - on core exit, you re process the list
>>
>> What is bothering me with this is that when a vdev which has multiple st=
a goes
>> down, you will have a lot of those entries to push to the firmware at on=
ce:
>>
>>   - So increasing the ring size / being able to release multiple entries=
 at once
>>     in one reo cmd may or may not be enough to handle the burst. It seem=
s
>>     that increasing those is just band aids on the underlying problem bu=
t I
>>     understand it's just to be on the safe side.
>>   - If entries do not get send/accepted by the firmware, we will need to=
 wait
>>     for another station removal before retrying, which could be a wile.
>>   - Or in the worst case (one vdev going down and needing to release tid=
 of
>>     all its stations) the more entries we have in the list the less like=
ly we
>>     will be to be able to push the delete of all stations + the ones sti=
ll in
>>     queue
>>
>> So, on station removal, why not make just things completely async. Push =
the tid
>> deletes in a list and wake a workqueue that tries to push those to the f=
irmware.
>> If the ring is full, retry periodically.
>>
>> Thanks
>
> Hi Nicolas,
Hi
>
> Thanks for the detailed observations and suggestions.
>
> You're right in your understanding of the flow. To clarify further:
>
> When the host fails to obtain a buffer from the hardware to send a
> command=E2=80=94due to the REO command ring being full
> (ath12k_hal_reo_cmd_send returning -ENOBUFS)=E2=80=94we treat it as a com=
mand
> send failure and avoid deleting the corresponding entry immediately.
>
> This situation typically arises in the flow:
>
> ath12k_dp_rx_process_reo_cmd_update_rx_queue_list =E2=86=92
> ath12k_dp_rx_tid_delete_handler =E2=86=92 returns -ENOBUFS
>
> Given the command ring size is 256, and each peer generally has 16
> TIDs, each TID sends 2 commands (RXQ update and cache flush). So,
> deleting one peer involves up to 32 commands. This means we can delete
> up to 8 peers (8 =C3=97 32 =3D 256 commands) before hitting the ring limi=
t.
>
> From the 9th peer onward, we may encounter ring exhaustion. However,
> we handle retries in the REO command callback
> (ath12k_dp_rx_tid_del_func). If commands fail to send, they remain in
> the pending list and can be retried via the success callback of
> earlier commands.
That was the part I did not get, I thought it was just another peer removal=
 that
would cause the whole list of pending entries to be reprocessed and pushed =
to
the ring.
>
> Do we foresee any issue with this ?
>
Nope, it should work.
> Regarding your suggestion to make the deletion process fully
> asynchronous via a workqueue, that=E2=80=99s a valid point. Workqueue-bas=
ed
> handling is a good idea, but we need to account for potential delays
> if the worker thread isn=E2=80=99t scheduled promptly. We also need to
> consider timeout-based rescheduling, especially during command
> failures, to ensure retries happen in a timely manner. We=E2=80=99ll eval=
uate
> this suggestion further and get back to you.
>
IMHO it feels like it would simplify the code to just push + wake to a wq o=
n
delete, and reschedule if no space is available in the ring. The timing sho=
uld
not be such a big deal right ? The important part is to eventually push all=
 reo
commands to the firmware but it should not have impact on the rest of the
operation if it reaches the firmware later that sooner right ?

> Thanks again for the insightful feedback!
Thanks for all the explanations
>
> Best Regards,
> Nithy


