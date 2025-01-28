Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56488C0218A
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 15:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3i0cNBwpceh1IScb1q0q5cjagdTOOAVxRkSUFaKaQo=; b=h6dNEB3JGe/5uz1yshxno0UEJW
	d4nEXbTeKB8GwWMlAC/DigPAhfYIz5Gppes9OJY7yN9jmdQ5vpO2YxOyvZY88MF3+wmGmXOinZG0I
	9jO4yU7O9Z9QQ1ut4HsrC9ZWtkqbnJ7jlVOCNEetcZSd/6Kh2UrY8VyO52YROHYSHE+bY2zUAcw5+
	J7vYY6IKQA/p4C89d5V9FTnX9inSSERGgdz/Nono3xhizWgWSCEDdiI3lB5BvZpVSspC55GIc9e3O
	mUncbLxuoCDN6VStc4HanCHNjoKJwjFOME8LilqT/ylTMWN1R6uj/Q2GRc5JHciTzSB7nu2lL8vge
	mBqgFIOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnaV-000000059Vc-0VlA
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 15:33:15 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnaT-000000059V9-1Jsy;
	Tue, 28 Jan 2025 15:33:14 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3eba559611aso1579823b6e.0;
        Tue, 28 Jan 2025 07:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738078391; x=1738683191; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3i0cNBwpceh1IScb1q0q5cjagdTOOAVxRkSUFaKaQo=;
        b=l7Nmca7x7SoBCXRqPrToWUbZZei90ubW0wDL7wUfi4MNB2rFlgq0yPXUoBl0j8C13L
         H+ZfybjyEYHHxGIfMOrgvVcAWJsoKIg694v1nXMT8ixvXDU++ur4dGG7akDnDwkv2uVb
         WgcM0D8AhuZVw/WjDsTnG/ju0KQqUOty5PkJo6c+POtfocC65jp7WGNwa3ysvP5+X1mX
         55p634gBS8rvcXVr/nSda6uFT8edKp4A/Rypt0QbMKF84w9DtA8mEpVeln5/xIVSB7zj
         kcYX9hbAPzhIOa/FnUk1ZQys0iGIIsRFyUH/vorV+hmdq3ex5HznCOIK4nbSMEpq10we
         ORLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738078391; x=1738683191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3i0cNBwpceh1IScb1q0q5cjagdTOOAVxRkSUFaKaQo=;
        b=RjqpTC/AzHdQRPuFU1zHdKsy59MGWc4c0JR6DFuHlF9xGioynhYi+fB8FaAZV+g81f
         vIvY0o+JubF/wAZqEXega09LAO90YYxiObGRu/Q6yCbEzHByZ1Nlq1z2RWbjNVHE7ltU
         SGkgHrY68rTF51CrCITAr4zZjLND+MBMceSc5dEiHNnegkrFpiLuKHp3/qj0INAf6mtR
         0N/+YKRGwL/5Vo9L7/C2Q7GM/O7NCpB6u2TJYp+px8hZkP3wzAcWBcHpt2gaRsgl6pZm
         KvWrh3m4qnNyUQRIg0iQRd59qeAdN8doAgjWHCy9BkeFpBLpuEYeqSU1cc+1N2lu4yXG
         BW9w==
X-Forwarded-Encrypted: i=1; AJvYcCVaRjfvMFIZKH6/6E2D6LBPuM5nIm8z0JMR8BDnek2OJd/IZj3cDLEB2KDayHzZoxWOAl2zAMdN@lists.infradead.org, AJvYcCWFGhEGy7EKtKR5GmM9SGr8PS0jIB7UPB++OIao38nTZDGS+/GL26FFwcdGjyz+b/GjGcMi454=@lists.infradead.org, AJvYcCWWjf3VVxP1HyfR49I+n6GQj5rfnGTZ8DAO18R/3lZdYHnXfNEFJr3vS1wUUqbhpDMFq8ZfzE70@lists.infradead.org
X-Gm-Message-State: AOJu0Ywon9tBg3JYX+PKvKlZolU3eTgt+tQ03d+cr1gf0xI7AQH3uzpf
	9HB9bF6ovL4yet6tDZ6E6X/LmZW2MIjMFNq6iH+ErgLG1bB6s+/Cqsqb/uE3J62D+6uzg40nTha
	k0CxAcHWEG48zqhC4TkYPDoEoZ/Y=
X-Gm-Gg: ASbGncsIgdTtLCDr66iS6O8EJmiVtm4CkH/uCXvxa2dxYoPBQVHQ9Z1/aQ7KisGwk0k
	M594z+b11amPG5S5ffX0c872aPWXHKth12Y4EJwcoE7OJKI5ZOOLcZOxLmprcZ/ye8jdNVRkBZJ
	S3oQ6gIJdWsisnwdzleCJ43pNQN83fiw==
X-Google-Smtp-Source: AGHT+IFVgUHgBoQ+P1RHpThk6E7tuYE2c27FpSojYlMmoJXQ9+b1GOH73A4mh7zQsm6lyLw50vEzJQhYrxAYXKrTNO0=
X-Received: by 2002:a05:6871:a4c7:b0:29e:6547:bffa with SMTP id
 586e51a60fabf-2b1c0ac9ac3mr24384623fac.21.1738078390683; Tue, 28 Jan 2025
 07:33:10 -0800 (PST)
MIME-Version: 1.0
References: <87wmefguqt.fsf@kernel.org> <e64c416a975d8fcc4e245db78f31b0daef358e89.camel@tuxdriver.com>
In-Reply-To: <e64c416a975d8fcc4e245db78f31b0daef358e89.camel@tuxdriver.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Tue, 28 Jan 2025 07:32:58 -0800
X-Gm-Features: AWEUYZk8T3Rc6w2pDYe87v7mGJwmiOTftIhyMvPxPpZ53niVOGUcaBFs4HcjLik
Message-ID: <CAA93jw7wA2SAnBYfWBVHJQPA_T5+TOQ=vpr+rC64p1=OxbuuRw@mail.gmail.com>
Subject: Re: Stepping down as maintainer
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, ath12k@lists.infradead.org, 
	ath11k@lists.infradead.org, ath10k@lists.infradead.org, 
	Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_073313_351547_563CAAE5 
X-CRM114-Status: GOOD (  17.46  )
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

On Tue, Jan 28, 2025 at 7:18=E2=80=AFAM John W. Linville <linville@tuxdrive=
r.com> wrote:
>
> On Tue, 2025-01-28 at 11:20 +0200, Kalle Valo wrote:
> > Hi everyone,
> >
> > I'm stepping down from all my maintainer roles. My first commit
>
> Well, my friend, I suppose the time has come for you to move on to
> something else? I truly hope that something exciting and rewarding
> awaits you!

I didn=C2=B4t know John was still on the list! Hi John! I have enjoyed your
return to retro-computing elsewhere.

>
> You have done a great job in this maintainer role, and I am very
> certain that you will be missed. Few people realize how thankless such
> a role can be, but I do. I hope you will now have some some time to
> enjoy your sauna as you consider what comes next for you.

I too, thank you for your service in this role, and hope you find
something rewarding to do.

>
> Thanks for the job you have done.
>
> Terveisin!
>
> John
> --
> John W. Linville        Someday the world will need a hero, and you
> linville@tuxdriver.com          might be all we have.  Be ready.
>
>


--=20
Dave T=C3=A4ht CSO, LibreQos

