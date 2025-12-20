Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9F8E668AE
	for <ath12k@archiver.kernel.org>; Sat, 20 Dec 2025 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6vBPasQMyn+eGsNF1ceGj+cIoXfpqgeBLIomGmUlik=; b=mhuvTLmhuH248NX+PVhuTUDNj/
	gcbPXhUysMfxsKuFYR7KHxRGVm7PEyTYSAlB+LhR2+VSlSeqgo0jDWeSnQ3OyHCbYaMt8Y08RV+Zq
	S7JDETHJME8duR2n97TFkskGPZ0Ezw6DUU4PUrSJESFo0YsLVl1ZsK7q9KcClx79jrLF64BlvHOuU
	lUQAKr2dNx21EF7XJgB5wLPY5aYRdnTaU1m2nuV1zkYalK5SYeUxw1cpPH/xe7lEvRquPsxA/TVvp
	MwdKtDBPwCVGeenzElrehT+9jxI9r6VQ7BhYU+Wff80MOEgeqvzi+JvYvk970ryQeLHQvUrZvyQDG
	X34i6fww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWt0g-0000000BSGS-0JDA;
	Sat, 20 Dec 2025 09:12:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWt0e-0000000BSGK-0hoT
	for ath12k@lists.infradead.org;
	Sat, 20 Dec 2025 09:12:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CBEC60008;
	Sat, 20 Dec 2025 09:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4EFC4CEF5;
	Sat, 20 Dec 2025 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766221939;
	bh=hYDqeJLk4fMx9mP+F0+rMSTvt8DAR2pALIwmlOoKT0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tww/limY7l44Ini+Fmz+2jiIpRCWzR2fioOWFxZ6aozbV+o/WbMg73uNPvqNnjBdC
	 pd7EaqOPoQTNyRR+RW0G5t0mxMGluoBZ6/1azAv3+cRtCEKTxxeZoJwfWalbSJsAei
	 xgv6aLd4KMdGDS5ZqNRwE3UgtMzbuKcbgwkqVlU+YBNeXqgY29TPn+qYV+MmwY2NLq
	 NoOSL3iH2wt/C/aU7KiLk69LiLYJ+KWnu54alTHyHZ6BWIGENTOGo7nWOiF4HgeEgb
	 qnXa1tAINbNZd/CvwaFHyTukYOgN7yPFiay8mU+O1PZr8JiPHxrbql8JQEPMdPwzFE
	 obCx4ZIhguAuw==
Date: Sat, 20 Dec 2025 10:12:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Dale Whinham <daleyo@gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
Message-ID: <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie>
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

On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
> On 20/12/2025 00:21, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:
> > From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >=20
> > For some devices, Wi-Fi is entirely hard blocked by default making
> > the Wi-Fi radio unusable, except if rfkill is disabled as expected
> > on those models.
> >=20
> > Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
> > disabling specific features based on ACPI bitflag") added a way to
> > support features set via ACPI, including the DISABLE_RFKILL bit.
> >=20
> > Add a disable-rfkill property to expose the DISABLE_RFKILL bit
> > equivalent for devices described by a Devicetree instead of ACPI.
> >=20
> > Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.co=
m>
> > ---
> >   Documentation/devicetree/bindings/net/wireless/ieee80211.yaml | 6 +++=
+++
> >   1 file changed, 6 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.y=
aml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > index d89f7a3f88a71d45d6f4ab2ae909eae09cbcaf9a..c10a4675640be947cd0b5ea=
ec2c7ff367fd93945 100644
> > --- a/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > @@ -29,6 +29,12 @@ properties:
> >         different 5 GHz subbands. Using them incorrectly could not work=
 or
> >         decrease performance noticeably
> >=20
> > +  disable-rfkill:
> > +    type: boolean
> > +    description:
> > +      Disable rfkill for some devices on which Wi-Fi would be entirely=
 hard
> > +      blocked by default otherwise
> > +
> >   additionalProperties: true
> >=20
> >   examples:
> >=20
> > --
> > 2.47.3
> >=20
> >=20
> >=20
>=20
> Is this really a hardware description though ?
>=20
> Its really more of a logical/functional description. It tells the runtime
> what todo, not what the hardware is.
>=20
> You could also have a list of quirks in ath12k for this or have a user-sp=
ace
> utility look for the appropriate platform device string name and disable
> rfkill.
>=20
> I think this logic belongs in drivers/net/wireless/ath/ath12k/ triggering=
 on
> a compat string.

This is good point. Either this could be deducible from the compatible
or this should actually describe the hardware and whatever is there
wired/configured, not what OS should do.

Best regards,
Krzysztof


