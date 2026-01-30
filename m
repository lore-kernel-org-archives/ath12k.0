Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5296AE6BF2A
	for <ath12k@archiver.kernel.org>; Fri, 30 Jan 2026 16:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0ZYFkodNECW1hBhW5QEpLxOE2Z1dNRWPiVSHuO642I=; b=c3TwsSMCADmcUCXbSj1FaNQCud
	E3L/Q8Xqz9OfbLK1lZN3QWTX4POehfMjQWoe5+9x86IKxFsP5VEFS/CcHBZaB6MaZMyyndbwG1NJO
	bdJob+K5gBXvDAtpxaHwy/k6cvbOX4p0JTd8DyzJOGltNol0UaM41EO5J2GlkJFBtDwVFhlXglOYO
	vuecfF3NteAPtG0ATQ3NzhvWOq6u4uqF7LZyX6H6yFL2smZBMHjDzldh+Zofp6Jb6gU3pWALacVyY
	QjQOOtyH7CBORWWmjB+EMUlgdKMeb40aLfGP3i8hQ1z5uVzBYuP3BLNvna9QZC+wPnI3Awn6GoEVy
	NLNnoCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrco-00000001jK9-2vcn;
	Fri, 30 Jan 2026 16:45:38 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrcm-00000001jJp-0iQ4
	for ath12k@lists.infradead.org;
	Fri, 30 Jan 2026 16:45:37 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-34b75fba315so1451396a91.3
        for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 08:45:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769791535; cv=none;
        d=google.com; s=arc-20240605;
        b=KRhgli21+8TmSW/ezOaWz5qWIWC67ABND6B2lKW1qyRVKkWoDXP9orV3SYLlllNbdX
         WmXUSX9A7Gv7JnY/tcpmEUh0rjLj4OMlavxZxBhIA3awLntqxZADOsdZeO9OsIQkSq9Y
         UzJ+HkIUOn9yty6kH+o8H/NEs5CCOYWIB/ozn6DrH8VWcrkGUg8q0oEHxOtPetZeTQ6i
         HkUT55iEWsFJHpGLe3/u34fYfk265iXBS23P3UaPWiBhWrMv1DAJ46M2fm6zbUkVUtEJ
         CQkRE2VRWBAJ9HS3Xv6Sb5ERwOD9lIS8cPv005HPzgCUkPv6f4yLILfe9IOcSxoF0u7V
         9bmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R0ZYFkodNECW1hBhW5QEpLxOE2Z1dNRWPiVSHuO642I=;
        fh=tB6dnRPIWXkzjkteiidxRj7mEZUV6q/KidEPACyVvB4=;
        b=EtAVhIw4wBoWHCBvPImOZ7cOcxtSmeE0iMq/+RS95/gAg2D/2Rv9yXKP6iE4L9/mY/
         gZ1hNleVezoi3r0aQMAsZfct6URRMAAobSvggupJfGP1i8Wny7UKYeMiMmCdfpeeOtA5
         ej8MKDK3N09xstRoXuHp9nTjCEzul+B4bAeaqnPTBDlFOFZDd6VEXGDkGmTL50ONUsqC
         eHLX7uk6Y+i6dopVsjOVa6WFxh4qwjyMK/4rFtIu1v9k8u4zY8ygAMWLnGIXeRaF7Qa6
         XYK3teJb3Tbq0z0ly/auPsKSHPHojS93+/iu1w+sN6xiIBUuNwScWn9nSYIoEG340sbK
         xZEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769791535; x=1770396335; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0ZYFkodNECW1hBhW5QEpLxOE2Z1dNRWPiVSHuO642I=;
        b=DiM7K8ml219ALX59VfA9tszxw8Wj1GtKae2SEdN5ee3m1ES0LUGEhwkHM3bB8sHDOu
         bVq7creL8hdG8H1Tilb5HxrsxGB/W6s3XuNrTUnMjMPfddRRU6Qdw39m+/uosGBFkjUl
         l0+wa/iRrNxCbUnLM5Np+ayBxyuBmHInk02h+wgjhDyV7XstO9hW5aXh4ylr3nWij+i6
         UhpbAi3Gx2yzfABb8/jDdYR1mJvbsyFScdtfFo/nHIHr0YtMFFscWWPeqngh0YVexq3J
         mWHbkV5J9aVMdJNHzfnqYisqhFJJ1jBulmgo7Qutw34eQaayknaajEaV5aPnWIYFXM86
         Lj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769791535; x=1770396335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R0ZYFkodNECW1hBhW5QEpLxOE2Z1dNRWPiVSHuO642I=;
        b=rtaRUa8qtuO4lkT5a6kdpHpuWutUa3Czi/+fhwLsdxcW8xtIf73ZtWdB7X+OgON0xl
         qAIJUYMDsyX+XO7wn9JcVv4Ps4EahCPjr0qN6SGm6rJYPb53c+H9ZDUyzWlKYr16GFVe
         FYGILvXozuPxHw/Rj2NjdPGfYT+jrXJLudyaDZbEaizjsqA66MQc50cLS4wOKY0qkeLA
         O0bN7gZX7bGNVvHve5SpFZpyu8Vy7mnsnaLv5Y/aW7w7+6jCZn2E3VyigMz8xrG0kSPM
         rFh60cnfcLJjfBEpDlDBWANWZhmhCsIr7oTtpeJKKZZhKBwEe15TsYu2ZhF0Q8B4S8DP
         x1jg==
X-Forwarded-Encrypted: i=1; AJvYcCXiMi0h1OaiIkM2uO3BuWsnMT2TIvqlkaw1TXuU1HfUq9zFbEFtbfGmL9R3RO+L6XcuhRxeZio=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEW41z40RN7zFYymHW9U35IKvEdL1eabZFEdRfMq+N5Pl8661G
	2fwI9UhP13ghIdxW2s0XCjIeom3J/APCV5qTC8cg5UI4tGXRM5zU/sGXN9G6iE6rOjkg7OksYou
	Z9BP4R/L5XVyDSUGtcw9eVAOR4MnTFt+PovX+
X-Gm-Gg: AZuq6aIYyGCelzNcmBfpgpiHiMNMeGgEbns0lnapVfCaLI4P/t8DO4Mdxed3bAaIRBs
	tP9BULr7Vwqy6JtYxnM7x7/TBZhwTx+LLMOajgo4voUgc+FAdv0BFIDnDq4+rZAj6IsrzH3+udW
	R61/j4XXiIDjpkfMvnNpEycn26YqWDHDd6NRXHz4ngWEjEjOE2lgAHcdbHsYnADQcjRlS8nLVOz
	zEwYcOMRgF8lLowv6IOYW42aEVF708sm2jGBH4Jidhnwj7z4g4mzynSnHsCldxfw5+Oglm7brh2
	X2/b78gxss7RRzJNDDfhR6xkYVCk
X-Received: by 2002:a17:90b:2cce:b0:340:e4fb:130b with SMTP id
 98e67ed59e1d1-3543b324fcamr3550336a91.14.1769791534812; Fri, 30 Jan 2026
 08:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20260126095244.113301-1-bjsaikiran@gmail.com> <20260126095244.113301-3-bjsaikiran@gmail.com>
 <9ca7ceac-2799-4993-844c-8427508c7d9b@oss.qualcomm.com> <CAAFDt1sxWMb1xPaWGWGE1XVFxRKwjOuQPZ__fNTH2+ujXJ6d5A@mail.gmail.com>
 <CAAFDt1s8HPQWJpSiDDk8PmUAKqkQHELcJj_F0faZ1C9RfiYu6g@mail.gmail.com>
 <7fb6b431-58ea-47bc-b251-5144575db17d@oss.qualcomm.com> <CAAFDt1s_NtY1vXa5STRW7oQn9yDJBC0g7CPSZXn0tFhd+CSHrQ@mail.gmail.com>
 <fbcbeb0f-c073-4da5-9dbe-2518a1d31f20@oss.qualcomm.com> <CAAFDt1uSQce_9AG2488yaeeEjCwQwQubW51K51VHiJF8Rp6xRQ@mail.gmail.com>
 <b96b9fb2-3313-4c3d-b20f-ea477f72bd62@oss.qualcomm.com>
In-Reply-To: <b96b9fb2-3313-4c3d-b20f-ea477f72bd62@oss.qualcomm.com>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Fri, 30 Jan 2026 22:15:23 +0530
X-Gm-Features: AZwV_QgSn6Pkd4HnYBcShPydd4sW93l20QxbCPitlbZLmxOdzbWGi6aTvxu9Mlg
Message-ID: <CAAFDt1vck6=sp4N+yEi6J8WwOmW-ZLfHaFXOaB+R9tMGophMDQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Fix firmware stats leak when pdev
 list is empty
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, kvalo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_084536_233111_8A43F94D 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jan 30, 2026 at 7:57=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 1/29/2026 11:32 PM, Saikiran B wrote:
> > I have merged the tag, applied your patches and I can confirm that the
> > leak has been fixed.
>
> When I apply the patches would you like me to add the following?
>
> Tested-by: Saikiran B <bjsaikiran@gmail.com>

Sure.

Thanks & Regards,
Saikiran

