Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0199BC54791
	for <ath12k@archiver.kernel.org>; Wed, 13 Mar 2024 19:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9BIhdFsSeXM2bYHGsp/3rh0lF2hEZKMymreY4sLWlo=; b=kCPet5alR1aDW0EsFLJqau5gen
	eVq2v+OSFpygSzSbtFsefsghrOZKRQXl3cEN4up8unHPziTRsmSMtUBL8iETYjDLjfvwXRvIiRYMo
	fK1ebpw+i8r6uSuZ/SH1MVIR60p+maBUJ96/YKbVVfJSerNFT0up4fJm//FmCWThIgDxkxwJucPva
	vLp/niKIjspJVFBTHwL9F5wYYxIQKLMCbCiq1V9nNas09xDEQN14XlkA4uVcungs7UnSJqfbM731B
	5S94YK/yq+W50aK8VrKryICU9TGCNzBjwJ6M3kzJFP8ktp9YLtITd0vSQFnLj1aRYr3yHQjjerDn9
	FVV8+lHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkUio-0000000Bj3R-2H4Q
	for ath12k@archiver.kernel.org;
	Wed, 13 Mar 2024 19:57:06 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkUil-0000000Bj18-19tz
	for ath12k@lists.infradead.org;
	Wed, 13 Mar 2024 19:57:04 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1dc09556599so1648925ad.1
        for <ath12k@lists.infradead.org>; Wed, 13 Mar 2024 12:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710359820; x=1710964620; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R9BIhdFsSeXM2bYHGsp/3rh0lF2hEZKMymreY4sLWlo=;
        b=b5Y7LmLa95kee+sxNQSMn1t5/9okPKoEniFN7UwZY92ckGVwXMdDav0SJYFmz+7tG6
         rxWAeYvmdhPmKgIaT7Vrpz9FGshtEPBLtX5oycliTM5ejJkPiNg+BUdlJMun4qOlrn1S
         Ocb7NhU12fQvtutPB7F1ZcK2bgYJBBqQ8pq3fRz2LsvXflpIPm33R21NdN//9eyhANJr
         uGJTGXvFeP1zumGmSqOQ3HQa4QlC+cBsTbAs+oo44RmydOEibCAfMTH9+mP9ZgwY/xd7
         P4Q5wICuPhTnIuNcoBWrVgPUcO6mxhJ4hEW6hHR+q0OwXWN5t/glMzsoT40vJBObic4a
         wwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710359820; x=1710964620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9BIhdFsSeXM2bYHGsp/3rh0lF2hEZKMymreY4sLWlo=;
        b=FU4B1n3Q7Q8fxwi09BJ2K3Lgnb1rcGNuV/6fYGkefBRz71E2TlfQziQ6veLRXc6Oy8
         bdKzlNieJ2CLZ8syexyL6z3dcJ8PN+TrNov1MhRy0QFLyBCiDbIuIIOEMITWfF1T5afZ
         cgnlFbRflM9zLW5g7xmLHzAXn14gWc+DqHTfkmF8MZcxVDF2UQz8SqTAqApQvlAJtI4f
         zaaGx8RbEuTsKtwO/R069YF+R3RYnnzIfncuIQk9zUCmHkp1NxiLhsX7h7hjnxaJz7A6
         kIoqC9C7iJARm/4cmE1Gqx4Ekz2V5UdQAAnQRuJrNgiDweAasnecHO83vQLjhscpD+pl
         4eIA==
X-Forwarded-Encrypted: i=1; AJvYcCWn7IYjElaU1bYXj0PFC203FyUanmUmzaUupwoe30Vh6kmsISdnSx0JmUzhVNTTsJ6nmGGAVRS2zk5VkRHwWrfP5f+FmdFPneGVmw==
X-Gm-Message-State: AOJu0Yy4cSNbsxUiSYYvjYTsngGTYoTOso7YrAjC7vnW0q2fnl8YDaQB
	nPTAsBOu81Y6yW/EklN6yVfHVcUmlKgEJ6KBQda1Yz0vjh9aDg09VSRlgL9mHAIvkt9c7Jgig8P
	lK/PKDBlaqnGW8WKXxMjz3G4fG3U=
X-Google-Smtp-Source: AGHT+IFUUPriNOMvJrZ6Q7KL/xrBdzmS+LtrePmywwgC1cnLtzpniigum4VgCQ9MmbFI2QbBR5EUQk2jz+MYOHadsqE=
X-Received: by 2002:a17:902:7403:b0:1dd:e34:d820 with SMTP id
 g3-20020a170902740300b001dd0e34d820mr15001228pll.28.1710359820091; Wed, 13
 Mar 2024 12:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
 <20240312135557.1778379-2-quic_ramess@quicinc.com> <4a527729-2bf8-47ce-8275-d36b76bde95c@quicinc.com>
 <3178cf8c-d328-4fe2-b3be-f5c4c908f20f@quicinc.com> <605a673e-3686-47d0-b71b-1e314fde65db@quicinc.com>
 <87il1qf571.fsf@kernel.org> <87edcef4qi.fsf@kernel.org> <f768cfec-d20d-424d-85ef-3576434aca12@quicinc.com>
In-Reply-To: <f768cfec-d20d-424d-85ef-3576434aca12@quicinc.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 13 Mar 2024 20:56:48 +0100
Message-ID: <CAOiHx=kx03MKKyMcJPxYPZH=E7krZwfsDqq2xnow8qRB7D-aqQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] wifi: ath12k: add multiple radio support in a
 single MAC HW un/register
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Rameshkumar Sundaram <quic_ramess@quicinc.com>, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_125703_343613_6B162D54 
X-CRM114-Status: GOOD (  24.19  )
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

On Wed, 13 Mar 2024 at 20:18, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> On 3/13/2024 9:58 AM, Kalle Valo wrote:
> > Kalle Valo <kvalo@kernel.org> writes:
> >
> >> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> >>
> >>> On 3/13/2024 5:57 AM, Rameshkumar Sundaram wrote:
> >>>> On 3/13/2024 3:23 AM, Jeff Johnson wrote:
> >>>>> and guess we have to figure out how to suppress the ath12k-check issues with
> >>>>> this macro
> >>>> ath12k-check complains about the reuse of ah and index arguments which
> >>>> may get evaluated multiple times if its an arithmetic expression, But
> >>>> areas where we use the macro in our code aren't doing so.
> >>>> Do you have any suggestions here ? or shall we go back and use this
> >>>> for-loop inline.
> >>>
> >>> The macro makes sense -- we'll need to update the overrides in ath12k-check.
> >>
> >> IIRC it is possible to avoid variable reuse in macros with typeof()
> >> operator (or something like that). I can't remember the details right
> >> now but I think there are examples in the kernel code.
> >
> > Here's the GCC documentation with an example:
> >
> > https://gcc.gnu.org/onlinedocs/gcc/Typeof.html
> >
>
> the problem here is that the macro actually writes to those arguments multiple
> times, so we actually need to reuse the arguments
>
> the macro as defined exactly matches the semantics of other for_each macros in
> the kernel, i.e. see in include/linux/list.h:
> #define list_for_each(pos, head) \
>         for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)
>
> what I don't understand is why list_for_each() doesn't trigger the same
> checkpatch issues. even stranger is that if I copy that macro into ath12k then
> I do see the same checkpatch issues:
> CHECK: Macro argument reuse 'pos' - possible side-effects?
> #998: FILE: drivers/net/wireless/ath/ath12k/core.h:998:
> +#define list_for_each(pos, head) \
> +       for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)
>
> CHECK: Macro argument reuse 'head' - possible side-effects?
> #998: FILE: drivers/net/wireless/ath/ath12k/core.h:998:
> +#define list_for_each(pos, head) \
> +       for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)
>
> So I'm really confused since I don't see anything in checkpatch.pl that would
> cause the behavior to change between macros in include/linux/list.h vs macros
> in drivers/net/wireless/ath/ath12k/core.h

The definition of the macro causes the complaint, not the usage of it.
If you run checkpatch.pl on include/linux/list.h, you'll get the same
output:

$ ./scripts/checkpatch.pl --strict --file include/linux/list.h
...
CHECK: Macro argument reuse 'pos' - possible side-effects?
#686: FILE: include/linux/list.h:686:
+#define list_for_each(pos, head) \
+ for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)

CHECK: Macro argument reuse 'head' - possible side-effects?
#686: FILE: include/linux/list.h:686:
+#define list_for_each(pos, head) \
+ for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)
...

Best Regards,
Jonas

