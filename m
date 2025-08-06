Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8A3C87FDA
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 21:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwHQj2S4iE5W8V5r1sARLF//FzzcxejJevd8ib6r6Bk=; b=KxxvZ39f8U9blXWRf/06NfviaJ
	2T72GtVqdoBkSeH7gbXD89pwq0rhfKL7b2dBjDIvRU5NRM8EGNayIQbhAayXIPA24JEjaECcMZsGJ
	d1RZEZKn0mGlTAFr8DuipBhZ3tn7SV8gj5FhKYUqOq6t8Jy1RtV4iLtakIne2ZEOf9CPMHUP5ytuA
	/I0X5xsZwIDarix02sY9xxMp2cLLmPexTe5s00B+UzPZQ+s8e8bnm/mDNl6wfdk7HKcdwtzY9SkcX
	ZfMruA/RbaGEgTMEl9O7RTW1MHNTjxAROKEcGcVg8Db617xhUmDhAyJH35a5FefSwINwT6YSGR7gJ
	SkUvhC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujm8k-0000000Geq0-1Gac;
	Wed, 06 Aug 2025 21:57:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkLH-0000000GIhH-3Yhv
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 20:02:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-458b2d9dba5so2121275e9.1
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 13:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754510550; x=1755115350; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwHQj2S4iE5W8V5r1sARLF//FzzcxejJevd8ib6r6Bk=;
        b=hEIb+WcZAjntw0c4M36SUnxRfajsmEisSEDDBkTuzzc1JXu+aaIIrELYlC+/nS2rsx
         XAyfp+5j0mZj75WxUCABYpzpjGZFOiLHxMNNmPeCIjwd4dyKuNTTwKSC2O0/OpbczWpP
         FAv43/5MInNISB1CciJu9glhhxxOjtqfF1GpP7rp4E3mr+a9DhuLbY5SwlTv8E30nDpE
         CnScIEr4XodSFdClee4jVDn53XjUC7TSxhvQtO3xlkYvm289yns+usmsPlriWSOMC4cF
         Vhq5IgPXW2qkL4Mq/rIpbLlcCR3icpeIjYooILfvcTTXYyg+55PuC6rnQY7+S+FPY/E3
         HOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510550; x=1755115350;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QwHQj2S4iE5W8V5r1sARLF//FzzcxejJevd8ib6r6Bk=;
        b=khH7Y4MCSyE/4QlgCb6YLN4PAa+rp+baNf5aKGNAnfNHGwgJKUbKjoPEllanQe8uK4
         Qj47qFskU4BUzIOP9ew2qWADpEAJRsj60uNBGNUi6fv8ZMbMf5/WZ43s0qkA9Ou7RyTA
         zI4df09QZELAtz5qjp/FSk2OHqMf3zwAkzaawQv4QkDMkmrYe/GLBjnv7KBO4Rtwsw5n
         aCHXqyNBiCBHjsky3gWSkJkBbROxTbDG5M6tEw5D7Yk846nlVw4qa5QIMQcpiSFpa0GR
         xroNR8ymBy2wSfSUePC5cBn5L9mpBh7woM4q1I7TWjrW/0+Nb9oU5NKoeHZYnQ90rPtU
         1R+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDl9EYTNtCwXxkJNs3dWrXFJmyhahJs+s4yagQppMhg2ecvoFCYN8crl7gb7X+5//xGvcz87o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3KPDy42zAIuPa9HZRGShPOsFBqLxDybKjGXFU32n/P+9tHGgP
	2XpbhxRYta2P9YtoZVl29MMQDzY3jr0NDA5i4iqYAGM8ZBziYjc+rA6e
X-Gm-Gg: ASbGncuMQVZOj+zHC0rg8hBxLDmo9vaNCeLdr69ltaoLHDGrUvNuv0ohl2tSrrRBDFw
	0Qakdk7LyEwo5LeqbsgKuzupbqmE4iElDTwLQicXCK1vGPeFIq30HAgrTjgMrlZVDqdjg330dK7
	Bjv1UH5kFt+mrpNSpPPRjpVSfbqOhf/XUSLkfzxWu8ORozkKfElqlXbc/j7BhX1sBDhbxyy4o0v
	n4ExU3TS4t2xNcIEKowRTD6WNbHqEhqJEEbOn/niQ3lu1B80TMsIrv0f/z7W3Rdv6+tGjZU8Evu
	4FCgWZpI2AHW3nnCBh3CDYNv5RW0dpq8DzVc33C6BLLNhdaAsVWJNefOuoe6XuG4cT8BGwLekql
	fyzYMmWhZ0voXOR7kKA7qxCjWUm7nxNPpQQr2iRnV
X-Google-Smtp-Source: AGHT+IHtL9F719IgiXDejNDTx8YGjo5svHsCY0ACzaMi+/cqLe1D3DEUC4gd6a7hIVYKxpfLhuyzCg==
X-Received: by 2002:a05:600c:4f4c:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-459e95af955mr26598505e9.21.1754510549796;
        Wed, 06 Aug 2025 13:02:29 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459ee17535bsm7889325e9.16.2025.08.06.13.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 13:02:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Aug 2025 22:02:28 +0200
Message-Id: <DBVM2YZDTS15.1WAPW69YQ5XOA@gmail.com>
To: "Nithyanantham Paramasivam"
 <nithyanantham.paramasivam@oss.qualcomm.com>, <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-current 0/7] wifi: ath12k: Fix Issues in REO RX
 Queue Updates
From: "Nicolas Escande" <nico.escande@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
In-Reply-To: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_130231_886279_4FFA00F2 
X-CRM114-Status: GOOD (  24.25  )
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

On Wed Aug 6, 2025 at 1:17 PM CEST, Nithyanantham Paramasivam wrote:
> During stress test scenarios, when the REO command ring becomes full,
> the RX queue update command issued during peer deletion fails due to
> insufficient space. In response, the host performs a dma_unmap and
> frees the associated memory. However, the hardware still retains a
> reference to the same memory address. If the kernel later reallocates
> this address, unaware that the hardware is still using it, it can
> lead to memory corruption-since the host might access or modify
> memory that is still actively referenced by the hardware.
>
> Implement a retry mechanism for the HAL_REO_CMD_UPDATE_RX_QUEUE
> command during TID deletion to prevent memory corruption. Introduce
> a new list, reo_cmd_update_rx_queue_list, in the dp structure to
> track pending RX queue updates. Protect this list with
> reo_rxq_flush_lock, which also ensures synchronized access to
> reo_cmd_cache_flush_list. Defer memory release until hardware
> confirms the virtual address is no longer in use, avoiding immediate
> deallocation on command failure. Release memory for pending RX queue
> updates via ath12k_dp_rx_reo_cmd_list_cleanup() on system reset
> if hardware confirmation is not received.
>
> Additionally, increase DP_REO_CMD_RING_SIZE to 256 to reduce the
> likelihood of ring exhaustion. Use a 1KB cache flush command for
> QoS TID descriptors to improve efficiency.
>

Hello,

I'm not sure I fully understand so please correct where I'm wrong but from =
what
I got looking at the code:
  - you increase the ring size for reo cmd
  - you enable releasing multiple tid buffer at once
  - as soon as you allocate the tid you create an entry in the list flaggin=
g it
    as active
  - when you need to clean up a tid
    - you mark it as inactive in the list, then
    - try to process the whole list by
      - sending the reo command to release it
      - if it succeed you release it and remove the entry from the list
  - on core exit, you re process the list

What is bothering me with this is that when a vdev which has multiple sta g=
oes
down, you will have a lot of those entries to push to the firmware at once:

  - So increasing the ring size / being able to release multiple entries at=
 once
    in one reo cmd may or may not be enough to handle the burst. It seems
    that increasing those is just band aids on the underlying problem but I
    understand it's just to be on the safe side.
  - If entries do not get send/accepted by the firmware, we will need to wa=
it
    for another station removal before retrying, which could be a wile.
  - Or in the worst case (one vdev going down and needing to release tid of
    all its stations) the more entries we have in the list the less likely =
we
    will be to be able to push the delete of all stations + the ones still =
in
    queue

So, on station removal, why not make just things completely async. Push the=
 tid
deletes in a list and wake a workqueue that tries to push those to the firm=
ware.
If the ring is full, retry periodically.

Thanks

