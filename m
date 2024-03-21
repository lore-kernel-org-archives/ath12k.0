Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EB3C6FD1F
	for <ath12k@archiver.kernel.org>; Thu, 21 Mar 2024 18:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9y+K3lwrNgxkvjio35nX3P6+2bJIVYEt7UZ5Xb1mL8A=; b=uYy/RlvAEDNduS2AgnYZJmqKLJ
	ZLw1y5Vm8te1vinEnFYyzlP90oJeJ0JthANOypIM5/UAd8dOwcN4nKWo8N74p0R1yTCLBChc8TGYN
	a15d5tVzP/7xv3WaD4IcGejtuzvGGD94W8kDgXTdm+GgZgCZB8W14QRzraAA8AVZ9Kua2nadrF8b9
	Sebze3eFOa6i22Jr3ZUCTuWwoPzvz29kuULNtPvhPmlpxRnYg93LkXnKLq+lB12yYdyApy8p6u6TC
	jlKo5AS/zlZrdYxiP5gPSRMzjRrXlMOBI93cTBav9lyUeg0miYSYUoz/vo/hLsfkfm6x0bRCNez0t
	7q7tq4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnNRv-00000004Iu1-1m7P
	for ath12k@archiver.kernel.org;
	Thu, 21 Mar 2024 18:47:35 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnNRs-00000004IsF-3aKb
	for ath12k@lists.infradead.org;
	Thu, 21 Mar 2024 18:47:34 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-56845954ffeso1678480a12.2
        for <ath12k@lists.infradead.org>; Thu, 21 Mar 2024 11:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711046846; x=1711651646; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9y+K3lwrNgxkvjio35nX3P6+2bJIVYEt7UZ5Xb1mL8A=;
        b=SzVeFBB/lZ1Whi0hxlFN9AjR/0O557S00RBXwdYCnHdMbshrXI1DZHCzUb0SQHUOlx
         BPy6KwhDs64KaE/LnqD1mYpWpOn67b2/K7z5R17+RhA8LPDOFnZRVM9xD4gYKcl/NxPv
         j1elvduwT4I0AH0w67oXb0tIdySjvD/Ey+x5k6d1gwsEAi4OYUiVT0vyBO8CkQ40y/4q
         pDPdOWGVF5vwwdJzJ50pfivxKUhmvRr1tn23hYQ06hv6BzXgmy9JN+fsoZOD1rZlf7J9
         dYbSVmEBPfaPnGn3zFm51Kq+qb7f11nAjUebtd7OdKVjtDIiaL20xmuV7tJYrx4MP7A1
         EvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711046846; x=1711651646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9y+K3lwrNgxkvjio35nX3P6+2bJIVYEt7UZ5Xb1mL8A=;
        b=Ddrz4Stsful4iuUbt1JA0z4xaNBI+yA0MHzFpKB37MMKKvdvkvaY/tAzO2KGDlUbtK
         UNt3++OOkRTdro4Y0Rsr8fVuvIGoI7ZnV/IkW1YSoNrr1T3joNCCLOqSuXrFvNeuMNc4
         ZEanfaL/9s9EDc69BJqUNKfT6OKadtu8twkJTP0RiErz0MU3PkdQ3bITHr9c6ZYlZf82
         Mx8Z/Il3YaZFhoRs3dq1ctgcsqlGB1DZq7rlqPbYI9n7hxOtNKJAZn3M3toZ60wM0ulj
         gNvlVlXAXDo/PpZOwjENh6hP2c5kW/8mEPudQ6etD4b6IDm5fg6GLsRmt39JQd5SUFoL
         7uLA==
X-Forwarded-Encrypted: i=1; AJvYcCWTAO3fCiPOw8IsaB5h80x5+ZXybUS29n2CTLfq5hE449523ZR066SeJNUH6XSJMI64MPu+NXDX1oZiqbl7jAOPUURoIyn3xJGjXg==
X-Gm-Message-State: AOJu0Yz1ZTpADJcmQktEgLrRXC1TZAELxv0g7AEocYqnRHTZVQuUsVjq
	hDJNlMZ7LaTDVobTkdgaHmDbH+mvyTeKyDoYnUCOapf1kKo8KQcVfpr3s9auzsBjiTKqY5rKjk5
	zDvNHQAFr9+vWvChtrRwUx4/HXN1LyG3WxlU=
X-Google-Smtp-Source: AGHT+IGzBXplJbnDGisBv1JHsPFE3c4myUgsaILHNKOX8vYDLvNtR40OlZESn8n8VjEzpY0GphkGqepv/OxRY5cUBSw=
X-Received: by 2002:a50:8714:0:b0:565:59a:a103 with SMTP id
 i20-20020a508714000000b00565059aa103mr55601edb.33.1711046845887; Thu, 21 Mar
 2024 11:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAHohoUjGROZ=E-D_qJp3S6dLUwA-PfAWBCU7pAkPVBJqkG=QQg@mail.gmail.com>
 <87sf0kan7d.fsf@kernel.org> <CAHohoUh9nt06n_eqFwVf3k6vbqJb5akxvgS4i8sNHpadDzUOEA@mail.gmail.com>
 <CAHohoUjMaNfhhDoJtNh=8zpzKvAChw89WocBFGxhP3Pi_i21Hg@mail.gmail.com>
 <CAHohoUgC34=x9Uq5E8a7nnqkGWRjKpir8=ZFC_XCtEF+Cgzcfw@mail.gmail.com>
 <158ebe88-2394-4b1c-8d32-9d8509c11a90@quicinc.com> <CAHohoUjSQdLYt+tSBzNO6LzGgEZcz5E-3WB=xYngE5URveX0XA@mail.gmail.com>
 <f077d1cb-2704-42fe-a77d-b23d0d38a8fa@quicinc.com>
In-Reply-To: <f077d1cb-2704-42fe-a77d-b23d0d38a8fa@quicinc.com>
From: "Owen Mesh." <owen.mesh@gmail.com>
Date: Thu, 21 Mar 2024 19:47:14 +0100
Message-ID: <CAHohoUjWa8wNhdVTr_Vy8TxsMYqMKkabTuBPH8HhCjgnpciS5A@mail.gmail.com>
Subject: Re: ath12k: driver does not show tx bitrate
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org, 
	Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_114733_028718_CCE62269 
X-CRM114-Status: GOOD (  10.65  )
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

Yes, please!

On Thu, Mar 21, 2024 at 7:12=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
>
> On 3/20/2024 11:33 PM, Owen Mesh. wrote:
> > Thanks!
> >
> > I applied this patch.
> > It looks great for my configuration/platform!
> >
> > iw now shows 802.11be tx and rx bitrates:
> >
> > iw dev wlp6s0 link
> > Connected to d4:da:21:a8:06:7e (on wlp6s0)
> >     SSID: NETGEAR65
> >     freq: 5805.0
> >     RX: 36791 bytes (185 packets)
> >     TX: 9111 bytes (73 packets)
> >     signal: -27 dBm
> >     rx bitrate: 1801.4 MBit/s 80MHz EHT-MCS 11 EHT-NSS 3 EHT-GI 0
> >     tx bitrate: 1200.9 MBit/s 80MHz EHT-MCS 11 EHT-NSS 2 EHT-GI 0
> >
> >     bss flags: short-slot-time
> >     dtim period: 1
> >     beacon int: 100
> >
> > Best regards
>
> Is it OK to add the following to the final commit:
> Tested-by: Owen Mesh <owen.mesh@gmail.com>
>

