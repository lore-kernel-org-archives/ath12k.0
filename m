Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960C8C54E5D
	for <ath12k@archiver.kernel.org>; Mon, 18 Mar 2024 16:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pks0d5mDPn4LnO3RyuMlci15r0NU85/smAG31ANqiA=; b=mYPH1Z9X2Rwyh0nwE6oXv/R+ej
	+Wvxzn1VPS+Q8Ap9XISqyAxvdC/ZcItk/WTgxme7vtIeOQNWp1TQUJXgDjycIUe170rbw+TZC2aG6
	8K+TFS9/a76fzsOR4gvSvIxpZSOC2Rj6aC2YP+BU5D1xad0Ok70L8YZhghmlN+HJn7qOf2NWaJ0gp
	Pml1CphEG6aTUtnFLQ4hqYhan2HA52HZLv70cOcGJbYRsdMfmoavQz6T2w7PAwC53TMnh2uP2HoRc
	VG5IBLiEacgaPtPMv78MizviV3z8MYM9ED+9NmgX8ILsDZcejGdxhWscYmGU90N/gjKD0eHecSLMa
	mM+OQgkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmGJW-00000009LcS-1IV1
	for ath12k@archiver.kernel.org;
	Mon, 18 Mar 2024 16:58:18 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmGJS-00000009Laj-3lO0
	for ath12k@lists.infradead.org;
	Mon, 18 Mar 2024 16:58:16 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-568d323e7fbso1905427a12.3
        for <ath12k@lists.infradead.org>; Mon, 18 Mar 2024 09:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710781093; x=1711385893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pks0d5mDPn4LnO3RyuMlci15r0NU85/smAG31ANqiA=;
        b=cawGKaNYaE8HLK7DAuwh9xSIPliyYS86dfJfI/jRYx0P9IU6V4k/y2WPnV7bzXiBd5
         TPWTSSzjdrtiuSGxLl7VR0aJIGw1G5nuMtYAa1/CgqO+MmsMjhR9YoRv9tKx/zGnH3iR
         sBe9/tcvsB9m1Je1QJXtwAuGoTNY1PKaInboqAj8iNX+rffj30iecrfPxFovryd0ENxM
         gQetnmIV77xKGEpnZrhzAh5T1S+q2ztVunFoe9VTceAbbrZTr2hb8cZI5xo5WQ753Hfn
         6w94VuwqdZEH2bRROk/DwRQs7kgqvEzUEY7atvaPd6rbvvhkxpz2jvLSQRWl1PT5i1aS
         mBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710781093; x=1711385893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pks0d5mDPn4LnO3RyuMlci15r0NU85/smAG31ANqiA=;
        b=TuHojqa8PhyrIJtIVXbcdC8b/y9Dj6QWvO15Hh8YQsV2PHWaBTexrfAmCOBZ/n/jO9
         /ItXRhnpqistvR08MOovFdyf9ebww6czuysTRUY2kJgRTcCWoch3YgUuqguAcvnSJnIm
         WCcrk0GbqR5LEw9iC5ZY2W9pDgz7zG0N2efd9qROEd0vyeiJnu+pehI2aFUKhyYOm4Yy
         BQquGNoEZx9NpXbQtJtoLZgzG1O1sO+vRVxmKZsXd9gy4Sl/Fbo9yt11m8tNnm+m9lry
         k+UZjUD2ACMbilz0ZEoN55OdbkHBNlR98zqF2FWuL7hTtsr5BfYfohVHm1iOwdn4E73l
         409w==
X-Forwarded-Encrypted: i=1; AJvYcCWJuQ3Im9SJP2Il5XBw6/WGCuj6UxcnEyZQ0eAG/08uKNojBU26gwq+ehK5Ayz9gYNOPqBk/oYCTQzq/bDmw4PFl5ynrSYFzBAOLA==
X-Gm-Message-State: AOJu0YxEzNk1gepm3N2ytx+UDlRDvzsXOOZsrmNdsUpw+x5QltbtiqKN
	Ez+ACo+AdWILvAsw35NiNTaKUKMIaUgyhIbz9EvXhI06vZKMB6mWyvmk8Di63qM9RnIjjaQ3w+7
	Ns+jHcnwQGuK+Yid8Rkd9bYJ2sEo=
X-Google-Smtp-Source: AGHT+IEJ5k+KvlpfKETEmjJiZH0O6XNMLKF8aeGQaqR1COwlHvF+blwOvyd6D28sppmUlJJsLH/8jhZ+5DzefzP/g54=
X-Received: by 2002:a50:c04a:0:b0:567:45e2:c4db with SMTP id
 u10-20020a50c04a000000b0056745e2c4dbmr8784216edd.39.1710781092609; Mon, 18
 Mar 2024 09:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAHohoUjBQ43aX8qvT6WAK5AK3PnOyU1g3eFLuCL1f-UMjnNnwQ@mail.gmail.com>
 <9dc50652-ac92-4962-b60c-1990c5cece86@quicinc.com> <87le6fcyxc.fsf@kernel.org>
In-Reply-To: <87le6fcyxc.fsf@kernel.org>
From: "Owen Mesh." <owen.mesh@gmail.com>
Date: Mon, 18 Mar 2024 18:58:03 +0200
Message-ID: <CAHohoUj1K6XyT+3c6+b16v_5nV6P8HwqTjXJ3AgD56bvR_-2Qw@mail.gmail.com>
Subject: Re: ath12k: driver does not allow the system to switch to
 suspend/sleep mode
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org, 
	Jeff Johnson <jjohnson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_095815_262369_43724869 
X-CRM114-Status: GOOD (  14.55  )
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

Thanks for the info!
I'll wait to hear about the solution.
In the meantime,  will use a proven method - run the "sudo modprobe -r
ath12k" command before leaving home.


=D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 18:00, Kal=
le Valo <kvalo@kernel.org>:
>
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>
> > On 3/18/2024 5:15 AM, Vladimir Mesh. wrote:
> >> Dear Sirs,
> >>
> >> I have a problem using ath12k driver with wcn7850 adapters.
> >> ath12k driver does not allow the system to switch to suspend/sleep mod=
e.
> >> Please fix it!
> >
> > This is a known issue both for ath11k and ath12k
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D214649
> >
> > There is already a proposed fix for ath11k that requires changes to oth=
er
> > components (MHI & QRTR) that is pending approval from those maintainers=
:
> > https://lore.kernel.org/ath11k/20240305021320.3367-1-quic_bqiang@quicin=
c.com/
> >
> > Once that is in place, ath12k can also be addressed.
>
> BTW it would be good to submit corresponding ath12k patches as well.
> That way people could test them and provide feedback.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

