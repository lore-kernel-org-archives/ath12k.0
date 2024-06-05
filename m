Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F68C25B76
	for <ath12k@archiver.kernel.org>; Wed,  5 Jun 2024 07:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyjciw8omyqWPArx3sDq7VVjOnmIsURoasHM7cx8Qy0=; b=UrIpdVp5t5mBHlTerq/Kp3NYmq
	ZTOCNdq0028HnbNet+HRCttW1nrphzKgQRR5poctJk+iZ02bbGLqT/D2HX3u0+NeWPWwcWGhnYmWY
	WSVsDM/0C2nwB2DvdFwYcXbFaAOXnQL559ASbZIpnmehjdhqBSf9v0QsE85cDy/wGUn1GdC5rt9hc
	z/EJO8AQ5EfDMUHJ2mixXJ5uafl1Dwsp4qEgNTntykShdbTyoMVroDelcArx1HnwYyRtQtKCYU/QY
	s3a7IEGvHO2pjI9YPMKSOqLs+psVtGnmK0zYesmVGLpuHEBJfUmIJ6r2ZUrWIN5qL8gVnsoaIdk+e
	JuibhdcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sElIl-000000052Kr-3016
	for ath12k@archiver.kernel.org;
	Wed, 05 Jun 2024 07:43:19 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sElIi-000000052IZ-36Sj
	for ath12k@lists.infradead.org;
	Wed, 05 Jun 2024 07:43:18 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ea9386cde0so65802641fa.2
        for <ath12k@lists.infradead.org>; Wed, 05 Jun 2024 00:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717573393; x=1718178193; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyjciw8omyqWPArx3sDq7VVjOnmIsURoasHM7cx8Qy0=;
        b=bmjhhXssvh1Uq/RT8Hcq4cJqZa9LBPxdKk8SyBIWlmTp8dCrZxfViOTTsphxj0rjoj
         0Dj+oIjFnuIKz464JJVnQM7jd7jgqbYXPWO6JJvYU18FfCatDZKggRPoCDSXJX2tc7AE
         9KfRTSoYiShEhpry9vc8SnCQBeiNIADCCw1a3Z7MbGWo0Kkez5Q0N8FC08EVYKz7CY8V
         HJIWfmLjVzQFyLDkB9RTBhVSmyYIhNKFX9WOH4cXBrAZvzaKKZNrHu5gjpchFNunzu2M
         4eEQwCtImXCfXyNV8T+nWPPvWSzjyQBBSNkYvNy83WxK6GLdVv/b/6eAcs12y9JZBmCu
         /Png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573393; x=1718178193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyjciw8omyqWPArx3sDq7VVjOnmIsURoasHM7cx8Qy0=;
        b=bpcplbmoACWOGGNE+saao+W6cAzzPuE5fajjJme8BoXF+LHyPKEgrsJJWWnd/QuGFF
         ARkYqnIl667ClU9SGwPMtKSSrDCwDG+2ITvipvtwSkULVy5sZi8yGNhC7u70fksKvLw1
         d2gNUlCR2mwuZftxl63BsmjAf1Nrth8MnpWaWfjhWRJJkwXtNAfHf340GYtna0RfolCJ
         D8AVUeeAHUNXRmfNSXnd0r47cB35onbWcm/AaRzejOKQdpUlwD8cNR4A7ZjcMDFEO6B0
         XudteNBlHzio1NQ1mx1UQfbwcPMV+2JPflVZJ8ZwMxFLhp+bvQgp229exnXaZOU7oBLV
         kQyA==
X-Forwarded-Encrypted: i=1; AJvYcCWpy1RKzblFt0R4pepkUGszq4Zwfpm+unM70AI9Jz4Is1uoRapI0mnO3yN9uyFn8wip1c9wUCiMEbBIJ5A7Uk6NQqNEX1G3MmbnUg==
X-Gm-Message-State: AOJu0Yw8kVCSYfSIoVfL6M0J6w+VZMv0zhbKfLPzo+Tj23rOe0PZIBoy
	ZcdLZDZxANAF8J68wzWTZN9f7W/1fO10Oz/iZwoaqVC+USNb+og4UNHREDyXJsVmg1TPInpEdW1
	Q7br3jMCEP0rPAxxeLgbvjI8ipHwKmnD4hY9D/A==
X-Google-Smtp-Source: AGHT+IFiHKKNVWneGGr50WzFkObsQ9oUM8GSCkWSrf/BaWFo5gFPEh8dKnIHSJrU2YjGwU9b3MU7THwqkd1DB3CAvSE=
X-Received: by 2002:a2e:2416:0:b0:2e2:72a7:843c with SMTP id
 38308e7fff4ca-2eac7a54169mr9164901fa.36.1717573393470; Wed, 05 Jun 2024
 00:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org> <20240528-pwrseq-v8-10-d354d52b763c@linaro.org>
 <20240605065245.GB3452034@maili.marvell.com>
In-Reply-To: <20240605065245.GB3452034@maili.marvell.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 5 Jun 2024 09:43:02 +0200
Message-ID: <CAMRc=MfyCJgOCBSh7AY4jEujWXGqZBB7Tnkq0VRrAKKCcJ9hAQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/17] power: sequencing: implement the pwrseq core
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Alex Elder <elder@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_004316_950078_20A75E34 
X-CRM114-Status: GOOD (  21.93  )
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

On Wed, Jun 5, 2024 at 8:52=E2=80=AFAM Ratheesh Kannoth <rkannoth@marvell.c=
om> wrote:
>
> On 2024-05-29 at 00:33:18, Bartosz Golaszewski (brgl@bgdev.pl) wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Implement the power sequencing subsystem allowing devices to share
> > complex powering-up and down procedures. It's split into the consumer
> > and provider parts but does not implement any new DT bindings so that
> > the actual power sequencing is never revealed in the DT representation.
> >
> > Tested-by: Amit Pundir <amit.pundir@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > +
> > +static struct pwrseq_unit_dep *pwrseq_unit_dep_new(struct pwrseq_unit =
*unit)
> nit. pwrseq_unit_dep_alloc/create rhymes well with pwrseq_unit_dep_free()=
,

So what?

> > +static void pwrseq_unit_free_deps(struct list_head *list)
> > +{
> > +     struct pwrseq_unit_dep *dep, *next;
> > +
> > +     list_for_each_entry_safe(dep, next, list, list) {
> no need of 'locks' to protect against simutaneous 'add' ?

No, this only happens once during release.

> > +
> > +static int pwrseq_unit_setup_deps(const struct pwrseq_unit_data **data=
,
> > +                               struct list_head *dep_list,
> > +                               struct list_head *unit_list,
> > +                               struct radix_tree_root *processed_units=
)
> > +{
> > +     const struct pwrseq_unit_data *pos;
> > +     struct pwrseq_unit_dep *dep;
> > +     struct pwrseq_unit *unit;
> > +     int i;
> > +
> > +     for (i =3D 0; data[i]; i++) {
> Can we add range for i ? just depending on data[i] to be zero looks to be=
 risky.
>

Why? It's perfectly normal to expect users to end the array with a
NULL pointer. The docs say these arrays must be NULL-terminated.

> > +             pos =3D data[i];
> > +
> > +             unit =3D pwrseq_unit_setup(pos, unit_list, processed_unit=
s);
> > +             if (IS_ERR(unit))
> > +                     return PTR_ERR(unit);
> > +
> > +             dep =3D pwrseq_unit_dep_new(unit);
> > +             if (!dep) {
> > +                     pwrseq_unit_decref(unit);
> This frees only one 'unit'. is there any chance for multiple 'unit', then=
 better clean
> up here ?

The references to those will be dropped in pwrseq_release().

> > +
> > +     /*
> > +      * From this point onwards the device's release() callback is
> > +      * responsible for freeing resources.
> > +      */
> > +     device_initialize(&pwrseq->dev);
> > +
> > +     ret =3D dev_set_name(&pwrseq->dev, "pwrseq.%d", pwrseq->id);
> > +     if (ret)
> > +             goto err_put_pwrseq;
> > +
> > +     pwrseq->owner =3D config->owner ?: THIS_MODULE;
> > +     pwrseq->match =3D config->match;
> > +
> > +     init_rwsem(&pwrseq->rw_lock);
> > +     mutex_init(&pwrseq->state_lock);
> > +     INIT_LIST_HEAD(&pwrseq->targets);
> > +     INIT_LIST_HEAD(&pwrseq->units);
> > +
> > +     ret =3D pwrseq_setup_targets(config->targets, pwrseq);
> > +     if (ret)
> > +             goto err_put_pwrseq;
> > +
> > +     scoped_guard(rwsem_write, &pwrseq_sem) {
> > +             ret =3D device_add(&pwrseq->dev);
> > +             if (ret)
> > +                     goto err_put_pwrseq;
> > +     }
> > +
> > +     return pwrseq;
> > +
> > +err_put_pwrseq:
> no need to kfree(pwrseq) ?

It's literally put on the next line?

Bart

