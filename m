Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AE7CFD364
	for <ath12k@archiver.kernel.org>; Tue, 25 Nov 2025 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUasbkstjniBrT4zxMVBFF99A9HoWusdu4FR+HNi+pw=; b=RbbltsEPSaGz5m366Ov+UivkXY
	8pTlnABR30t/MlTaKoHTt+cLeBWEyOvaS1/2vDOYr+KHAQFsBR0Nt0rJK1WCqwnSCmKf4KoUuZXbt
	rSlLnpPz3/D9RDOYhAuLfqs/FwffpBQq2t301uHEm3b3Ig7sPTceQngHpLSeHFwnDZcARwPgE3AI1
	6dBO9fmULAXUTkKDBySR+yeJgz8DF/bWRrmEKPErv6c8mCTq+XsqrPNAGveh3H/35x4b2kdbZyNx0
	F8rjt3Hiqm4u0gM1Xi2/IxUI0rR45izt9Onl68qsjIDZJsmnuAYJbjK+nhIRP0FLO/4gZniGGqrPP
	oCibSWIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpo9-0000000D3lL-36EO;
	Tue, 25 Nov 2025 09:58:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpo7-0000000D3kd-40nI
	for ath12k@bombadil.infradead.org;
	Tue, 25 Nov 2025 09:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rUasbkstjniBrT4zxMVBFF99A9HoWusdu4FR+HNi+pw=; b=hPhScjxnAp7yJkq4TpeZA4oMVw
	Hr6lowpnrnBqBSIa71BrTD6CxwM2nt1fCWkK7tPONBgfNbaqCqe2VhQ1Sb4GHzytrKOmveEk4x/SB
	JjNH8GDteoh6PDtxvc+EbpO2+/VIqIRuSOiBtjUcUo5DhZU8OQKl4wZHwnpZmVk0A2+/pLwlvXbTO
	jJttxmgvmAjR0VKKelCvKuf/HzPxTD223n99C+Cla4THZg3pT+x20/IPPvSB9R3zSYiMg9Ov+BN7Y
	BiJHL43AijLe3oKUB/3wHMU49/MXfFVRRbifR87GgQO1krsZ0JD2F7GzC+5SZSSQV7Gwdxt/iw6E0
	hNud7pAg==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNowU-00000005Uem-0LKd
	for ath12k@lists.infradead.org;
	Tue, 25 Nov 2025 09:02:35 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b76b5afdf04so229892966b.1
        for <ath12k@lists.infradead.org>; Tue, 25 Nov 2025 01:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764064675; x=1764669475; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUasbkstjniBrT4zxMVBFF99A9HoWusdu4FR+HNi+pw=;
        b=DZeQGtADCy2RJHLbOxVCfbpH/CSs3uNLxBpZnDZPjGrj5zcnJFf44JpPOUFhYV5Kgm
         6z0LBXBs3vcFWiVuczU46pej8WFrTPiV8UJEL47utfH5Bwjq2OCYp9sT1PDurN9kYWC6
         XbQVvKW8Rr4UhNIZKpLY5MGhQJ4PSs+tTrzwZULXvWZYEuh+/YL4aKU/x7lBCksoUGtJ
         tNAQ+Mb5YHAsnyi/ELtEXl85KCnJ2stYrE9HPZNdybkQJV+DUbWiSa0jHV0I8o7JIPyn
         8Xm5PdbRqJDstfBrt/ALyVXcLOTHI6oRuURRyTv4lvKY/b+tC2uKInmsjrmHao2/grNy
         HNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764064675; x=1764669475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUasbkstjniBrT4zxMVBFF99A9HoWusdu4FR+HNi+pw=;
        b=jHNOOD/8iyRMbg2sZ0cQaC7SenAlCZnut6c7X/PY2zgv0HGiEa/tT6qmUcc6XZQGOn
         10XSHd57IEoWwUVelLCjlrUSJRsm3lBbfvdOddl9SghdMdzfC1K7rZqzq2qdFpQ0anwF
         K0Tp5Cfl9oh30NZWbebRBNoWtv1ZqmoDSgMoiZjtj167npq/WNDNqUkBnp/evc98vK7g
         BH+fClfK3pTB/U/F1+De3hbFKpt1VZsyokqG1p1AvtrZB835OHoo8LrRVVDeSKroQWys
         bf2hhh8fLSMeBijycxwuBLTOwePTlb0ZRXaqeXZ5IjazMj9qUW277MhKMxqUuX73wOw+
         AVwA==
X-Forwarded-Encrypted: i=1; AJvYcCVL8oeVE4ITmA/skBam+IvQWKDsIrAp8l59gYorKlqPRubdncbNOF3JCCx4+wpF+5NETcoHrYo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOVzM1dC1VSgjSPHWs7lfSrogdt/fId/EFq98yrU93j1A01ijU
	3cJBal+4UAJ7Or/YawiYI0SNBEOvTEdEvN9CrHt2C8pmQfnqD/dLT8of
X-Gm-Gg: ASbGnctYb37DfQZAAWPKb1T+RDFCjzrS2PjxVooc1OiLImSICUn1w7h2thQoqbUmzyR
	eZ5e0k3xvOkr76W4qGA+hipiGJHJxsYQeAOPTnVS4nVSwQQijP/+cinqJ+O5Cdjv/DWGB+u08/y
	dJgxrQ8iz7+DL+buFRnslcaGTZFv9R7I5lc8h81/DUCmGF2zm85Rn3BoxHHWnXJK5Ou3VIzYzBk
	JRwGhUmoY/Mo4Kd7CbEv8XzyzC1dUGvAt3oUpoVC1T30LVdDIztw+1pTaFi3Sav+VPPl8ttILSM
	DfAT/YMSPNrmR8IGS38CV2kmDWV6YpSDe6+q30/mTySEFqQ/Jm6nxJdymaqN+RfsTO9K/1P/RVG
	U9q3tzIC/z8aTbRLx7+LAaAuKyRNNMvlf8O/tJnxCn8nC8s/Ub87XxrHQ87TLlbfdUcAYIxsO5t
	eQpYIpe5fxx2mSywiM1pGTIsCH88OHsSMsJBOBVyr/XI5xBVxH0lJ8CRp61IebP9U8NdJBsYTZE
	6eYOp7lcfABXg==
X-Google-Smtp-Source: AGHT+IHLisWyuG15RnJSodDThe/ELizaIWdtNrkb9dhnJFuydOtd23t6sLVr0LkGdKB4Y4UIprMu/A==
X-Received: by 2002:a17:906:c156:b0:b73:7652:ef9e with SMTP id a640c23a62f3a-b7671a28d01mr1625571366b.55.1764064674836;
        Tue, 25 Nov 2025 01:57:54 -0800 (PST)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654ff3bbesm1539477966b.51.2025.11.25.01.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:57:54 -0800 (PST)
Date: Tue, 25 Nov 2025 10:57:53 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
Message-ID: <fasihmiu2szj6m2r3qef5slvzlvdjo2ajhrd6xyqsa5cajrbzq@a5dyulg2dnac>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
 <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
 <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
 <exfmj52dqu3uctwsb2gopcjg7744vq5avlkahtmgfw4opw4mfl@t2svrln72u53>
 <f853d9b2-47f8-47b5-a02d-6aa8f12a4283@oss.qualcomm.com>
 <trr5j57vwk2dhoibdgdxnlkftnmfcmjkwmicsiltmhybxanjaf@tzaeeqcyz56l>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <trr5j57vwk2dhoibdgdxnlkftnmfcmjkwmicsiltmhybxanjaf@tzaeeqcyz56l>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_090234_328682_B50DAE55 
X-CRM114-Status: GOOD (  16.73  )
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

On Tue, Nov 18, 2025 at 12:23:20PM +0530, Manivannan Sadhasivam wrote:
> 
> ath12k doesn't seem to require a calibration variant. But even if the user
> replaces ath11k chipset with ath10k one, the calibration variant should be the
> same as it is platform specific except for WSI.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
> 

Hi all,

Jumping in on this thread to ask about how we should handle variants.

We are using the WCN7850 device with the ath12k driver and received three
board files for this from Silex, signed by Qualcomm. All three support the
same board (SX-PCEBE), where one is the board file to be used for the
US/EU/JP and the other two are one for higher emissions in the UK/CA and
one for lower emissions in the UK/CA.

Since these are needed for regulatory differences but support the same
board, we were wondering about your views on how to handle that in
mainline. I see that there is no support for the board file selection in
the device tree for ath12k, and that there is some discussion on how to
handle variants in general. We are using a device tree-based setup and no
ACPI.

Thanks!

Kind regards,
Ernest

