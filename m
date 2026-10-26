Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92202606A32A
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F44Gc0ok;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A2QyuKnA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EBf3Sy+5DcnC0QRUJ+VDMuCVNHbnBlvEfTw0fhN6JSU=; b=F44Gc0okeSuLzSQ9qVbExSeRLP
	zvAitZJoKjzZ5/68+2ITJJW0Sa63Rm6b60r97aGO96zKtNjBEgcMtGUyPzuB36dj0Sae/scZ/45wN
	Ty7BsW/wh+RvfUqO8KaC0wHp/gEd1caB89OK2HzF+G9FHJdF4zF/T2+Hne7s5ZoVM2f6tGdQPpSK9
	vzykFoqR8ZaL0go1SLP3cAOnfGnVdhLbr6K4lBV3HEw/QnTwxJRTMbH5EbTLb5KTRqu91PwUin2JP
	l2lz17BaMHk37aHyBD3692Nf6BgP8BL7TkQKdxHT3RDBNcElArh50yV+80eGqfZ50ypdFpWDWJVaP
	kIhmhtxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIJ0-00000002IJR-06nw;
	Mon, 26 Oct 2026 10:51:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIIx-00000002IIk-1jXr
	for ath12k@lists.infradead.org;
	Mon, 26 Oct 2026 10:51:52 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1510133f8f.2
        for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 03:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793011909; x=1793616709; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EBf3Sy+5DcnC0QRUJ+VDMuCVNHbnBlvEfTw0fhN6JSU=;
        b=A2QyuKnATWMg17KH6abCPOu1zJ4PKdpGtQN1CmlSs/0jfGgFtaIbLEYuf0XV4ePc3b
         lpgDa0QaGOdtfwrPLk5aJvgMgJi6ettSO6XXpk+DQv5dNjMVG17C9oPhi/Van7Ypilvm
         A9E30XwUEcd5+U0EG/MMKhAokiRSxC9jzM6VSasX/5MW66q8a52DImkcRjSTZYXs01X/
         Aj/JdSsNaeVGiFhNYFy6C3YKkNBVO6ZGRyR5nYGr5HuVZSHJowuN/Q/95QDPIa4Mcjvh
         ail8opmDsGuxHq0Omf5O/rnkrE+lkUwMc8hXqOI2Czzn+n7wpSD8/OvG4PU1M+QjpCMs
         QAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011909; x=1793616709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBf3Sy+5DcnC0QRUJ+VDMuCVNHbnBlvEfTw0fhN6JSU=;
        b=FjynarXsaUYLEwAbU3Kj5gCnp6Yv6Aj+RzgQNaijKz9yuB8zjvXzqhWOtplhFdU6R6
         c0R1EbZmN8uikrAfuILcIBPR2VmypIlSz+BwJ7BMO4ogTm3zJV7MLtxDrvNj0vgiFwXH
         ai4gjW4omcFvtMH9lAPH8/9KgR9blrwpSyzDU6DvPoc6IKdzwcCMNDUzUD7kl2ql+oNq
         XRBe+D2LTXfXYkF3dtJT+H8bcH36SMzfCSEc9KS3Y6YYoag5vLtOvUeN8mrDW4q1glkZ
         AfwTbeD4yD1/vHY0tqbrIL5+643Wsgu18vOA7/dLn7zca6VbtAs/FadISp9se9gxAvDJ
         4N1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzrzwkAl5QwPxfJI4siN0N1twFlQKZS5WZ4MmkFFRKf5HFJOQqYFvyB2IQlCPbcT3BYA2R2ywo=@lists.infradead.org
X-Gm-Message-State: AFq9FYKNSimDUhtQIWe0a3DjdShtQI/+VXhk9x4mw0kK012UvsNJWfFA
	sUgQ0/G1Yri40APhEoQTGmku0y4RW74VzSSTs0UOo6hFj4dieuVLsMi+oRk6MLJ+
X-Gm-Gg: AYBFou1pMwOIysA6IeWIksajMYBcuEa87wILIIT6xNu6MGrk4BfeEjNT6qFk5uT9Iz6
	tLwB1XU9t7+5UJg/21yhDtN8sDIe7/7mrvSewgaxdtTDIEW0duq3NlNZUmRNe5qNUvddr312NPQ
	/scSc9u6hJo/TzFpsJzF7apOXqmFqkqTJBVJA5NpH70WQMUCdhYC6ydazqaAqPeIChCTDW7gKUt
	+oVz0ctoMKZlc0IDjeEmMck0ToDSSLC9ofx/RBb/Eu9KjSNffAK2lHdHwKlY/ZX3Gih88uF49SX
	w7IoGki86E+wZj/jp7uJI5QGO1HDWK8ZHAcZqAegM0U12t+N8LCO2v+FmaW7SAG3b4X1q88Dmlf
	72VPLqJNkDsnjNWFoxO8Bj9nys4CyD0Jbtekgh/mDWLxQY/jL93Jox0oqophi4nwEDr/HeEbTVV
	E/hroF9sVyMsN+eCGejCxlvfwrUEkswtiYZS50HwB2DEfceax7B5LOrm254XTuXVA5X85uTUSo5
	x/fO+lFCtIJXIB1+ccBD1dfTmykmyU5PoIspfiQtDdcjlw5IhtNbcWAZW1q4QCIijD4k/3oFcmy
	1NfOKleUD7gyRct4tZly6Ue+BQaneMkYIQarJ3zFCvEwWT5RRwl0BWw=
X-Received: by 2002:a05:6000:2999:20b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-48e3eb2b9a3mr8914050f8f.3.1793011909237;
        Mon, 26 Oct 2026 03:51:49 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3c32sm16077045f8f.47.2026.10.26.03.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:51:48 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:51:47 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Andrew LaMarche <andrewjlamarche@gmail.com>, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2] dt-bindings: wireless: ath12k: allow calibration
 variant for WCN7850
Message-ID: <xrszqxg7ketpbjtafssgyjdgygwuhqx7p2ln3phrabcinrqn7c@vor67puwvmyd>
References: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_035151_488034_3AAE3333 
X-CRM114-Status: GOOD (  23.94  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Sep 07, 2026 at 04:17:20PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> qcom,calibration-variant is the generic Qualcomm Wi-Fi DT property for
> selecting board-specific calibration data when the device identity alone
> is ambiguous.
> 
> Commit 06cca100ad08 ("wifi: ath12k: support calibration-variant from
> device tree") implemented support for this property in the ath12k
> driver.
> 
> WCN7850 can be used in systems where the PCI device ID and machine
> compatible are identical across product variants, or across regions with
> different regulations. For regulatory changes, the hardware description
> does not change, but the vendor-provided calibration data can differ. In
> that case neither the PCI identity nor the machine compatible can
> identify the required data, so DT needs an explicit calibration variant.
> 
> The ath10k, ath11k and ath12k WSI bindings already allow this generic
> property for the same class of board-data selection. Allow it for
> WCN7850 PCIe devices as well.
> 
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
> Changes in v2:
> - Rebased
> - Updated commit message
> - Link to v1: https://lore.kernel.org/r/20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> index dc68dd59988f..cf3e1fd99c12 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
> @@ -54,6 +54,12 @@ properties:
>    vddpcie1p8-supply:
>      description: VDD_PCIE_1P8 supply regulator handle
>  
> +  qcom,calibration-variant:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      String to uniquely identify variant of the calibration data for designs
> +      with colliding bus and device ids
> +
>  required:
>    - compatible
>    - reg
> 
> ---
> base-commit: 1d8e73163ef933624341075f576e2f36ef9133f7
> change-id: 20260701-ath12k-calibration-variant-b7850f7ffd7c
> 
> Best regards,
> -- 
> Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 

Hi,

Just a friendly ping on this since this since 06cca100ad08 ("wifi:
ath12k: support calibration-variant from device tree") has been in the
tree for a while now.

Kind regards,
Ernest


