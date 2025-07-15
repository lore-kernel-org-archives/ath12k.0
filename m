Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355D3C83F17
	for <ath12k@archiver.kernel.org>; Tue, 15 Jul 2025 04:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0SYM23ez6BMlTZ2VmSmgWyo5BcS7W8ns6wALwTeU0c=; b=L4DG9z54TBwzZv4OshLAWEIZts
	HML/iqpp/mc3whPHADFOoVgKK9/RqHb33ciTHGcoXyYlyiGMOFShR6zfXUYmhSQ13dZ08lyJ8B3/q
	poClQ+6kEjpvtBOw71ZowvRB7MJ9aW2bdT9hVNOO4umIrOa/eMCoG/LY5p0Z6Yd4tOZQopU7mkRDY
	807nj+Wbxqf3EiTsUKT/1zyF17BHiYb9w6jKTKbzwXZ65Ak7tRzzXsnZ9gqd1daep3FSwGDMX4ADS
	L63oIe6HHCF8jMlKOzfAhnQKN0qTMlca9oV924swrR82Z8pzGIOZdPyFMcw1hLb3Mtt8qLD591zQN
	LQ7XuSeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXOh-000000041Dt-3dL2;
	Tue, 15 Jul 2025 04:36:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWrw-00000003xaZ-2CNO
	for ath12k@lists.infradead.org;
	Tue, 15 Jul 2025 04:02:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32BB0444DA;
	Tue, 15 Jul 2025 04:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05AFC4CEE3;
	Tue, 15 Jul 2025 04:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752552136;
	bh=XTpTiYZCt+831D8WJ+GyCYjH/IxQRruB1cTTUcZo054=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g9hfz6KULY0Fap/fLlLOyRyIzj1Nakml0N8IWzcDYZXAhYbIWyUEubLZC7UwkF/Z2
	 Q6quDzNAJgUiG0z6HmPtLEuYL62Kdl4HTAs1t5XvnvRwsnHilPrNLcyibFVGi0JXWY
	 Jd59fRfZ4tyEblo4wBLXnPhFS3Zk4uOoss6IkeGXX/Llf7u6Kj7ntsr2YioodItpCe
	 KbUFOUMT76nuXnhhUrRLuTIUOPzNSZ17Mh1/zDItfUfzpMeL1WJi0rV16NoZoR5Ofg
	 j7x3eWdNBsJ4EDhnvydnCOIKjQy68PjiCUZGHeYmLYkqEpvwNVYUJT0Bvg1q8Hp69y
	 6nqsL1nGSth/g==
Date: Mon, 14 Jul 2025 23:02:15 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?B?Suly9G1l?= de Bretagne <jerome.debretagne@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dale Whinham <daleyo@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lingbo Kong <quic_lingbok@quicinc.com>
Subject: Re: [PATCH 7/9 RFC] dt-bindings: wireless: ath12k: Add
 disable-rfkill property
Message-ID: <20250715040215.GA20887-robh@kernel.org>
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-8-daleyo@gmail.com>
 <prrra3lon2p4pugkgeytf5ow5wls62lfdnwcdykztw3qzwity2@d26aqh6wdyln>
 <CA+kEDGFR3FB=ead50kFBAL23-1dXo-LOMqhT7f=WecNMf_MaNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+kEDGFR3FB=ead50kFBAL23-1dXo-LOMqhT7f=WecNMf_MaNg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_210216_584661_FE7C9A77 
X-CRM114-Status: GOOD (  19.23  )
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

On Tue, Jul 15, 2025 at 01:26:48AM +0200, Jérôme de Bretagne wrote:
> On Mon. Jul 15, 2025 at 00:33, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote :
> >
> > On Mon, Jul 14, 2025 at 06:35:43PM +0100, Dale Whinham wrote:
> > > From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> > >
> > > Document the disable-rfkill property.
> >
> > Why? What does it mean? Why are you describing Linux driver firmware in
> > the DT?
> 
> rfkill should be disabled according to the Surface Pro 11's DSDT.
> 
> https://lore.kernel.org/all/20250113074810.29729-3-quic_lingbok@quicinc.com/
> has added support to read the ACPI bitflag when ACPI is supported.
> 
> The idea was to expose one specific feature (DISABLE_RFKILL_BIT) for
> devices described with a DT, so that the feature can be disabled.

The commit msg should answer all this. That was the purpose of the 
questions.

Assuming it belongs in DT, why is this ath12k specific? Could be for any 
wireless chip...

> > > Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> > > Signed-off-by: Dale Whinham <daleyo@gmail.com>
> > > ---
> > >  .../devicetree/bindings/net/wireless/qcom,ath12k.yaml          | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> > > index 9e557cb838c7..f15b630fb034 100644
> > > --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> > > +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> > > @@ -48,6 +48,9 @@ properties:
> > >    vddpcie1p8-supply:
> > >      description: VDD_PCIE_1P8 supply regulator handle
> > >
> > > +  disable-rfkill:
> > > +    type: boolean
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > --
> > > 2.50.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

