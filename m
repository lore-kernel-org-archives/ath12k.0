Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3764BC2D0CD
	for <ath12k@archiver.kernel.org>; Thu, 15 May 2025 19:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRe9pBALwoloKQMDtYYRo83F8zooiP4QduuUTQf5Hik=; b=YsXetK5k1JPJ7FMTUFci8jpG5A
	iNisNnWlTrdgnYYprIGbolFkDMfymB2psJWCcvDml5OCu8HCwo84tCG1XVx3Yx8Art1tDr2Kx4XIM
	tuJ+T7eB1x0mUeO/uezqRPDFFQyzDwrmeea1R1K1oqo25Bx2ig6Mgi6YVyuTZzM4EA11c7eYG1MEO
	dPqrGUmgg6wHogIjAceumFiOIKd0TrOr3wsXhNhPZtcWxzmHbQGw40VOmo9BOPKDPsigyZ8xh7TZs
	sOG9sN7TH0Q4Wu27miNv7m+Ofb9dHqqSq3NwT8B8TDYWoKp+p0pRuIkW7QhxD3VLJMGqtnQB/zwXY
	he7vSt8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdx5-00000001e3M-44Qr;
	Thu, 15 May 2025 19:09:07 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdmL-00000001ceF-07RY
	for ath12k@lists.infradead.org;
	Thu, 15 May 2025 18:58:02 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cf257158fso9530125e9.2
        for <ath12k@lists.infradead.org>; Thu, 15 May 2025 11:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335479; x=1747940279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRe9pBALwoloKQMDtYYRo83F8zooiP4QduuUTQf5Hik=;
        b=Mp+Z18Mdk0RQKR/FasG7FQhH/Bm4qYAYlxOJqvfwR1rs9UVo00PJBO3jbQUnjDJksn
         7OOsDUHmd06m6oSan/eBnNyvn9a1LMx8VUsc2CbxMOP5o/4MUe/5CPu+7exjenE9N9cv
         3ZCt8kugEF0jhBt0VC191EaG6v+MfTrmnXM/8no97v7AZr7AwuXEGx0SYwIihBF+YG1e
         JckqMIArbCdFYtYyG4YazdagUA8w47DSYeJt9einh00v2ckb59qgp0doRK4/4gvvGdCM
         DOZh6FSHLmezkzDjJFwNbaDgC5vQcV5Pe2cUWFtwCgd9Q0APL8Mxa/YbjRRX/8j5bJJH
         lpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335479; x=1747940279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRe9pBALwoloKQMDtYYRo83F8zooiP4QduuUTQf5Hik=;
        b=mN1lsMZByu0vbTAjD9NadpFwt4FLNscfV+2ZMb5Xk763I8DwXXYeGrLVDXTmbRIXXt
         3EEP8G5XbampTUF44iQMUVUmaAhx+d/+4y4wGxHjW77rRw5QDDGXHaqGGDzThGUaR5uL
         Eiu+Fu3GPd2j5OvzaP7h00HjWq4FVmwlzolvZutbkLPllO3yJYNtG0wYtESgDWjWNifQ
         hoCaIdxziX7nqqcGkbgmcCyYdBjbaDuPXgsK5keNQPmzJ/K84PNvaECUJ/DWqhYPExkk
         7m6EaPtetVziMHEs1xxDb2XW0u9qqyymHSqyM/rgpsBXAf4bC/rMIYE8r3fb3m3256Ny
         chig==
X-Forwarded-Encrypted: i=1; AJvYcCX9DjY8MPXidIH5CL+PURuOZzy0aqtfnHF+11zuxgw/uj+k3AJb5RQWKk/oTtxhvUbx4cqobEA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0UQqQ92uwPlreQLO3rfegIU0sFYzNBlS69kvRikVLeK55gJoZ
	fG07D0n3FxXom3y74iEd3OxLOwUVsb6iGrJR1CBG2UJV/jA4xQObx4zL9ZAwYoHWs65NQb4Wg9z
	ZtycigORcKDGxoJy+3W0fGTuh5kOkX/46ywBp
X-Gm-Gg: ASbGnctySZsfGU5xZAdy5FxLUAdzDffn+ZfkqyAg3zLehLjdIxMAHhHjTrqEKyeMMlu
	Z4Kq0AJO/hGgcacE4DLAwtxdF7XHbjwG6FdSGAAYGlPnjgYbouGvYat4XtjTSNPPmQR/nWNf44t
	LranjkuyOKSbOwcH5riEvTpIRNB7Q+/ZY=
X-Google-Smtp-Source: AGHT+IFnPI/D3I42zhtn6Eo3/ju9VXJPwh+5PhBxi/YCt9kniIybmcM8jss+YyH3ttHJ1tW7Z0n55/xRWJSwSVD/LBA=
X-Received: by 2002:a05:600c:1553:b0:43c:eeee:b706 with SMTP id
 5b1f17b1804b1-442fd66ecb4mr6491095e9.24.1747335479257; Thu, 15 May 2025
 11:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAMb39_ngQs8=FUML5QXMh2RmEZBZ2NwUHefhGoTkGtHat+KWJA@mail.gmail.com>
 <ef81db9e-99cb-4802-b17f-94eb623a8b32@quicinc.com> <CAMb39_m+4dNBDbkZmn-rDA7T+u84y-dx1jSfmPNWnse=R1=gCw@mail.gmail.com>
 <18788f02-e374-4aa6-ac4a-fd53bc93754c@quicinc.com> <CAMb39_=G_TEL1pbeF_PAZLQh-JOFcncSfqZChPmEj63NjsEOLA@mail.gmail.com>
 <16ccbe02-b315-40d1-8600-232b592d4dd6@quicinc.com> <CAMb39_n4tyrzS=-j0L+ekJVer=KiZyDYFhMqrrcpr9py_itU9w@mail.gmail.com>
 <0933d8d6-5b72-40df-95f8-69f6fbbdfde7@oss.qualcomm.com> <CAMb39_nHO_TbHPQawdLVY8nt3yt4wDuEHyEuzMa-p5Ab1n94sA@mail.gmail.com>
 <CAMb39_nQ-uyKAqCz1HEUDt5qjszbhzf3oikVcvzHcVwt4_qt=A@mail.gmail.com>
 <CAMb39_n89hBL_GvfXb7Jw9h5-h-+Qg-3GyqvpahL7MT5ewpvJw@mail.gmail.com>
 <CAMb39_=YPYg0q7Lf0sMgTx5QwKOqcyJrZR7kTspyXEDa6qz9Bw@mail.gmail.com>
 <e9da4ad5-52cb-416d-991a-259140469e2c@oss.qualcomm.com> <87774003-d0a5-4408-b710-20bd3c194cec@quicinc.com>
 <CAMb39_ntK9Zv3pOuMSza5hRfs_KZBhya=GAPnpBWjN2wZDst9w@mail.gmail.com> <ad255f5e-d1be-42e0-83ca-40fdc4eb25a4@oss.qualcomm.com>
In-Reply-To: <ad255f5e-d1be-42e0-83ca-40fdc4eb25a4@oss.qualcomm.com>
From: Walt Holman <waltholman09@gmail.com>
Date: Thu, 15 May 2025 13:57:48 -0500
X-Gm-Features: AX0GCFvyrGDMPQ28FWQyG1gXLH5c7Sl3DeSrafBnKdNPWNupvxTTFNCdATEY3z8
Message-ID: <CAMb39_muO=E_zqBJtdDs3+XBGNXjN2yTQUaWsKgTd8gMp6DQSQ@mail.gmail.com>
Subject: Re: ath12k: No 6GHz Wireless found
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Kang Yang <quic_kangyang@quicinc.com>, linux-wireless@vger.kernel.org, 
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_115801_066382_B52E53F0 
X-CRM114-Status: GOOD (  13.68  )
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

On Thu, May 15, 2025 at 1:20=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 5/15/2025 10:47 AM, Walt Holman wrote:
> > I adedd another network with 2.4 / 5 / 6Ghz settings and still only
> > connect to the 5Ghz network portion. This is verified through wavemon
> > and the AP. I saw some patches recently to address 6 Ghz operatoins in
> > various modes (https://lore.kernel.org/linux-wireless/1692f2f8-c77e-87c=
e-db70-00b4d9fc7c95@oss.qualcomm.com/),
> > but the patch doesn't apply cleanly to current or ath-pending. Don't
> > know that it would help, but it seemed interesting.
>
> That series is already part of the pending branch, hence why it doesn't a=
pply
> cleanly. So ideally you could test with that branch, but there are some o=
ther
> issues in that branch that are still being resolved, see:
> https://msgid.link/7db2e4b5-377c-4d3b-b51f-290accc9ddd9@oss.qualcomm.com
>
> /jeff

Thanks for the info. I've found something odd out just now. If I turn
on WPS it will find the 6Ghz Network. It times out before the
connection can be made and WPS turns back off. Just another data point
to consider I guess.

-Walt

