Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3FCC02182
	for <ath12k@archiver.kernel.org>; Tue, 21 Jan 2025 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBXuhRdSPlf7PvQC0JDuPAtpDLmpxAlN4/LRDL69rq0=; b=i4oqBkByRBPdhZLcbuIFvRJVRA
	zwxuKA5g+B5xXvTPRbyZmKqMxN/OE7vffQ2XyPOMn8MpIbMvTiry5QQbdgzeIZhlnbzX2tqt1SpKT
	k0FZ6m8LXGLJ+ribLh8jHl7Ln1/glI2f4yKldjhWVY1jGzNy7diyFgBE2K0LqfHhk1fy2QmHFOAEk
	Uzb7HaAVRqqf/1o8LviR2UPHNwQhhkThi4stQ4jvh4YENX4o9ZH7GROGEyDyASh59gM8L6j5RAADa
	zSTfYp8m7Ffo6ZdielCQw0GyKd49mPP+VhEtDV7ZqA18YdQ0QheqJoWRMH2pq4rxXn1eEtGQ7Ic1t
	Mz2XHQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAtI-00000007Sbo-2j0I
	for ath12k@archiver.kernel.org;
	Tue, 21 Jan 2025 09:49:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAtG-00000007SbJ-02ML
	for ath12k@lists.infradead.org;
	Tue, 21 Jan 2025 09:49:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43624b2d453so58918285e9.2
        for <ath12k@lists.infradead.org>; Tue, 21 Jan 2025 01:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737452984; x=1738057784; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBXuhRdSPlf7PvQC0JDuPAtpDLmpxAlN4/LRDL69rq0=;
        b=MK8mQp4etUT7fQoM7TYZsVxqFvAACqBOupLcLdrWYcJKbK5YQkRvr+3RsbvvjTPNPQ
         B+10wx09Xomkkbv9U9jhv36Q70azR70ABscyf51hxSKZ4uxdlFUUYOypVxn9zeAMXVsF
         KnTJ0/PeXwNJBslGqL1Q9+CG44CFesjd9SdDkSoyTDhg/52xzCHWcdOPafcDFyhJJNpL
         4k0N3tKRsoyCAtrM44+QI5T012akjkJiRIZoZUuyDZosBCBRqhcD2gDY21UP2RcLAU8p
         MWfXnCxtXMb0RmK+0FYJBgr8X5NGv4efoqqIvDgcDggxC9Zbr8X1YXEdtCBjU3cZKSIZ
         dYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737452984; x=1738057784;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sBXuhRdSPlf7PvQC0JDuPAtpDLmpxAlN4/LRDL69rq0=;
        b=dlyh0gYEZ7MHscoLfpf/HW6tyaF0S/o8KbZYpbXtftGUGF1RIt8qOjOybJXiSYBFig
         YsfMeQ9c36Gg9RBQggZRViQ2sB8cjx6KFlrBmthQdanLu+9JTegPcvGPnr90EuYEaK9C
         qYbO5NtZz/UAs3NzbB2zmP2x3qq7fCHTsfY/Xbo0r3l5ZBUEr2HZkpNHGFv3Cg/kZO6W
         tDXE7wNRNUFs37nHaL0itWZNWiQrXja3Moowqk0c5tqoQURBF4tFAhyq0ai+aILIdOwu
         PfGrxa0YvpX3GIBqUAoGDmUEEKQMUFysNsi/R0dAi4i44d3rK+UBu/rK2iVFlfmBFchD
         jD7A==
X-Forwarded-Encrypted: i=1; AJvYcCWjT4YY76CDT2meWQO42zWZB3fRm/NitcND/B2Qk/R3W2FYMhEnHusCCdxQfUJ30suWT8kCsR0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2VSFftYVarGm4+nX9WRuDNRbrKPXnCorDv0Hm746iPiu5UI80
	kIkbUVjzXMRvEW+MEcNy0S1buq+CqHJPls1EbHe8UdGDVMzhbcn1
X-Gm-Gg: ASbGncv0+9Hla3RfLU8Rn/iaFPTjW9q3bpHmEV3TqZdgn+Xgldg1fSp3utvskeEea1J
	z3aAPnDLeQKFnV0bO88yAgywaL1EPz/z4Tpag4zqvv+c34bCCtzoDWv2N0F2b9S11BrSj2kwIxv
	QMh5WvUi96f0xicL8SKupuyg/0TEk1bIbUpUfkb31ADZg3gw98ZtG9a3zlODXWpNJYYqcx8Jxbc
	Dk4LNKLTGClKqXp3EAdyZdly+U65EU/lXKal1HhPiyl5OSNOflaAVeX5Kp4Ztdt966Dza+H2yta
	EQuQdKTmo1rF
X-Google-Smtp-Source: AGHT+IHjVO2YcO1lMm3WQKO/pANMJVm8K7b6sxC3hG1wGqRw4v2S5uJdUOnL3mMjC9UjqV6dfEu+uA==
X-Received: by 2002:a05:6000:4011:b0:38a:4184:152a with SMTP id ffacd0b85a97d-38bf5669eb5mr17144073f8f.28.1737452984186;
        Tue, 21 Jan 2025 01:49:44 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32755cesm12798584f8f.78.2025.01.21.01.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 01:49:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jan 2025 10:49:43 +0100
Message-Id: <D77NOHOZIN4B.E43G3MAUD8JH@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>,
 <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>, "P Praneesh"
 <quic_ppranees@quicinc.com>
Subject: Re: [PATCH 7/7] wifi: ath12k: add monitor interface support on
 QCN9274
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250107021017.3857555-1-quic_periyasa@quicinc.com>
 <20250107021017.3857555-8-quic_periyasa@quicinc.com>
 <D74BE3ES4HZC.GJJ2MY3UH462@gmail.com>
 <e713770a-2032-f007-f828-d24935b042e2@quicinc.com>
 <D74DNZH2FACA.1EWK96IOHSY6I@gmail.com>
 <8d81dd30-587c-89bd-56ec-2a86ec7accd7@quicinc.com>
In-Reply-To: <8d81dd30-587c-89bd-56ec-2a86ec7accd7@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_014946_047716_90A0B6D1 
X-CRM114-Status: GOOD (  10.53  )
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

On Tue Jan 21, 2025 at 10:12 AM CET, Karthikeyan Periyasamy wrote:
> On 1/17/2025 6:50 PM, Nicolas Escande wrote:
[...]
>> I'm not too familiar with the driver but clearly this is the part that b=
reaks
>> sta info update when running a monitor while an ap is running.
>>=20
>> And as this is a valid interface combination it should work right ?
>>=20
>> So this change works around the problem I reported earlier, I just confi=
rmed it
>> on my setup. But maybe this is not the right fix indeed but hopefully it
>> points towards the culprit.
>>=20
>
> Addressed in the next version of the patch.

Yes thank you for that. Everything is working fine now.

