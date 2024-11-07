Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE031D4335D
	for <ath12k@archiver.kernel.org>; Thu,  7 Nov 2024 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTJTU1/WgMnMhMsHkYEBclEMuS9M1UtJvjgM/eI3K/8=; b=2PPF5HWVK2aKgJKOSLjkgL/fpW
	K4RjKSq1RDpZ+l4yKG/Yyyrg07CXZ6+2wGVlmaBRfgp/9RRFP2KHw+ysu1BcGWV+EUVi9PfKcpuow
	mP0IBlVwPSzp11alGuWACknhwk3wF71jiLTFkMljBeBTm/VB3HhDv0GkyW7lDMUpyNrxQpMWmEEPw
	3cnVWn0/MhC7tfWMQZwmtlXOAnsPaQ0gXAwKPH+dSUliZ7F6eEh1Vrfboi+34OwkNP54K+B9tTp9i
	HLjkN6L/Lv5GNoEF1A24pFGuhQkXnWnHcMjKsgZHmS8VCpQB2xHgJfjUB0qTWZBRYt1VUkHncM/c8
	kw/NtYHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t92Rk-000000074WI-1tp7
	for ath12k@archiver.kernel.org;
	Thu, 07 Nov 2024 13:21:12 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92RG-000000074QK-0PFs
	for ath12k@lists.infradead.org;
	Thu, 07 Nov 2024 13:20:43 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539fe76e802so957573e87.1
        for <ath12k@lists.infradead.org>; Thu, 07 Nov 2024 05:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730985640; x=1731590440; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wTJTU1/WgMnMhMsHkYEBclEMuS9M1UtJvjgM/eI3K/8=;
        b=pZh+84Ig3eM1Vbxl9qc73iEugFf2sxgdJGJtHR7SpJleQUXLFzXSj4kW/bC/Bu3/MC
         wTM6jCcZO65URip0UZs39Z7/MezTtSF1gAleVVRSHVenm2N/c7Vbij4iJi/6v9hIHDtG
         LL6hCCqajNmFamysEAF7txI6PktB+A8w8BNjhzDYkdQNX2g9xJGeKmTHj6ETeJVRYUug
         55IKL9v/IDmeZVlHG2wf+Cagkb/8T4ZVdWqiuexY47w9rP6Q0a+tH3TEkTdiFfrE7Aut
         7Pk1L9Pcuz3fy+FHKeYT+d9AzDArn947WWMlFWf1isjX/2g6uwPe9kdZylw6PDt5O4jp
         GCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730985640; x=1731590440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTJTU1/WgMnMhMsHkYEBclEMuS9M1UtJvjgM/eI3K/8=;
        b=EPvkGx7gNK6N5Bud0gT0LuCC1KPPQxPkCPzXM6gskSGS2e61xG9q/EAA+HtnZt38a3
         0NTAQ0xAKVbgIr1c5pQSdc4UxpTVMZb4G9egOlOjm0X3T/QvnrgyVeULJYEVSuDBU+zI
         d2W6zirkM885yVAwDqgbo1bBbj1LrbxYZ6J0e3yLS5j8UupGeHsu8aKUoYT7DaF4wkmo
         WSywBwTf5eZSYjjACS/p7L+2H3tt9Wk5CjQ4I4I9QU1Jaj2pW79L1Ox+Q1hUAbOGEWKR
         dDz9z+OZEMKyax7aLgWnLTjJiu3bITkUJFVBE1QSBVgH8Jj1xIFz0NPtZueGect/S6Hl
         FerQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNuAFyCJPLRxT0sy1eaDtQ+f8MnOmzxwjDlQguAZrcY2Rf9RxzH/oDEI5w8CNJP5hxMpCUEG0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo+e+QtDkklhLdsGNIaEKmzA7dWTHmtIST9OxvQ3ME+/Q/9wc3
	42LLyxvBZ+qlRI1ulM+B4Z4S3NY64mcWC/1Q+S/uNOk+zK5Yc8CxN3ui8VnwtuQ=
X-Google-Smtp-Source: AGHT+IFvkWpQMrorpEfz69D8hdyKknrpmvGBejcMWnvwqudlmWyULPvb4Uly1A/kUgo7+RzonjdO+w==
X-Received: by 2002:a05:6512:1282:b0:537:a855:7d6f with SMTP id 2adb3069b0e04-53d65df4b65mr11452598e87.34.1730985640002;
        Thu, 07 Nov 2024 05:20:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a739dsm212002e87.158.2024.11.07.05.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 05:20:38 -0800 (PST)
Date: Thu, 7 Nov 2024 15:20:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RFC PATCH v3 0/5] wifi: ath12k: Add wifi device node with WSI
 for QCN9274 in RDP433
Message-ID: <x2ch5ahotd6kfqg7tjvaav5kaxi7mfij4nsakxegp6j5pecomd@rhzytgayfoek>
References: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
 <49a6ec0d-8a0b-49aa-a9eb-1174cff930f6@kernel.org>
 <cmvfpctliqggra33u6ituguoxh3jxcuxiyjpbtcjbcgpu6lhoi@4zdthfkc2ed3>
 <692503b8-cf39-4d6b-b70e-910fcc710d69@kernel.org>
 <CAA8EJpqMCbyK0dodMNyfs8dNjV2QoB2nyWm233eOS9xo8BaFJg@mail.gmail.com>
 <9d158c25-197a-49fd-b639-45287a46438f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d158c25-197a-49fd-b639-45287a46438f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_052042_171968_55EDEAB1 
X-CRM114-Status: GOOD (  24.91  )
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

On Thu, Nov 07, 2024 at 01:16:56PM +0100, Krzysztof Kozlowski wrote:
> On 07/11/2024 13:03, Dmitry Baryshkov wrote:
> > On Thu, 7 Nov 2024 at 11:29, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 07/11/2024 12:06, Dmitry Baryshkov wrote:
> >>> On Thu, Nov 07, 2024 at 11:23:20AM +0100, Krzysztof Kozlowski wrote:
> >>>> On 05/11/2024 19:04, Raj Kumar Bhagat wrote:
> >>>>> The RDP433 is a Qualcomm Reference Design Platform based on the
> >>>>> IPQ9574. It features three QCN9274 WiFi devices connected to PCIe1,
> >>>>> PCIe2, and PCIe3. These devices are also interconnected via a WLAN
> >>>>> Serial Interface (WSI) connection. This WSI connection is essential
> >>>>> for exchanging control information among these devices.
> >>>>>
> >>>>> This patch series describes the WSI interface found in QCN9274 in
> >>>>> device tree and uses this device tree node in the Ath12k driver to get the
> >>>>> details of WSI connection for Multi Link Operation (MLO) among multiple
> >>>>> QCN9274 devices.
> >>>>>
> >>>>> NOTES:
> >>>>> 1. As ath12k MLO patches are not ready yet, this patchset does not apply
> >>>>>    to the ath.git ath-next branch and that's why the patchset is marked
> >>>>>    as RFC. These are the work-in-progress patches we have at the moment.
> >>>>>    The full set of MLO patches is available at:
> >>>>>    https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=ath12k-mlo-qcn9274
> >>>>>
> >>>>> 2. The dependency marked below applies only to the DTS patch. The
> >>>>>    dt-bindings patches do not have this dependency.
> >>>>>
> >>>>> Depends-On: [PATCH V7 0/4] Add PCIe support for IPQ9574
> >>>>> Link: https://lore.kernel.org/linux-pci/20240801054803.3015572-1-quic_srichara@quicinc.com/
> >>>>>
> >>>>> v3:
> >>>>> - Created a separate binding "qcom,ath12k-wsi.yaml" to describe ath12k PCI
> >>>>>   devices with WSI interface.
> >>>>
> >>>> Thanks for the changes. When you finish with testing/RFC, please send
> >>>> proper version for review (just remember to keep numbering, next one is
> >>>> v4 regardless whether this is RFC or not).
> >>>
> >>> Isn't the 'RFC' being an invitation for review per the nature of the tag
> >>> itself?
> >>
> >> No, RFC means patch is not ready, might change. This was brought on the
> >> lists multiple times and some maintainers clearly ignore RFC. Including me.
> > 
> > Thanks, point noted. I'll stop marking my patches with RFC tag.
> 
> Wait, you can keep marking them RFC! It all depends what do you want to
> achieve. Get some comments on early work or actual review for something
> you believe is a finished work.
> 
> I looked here briefly, no comments from me and I assume that was the
> intention of RFC.

Okay

-- 
With best wishes
Dmitry

