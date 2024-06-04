Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF40C27C52
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 17:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=yi/S+qY2kzxieCFrjwx0TBUzZjyUlpR2q5uNTsJ7eiM=; b=0JrMcbZ8ZUSZ4R
	yR7l/z1NmhA1ANE++UovaEAnxvAN6T1fOUDbtGmUfBLpK8PoCSsSu4kxCxrKObmRHCPixPpEDpLiE
	hjWlOeCp338B9sC7/qHL3FWP6n98dCwNMdEeEU6C8bYktSYmulMfSAWb1y/b0BYZu1tJ3xMmmjEwV
	xXasYo+32Vc/0ZG5BtFf5SH+rnCj5LEeUob208myBcEoJXok3be8U8sZYVEHm2nhpYEMoy0Hy/s0p
	5xYg2FxvZdqckKFUwdXvMHLzXnPIerQ5Kxr7Bn111YQEJlRplYAkhFrjRI7IvocuivB+NaCtzEUs1
	tPkrfV/XvpkOBIrL+Xhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEYC5-00000003M9d-1XVC
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 17:43:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEYC2-00000003M8I-0UOf;
	Tue, 04 Jun 2024 17:43:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B86A61306;
	Tue,  4 Jun 2024 17:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E4DC2BBFC;
	Tue,  4 Jun 2024 17:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717523008;
	bh=JcC1v5BWR3/aIlXbMvxiyykfLTUcQNGVWF3/jh+S9iI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NGAt4/9MoQ3AADgy57S1dDGgOpgjl4uVWGIzgaNz5ReBofop0ijw73bFpo5gR98qF
	 CvPSGCEku+NrJ+LAoiFaG3umsj7ojAuPmVV9mvyMvd53uEtYP6HBT21e034WKZzZo1
	 pT7k7x8Q28EiSk9xj2BxDfduF22g4hjx88kWNxTUUglSMDL5InDtwWdQOZnYfloWlq
	 0MLrrd+8tANmZZXjTPifJU2FtawybtBxhLc5weSA/2jWj1BJtYS65AOYOPutl0u6wy
	 eZ6VEz77CkW+huywzLbt78kvUoDMiDPOQn8Uo7d+X5F/rfFmDMBI+aweIJgWuoo/kw
	 IB2qtzrohV9Kw==
Date: Tue, 4 Jun 2024 12:43:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Alex Elder <elder@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath12k@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel@quicinc.com, Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v8 10/17] power: sequencing: implement the pwrseq core
Message-ID: <20240604174326.GA733165@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-pwrseq-v8-10-d354d52b763c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_104330_259080_68E50461 
X-CRM114-Status: GOOD (  12.44  )
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

On Tue, May 28, 2024 at 09:03:18PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Implement the power sequencing subsystem allowing devices to share
> complex powering-up and down procedures. It's split into the consumer
> and provider parts but does not implement any new DT bindings so that
> the actual power sequencing is never revealed in the DT representation.

> +++ b/drivers/power/sequencing/core.c

> + * Unit - a unit is a discreet chunk of a power sequence. For instance one unit

s/discreet/discrete/

> +static struct pwrseq_unit *pwrseq_unit_incref(struct pwrseq_unit *unit)
> +{
> +	kref_get(&unit->ref);
> +
> +	return unit;
> +}
> +
> +static void pwrseq_unit_release(struct kref *ref);
> +
> +static void pwrseq_unit_decref(struct pwrseq_unit *unit)
> +{
> +	kref_put(&unit->ref, pwrseq_unit_release);
> +}

No existing callers of kref_get() and kref_put() use names that
include "incref" or "decref".  Many include "get" and "put", so maybe
there would be some value in using that pattern?

