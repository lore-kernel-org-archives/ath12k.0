Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A75AD43349
	for <ath12k@archiver.kernel.org>; Thu,  7 Nov 2024 11:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASyBcKrBKY8NGzfSOTvWexlrMtjkKivNcNfUlPPO4jo=; b=CgWJ00LQ9IqkeZv1MkosKsJ4yw
	8nGiedkjW45yYrn/kB9Gs8118nyK0LyrMchd4v/2cAnYr7VNitNW4n37MbDoyW6MPEqhNe5J5JYGz
	f7+2pIxgloJfZQNDfqBdL9eQlcNn070jncOTcJlKiutKkUHDIFnJf29kkXH/XkMlA7eJQF6mtnfsk
	oOKJtOIQdyIV73FcjzjRpLmCGNqfaBbixeDsIDgK6iO8EV8owtdeU4OuMOp9ckQBXqT4V+UgNq0VI
	dU33RawV1UA1hiWWy6VNOJsTgufMOIT6kPZP3VX78ViMA5c4CGmv6W5rNmtm9m+UzbFJ+yQzYP/IO
	Il+SZqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90N1-00000006cOM-0RFg
	for ath12k@archiver.kernel.org;
	Thu, 07 Nov 2024 11:08:11 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Ln-00000006c6o-0FIU
	for ath12k@lists.infradead.org;
	Thu, 07 Nov 2024 11:06:57 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539e13375d3so881462e87.3
        for <ath12k@lists.infradead.org>; Thu, 07 Nov 2024 03:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730977613; x=1731582413; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ASyBcKrBKY8NGzfSOTvWexlrMtjkKivNcNfUlPPO4jo=;
        b=KgZfoWhlYqz1clHXgDVt1b4WdxJ5u7nFpAyUveJ2LMs2l64CAigG8nYq/hN9YHD+bA
         P0oPp3/m79Fwj5tOK5/45kkCSVNEDWQRD5USGZE2lSfMQIyGO5zdDX1forgz4L35t+FK
         GrEm1dbEQ1fwBrHL9NmlhKELEKsQht99GQHdlPBew0CVoimlHJlZJqh5vSDB2C6mXTVU
         Kt3acsa93wiqChkKHR6ut9NqOre6hHonHLgqozKW8YUOLa9h16KbJaZYd94afNDZwXfK
         nrpu88Oda0li25eGIFP3EVqh0Evf58RK5XSUsqL3M4Re1z2z4aY7On9emNCl30Ami3Ld
         npHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730977613; x=1731582413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASyBcKrBKY8NGzfSOTvWexlrMtjkKivNcNfUlPPO4jo=;
        b=UtGiwHugCiBB0nQQa+3NstnT6fzHazWvw7tNCQ3yUG477ESJa9Em5+h+BYsA6zNXtg
         BIcrWJdZ2P6V9PLZREfq9YJKDrqUILihu4tbvZcG/igbWOCsJE2GObIBJVeZUETov3ir
         BA67P2UNmeqoFvqlGIy77NfFynSnST77bU1UVDcUCs/0i+TIz6tC91KAP8HKe+D+2kuC
         QOXzJ0zBnqzlLBNCT3V1zKab3V4QTAT7hMKAHSo1LzC/JwueLb6sbSqsiDqadDe7GILM
         /qIM41+88vAKemD++L5xeVsQhKpOFu4HgBeQEvl0lo/krsqrMoElsbIsH8xLgK9F/X6t
         yEmg==
X-Forwarded-Encrypted: i=1; AJvYcCVM+TB6aek1k2ks8Zzp30eaO53a6GtsLuwO22JjcOjsqn0MZsNBqIADdjKyf6Xtwscxb7VxVSs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIB5j9PYNhSxq70RnfBW/NF6lMXBjtuMGu5a55r6pjH433Q0L8
	odZVBv+EUxBWqJyqi600CtANi75XBd7QFXmVmgX5BL1nRvwoBmETbAePu4IzZGk=
X-Google-Smtp-Source: AGHT+IFi3LY+Kr3VywWVQAVjcm+xWKmNQhu5wIXejKiarWn4kE6mkOvT2Gb7mmwc2E0pIjCs2m7I8g==
X-Received: by 2002:a05:6512:33c9:b0:539:f1ce:5fa8 with SMTP id 2adb3069b0e04-53d840ac0femr353800e87.49.1730977612627;
        Thu, 07 Nov 2024 03:06:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d82678449sm168905e87.12.2024.11.07.03.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 03:06:52 -0800 (PST)
Date: Thu, 7 Nov 2024 13:06:50 +0200
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
Message-ID: <cmvfpctliqggra33u6ituguoxh3jxcuxiyjpbtcjbcgpu6lhoi@4zdthfkc2ed3>
References: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
 <49a6ec0d-8a0b-49aa-a9eb-1174cff930f6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49a6ec0d-8a0b-49aa-a9eb-1174cff930f6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_030655_133706_9666E943 
X-CRM114-Status: GOOD (  22.91  )
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

On Thu, Nov 07, 2024 at 11:23:20AM +0100, Krzysztof Kozlowski wrote:
> On 05/11/2024 19:04, Raj Kumar Bhagat wrote:
> > The RDP433 is a Qualcomm Reference Design Platform based on the
> > IPQ9574. It features three QCN9274 WiFi devices connected to PCIe1,
> > PCIe2, and PCIe3. These devices are also interconnected via a WLAN
> > Serial Interface (WSI) connection. This WSI connection is essential
> > for exchanging control information among these devices.
> > 
> > This patch series describes the WSI interface found in QCN9274 in
> > device tree and uses this device tree node in the Ath12k driver to get the
> > details of WSI connection for Multi Link Operation (MLO) among multiple
> > QCN9274 devices.
> > 
> > NOTES:
> > 1. As ath12k MLO patches are not ready yet, this patchset does not apply
> >    to the ath.git ath-next branch and that's why the patchset is marked
> >    as RFC. These are the work-in-progress patches we have at the moment.
> >    The full set of MLO patches is available at:
> >    https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=ath12k-mlo-qcn9274
> > 
> > 2. The dependency marked below applies only to the DTS patch. The
> >    dt-bindings patches do not have this dependency.
> > 
> > Depends-On: [PATCH V7 0/4] Add PCIe support for IPQ9574
> > Link: https://lore.kernel.org/linux-pci/20240801054803.3015572-1-quic_srichara@quicinc.com/
> > 
> > v3:
> > - Created a separate binding "qcom,ath12k-wsi.yaml" to describe ath12k PCI
> >   devices with WSI interface.
> 
> Thanks for the changes. When you finish with testing/RFC, please send
> proper version for review (just remember to keep numbering, next one is
> v4 regardless whether this is RFC or not).

Isn't the 'RFC' being an invitation for review per the nature of the tag
itself?

-- 
With best wishes
Dmitry

