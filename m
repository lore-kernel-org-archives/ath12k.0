Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE86C02194
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMArTWxNFUp4PQzCQD8slqPHvp/31eRbyPGy6SkB2WA=; b=pitmpJgogCUfAmG211NIQ+EHVf
	82gRV4yxbfyTC0cO+dTHBiKzVxoEmIWAChrQEkgyBsYSNOyD7fpbO+xilskxjavGO1xTNcN9d13nA
	g3AE8hT3OulOiewNOAPptz+vFllbwzMw9hhCmc+QAJIcT8CJnXQFot7Rizjo0r/qkYOfg6Ol7igXR
	DTzFBDepqO3AAsu6mjPMJ5/T13YCKlpunNySlT5ojYiJjUMPoqSCMM/DIiWEQvTjCPn9Jp9cXSRiw
	Ts4GhXh1PTcX4HVTJu4M6LjVSEZuM+FmEyAhxF1e0sU6J3KBbrrX1ezetX4aSG8JsNjKCsFgYKW+Y
	hLaByx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGQP-00000000BK9-2Cjb
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 10:45:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGPX-00000000BFF-2Uz0
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 10:44:08 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43635796b48so33298275e9.0
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 02:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738665846; x=1739270646; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMArTWxNFUp4PQzCQD8slqPHvp/31eRbyPGy6SkB2WA=;
        b=bXA8kmbpQ6VnR4s844Uw1/jYnLmXfRTtxLBeTIrPJ/oGCfAQOZCqNZUVhBfEgda7hQ
         SzQvR8n/W2C8rQjPFOGd0xkHgYy9mNbFDAdZOnqDKDz3JZcSjPNrPnetTAFwhrfPjoQA
         xcMHxhPrRC5thVt7c2TfrhGZk03bH+7nnEiRvlwCOsWpKXvZzW0VsSlv4BFNBhGejCrU
         rD0pIJzwemKZxSV7sqq3aX4dVoS5UlXyqFvv/R529rc0LNYHO+AopNpRw9EEyrj1flNU
         V0VKuXbCCG+vgWucsnJjNv/8D9+uIRfO48+K6vj2Gl5gDzEVlLGAT/KyPwyAtZDD6ec8
         bijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738665846; x=1739270646;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lMArTWxNFUp4PQzCQD8slqPHvp/31eRbyPGy6SkB2WA=;
        b=W0PeqtsdXEQ7Q/SOyCRGzRQizbM0qqVwldqW1Patx8rjLD/UVe5Vo4spjN/eIhVzBL
         aBhBsSMxnOWiOU3zDys/+be2ioo8YIHeSvDIs+YZfPZxzY33VxjK/9OG4O2RjDSAmfff
         b9c7tiPNCE7MaJ4Kt4xQzMlNxntANShOZCtyHKccXBWd8b4o3iQYTjbk4nrgHVIJzAqn
         LugWyQEEqlxNUpNPnUL3LluHhqJfm0cwNZb22Q1QE1lX1Mm8gZytrpSOuOr17E+nnMPP
         XINMWK0/JxsVDmAfC+8McjQRFwMcYBV3shO0dwEv+QW9nmU3yrJ1Ai1IjAmu0NCK20Ok
         TaeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7AYKMmIpAWU6ZN1EKNTb7aTI87bgNEOzrMPPfdsdPPnjjzGzW3D3UulS42rsWdLzXu82LR7g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8v7tIvrQzPXVZU5rohOpOqMQSUC8wYt3z3jTnRfKjD6hdMgPR
	HNmJvywVOswkrik0VZM6Jjln50Pq/KplpxED+LGU/hIqcPRe4lIxjCZW6g==
X-Gm-Gg: ASbGnctu6UhYvmDFcV1YwMUdZYBO0M8jFp4bTd6FZ2ykr7EmN23kreC909mBTpAPXAi
	TYfmzkwFenoxJe9bi8SsxuxmlN14JkeQ63behhZ8nayT1YI5nHEQ4BqyDPoFh711wSq5pt/5yjF
	eY/0A19/Y160rCXfDn8i0HtCgYQuJulJZe++mPIhJF/3E1BuobYYlg2+cNYOlPCxV93YUsKGuqu
	kO6UpQ1+aqI5I/wwDtX5KtQC9EX9F0iIyBgVbIauDsxWOkXdyrg8IEQ0OyRpRJ/bUcmqchumH1J
	fMnc60JmH96CWx69GIA3ZTKnBk/hJFDm7Q==
X-Google-Smtp-Source: AGHT+IHsN8HTcCwIdZM+oqcLS8cPH93vMIT74gEgvRL+nbc/qsns8TrvV+nm1LCTJCegyuOBJuh5tA==
X-Received: by 2002:a05:600c:1f8e:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-43905f743f5mr19708595e9.9.1738665845748;
        Tue, 04 Feb 2025 02:44:05 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2e3a6sm228450075e9.20.2025.02.04.02.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 02:44:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Feb 2025 11:44:04 +0100
Message-Id: <D7JLLQ79FP2Z.2Z7VYLSC52A2U@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/8] wifi: ath12k: handle change_vif_links() callback
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Aditya Kumar Singh" <aditya.kumar.singh@oss.qualcomm.com>, "Kalle Valo"
 <kvalo@kernel.org>, "Jeff Johnson" <jjohnson@kernel.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com> <D7JKQ60C6EZA.24H639LLIG2U7@gmail.com> <076014d2-eaaa-44be-81fc-a8f1eb0c2ac9@oss.qualcomm.com>
In-Reply-To: <076014d2-eaaa-44be-81fc-a8f1eb0c2ac9@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_024407_631408_6DE129B2 
X-CRM114-Status: GOOD (  11.85  )
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

On Tue Feb 4, 2025 at 11:23 AM CET, Aditya Kumar Singh wrote:
> On 2/4/25 15:32, Nicolas Escande wrote:
>> Hello,
>>=20
>> When applying this series I am no longer able to start an AP on a DFS ch=
annel.
>> (I don't know specifically which patch though)
>>=20
>
> Thanks for reporting this. I think non-DFS channel should be working=20
> fine right?
Right non DFS channels are ok, only DFS ones, and not from the get go but a=
fter
the initial CAC, when they switch to operational mode.
>
> Anyways, I'm able to repro the issue locally. Let me investigate further=
=20
> and come back.
I'll happily test what you can throw at me.
>
>> After the initial CAC period I get the following kernel message:
>> 	[   45.248441] ath12k_pci 0003:01:00.0: cannot install key for non-exis=
tent peer 3a:07:16:d8:00:08
>> And then hostapd goes in failed state:
>> 	wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
>> 	ACS: Automatic channel selection started, this may take a bit
>> 	wlan0: interface state COUNTRY_UPDATE->ACS
>> 	wlan0: ACS-STARTED
>> 	wlan0: ACS-COMPLETED freq=3D5620 channel=3D124
>> 	wlan0: interface state ACS->DFS
>> 	wlan0: DFS-CAC-START freq=3D5620 chan=3D124 sec_chan=3D1, width=3D2, se=
g0=3D114, seg1=3D0, cac_time=3D5s
>> 	wlan0: DFS-CAC-COMPLETED success=3D1 freq=3D5620 ht_enabled=3D0 chan_of=
fset=3D0 chan_width=3D5 cf1=3D5570 cf2=3D0 radar_detected=3D0
>> 	wlan0: nl80211: kernel reports: key addition failed
>> 	Interface initialization failed
>> 	wlan0: interface state DFS->DISABLED
>> 	wlan0: AP-DISABLED
>>=20
>> Maybe I missed something ? Is there another series this one depends upon=
 that I
>> should have applied before ?
>
> No known dependency as such.
Good, as I have a few other series applied in my tree I was affraid it migh=
t be
something on my side.

