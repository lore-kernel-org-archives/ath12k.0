Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96624C27C54
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 23:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5F59Y5F210ARWzU6IxQVbEufFPE5a5xbmD+TtWexxk=; b=mMdO6v6w/O77crIsCI5Vw6nfFW
	Q+EBKNDAT7KMzbv9iM+WS8yDyF/GfKPhf7YKKyc16IWmumlg5NC50xT3KlN5YECZoDlqPJcZUibI4
	81Jwj85xb3mKQxI8wBc36Tx0/di2HC5t5vZhzWt7y00Z8yXV8Z0u+iYVAMwncdgaA28BDVvYhLUdV
	rXOLqU/9MRhepnXr1FDc58BkkB62gU+FgGNnA2jijGn8PnvMqiypqInUXlACOCGrFFBGz3JM4IQu2
	OXwWTHAZ73jqOetZGr6/tEIDzpLpj2W8V8khEnEsXCwprAVHESwGwfxuBl+SFMgIG4ePJFxTX0SkV
	KOoaPPGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEdgM-00000004BCV-1DEV
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 23:35:10 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEdgI-00000004BAc-27a3
	for ath12k@lists.infradead.org;
	Tue, 04 Jun 2024 23:35:08 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-dfa7fafa0c0so336771276.0
        for <ath12k@lists.infradead.org>; Tue, 04 Jun 2024 16:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717544104; x=1718148904; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U5F59Y5F210ARWzU6IxQVbEufFPE5a5xbmD+TtWexxk=;
        b=hP057PKa9jfuko3nZtbl1b799MO3Kh5QovfhV+PFr7CvbrRKKhJ4fmM/QESJpXpVfG
         GUi+pfxUzSC/tB7apnfrPyr3H4/1ihHb6KuZwvdlnh831B0QI5SqKz9BMn6/huTQHKIP
         5mycNhN9ori3HPXLpELsilPBB/GiQ2P38XfAoVtCoK9+f180zpfGCTPoV3KFAY9170LJ
         x4fcO33lCDTiE6k2p9TI07flLUjCY/hvPwBWiFXJWcgngU8oBJ/V9HD2gVdsKM5qmWoP
         zvxrrtVn9BMHh0S97GwtBp0k2oORf0afiCF77CVzkwaaxnVAuovwnt0gNp8JAdcUpD7h
         vtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717544104; x=1718148904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5F59Y5F210ARWzU6IxQVbEufFPE5a5xbmD+TtWexxk=;
        b=T1RuDfH8/hVLy3ILwcj94XCkgdEDYGltkK25X0nq6IqPu/wz1TT17Qp4IpO+NJ1yjG
         N79CN0mD0n5PkwYOrMYxOXmX7amQNlcdEsUXhWpoer+qjg40ND1ZF2BjfZmn+8bDeWEt
         YN2cQWfvlnS/mok2ebELQxNsd3K2ZT8ydaaLljeuNY+oUt8one0IU1xJYn3+qJJC3m7p
         CFEvp7D+j9SvzCxF5nlCDscLDc7+yZfndwRE3FroGzAyUY2Aet5YzwRrrN1iP/peYqk8
         FVwu/jWzrwYC437QKxVyZEc6kFfFCdywQlOei1FB0ZGWhrGFtzv2t4O2iR4X4D5Kq7Lh
         KgwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH7Yl7wMrwOa7i+YD+PJRXx2+jen2TycN9O2nq/bpO9yHzzjB//mf7wqHuM7+NhnV1hu1LzzalWmEE853UHXrVIdioK5gVRMvYAg==
X-Gm-Message-State: AOJu0YxeoGjQS5CCWfoKfxKPv8WSKTXSbDd8c6sYqXuLth+R/55KME8U
	XvtKoHDaXZPG1AbCQ2XaBPcT2nBdMFJZxZNwbjkBOIQ/bH+UImYcwL4DeHhsXZfJaJO0N+45P2i
	vixQEnvVOW8ywS6tLRBX+hg63QwmnpGg7XCMPzg==
X-Google-Smtp-Source: AGHT+IFdoTto+OyWazk/s95VUduCXVBIPATg60NiVpHEaONaANNsRtZaVqiKS3evRYjowXOhqIkWoq2TlII04CwtgN4=
X-Received: by 2002:a25:dcd0:0:b0:dfa:48d9:b0 with SMTP id 3f1490d57ef6-dfab8b0312fmr3125447276.22.1717544104107;
 Tue, 04 Jun 2024 16:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240528-pwrseq-v8-16-d354d52b763c@linaro.org> <20240604232347.GA740032@bhelgaas>
In-Reply-To: <20240604232347.GA740032@bhelgaas>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Jun 2024 02:34:52 +0300
Message-ID: <CAA8EJpomPLQmQbW8w3_ms_NMKHoSPcqBa7f2OhNTTOUSdB+9Eg@mail.gmail.com>
Subject: Re: [PATCH v8 16/17] PCI/pwrctl: add a PCI power control driver for
 power sequenced devices
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Alex Elder <elder@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	ath12k@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_163506_588522_713C8333 
X-CRM114-Status: GOOD (  21.66  )
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

On Wed, 5 Jun 2024 at 02:23, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Tue, May 28, 2024 at 09:03:24PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add a PCI power control driver that's capable of correctly powering up
> > devices using the power sequencing subsystem. The first users of this
> > driver are the ath11k module on QCA6390 and ath12k on WCN7850.
>
> Can you add a little detail here about what benefit we will see from
> this driver?  E.g., something that doesn't work correctly now, but
> will work with this driver?
>
> > +static const struct of_device_id pci_pwrctl_pwrseq_of_match[] = {
> > +     {
> > +             /* ATH11K in QCA6390 package. */
> > +             .compatible = "pci17cb,1101",
> > +             .data = "wlan",
> > +     },
> > +     {
> > +             /* ATH12K in WCN7850 package. */
> > +             .compatible = "pci17cb,1107",
> > +             .data = "wlan",
> > +     },
>
> IIUC, "pci17cb,1101" and "pci17cb,1107" exist partly so we can check
> that a DTS conforms to the schema, e.g., a "pci17cb,1101" node
> contains all the required regulators.  For that use, we obviously need
> a very specific "compatible" string.
>
> Is there any opportunity to add a more generic "compatible" string in
> addition to those so this list doesn't have to be updated for every
> PMU?  The .data here is "wlan" in both cases, and for this purpose, we
> don't care whether it's "pci17cb,1101" or "pci17cb,1107".

These two devices have different set of regulators and different
requirements to power them on.

-- 
With best wishes
Dmitry

